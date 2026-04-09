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
                Handled: Boolean;
            begin
                case Rec.Level of
                    Rec.Level::" ":
                        Rec.Validate(Discount, 0);
                    Rec.Level::Bronze:
                        Rec.Validate(Discount, 5);
                    Rec.Level::Silver:
                        Rec.Validate(Discount, 10);
                    else begin
                        OnValidateCustomerLevelOnBeforeUnknownLevel(Rec, Handled);
                        if not Handled then
                            Error('Nivel %1 desconodido', Rec.Level);
                    end;
                end;
            end;
        }
        field(50101; Discount; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
    }

    [IntegrationEvent(false, false)]
    local procedure OnValidateCustomerLevelOnBeforeUnknownLevel(var Rec: Record Customer; var Handled: Boolean)
    begin

    end;
}