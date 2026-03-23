tableextension 50104 "Item Journal Line" extends "Item Journal Line"
{
    fields
    {
        field(50100; "QC Result (Option)"; Option)
        {
            Caption = 'Quality Control Result (option)', comment = 'ESP="Resultado control calidad (option)"';
            ToolTip = 'Specifies the Quality control result', comment = 'ESP="Establece el resultado del control de calidad"';
            DataClassification = CustomerContent;
            OptionMembers = " ",Satisfactory,"Non-Satisfactory";
            //              0,1,2,3,4,5,6
            OptionCaption = ' ,Satisfactory,Non-Satisfactory', Comment = 'ESP=" ,Satisfactorio,No satisfactorio"';
        }
        field(50101; "QC Result (Enum)"; Enum "Quality Control Result")
        {
            Caption = 'Quality Control Result (enum)', comment = 'ESP="Resultado control calidad (enum)"';
            ToolTip = 'Specifies the Quality control result', comment = 'ESP="Establece el resultado del control de calidad"';
            DataClassification = CustomerContent;
        }
    }
}