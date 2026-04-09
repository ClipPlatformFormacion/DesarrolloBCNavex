namespace ClipPlatform.Interfaces;

codeunit 50101 "Bronze Customer Level" implements ICustomerLevel
{
    procedure GetDiscount(): Decimal
    begin
        exit(5);
    end;
}