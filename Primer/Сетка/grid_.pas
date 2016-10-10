unit grid_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormPaint(Sender: TObject);
var
 x0,y0:integer; // ���������� ������ ������������ ���� 
 dx,dy:integer; // ��� ������������ ����� (� ��������) 
 h,w:integer;   // ������ � ������ ������� ������ ������������ ����� 
 x,y:integer;

 lx,ly:real;    // ����� (���������) ����� ����� �� X  Y 
 dlx,dly:real;  // ��� ����� (���������) ����� ����� �� X � Y 
 cross:integer; // ������� �� ������������ ����� ����� 
 dcross:integer;// ���������� �� ������������ ����� ����� ������������� 
begin
 x0:=30; y0:=220; // ��� ���������� � ����� (40,250)
 dx:=40; dy:=40;  // ��� ������������ ����� 40 ��������
 dcross:=1;       // �������� ����� ����� X: 1 - ������;
                  //                         2 - ����� ����;
                  //                         3 - ����� ���;
 dlx:=0.5;        // ��� ����� ��� X
 dly:=1.0;        // ��� ����� ��� Y, ������� �����: 1, 2, 3 � �.�.

 h:=200;
 w:=300;

 with form1.Canvas do
 begin
   cross:=dcross;
   MoveTo(x0,y0); LineTo(x0,y0-h);  // ��� X
   MoveTo(x0,y0); LineTo(x0+w,y0);  // ��� Y

   // �������, ����� � ��������� �� ��� X 
   x:=x0+dx;
   lx:=dlx;
   repeat
     MoveTo(x,y0-3);LineTo(x,y0+3);  // �������
     cross:=cross-1;
     if cross = 0 then   //���������
     begin
       TextOut(x-8,y0+5,FloatToStr(lx));
       cross:=dcross;
     end;
     Pen.Style:=psDot;
     MoveTo(x,y0-3);LineTo(x,y0-h);  // ����� �����
     Pen.Style:=psSolid;
     lx:=lx+dlx;
     x:=x+dx;
   until (x>x0+w);

   // �������, ����� � ��������� �� ��� Y 
   y:=y0-dy;
   ly:=dly;
   repeat
     MoveTo(x0-3,y);LineTo(x0+3,y);    // ������� 
     TextOut(x0-20,y,FloatToStr(ly));  // ��������� 
     Pen.Style:=psDot;
     MoveTo(x0+3,y); LineTo(x0+w,y);    // ����� �����
     Pen.Style:=psSolid;
     y:=y-dy;
     ly:=ly+dly;
   until (y<y0-h);
  end;
end;

end.
