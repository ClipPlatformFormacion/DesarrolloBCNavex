namespace ClipPlatform.QualityControl;

enum 50100 "Quality Control Result"
{
    Extensible = true;

    value(0; " ")
    {
        Caption = ' ', comment = 'ESP=" "';
    }
    value(1; "Satisfactory")
    {
        Caption = 'Satisfactory', comment = 'ESP="Satisfactorio"';
    }
    value(2; "Non-Satisfactory")
    {
        Caption = 'Non-Satisfactory', comment = 'ESP="No Satisfactorio"';
    }
}