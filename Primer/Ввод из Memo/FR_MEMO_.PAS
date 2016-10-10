unit fr_memo_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Label1: TLabel;
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


procedure TForm1.Button1Click(Sender: TObject);

const
   SIZE=5;  // размер массива
var
   a:array[1..SIZE]of string[30]; // массив
   n: integer; // количество строк, введенных в поле Memo
   i:integer;  // индекс элемента массива
   st:string;
begin
   n:=Memo1.Lines.Count;
   if n = 0 then
      begin
        ShowMessage('Исходные данные не введены!');
        Exit;   // выход из процедуры обработки события
      end;

   // в поле Memo есть текст
   if n > SIZE then
      begin
        ShowMessage('Количество введенных строк превышает размер массива.');
        n:=SIZE; // будем вводить только первые SIZE строк
      end;
   for i:=1 to n do
      a[i]:=Form1.Memo1.Lines[i-1]; // строки Memo пронумерованы с нуля

   // вывод массива в окно сообщения
   if n > 0 then
      begin
         st:='Введенный массив:'+#13;
         for i:=1 to n do
            st:=st+IntToStr(i)+'  '+ a[i]+#13;
         ShowMessage(st);
      end;
end;
end.
