select database() as Banco, count(c."_Connect-Usr") as Usuarios
from pub."_Connect" c