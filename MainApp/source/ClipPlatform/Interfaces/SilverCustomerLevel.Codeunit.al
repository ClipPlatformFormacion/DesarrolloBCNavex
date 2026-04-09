namespace ClipPlatform.Interfaces;

codeunit 50103 "Silver Customer Level" implements ICustomerLevel
{
    procedure GetDiscount(): Decimal
    begin
        exit(10);
    end;
}