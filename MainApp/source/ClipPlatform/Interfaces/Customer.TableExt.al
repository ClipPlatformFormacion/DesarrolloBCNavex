namespace ClipPlatform.Interfaces;

using Microsoft.Sales.Customer;

tableextension 50105 Customer extends Customer
{
    fields
    {
        field(50100; "Level"; Enum "Customer Level")
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ICustomerLevel: Interface ICustomerLevel;
            begin
                ICustomerLevel := Rec.Level;
                Rec.Validate(Discount, ICustomerLevel.GetDiscount());
            end;
        }
        field(50101; Discount; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}