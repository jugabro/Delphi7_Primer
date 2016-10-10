unit Stars_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure StarLine(x0,y0,r: integer; Canvas: TCanvas);
    // x0,y0 - ���������� ������ ������
    // r - ������ ������
var
    p : array[1..11] of TPoint; // ������ ��������� ����� � ������
    a: integer;   // ���� ����� ���� �� � ������, �����������
                  // ����� ������ � ����� ���� ��� �������
    i: integer;
begin
    a := 18; // ������ �� ������� ���. ����
    for i:=1 to 10 do
       begin
          if (i mod 2 = 0) then
             begin // �������
               p[i].x := x0+Round(r/2*cos(a*2*pi/360));
               p[i].y:=y0-Round(r/2*sin(a*2*pi/360));
             end
          else
             begin // ���
               p[i].x:=x0+Round(r*cos(a*2*pi/360));
               p[i].y:=y0-Round(r*sin(a*2*pi/360));
             end;
          a := a+36;

       end;

    p[11].X := p[1].X; // ����� �������� ������ ������
    p[11].Y := p[1].Y;

    Canvas.Polyline(p); // ��������� ������
end;

// ������� ������ ����
procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
                               Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft  // ������ ����� ������?
     then Form1.Canvas.Pen.Color := clBlack
     else Form1.Canvas.Pen.Color := clRed;
  StarLine(x, y, 30,Form1.Canvas);
end;

end.
