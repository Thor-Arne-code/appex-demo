unit Unit_FormMain;

interface

uses
  System.JSON, ShellAPI,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, mySQLDbTables, Vcl.ComCtrls,
  Vcl.Menus, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent;

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
    MainMenu1: TMainMenu;
    Fil1: TMenuItem;
    Avslutt1: TMenuItem;
    NetHTTPClient1: TNetHTTPClient;
    MySQLTable_LeverandørID_Leverandor: TLargeintField;
    MySQLTable_LeverandørNavn: TWideStringField;
    MySQLTable_LeverandørOrgNr: TWideStringField;
    MySQLTable_LeverandørHjemmeside: TWideStringField;
    MySQLTable_LeverandørTlfSentralbord: TWideStringField;
    MySQLTable_LeverandørEpost: TWideStringField;
    MySQLTable_LeverandørRabatt: TFloatField;
    MySQLTable_LeverandørAddresse1: TWideStringField;
    MySQLTable_LeverandørAdresse2: TWideStringField;
    MySQLTable_LeverandørPostNr: TWideStringField;
    MySQLTable_LeverandørPostSted: TWideStringField;
    Panel4: TPanel;
    ComboBox_Filter: TComboBox;
    Label11: TLabel;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Avslutt1Click(Sender: TObject);
    procedure DataSource_LevrandørDataChange(Sender: TObject; Field: TField);
    procedure MySQLTable_RollerAfterOpen(DataSet: TDataSet);
    procedure ComboBox_FilterChange(Sender: TObject);
    procedure DBEdit3DblClick(Sender: TObject);
    procedure DBEdit5DblClick(Sender: TObject);
    procedure DBEdit4DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetPoststed(postnr:string):string;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}



procedure TForm2.Avslutt1Click(Sender: TObject);
begin
  Close;
end;



function TForm2.GetPoststed(postnr:string):string;
// Returnerer poststed med gitt postnr
var
  Response: IHttpResponse;
  JSonValue: TJSonValue;
  URL, r, s: string;
begin
  URL := 'https://webapi.no/api/v1/zipcode/' + postnr;
  try
    Response := NetHTTPClient1.Get(URL);
    s := Response.ContentAsString;
    // Må teste på streng innhold siden webapi returnerer noe uansett.
    if Pos('ikke postnummer', s) = 0 then
      begin
        JsonValue := TJSonObject.ParseJSONValue(s);
        r := JsonValue.GetValue<string>('data.city');
        JSonValue.Free;
      end
    else
      r := '(Ukjent)';
  finally
  end;
  Result := r;
end;



procedure TForm2.MySQLTable_RollerAfterOpen(DataSet: TDataSet);
begin
  // Populere filter combo boks
  ComboBox_Filter.Items.BeginUpdate;
  if DataSource_Roller.DataSet.FindFirst then
    begin
      ComboBox_Filter.Items.Add(DataSource_Roller.DataSet.FieldByName('Rolle').AsString);
      while DataSource_Roller.DataSet.FindNext do
        begin
          ComboBox_Filter.Items.Add(DataSource_Roller.DataSet.FieldByName('Rolle').AsString);
        end;
    end;
  ComboBox_Filter.Items.EndUpdate;
end;



procedure TForm2.ComboBox_FilterChange(Sender: TObject);
begin
  // Aktivere/deaktivere filter på rolle feltet
  if ComboBox_Filter.ItemIndex = 0 then
    begin
    DataSource_Kontakt.DataSet.Filter := '';
    DataSource_Kontakt.DataSet.Filtered := False;
    end
  else
    begin
      DataSource_Kontakt.DataSet.Filter := 'Rel_Roller = ' + IntToStr(ComboBox_Filter.ItemIndex);
      DataSource_Kontakt.DataSet.Filtered := True;
    end;
end;



procedure TForm2.DataSource_LevrandørDataChange(Sender: TObject;
  Field: TField);
// Oppdatere poststed når postnr endres
var
  s: string;
begin
   if Field <> nil then // Field må være allokert
    if Field.Name = 'MySQLTable_LeverandørPostNr' then // Kun prosessere PostNr
      begin
        s := DataSource_Levrandør.DataSet.FieldByName('PostNr').AsString;
        if Length(s) = 4 then
          begin
            if DataSource_Levrandør.DataSet.State = dsEdit then
              DataSource_Levrandør.DataSet.FieldByName('PostSted').AsString := GetPoststed(s);
          end;
      end;
end;



procedure TForm2.DBEdit3DblClick(Sender: TObject);
var
  tmp: string;
begin
  // Åpne i standard nettleser
  tmp := 'https://' + DataSource_Levrandør.DataSet.FieldByName('Epost').AsString;
  ShellExecute(self.WindowHandle,'open',PChar(tmp),nil,nil, SW_SHOWNORMAL);
end;



procedure TForm2.DBEdit4DblClick(Sender: TObject);
var
  tmp: string;
begin
  // Åpne i standard telefon app
  tmp := 'tel:' + DataSource_Levrandør.DataSet.FieldByName('TlfSentralbord').AsString;
  ShellExecute(self.WindowHandle,'open',PChar(tmp),nil,nil, SW_SHOWNORMAL);
end;



procedure TForm2.DBEdit5DblClick(Sender: TObject);
var
  tmp: string;
begin
  // Åpne i standard epost
  tmp := 'mailto:' + DataSource_Levrandør.DataSet.FieldByName('Hjemmeside').AsString;
  ShellExecute(self.WindowHandle,'open',PChar(tmp),nil,nil, SW_SHOWNORMAL);
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
  // Tegne opp combo boks i stedet for tekst boks når i fokus
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
