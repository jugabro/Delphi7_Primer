unit mcircle_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

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


implementation

{$R *.DFM}

var
  Form1: TForm1;
  x,y: byte;    // ���������� ������ ���������� 
  dx: byte;     // ���������� ���������� x ��� �������� ���������� 

procedure Ris;
begin
     // ������� ���������� 
     form1.Canvas.Pen.Color:=form1.Color;
     form1.Canvas.Ellipse(x,y,x+10,y+10);

     x:=x+dx;

     // ���������� ���������� �� ����� ����� 
     form1.Canvas.Pen.Color:=clBlack;
     form1.Canvas.Ellipse(x,y,x+10,y+10);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Ris;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  x:=0;
  y:=10;
  dx:=5;
  timer1.Interval:=50; // ������ ������������� ������� OnTimer - 0.5 ���
  form1.canvas.brush.color:=form1.color;
end;

end.
