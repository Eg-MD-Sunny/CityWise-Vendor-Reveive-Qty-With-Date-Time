--Previous Date
-- Receive QTY Vendor and Warehouse Wise
select 
	max(cast(dbo.tobdt(po.CompletedOn) as smalldatetime)) ReceivedOn,
	w.id SourcingWarehouseId, 
	w.name SourcingWarehouse,
	v.id VendorID,
	v.name VendorName,
	pv.Id [PVID],
	pv.Name [Product],
	count(*) ReceiveQuantity,
	sum(t.costprice) ReceiveAmount

from thing t
join productvariant pv on pv.id=t.ProductVariantId
join PurchaseOrder po on po.id=t.PurchaseOrderId
join warehouse w on w.id=po.sourcingwarehouseid
join vendor v on v.id=po.vendorid

where po.completedon is not null
and po.CompletedOn>='2022-09-08 00:00 +06:00'
and po.CompletedOn<'2022-09-10 00:00 +06:00'
and t.costprice is not null
and pv.Id in (15976,23569,15549,10049,23904,10052,22899,3158,22960,6965,5609,6010,22141,10050,22392,13346,23061,6008,10727,8474,18522,6012,10765,6013,6009,23144,4248,7404,7196,24609,23802,36114,6424)

group by w.id,w.name,v.id,v.name,pv.Id ,pv.Name
order by 2 asc





