unit peter_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Mask, Db, DBTables,
  jpeg; // ����� ����� ���� �������� jpg �����������

type
  TForm1 = class(TForm)
    Table1: TTable;            // ���� ������ - �������
    DataSource1: TDataSource;  // �������� ������ ��� �����
                               // ��������������-���������
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    Image1: TImage;
    DBEdit3: TDBEdit;
    DBNavigator1: TDBNavigator;
    Label4: TLabel;
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure Table1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  BmpPath: string;  // ���� � ������ �����������. �����������
                    // ��������� � ����������� Data �������� ���������.

implementation
{$R *.DFM}

// ������� ���������� � ���� Image1
procedure ShowFoto(foto: string);
  begin
    try
       Form1.Image1.Picture.LoadFromFile(BmpPath+foto);
       Form1.Image1.Visible:=True;
     except
       on EFOpenError do
       begin
         MessageDlg('���� ����������� '+foto+' �� ������.',
                     mtInformation, [mbOk], 0);
       end;
    end;
end;

// ������� � ������ ������ (���������, ����������,
// ������ ��� ���������)
procedure TForm1.Table1AfterScroll(DataSet: TDataSet);
begin
     if form1.DBEdit3.Visible
        then
          begin
             form1.DBEdit3.Visible := False;
             form1.Label4.Visible:=False;
          end;
     if Form1.DBEdit3.Text <> ''
        then ShowFoto(Form1.DBEdit3.Text)
        else form1.Image1.Visible:=False;
end;


// ������� ������� � ���� ����
procedure TForm1.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         if Form1.DBEdit3.Text <> ''
             then ShowFoto(Form1.DBEdit3.Text) // �������� �����������
             else form1.Image1.Visible:=False;
end;

// ������ �� ���������� ���������
procedure TForm1.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
     case Button of
     nbInsert: begin
                Image1.Visible:=False;  // ������ ������� ������ �����������
                DBEdit3.Visible:=True;  // �������� ���� ����
                Label4.Visible:=True;   // �������� ����� ����
               end;
     nbEdit:   begin  // �������������� ������
                 DBEdit3.Visible:=True;  // �������� ���� ����
                 Label4.Visible:=True;   // �������� ����� ����
               end;
     end;
end;


procedure TForm1.Table1BeforeOpen(DataSet: TDataSet);
begin
   BmpPath:=ExtractFilePath(ParamStr(0))+'data\';
end;

end.

