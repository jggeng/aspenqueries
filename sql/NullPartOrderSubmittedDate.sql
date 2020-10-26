select 
	oh.OrderNumber,
	oh.DisplayText,
	ih.DocNo,
	ih.WODescription,
	ol.QtyOrdered,
	pm.PartNo,
	pm.Description,
	oh.OrderDate

from parts.OrderHeader as oh
	join parts.OrderLine as ol on oh.OrderHeaderId = ol.OrderHeaderId
	left join pos.InvoiceHeader as ih on ol.InvHeaderId = ih.InvoiceDocId
	join parts.PartMaster as pm on ol.PartId = pm.PartId

where oh.Completed = 0 and oh.SubmittedDate is null and oh.IsActive = 1 and ol.IsActive = 1

order by oh.OrderDate asc