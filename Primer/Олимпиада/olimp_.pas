unit olimp_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls;

type
  TForm1 = class(TForm)
    Tabl: TStringGrid;
    Button1: TButton;
    Label1: TLabel;
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
begin
     tabl.Cells[0,0]:='������';
     tabl.Cells[1,0]:='�������';
     tabl.Cells[2,0]:='����������';
     tabl.Cells[3,0]:='���������';
     tabl.Cells[4,0]:='�����';
     tabl.Cells[5,0]:='������';
     tabl.Cells[0,1]:='���������';
     tabl.Cells[0,2]:='����������';
     tabl.Cells[0,3]:='��������������';
     tabl.Cells[0,4]:='��������';
     tabl.Cells[0,5]:='������';
     tabl.Cells[0,6]:='�����';
     tabl.Cells[0,7]:='�����';
     tabl.Cells[0,8]:='����';
     tabl.Cells[0,9]:='����������';
     tabl.Cells[0,10]:='������';
     tabl.Cells[0,11]:='���';
     tabl.Cells[0,12]:='�������';
     tabl.Cells[0,13]:='������';
end;

procedure TForm1.Button1Click(Sender: TObject);
var
   c,r:integer; // ����� ������� � ������ �������
   s:integer;   // ����� ������� � �������
   p:integer;   // ����� � �������

   m:integer;   // ����� ������ � ������������ ����������� �����
   buf:array[0..5] of string; // ����� ��� ������ �����
   i:integer;    // ����� ������ ������������ �� ����� ����������

begin
   for r:=1 to tabl.rowcount do // ���������� ��� ������
   begin
      s:=0;
      // ��������� ����� ���-�� �������
      for c:=1 to 3 do
          if tabl.cells[c,r] <> ''
             then s:=s+StrToInt(tabl.cells[c,r])
             else tabl.cells[c,r]:='0';
      // ��������� ���������� �����
      p:=7*StrToInt(tabl.cells[1,r])+
         6*StrToInt(tabl.cells[2,r])+
         5*StrToInt(tabl.cells[3,r]);

      // ����� ����������
      tabl.cells[4,r]:=IntToStr(s); // ����� �������
      tabl.cells[5,r]:=IntToStr(p); // �����
   end;

   // ���������� ������� �� �������� � ������������
   // � ����������� ������ (�� ����������� 5-��� �������)
   // ���������� ������� ������
   for r:=1 to tabl.rowcount-1 do
   begin
       m:=r; // ������������ ������� - � r-�� ������
       for i:=r to tabl.rowcount-1 do
         if StrToInt(tabl.cells[5,i])>StrToInt(tabl.cells[5,m])
            then m:=i;

       if r <> m then
       begin // �������� r-�� � m-�� ������ �������
          for c:=0 to 5 do
             begin
                   buf[c]:=tabl.Cells[c,r];
                   tabl.Cells[c,r]:=tabl.Cells[c,m];
                   tabl.Cells[c,m]:=buf[c];
             end;
       end;
   end;
end;

end.
