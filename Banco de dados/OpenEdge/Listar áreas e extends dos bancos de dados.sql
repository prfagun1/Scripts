select database() as 'Banco',
	a."_AreaStatus-Areaname" as 'Area',
	a."_AreaStatus-Extents" as 'Extends',
	a."_AreaStatus-Lastextent" as 'Ultimo extend'
from pub."_AreaStatus" a
