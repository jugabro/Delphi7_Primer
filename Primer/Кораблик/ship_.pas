unit ship_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  x,y: integer; // ���������� ������� (������� �����)

implementation

{$R *.DFM}

procedure Titanik(x,y: integer;   // ���������� ������� �����
                  color: TColor); // ���� �������
const
  dx = 5;
  dy = 5;
var
  buf: TColor;
begin
  with form1.canvas do
  begin
    buf:=pen.Color;   // �������� ������� ����
    pen.Color:=color; // ��������� ������ ����
    // ������ ...
    //  ������
    MoveTo(x,y);
    LineTo(x,y-2*dy);
    LineTo(x+10*dx,y-2*dy);
    LineTo(x+11*dx,y-3*dy);
    LineTo(x+17*dx,y-3*dy);
    LineTo(x+14*dx,y);
    LineTo(x,y);
    // ����������
    MoveTo(x+3*dx,y-2*dy);
    LineTo(x+4*dx,y-3*dy);
    LineTo(x+4*dx,y-4*dy);
    LineTo(x+13*dx,y-4*dy);
    LineTo(x+13*dx,y-3*dy);
    MoveTo(x+5*dx,y-3*dy);
    LineTo(x+9*dx,y-3*dy);
    // ����������� ������
    Rectangle(x+8*dx,y-4*dy,x+11*dx,y-5*dy);
    // �����
    Rectangle(x+7*dx,y-4*dy,x+8*dx,y-7*dy);
    // ������������
    Ellipse(x+11*dx,y-2*dy,x+12*dx,y-1*dy);
    Ellipse(x+13*dx,y-2*dy,x+14*dx,y-1*dy);
    // �����
    MoveTo(x+10*dx,y-5*dy);
    LineTo(x+10*dx,y-10*dy);
    // ��������
    MoveTo(x+17*dx,y-3*dy);
    LineTo(x+10*dx,y-10*dy);
    LineTo(x,y-2*dy);
    pen.Color:=buf; // ����������� ������ ���� ���������
  end;
end;

// ��������� ������� �������
procedure TForm1.Timer1Timer(Sender: TObject);
begin
   Titanik(x,y,form1.color); // ������� �������
   if x < Form1.ClientWidth
      then x := x+5
      else begin // ����� ����
        x := 0;
        y := Random(50) + 100;
      end;
   Titanik(x,y,clWhite);     // ���������� � ����� �����
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
     x:=0;
     y:=100;
     Form1.Color:=clNavy;
     Timer1.Interval := 50; // ������ ������� ������ 50 ����
end;

end.
