update 
	cmn_users ce
set 
	ce.info = (CONCAT(lpad(ce.category,2,'0'), ce.info)),
    category = 0
where 
	ce.login = 'UsuarioDesativadoSistema';



update 
	cmn_users ce
set 
    ce.category = cast(substring(ce.info,1,2) as SIGNED),
	ce.info = substring(ce.info,3)
where 
	ce.login = 'UsuarioDesativadoSistema';
