namespace ClipPlatform.Interfaces.SecondaryApp;
using ClipPlatform.Interfaces;

codeunit 50150 "Gold Customer Level" implements ICustomerLevel
{
    procedure GetDiscount(): Decimal
    begin
        exit(15);
    end;
}