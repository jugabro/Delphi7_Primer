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

// ‘ункци€, график которой надо построить
 Function f(x:real):real;
 begin
    f:=2*Sin(x)*exp(x/5);
 end;

// строит график функции
procedure GrOfFunc;
var
 x1,x2:real;    // границы изменени€ аргумента функции
 y1,y2:real;    // границы изменени€ значени€ функции
 x:real;        // аргумент функции
 y:real;        // значение функции в точке x
 dx:real;       // приращение аргумента
 l,b:integer;   // левый нижний угол области вывода графика
 w,h:integer;   // ширина и высота области вывода графика
 mx,my:real;    // масштаб по ос€м X и Y
 x0,y0:integer; // точка - начало координат

begin
 // область вывода графика
 l:=10;                     // X - координата левого верхнего угла
 b:=Form1.ClientHeight-20;  // Y - координата левого верхнего угла
 h:=Form1.ClientHeight-40;  // высота
 w:=Form1.Width-40;         // ширина

 x1:=0;     // нижн€€ граница диапазона аргумента
 x2:=25;    // верхн€€ граница диапазона аргумента
 dx:=0.01;  // шаг аргумента

 // найдем максимальное и минимальное значени€
 //  функции на отрезке [x1,x2]
 y1:=f(x1); // минимум
 y2:=f(x1); // максимум
 x:=x1;
 repeat
   y := f(x);
   if y < y1 then y1:=y;
   if y > y2 then y2:=y;
   x:=x+dx;
 until (x>=x2);

 // вычислим масштаб
 my:=h/abs(y2-y1);  // масштаб по оси Y
 mx:=w/abs(x2-x1);  // масштаб по оси X

 // оси
 x0:=l;
 y0:=b-Abs(Round(y1*my));

 with form1.Canvas do
 begin
   // оси
   MoveTo(l,b);LineTo(l,b-h);
   MoveTo(x0,y0);LineTo(x0+w,y0);
   TextOut(l+5,b-h,FloatToStrF(y2,ffGeneral,6,3));
   TextOut(l+5,b,FloatToStrF(y1,ffGeneral,6,3));
   // построение графика
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

// изменилс€ размер окна программы
procedure TForm1.FormResize(Sender: TObject);
begin
  // очистить форму
  form1.Canvas.FillRect(Rect(0,0,ClientWidth,ClientHeight));
  // построить график
  GrOfFunc;
end;

end.
