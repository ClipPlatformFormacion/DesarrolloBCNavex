codeunit 50152 GetMin
{
    procedure GetMin(Parametro1: Decimal; Parametro2: Decimal): Decimal
    begin
        if Parametro2 > Parametro1 then
            exit(Parametro1);
        exit(Parametro2);
    end;
}