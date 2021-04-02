--Antes é necessário dar permissão

BEGIN
  DBMS_NETWORK_ACL_ADMIN.CREATE_ACL(acl         => 'webservices.xml',
                                    description => 'Acesso webservices',
                                    principal   => 'schema',
                                    is_grant    => true,
                                    privilege   => 'connect');
  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(acl       => 'webservices.xml',
                                       principal => 'ADMWPD',
                                       is_grant  => true,
                                       privilege => 'resolve');
  DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL(acl  => 'webservices.xml',
                                   host => '*');
END;
/
COMMIT
/

--Fim da permissão

SET SERVEROUTPUT ON
DECLARE
    l_http_request   UTL_HTTP.req;
    l_http_response  UTL_HTTP.resp;
    l_buffer_size    NUMBER(10) := 512;
    l_string_request VARCHAR2(512);
    l_line           VARCHAR2(128);
    l_substring_msg  VARCHAR2(512);
    l_raw_data       RAW(512);
    l_clob_response  CLOB;
    l_host_name      VARCHAR2(128) := 'webservice.dominio.com';
    l_port           VARCHAR2(128) := '80';
    l_webservice     VARCHAR2(128) := '/teste/Service.svc';
    l_soap_action    VARCHAR2(128) := 'http://tempuri.org/IService/teste';
 
BEGIN
    l_string_request := '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">
   <soapenv:Header/>
   <soapenv:Body>
      <tem:teste/>
   </soapenv:Body>
</soapenv:Envelope>';
    UTL_HTTP.set_transfer_timeout(60);
    l_http_request := UTL_HTTP.begin_request(url => 'http://' || l_host_name || ':' || l_port || l_webservice, method => 'POST', http_version => 'HTTP/1.1');
    UTL_HTTP.set_header(l_http_request, 'User-Agent', 'Mozilla/4.0');
    UTL_HTTP.set_header(l_http_request, 'Connection', 'close');
    UTL_HTTP.set_header(l_http_request, 'Content-Type', 'text/xml;charset=UTF-8');
    UTL_HTTP.set_header(l_http_request, 'SOAPAction', l_soap_action);
    UTL_HTTP.set_header(l_http_request, 'Content-Length', LENGTH(l_string_request));
 
    <<request_loop>>
    
    
    FOR i IN 0..CEIL(LENGTH(l_string_request) / l_buffer_size) - 1 LOOP
        l_substring_msg := SUBSTR(l_string_request, i * l_buffer_size + 1, l_buffer_size);
 
        BEGIN
            l_raw_data := utl_raw.cast_to_raw(l_substring_msg);
            UTL_HTTP.write_raw(r => l_http_request, data => l_raw_data);
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    EXIT request_loop;
        END;
    END LOOP request_loop;
 
    l_http_response := UTL_HTTP.get_response(l_http_request);
 
    BEGIN
 
        <<response_loop>>
        LOOP
            UTL_HTTP.read_raw(l_http_response, l_raw_data, l_buffer_size);
            l_clob_response := l_clob_response || UTL_RAW.cast_to_varchar2(l_raw_data);
        END LOOP response_loop;
 
        EXCEPTION
            WHEN UTL_HTTP.end_of_body THEN
                UTL_HTTP.end_response(l_http_response);
    END;
 
 DBMS_OUTPUT.put_line(l_clob_response);
END;
