SELECT s.SID, s.SERIAL#, p.SPID, s.PROGRAM
 FROM V$PROCESS p, V$SESSION s
 WHERE p.ADDR = s.PADDR
 and p.SPID = '59135';