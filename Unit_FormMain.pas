unit Unit_FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, mySQLDbTables, Vcl.ComCtrls,
  Vcl.Menus, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

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
    DBLookupComboBox1: TDBLookupComboBox;
    MySQLTable_KontaktID_Kontakt: TAutoIncField;
    MySQLTable_KontaktRel_Leverandor: TLargeintField;
    MySQLTable_KontaktRel_Roller: TIntegerField;
    MySQLTable_KontaktFornavn: TWideStringField;
    MySQLTable_KontaktEtternavn: TWideStringField;
    MySQLTable_KontaktEpost: TWideStringField;
    MySQLTable_KontaktTelefon: TWideStringField;
    MySQLTable_Kontakt_Rolle: TStringField;
    ComboBox1: TComboBox;
    Label11: TLabel;
    MainMenu1: TMainMenu;
    Fil1: TMenuItem;
    Avslutt1: TMenuItem;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Avslutt1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Avslutt1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.DBGrid1ColExit(Sender: TObject);
begin
// Skjule kombo boks når feltet mister fokus
  if DBGrid1.SelectedField.FieldName = DBLookupComboBox1.DataField then
    DBLookupComboBox1.Visible := False
end;

procedure TForm2.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // Tegne opp combo boks i stedet for tekst når i fokus
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

procedure TForm2.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
// Sende alle tastetrykk uten om tab til combo boks
  if (key = Chr(9)) then
    Exit;
  if (DBGrid1.SelectedField.FieldName = DBLookupComboBox1.DataField) then
    begin
      DBLookupComboBox1.SetFocus;
      SendMessage(DBLookupComboBox1.Handle, WM_Char, word(Key), 0);
    end;
end;

end.
