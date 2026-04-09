namespace ClipPlatform.Reporting;

using Microsoft.Inventory.Item;
// SELECT en el SQL
query 50100 "Item Vendor"
{
    QueryType = Normal;

    elements
    {
        dataitem(Item; Item)
        {
            // DataItemTableFilter = "Replenishment System" = const(Purchase);
            column(No_; "No.") { }
            column(Description; Description) { }
            column(Requieres_Quality_Control; "Requieres Quality Control") { }
            column(Replenishment_System; "Replenishment System")
            {
                ColumnFilter = Replenishment_System = const(Purchase);
            }
            column(Vendor_No_; "Vendor No.") { }
            filter(Purchases__Qty__; "Purchases (Qty.)")
            {

            }
            dataitem(Vendor; Microsoft.Purchases.Vendor.Vendor)
            {
                DataItemLink = "No." = Item."Vendor No.";
                SqlJoinType = InnerJoin;
                column(Name; Name) { }
            }
        }
    }
}