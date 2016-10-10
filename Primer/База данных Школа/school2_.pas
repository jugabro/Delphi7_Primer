unit school2_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, ExtCtrls, DBCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Table1: TTable;              // ������� (��� ���� ������)
    Query1: TQuery;           // ������ (������ ��, ��������������� �������� ������)
    DataSource1: TDataSource;    // �������� ������ - ������� ��� ������
    DBGrid1: TDBGrid;         // ������� ��� ����������� �� ��� ���������� ���������� �������
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    Button1: TButton;         // ������ ������
    Button2: TButton;         // ������ ��� ������
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

 // ������ �� ������ ������
procedure TForm1.Button1Click(Sender: TObject);
var
    fam: string[30];
begin
    fam:=InputBox('������� ���������� �� ��',
                  '������� ������� � �������� �� OK.', '');
    if fam <> '' // ������������ ���� �������
    then
       begin
         with form1.Query1 do begin
           Close;       // ������� ����-��������� ���������� ����������� �������
           SQL.Clear;   // ������� ����� ����������� �������
           // ���������� ����� ������ � �������� SQL
           SQL.Add('SELECT Fam, Name, Class');
           SQL.Add('FROM ":�����:school.db"');
           SQL.Add('WHERE');
           SQL.Add('(Fam = "'+ fam + '")');
           SQL.Add('ORDER BY Name, Fam');
           Open;         // ������������ ���������� �������
         end;

         { *** ������ ������� ��������� �������� �������
         begin
           Query1.Close;
           Query1.SQL[3]:='(Fam="'+ fam + '")';
           Query1.Open;
           DataSource1.DataSet:=Query1;
         end;
         }


         if Query1.RecordCount <> 0 then
              DataSource1.DataSet:=Query1 // ���������� ���-� ���������� �������
            else begin
              ShowMessage('� �� ��� �������, ��������������� �������� �������.');
              DataSource1.DataSet:=Table1;
            end;
       end;
end;

// ������ �� ������ ��� ������
procedure TForm1.Button2Click(Sender: TObject);
begin
     DataSource1.DataSet:=Table1; // �������� ������ - �������
end;

// ����������� �����
procedure TForm1.FormActivate(Sender: TObject);
begin
     DataSource1.DataSet := Table1;
     Table1.Active := True;
end;

end.
