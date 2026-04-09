namespace ClipPlatform.Interfaces;

using Microsoft.Sales.Customer;

tableextension 50105 Customer extends Customer
{
    fields
    {
        field(50100; "Level"; Option)
        {
            OptionMembers = " ",Bronze,Silver;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                case Rec.Level of
                    Rec.Level::" ":
                        Rec.Validate(Discount, 0);
                    Rec.Level::Bronze:
                        Rec.Validate(Discount, 5);
                    Rec.Level::Silver:
                        Rec.Validate(Discount, 10);
                    else
                        Error('Nivel %1 desconodido', Rec.Level);
                end;
            end;
        }
        field(50101; Discount; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}