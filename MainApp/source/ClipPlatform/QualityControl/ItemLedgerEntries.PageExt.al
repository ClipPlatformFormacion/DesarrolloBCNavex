namespace ClipPlatform.QualityControl;

using Microsoft.Inventory.Ledger;
using Microsoft.Purchases.Vendor;

pageextension 50104 "Item Ledger Entries" extends "Item Ledger Entries"
{
    layout
    {
        addafter(Quantity)
        {
            field("QC Result (Option)"; Rec."QC Result (Option)")
            {
                ApplicationArea = All;
            }
            field("QC Result (Enum)"; Rec."QC Result (Enum)")
            {
                ApplicationArea = All;
            }
            field(MySourceNo; Rec."Source No.")
            {
                ApplicationArea = All;
            }
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = All;
            }
#pragma warning disable AA0225
            field(VendorName2; UnaLlamadaAUnaFuncion(Rec."Source No."))
            {
                ApplicationArea = All;
            }
#pragma warning restore
        }
    }

    local procedure UnaLlamadaAUnaFuncion(VendorNo: Code[20]) VendorName: Text[100]
    var
        Vendor: Record Vendor;
        VendorFound: Boolean;
    begin
        Vendor.SetLoadFields(Name);
        VendorFound := Vendor.Get(VendorNo);
        if VendorFound then
            VendorName := Vendor.Name;
    end;
}