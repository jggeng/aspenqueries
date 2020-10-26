SELECT
	oh.OrderHeaderId,
	oh.OrderNumber,
	oh.ExpectedDate,
	--ol.ExpectedDate as LineDate,
	oh.SubmittedDate,
	oh.DisplayText,
	ol.InvHeaderId,
	ol.QtyOrdered,
	pm.PartNo,
	pm.Description,
	ih.DocNo,
	ih.WODisplayText,
	ih.WODeliveryDate,
	ih.WOUnitModel,
	ih.WOUnitBaseSerial,
	wos.DisplayText as CurWOStatus
	
FROM
	parts.OrderHeader as oh

	JOIN parts.OrderLine as ol on oh.OrderHeaderId = ol.OrderHeaderId
	JOIN parts.PartMaster as pm on ol.PartId = pm.PartId
	JOIN pos.InvoiceHeader as ih on ol.InvHeaderId = ih.InvoiceDocId
	JOIN system.WorkOrderStatus as wos on ih.WOStatusId = wos.WorkOrderStatusId

WHERE
	oh.IsActive = 1 and
	oh.Completed = 0 and
	--oh.LocationToId = 1 and
	ol.InvHeaderId is not null and
	ol.Completed = 0 and
	ih.IsActive = 1 and
	ih.WOStatusId <> 10
