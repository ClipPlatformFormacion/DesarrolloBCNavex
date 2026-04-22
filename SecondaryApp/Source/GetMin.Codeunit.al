codeunit 50152 GetMin
{
    procedure GetMin(P1: Decimal; P2: Decimal): Decimal
    begin
        if P2 > P1 then
            exit(P1);
        exit(P2);
    end;
}