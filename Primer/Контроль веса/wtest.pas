unit wtest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;     // поле ввода веса
    Edit2: TEdit;     // поле ввода роста
    Button1: TButton; // кнопка "Вычислить"
    Label3: TLabel;   // поле вывода сообщения - рез-та работы программы
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
   w:real;   { вес }
   h:real;   { рост }
   opt:real; { оптимальный вес }
   d:real;   { отклонение от оптимального веса }
begin
   w:=StrToFloat(Edit1.text);
   h:=StrToInt(Edit2.Text);
   opt:=h-100;
   if w=opt
      then
          Label3.caption:='Ваш вес оптимален !'
      else
          if w<opt
               then
                   begin
                         d:=opt-w;
                         Label3.caption:='Вам надо поправиться, на '
                                          + FloatTostr(d)+ 'кг.';
                   end
               else
                   begin
                        d:=w-opt;
                        Label3.caption:='Надо немного похудеть, на '
                                         + FloatTostr(d)+ ' кг.';
                   end;
  end;
end.


