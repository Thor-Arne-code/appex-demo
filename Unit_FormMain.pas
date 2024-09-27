unit Unit_FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, mySQLDbTables, Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    MySQLDatabase1: TMySQLDatabase;
    MySQLTable_Leverandør: TMySQLTable;
    MySQLTable_Kontakt: TMySQLTable;
    MySQLTable_Roller: TMySQLTable;
    Panel2: TPanel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    DataSource_Levrandør: TDataSource;
    DataSource_Kontakt: TDataSource;
    DataSource_Roller: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  //
  if (gdFocused in State) then
    begin
      if (Column.Field.FieldName = DBLookupComboBox1.DataField) then
        with DBLookupComboBox1 do
          begin
            Left := Rect.Left + DBGrid1.Left + 2;
            Top := Rect.Top + DBGrid1.Top + 2;
            Width := Rect.Right - Rect.Left;
            Width := Rect.Right - Rect.Left;
            Height := Rect.Bottom - Rect.Top;
            Visible := True;
          end;
    end;
end;

end.
