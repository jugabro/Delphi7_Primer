unit brustyle_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations}
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormPaint(Sender: TObject);
const
  bsName: array[1..8] of string =
           ('bsSolid','bsClear','bsHorizontal',
            'bsVertical','bsFDiagonal','bsBDiagonal',
            'bsCross','bsDiagCross');
var
  x,y: integer;   // координаты левого верхнего угла прямоугольника
  w,h: integer;   // ширина и высота прямоугольника
  bs: TBrushStyle;// стиль заполнения области
  k: integer;     // номер стиля заполнения
  i,j: integer;

begin
  w:=40; h:=40; // размер области(прямоугольника)
  y:=20;

  for i:=1 to 2 do
  begin
    x:=10;
    for j:=1 to 4 do
    begin
       k:=j+(i-1)*4; // номер стиля заполнения
       case k of
         1: bs := bsSolid;
         2: bs := bsClear;
         3: bs := bsHorizontal;
         4: bs := bsVertical;
         5: bs := bsFDiagonal;
         6: bs := bsBDiagonal;
         7: bs := bsCross;
         8: bs := bsDiagCross;
        end;

        // вывод прямоугольника
        Canvas.Brush.Color := clGreen; // цвет закраски - зеленый
        Canvas.Brush.Style := bs;      // стиль закраски
        Canvas.Rectangle(x,y,x+w,y+h);

        // вывод названия стиля
        Canvas.Brush.Style:=bsClear;
        Canvas.TextOut(x,y-15,bsName[k]); // вывод названия стиля
        x := x+w+30;
    end;
    y := y+h+30;
  end;
end;

end.
