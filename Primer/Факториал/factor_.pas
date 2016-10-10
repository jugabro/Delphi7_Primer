unit factor_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Label2: TLabel;
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

// рекурсивная функция
function factorial(n: integer): integer;
begin
    if n > 1
       then factorial := n * factorial(n-1) // функция вызывает сама себя
       else factorial:= 1;  // факториал 1 равен 1
end;

procedure TForm1.Button1Click(Sender: TObject);
var
   k:integer; // число, факториал которого надо вычислить
   f:integer; // значение факториала числа k
begin
   k := StrToInt(Edit1.Text);
   f := factorial(k);
   label2.caption:='Факториал числа '+Edit1.Text
                  +' равен '+IntToStr(f);
end;

end.
