select  t."TBL", s."VAL_TS"
from sysprogress."SYSTBLSTAT" s, sysprogress."SYSTABLES" t
where s."TBLID" = t."ID"
	and s.VAL_TS is not null
order by s.VAL_TS desc