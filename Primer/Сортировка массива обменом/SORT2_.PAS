unit sort2_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
const
   SIZE=5;
var
   a:array[1..SIZE] of integer;
   k:integer;       // ������� ������� �������
   i:integer;       // ������ ��� ����� � ������ �������
   changed:boolean; // TRUE, ���� � ������� ����� ���� ������

   buf:integer;     // ����� ��� ������ ��������� �������

begin
   // ���� �������
   for i:=1 to SIZE do
       a[i] := StrToInt(StringGrid1.Cells[i-1,0]);

   label2.caption:='';

   // ��������� �������
    repeat
       changed:=FALSE;       // ����� � ������� ����� ��� �������
       for k:=1 to SIZE-1 do
           if a[k] > a[k+1] then
              begin  // �������� k-�� � k+1-�� ��������
	        buf := a[k];
	        a[k] := a[k+1];
	        a[k+1] := buf;
                changed := TRUE;
             end;

         // ����� �������
	 for i:=1 to SIZE do
             Label2.caption:=label2.caption+' '+IntTostr(a[i]);
         Label2.caption:=label2.caption+#13;

    until not changed; // ���� �� ���� �������, ������
                       // ������ ������������

    Label2.caption:=label2.caption+#13+'������ ������������.';
end;

end.
