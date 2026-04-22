namespace ClipPlatform.Sales;
using System.Globalization;

#pragma warning disable PTE0025, AS0130
table 50103 Customer
#pragma warning restore PTE0025, AS0130
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Language"; Code[10])
        {
            TableRelation = Language;
        }
        field(3; "Posting Group"; Code[20])
        {
            TableRelation = Microsoft.Sales.Customer."Customer Posting Group";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}