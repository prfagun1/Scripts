insert into banco1 (id,usuario,nome,cargo,setor,centrodecusto,RegistroData,statuslocal,metadadosstatus,MetadadosDataRescisao,RegistroUsuario)
SELECT id,username,fullname,jobrole,department,cc,changedate,statuslocal,statusrh,metadadosdate,'Registro interno' as RegistroUsuario
FROM banco2.userhr;