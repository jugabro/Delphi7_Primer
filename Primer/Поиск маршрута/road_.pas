unit road_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
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

procedure TForm1.FormActivate(Sender: TObject);
var
   i:integer;
begin
   // ��������� �����
   for i:=1 to 10 do
       StringGrid1.Cells[0,i]:=IntToStr(i);
   // ��������� �������
   for i:=1 to 10 do
       StringGrid1.Cells[i,0]:=IntToStr(i);
   // �������� ���������������� �����
   StringGrid1.Cells[1,2]:='1';
   StringGrid1.Cells[2,1]:='1';
   StringGrid1.Cells[1,3]:='1';
   StringGrid1.Cells[3,1]:='1';
   StringGrid1.Cells[1,4]:='1';
   StringGrid1.Cells[4,1]:='1';
   StringGrid1.Cells[3,7]:='1';
   StringGrid1.Cells[7,3]:='1';
   StringGrid1.Cells[4,6]:='1';
   StringGrid1.Cells[6,4]:='1';
   StringGrid1.Cells[5,6]:='1';
   StringGrid1.Cells[6,5]:='1';
   StringGrid1.Cells[5,7]:='1';
   StringGrid1.Cells[7,5]:='1';
   StringGrid1.Cells[6,7]:='1';
   StringGrid1.Cells[7,6]:='1';
end;


procedure TForm1.Button1Click(Sender: TObject);
const
   N=10;{ ���-�� ������ �����}
var
   map:array[1..N,1..N]of integer; {�����. map[i,j �� 0, ���� ����� i � j ��������� }
   road:array[1..N]of integer;     { ������ - ������ ����� ����� }
   incl:array[1..N]of boolean;     { incl[i] ����� TRUE, ���� ����� � ������� i �������� � road }
   start,finish:integer;           { ��������� � �������� ����� }
   found:boolean;
   i,j:integer;
procedure step(s,f,p:integer);
var
   c:integer;{ ����� �����,� ������� ������ ��������� ��� }
   i:integer;
begin
   if s=f then
   begin
       { ����� s � f ������� !}
       found:=TRUE;
       Label1.caption:=Label1.caption+#13+'����:';
       for i:=1 to p-1 do
          Label1.caption:=Label1.caption+' '+IntToStr(road[i]);
   end
   else begin
	{ ������� ��������� ����� }
	for c:=1 to N do
           begin { ��������� ��� ������� }
	      if(map[s,c]<> 0)and(NOT incl[c])
              { ����� ��������� � ������� � �� �������� � �������}
                  then begin
			 road[p]:=c;{ ������� ������� � ���� }
			 incl[c]:=TRUE;{ ������� ������� ��� ���������� }
			 step(c,f,p+1);
			 incl[c]:=FALSE;
                         road[p]:=0;
                  end;
           end;
   end;
end;{ ����� ��������� step }

begin
   Label1.caption:='';
   { ������������� �������� }
   for i:=1 to N do road[i]:=0;
   for i:=1 to N do incl[i]:=FALSE;

   { ���� �������� ����� �� SrtingGrid.Cells}
   for i:=1 to N do
       for j:=1 to N do
          if StringGrid1.Cells[i,j] <> ''
              then map[i,j]:=StrToInt(StringGrid1.Cells[i,j])
              else map[i,j]:=0;

   start:=StrToInt(Edit1.text);
   finish:=StrToInt(Edit2.text);

   road[1]:=start;{ ������ ����� � ������� }
   incl[start]:=TRUE;{ ������� �� ��� ���������� }

   step(start,finish,2);{���� ������ ����� �������� }

   // ��������, ������ �� ���� �� ���� ����
   if not found
       then Label1.caption:='��������� ����� �� ���������!';

end;
end.
