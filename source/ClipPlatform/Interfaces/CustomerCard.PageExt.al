namespace ClipPlatform.Interfaces;

using Microsoft.Sales.Customer;
pageextension 50107 "Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(Level; Rec.Level)
            {
                ApplicationArea = All;
            }
            field(Discount; Rec.Discount)
            {
                ApplicationArea = All;
            }
        }
    }
}