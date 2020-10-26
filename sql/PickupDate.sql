select ih.*
from pos.InvoiceHeader as ih
where 
(
	ih.IsActive = 1 and
	ih.CustomerId not in (966, 967) and
	ih.InvoiceType = 'wo' and
	ih.FinalizedDate is null and
	ih.WOPickupDate is not null
)
order by ih.WOPickupDate asc