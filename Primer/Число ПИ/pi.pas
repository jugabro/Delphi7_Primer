unit pi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
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

procedure TForm1.Button1Click(Sender: TObject);

var
   pi:real;	{ вычисляемое значение ПИ}
   t:real;	{ точность вычисления}
   n:integer;	{ номер члена ряда}
   elem:real;	{ значение члена ряда}
begin
     pi:=0;
     n:=1;
     elem:=1; { чтобы начать цикл. см. условие инструкции while }
     t:=StrToFloat(edit1.text);
	while elem >= t do
           begin
             elem:=1/(2*n-1);
	     if (n MOD 2) = 0
	     	then pi:=pi-elem
	     	else pi:=pi+elem;
	     n:=n+1;
	   end;
	pi:=pi*4;
	label1.caption:= 'ПИ равно '+ FloatToStr(pi) + #13
	           + 'Просуммировано '+IntTostr(n)+' членов ряда.';

end;

end.
