namespace ClipPlatform.Interfaces.SecondaryApp;
using Microsoft.Sales.Customer;

codeunit 50150 "Customer Level Management"
{
    [EventSubscriber(ObjectType::Table, Database::Customer, OnValidateCustomerLevelOnBeforeUnknownLevel, '', false, false)]
    local procedure OnValidateCustomerLevelOnBeforeUnknownLevel_HandleGoldValue(var Rec: Record Customer; var Handled: Boolean)
    begin
        if Rec.Level <> Rec.Level::Gold then
            exit;

        Rec.Validate(Discount, 15);
        Handled := true;
    end;
}