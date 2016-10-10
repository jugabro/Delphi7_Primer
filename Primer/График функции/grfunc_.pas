unit grfunc_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

// �������, ������ ������� ���� ���������
 Function f(x:real):real;
 begin
    f:=2*Sin(x)*exp(x/5);
 end;

// ������ ������ �������
procedure GrOfFunc;
var
 x1,x2:real;    // ������� ��������� ��������� �������
 y1,y2:real;    // ������� ��������� �������� �������
 x:real;        // �������� �������
 y:real;        // �������� ������� � ����� x
 dx:real;       // ���������� ���������
 l,b:integer;   // ����� ������ ���� ������� ������ �������
 w,h:integer;   // ������ � ������ ������� ������ �������
 mx,my:real;    // ������� �� ���� X � Y
 x0,y0:integer; // ����� - ������ ���������

begin
 // ������� ������ �������
 l:=10;                     // X - ���������� ������ �������� ����
 b:=Form1.ClientHeight-20;  // Y - ���������� ������ �������� ����
 h:=Form1.ClientHeight-40;  // ������
 w:=Form1.Width-40;         // ������

 x1:=0;     // ������ ������� ��������� ���������
 x2:=25;    // ������� ������� ��������� ���������
 dx:=0.01;  // ��� ���������

 // ������ ������������ � ����������� ��������
 //  ������� �� ������� [x1,x2]
 y1:=f(x1); // �������
 y2:=f(x1); // ��������
 x:=x1;
 repeat
   y := f(x);
   if y < y1 then y1:=y;
   if y > y2 then y2:=y;
   x:=x+dx;
 until (x>=x2);

 // �������� �������
 my:=h/abs(y2-y1);  // ������� �� ��� Y
 mx:=w/abs(x2-x1);  // ������� �� ��� X

 // ���
 x0:=l;
 y0:=b-Abs(Round(y1*my));

 with form1.Canvas do
 begin
   // ���
   MoveTo(l,b);LineTo(l,b-h);
   MoveTo(x0,y0);LineTo(x0+w,y0);
   TextOut(l+5,b-h,FloatToStrF(y2,ffGeneral,6,3));
   TextOut(l+5,b,FloatToStrF(y1,ffGeneral,6,3));
   // ���������� �������
   x:=x1;
   repeat
     y:=f(x);
     Pixels[x0+Round(x*mx),y0-Round(y*my)]:=clRed;
     x:=x+dx;
   until (x>=x2);
 end;
end;


procedure TForm1.FormPaint(Sender: TObject);
begin
  GrOfFunc;
end;

// ��������� ������ ���� ���������
procedure TForm1.FormResize(Sender: TObject);
begin
  // �������� �����
  form1.Canvas.FillRect(Rect(0,0,ClientWidth,ClientHeight));
  // ��������� ������
  GrOfFunc;
end;

end.
