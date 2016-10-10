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
     tabl.Cells[0,0]:='Страна';
     tabl.Cells[1,0]:='Золотых';
     tabl.Cells[2,0]:='Серебряных';
     tabl.Cells[3,0]:='Бронзовых';
     tabl.Cells[4,0]:='Всего';
     tabl.Cells[5,0]:='Баллов';
     tabl.Cells[0,1]:='Австралия';
     tabl.Cells[0,2]:='Белоруссия';
     tabl.Cells[0,3]:='Великобритания';
     tabl.Cells[0,4]:='Германия';
     tabl.Cells[0,5]:='Италия';
     tabl.Cells[0,6]:='Китай';
     tabl.Cells[0,7]:='Корея';
     tabl.Cells[0,8]:='Куба';
     tabl.Cells[0,9]:='Нидерланды';
     tabl.Cells[0,10]:='Россия';
     tabl.Cells[0,11]:='США';
     tabl.Cells[0,12]:='Франция';
     tabl.Cells[0,13]:='Япония';
end;

procedure TForm1.Button1Click(Sender: TObject);
var
   c,r:integer; // номер колонки и строки таблицы
   s:integer;   // всего медалей у команды
   p:integer;   // очков у команды

   m:integer;   // номер строки с максимальным количеством очков
   buf:array[0..5] of string; // буфер для обмена строк
   i:integer;    // номер строки используется во время сортировки

begin
   for r:=1 to tabl.rowcount do // обработать все строки
   begin
      s:=0;
      // вычисляем общее кол-во медалей
      for c:=1 to 3 do
          if tabl.cells[c,r] <> ''
             then s:=s+StrToInt(tabl.cells[c,r])
             else tabl.cells[c,r]:='0';
      // вычисляем количество очков
      p:=7*StrToInt(tabl.cells[1,r])+
         6*StrToInt(tabl.cells[2,r])+
         5*StrToInt(tabl.cells[3,r]);

      // вывод результата
      tabl.cells[4,r]:=IntToStr(s); // всего медалей
      tabl.cells[5,r]:=IntToStr(p); // очков
   end;

   // сортировка таблицы по убыванию в соответствие
   // с количеством баллов (по содержимому 5-ого столбца)
   // сортировка методом выбора
   for r:=1 to tabl.rowcount-1 do
   begin
       m:=r; // максимальный элемент - в r-ой строке
       for i:=r to tabl.rowcount-1 do
         if StrToInt(tabl.cells[5,i])>StrToInt(tabl.cells[5,m])
            then m:=i;

       if r <> m then
       begin // обменяем r-ую и m-ую строки таблицы
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
