namespace ClipPlatform.QualityControl;

using Microsoft.Inventory.Item;

pageextension 50105 "Item List" extends "Item List"
{
    layout
    {
        addbefore(InventoryField)
        {
            field("Non-Satisfactory Purch. (Qty.)"; Rec."Non-Satisfactory Purch. (Qty.)")
            {
                ApplicationArea = All;
            }
        }
    }
}