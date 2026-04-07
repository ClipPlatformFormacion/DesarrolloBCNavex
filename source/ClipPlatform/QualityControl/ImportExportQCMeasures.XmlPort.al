namespace ClipPlatform.QualityControl;

xmlport 50100 "Import/Export QC Measures"
{
    Caption = 'Import/Export QC Measures', comment = 'ESP="Importar/exportar medidas CC"';
    FormatEvaluate = Xml;
    Format = VariableText;
    FieldDelimiter = '"';
    FieldSeparator = ';';

    schema
    {
        textelement(Root)
        {
            tableelement(QualityControlMeasures; "Quality Control Measures")
            {
                AutoUpdate = true;

                fieldelement(Measure; QualityControlMeasures.Measure) { }
                fieldelement(Description; QualityControlMeasures.Description) { }
                fieldelement(Blocked; QualityControlMeasures.Blocked) { }
                // textelement(ExtraDescription; ExtraDescriptionTxt){}
                trigger OnBeforeInsertRecord()
                begin
                    ChangeDescription();
                end;

                trigger OnBeforeModifyRecord()
                begin
                    ChangeDescription();
                end;
            }
        }
    }

    local procedure ChangeDescription()
    begin
        QualityControlMeasures.Description := 'IMPORTADO: ' + QualityControlMeasures.Description;
    end;
}