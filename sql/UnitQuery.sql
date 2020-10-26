select
	ub.UnitId,
	ub.StockNo,
	ub.LocationId,
	ub.StockStatus,
	ub.BaseSerial,
	ub.Model,
	ub.[Description],
	ub.MiscUserDefined1 as Tier,
	ub.DateOrdered,
	ub.DateReceived,
	ub.UnitGroupId,
	ug.DisplayText as UgText

from units.unitbase as ub
left join units.v_UnitCommitted as ucom on ub.UnitId = ucom.UnitId
left join units.unitgroup as ug on ub.UnitGroupId = ug.UnitGroupId
--left join units.category as ucat on ub.UnitCategoryId = ucat.UnitCategoryId

where 
	ub.IsActive = 1
		and (ub.StockStatus = 'instock' or ub.StockStatus = 'expected')
		and ucom.UnitId is null
		and 
		(ub.UnitCategoryId = 11 or
		ub.UnitCategoryId = 12 or
		ub.UnitCategoryId = 13 or
		ub.UnitCategoryId = 14 or
		ub.UnitCategoryId = 15 or
		ub.UnitCategoryId = 16 or
		ub.UnitCategoryId = 17 or
		ub.UnitCategoryId = 19 or
		ub.UnitCategoryId = 25)

order by DateOrdered desc
