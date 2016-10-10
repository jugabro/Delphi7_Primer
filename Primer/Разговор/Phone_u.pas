unit Phone_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;       // поле ввода длительности разговора
    Edit2: TEdit;       // поле ввода номера дн€ недели
    Button1: TButton;   // кнопка ¬ычислить
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
        PAY = 0.15;     // цена одной минуты разговора 0.15 рубл€
        DISCOUNT = 0.2; // скидка 20 процентов
var
	Time:Real;	// длительность разговора
	Day:integer;	// день недели
	Summa:real;	// стоимость разговора
begin
        //получить исходные данные
        Time:=StrToFloat(Edit1.Text);
        Day:=StrToInt(Edit2.Text);

        // ¬ычислить стоимость разговора
	Summa:= PAY*Time;
        // ≈сли день суббота или воскресенье, то уменьшить
        // стоимость на величину скидки
	if (Day = 6) OR (Day = 7)
		then Summa:=Summa*(1 -DISCOUNT);

        // вывод результата вычислени€
        label3.caption:='  оплате '+FloatToStr(Summa)+'руб.';
end;

end.
