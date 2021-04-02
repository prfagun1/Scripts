select l."_Lock-Usr", l."_Lock-Name", l."_Lock-Flags", l."_Lock-Type", t.TBL, database()
from PUB."_Lock" l, sysprogress.SYSTABLES t
where l."_Lock-Id" < 100 and l."_Lock-Usr" is not null and l."_Lock-Table" = t."ID"