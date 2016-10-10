unit sort2_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    StringGrid1: TStringGrid;
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
   SIZE=5;
var
   a:array[1..SIZE] of integer;
   k:integer;       // текущий элемент массива
   i:integer;       // индекс для ввода и вывода массива
   changed:boolean; // TRUE, если в текущем цикле были обмены

   buf:integer;     // буфер для обмена элементов массива

begin
   // ввод массива
   for i:=1 to SIZE do
       a[i] := StrToInt(StringGrid1.Cells[i-1,0]);

   label2.caption:='';

   // сортирвка массива
    repeat
       changed:=FALSE;       // пусть в текущем цикле нет обменов
       for k:=1 to SIZE-1 do
           if a[k] > a[k+1] then
              begin  // обменяем k-ый и k+1-ый элементы
	        buf := a[k];
	        a[k] := a[k+1];
	        a[k+1] := buf;
                changed := TRUE;
             end;

         // вывод массива
	 for i:=1 to SIZE do
             Label2.caption:=label2.caption+' '+IntTostr(a[i]);
         Label2.caption:=label2.caption+#13;

    until not changed; // если не было обменов, значит
                       // массив отсортирован

    Label2.caption:=label2.caption+#13+'Массив отсортирован.';
end;

end.
