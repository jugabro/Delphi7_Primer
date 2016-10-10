unit lookmin_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
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
     a:array[1..SIZE]of integer; // массив целых
     min:integer; // номер минимального эл-та массива
     i:integer;	  // номер эл-та, сравниваемого с минимальным

begin
     // ввод массива
     for i:=1 to SIZE do
         a[i]:=StrToInt(StringGrid1.Cells[i-1,0]);

     // поиск минимального элемента
     min:=1;  // пусть первый элемент минимальный
     for i:=2 to SIZE do
         if a[i]< a[min]then min:=i;

     // вывод результата
     label2.caption:='Минимальный элемент массива:'+IntToStr(a[min])
	             +#13+'Номер элемента:'+ IntToStr(min);
end;
end.
