codeunit 50152 GetMin
{
    procedure GetMin(Parametro1: Decimal; Parametro2: Decimal): Decimal
    begin
        if Parametro1 < Parametro2 then
            exit(Parametro1)
        else
            exit(Parametro2);
    end;
}