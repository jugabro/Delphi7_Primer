unit UsTry_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;      // напряжение
    Edit2: TEdit;      // сопротивление
    Label5: TLabel;    // результат расчета - ток
    Button1: TButton;  // кнопка Вычислить
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
   u: real; // напряжение
   r: real; // сопротивление
   i: real; // ток
begin
   Label5.Caption := '';
   try
      // инструкции, которые могут
      // вызвать исключение (ошибку)
      u := StrToFloat(Edit1.Text);
      r := StrToFloat(Edit2.Text);
      i := u/r;
      except
        on EZeroDivide do  // деление на ноль
            begin
               ShowMessage(' Сопротивление не может быть равно нулю!');
               exit;
             end;
        on EConvertError do  // невозможно преобразовать строку символов в число
             begin
                ShowMessage('Напряжение и сопротивление должны быть заданы числом.'+#13+
                            'При записи дробного числа используйте запятую.');
                exit;
             end;
      end;
      Label5.caption:=FloatToStr(i)+' А';
end;
end.
