Criar tabela abaixo:
 
CREATE TABLE `test`.`resultado` (
  `id` INT NOT NULL,
  `col1` VARCHAR(100) NULL,
  `col2` VARCHAR(100) NULL,
  `col3` VARCHAR(100) NULL,
  `col4` VARCHAR(100) NULL,
  `col5` VARCHAR(100) NULL,
  `col6` VARCHAR(100) NULL,
  `col7` VARCHAR(100) NULL,
  `col8` VARCHAR(100) NULL,
  `col9` VARCHAR(100) NULL,
  `col10` VARCHAR(100) NULL,
  `col11` VARCHAR(100) NULL,
  `col12` VARCHAR(100) NULL,
  `col13` VARCHAR(100) NULL,
  `col14` VARCHAR(100) NULL,
  `col15` VARCHAR(100) NULL,
  `col16` VARCHAR(100) NULL,
  `col17` VARCHAR(100) NULL,
  `col18` VARCHAR(100) NULL,
  `col19` VARCHAR(100) NULL,
  `col20` VARCHAR(100) NULL,
  `col21` VARCHAR(100) NULL,
  `col22` VARCHAR(100) NULL,
  `col23` VARCHAR(100) NULL,
  `col24` VARCHAR(100) NULL,
  `col25` VARCHAR(100) NULL,
  `col26` VARCHAR(100) NULL,
  `col27` VARCHAR(100) NULL,
  `col28` VARCHAR(100) NULL,
  `col29` VARCHAR(100) NULL,
  `col30` VARCHAR(100) NULL,
  `col31` VARCHAR(100) NULL,
  `col32` VARCHAR(100) NULL,
  `col33` VARCHAR(100) NULL,
  `col34` VARCHAR(100) NULL,
  `col35` VARCHAR(100) NULL,
  `col36` VARCHAR(100) NULL,
  `col37` VARCHAR(100) NULL,
  `col38` VARCHAR(100) NULL,
  `col39` VARCHAR(100) NULL,
  `col40` VARCHAR(100) NULL,
  `col41` VARCHAR(100) NULL,
  `col42` VARCHAR(100) NULL,
  `col43` VARCHAR(100) NULL,
  `col44` VARCHAR(100) NULL,
  `col45` VARCHAR(100) NULL,
  `col46` VARCHAR(100) NULL,
  `col47` VARCHAR(100) NULL,
  `col48` VARCHAR(100) NULL,
  `col49` VARCHAR(100) NULL,
  `col50` VARCHAR(100) NULL,
  `col51` VARCHAR(100) NULL,
  `col52` VARCHAR(100) NULL,
  `col53` VARCHAR(100) NULL,
  `col54` VARCHAR(100) NULL,
  `col55` VARCHAR(100) NULL,
  `col56` VARCHAR(100) NULL,
  `col57` VARCHAR(100) NULL,
  `col58` VARCHAR(100) NULL,
  `col59` VARCHAR(100) NULL,
  `col60` VARCHAR(100) NULL,
  `col61` VARCHAR(100) NULL,
  `col62` VARCHAR(100) NULL,
  `col63` VARCHAR(100) NULL,
  `col64` VARCHAR(100) NULL,
  `col65` VARCHAR(100) NULL,
  `col66` VARCHAR(100) NULL,
  `col67` VARCHAR(100) NULL,
  `col68` VARCHAR(100) NULL,
  `col69` VARCHAR(100) NULL,
  `col70` VARCHAR(100) NULL,
  `col71` VARCHAR(100) NULL,
  `col72` VARCHAR(100) NULL,
  `col73` VARCHAR(100) NULL,
  `col74` VARCHAR(100) NULL,
  `col75` VARCHAR(100) NULL,
  `col76` VARCHAR(100) NULL,
  `col77` VARCHAR(100) NULL,
   PRIMARY KEY (`id`)
);



DELIMITER // 
 
DROP PROCEDURE IF EXISTS executa //
 
CREATE PROCEDURE executa ()
BEGIN
	DECLARE done INT DEFAULT FALSE;
	DECLARE mensagem VARCHAR(3000);
    declare identificador int;
    declare i int;
    declare comando varchar(200);
 
    DECLARE delim VARCHAR(1);
	DECLARE inipos int;
    DECLARE endpos int;
    DECLARE maxlen int;
    DECLARE item VARCHAR(300);
    
	DECLARE cur1 CURSOR FOR SELECT ID,Message from test.teste;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    SET delim = '|';
    truncate table resultado;
 
	OPEN cur1;
 
	read_loop: LOOP
		set i = 1;
        set inipos = 1;
        
		FETCH cur1 INTO identificador,mensagem;
		IF done THEN
			LEAVE read_loop;
		END IF;
 
        /*(SELECT LENGTH(mensagem) - LENGTH(REPLACE(mensagem, '|', '') ) + 1 as 'Dados') ;*/
                
		insert into resultado (id) values (identificador);
                
		Repeat
				set maxlen = LENGTH(mensagem);
				SET endpos = LOCATE(delim, mensagem, inipos);
				SET item =  SUBSTR(mensagem, inipos, endpos - inipos);
 
				IF item <> '' AND item IS NOT NULL THEN           
					set comando = concat('update resultado set col',i,'=''',item,''' where id=''',identificador,'''');
					set @sql = comando;
					PREPARE stmt1 FROM @sql; 
					EXECUTE stmt1; 
					DEALLOCATE PREPARE stmt1; 
				END IF;
				set i = i + 1;
				SET inipos = endpos + 1;
 
 
		until i>76 END repeat;
 
 
    /*adiciona o ´ultimo campo*/
   
        SET item =  substring_index(mensagem,delim,-1);
		set comando = concat('update resultado set col',i,'=''',item,''' where id=''',identificador,'''');
 
       
		set @sql = comando;
		PREPARE stmt1 FROM @sql; 
		EXECUTE stmt1; 
		DEALLOCATE PREPARE stmt1; 
 
    
                
	END LOOP;
 
	close cur1;
END;
//
 
DELIMITER --
call executa();
 

--Campo original:

insert into teste values (1,'CALL_CONNECT|70   |519352159      |2    |9    |249  |1    |CAS       |LCL  |10.1.4.206          |10.1.4.253          |11   |0    |05499046420         |5499046420          |-1   |-1   |5300                |000                 |-1   |g711Alaw64k    |20   |10.1.4.251          |24236|UNKN |REASON N/A                              |0    |0         |0         |0         |0             |888891696201595713@10.1.4.206                     |09:57:13.450  UTC Tue Jun 09 2015  |09:57:14.750  UTC Tue Jun 09 2015  |                                   |0        |0        |0             |0             |-1             |0    |0    |                    |-1                  |10.1.4.206          |10.1.4.206          |10.1.4.253          |10.1.4.253          |2   (Asterisk)                      |10.1.4.206          |7400           |         |     |UNKNOWN          |                    |0     (DefaultSRD)           |0              |2              |1           ()                    |0            (DefaultRealm)                            |TCP             |46             |40             |127         |127          |127       |127        |5060         |5060       |AUDIO     |   |   |            |                          |0             |                    |0              #01231235')

