unit fazenda_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;         // расстояние
    Edit2: TEdit;         // цена литра бензина
    Edit3: TEdit;         // потребление бензина на 100 км
    CheckBox1: TCheckBox; // True - поездка туда и обратно
    Button1: TButton;     // кнопка Вычислить
    Label4: TLabel;       // поле вывода результата расчета
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

// проверяет, является ли символ допустимым
// во время ввода дробного числа
function IsFloat(ch : char; st: string) : Boolean;
begin
   if      (ch >= '0') and (ch <= '9') // цифры
        or (ch = #13)                  // клавиша <Enter>
        or (ch = #8)                   // клавиша <Back Space>
   then
        begin
          IsFloat := True;  // символ верный
          Exit;            // выход из функции
        end;

   case ch of
      '-': if Length(st) = 0 then IsFloat := True;
      ',': if    ( Pos(',',st) = 0)
             and (st[Length(st)] >= '0')
             and (st[Length(st)] <= '9')
           then // разделитель можно ввести только после цифры
                // и если он еще не введен
                    IsFloat := True;
      else // остальные символы запрещены
           IsFloat := False;
    end;
end;


{$R *.dfm}

// нажатие клавиши в поле Расстояние
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Char(VK_RETURN)
       then Edit2.SetFocus  // переместить курсор в поле Цена
       else If not IsFloat(Key,Edit2.Text) then Key := Chr(0);
end;

// нажатие клавиши в поле Цена
procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Char(VK_RETURN)
       then Edit3.SetFocus  // переместить курсор в поле Потребление
       else If not IsFloat(Key,Edit2.Text) then Key := Chr(0);
end;

// нажатие клавиши в поле Потребление
procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Char(VK_RETURN)
       then Button1.SetFocus // // сделать активной кнопку Вычислить
       else If not IsFloat(Key,Edit2.Text) then Key := Chr(0);
end;

// щелчок на кнопке Вычислить
procedure TForm1.Button1Click(Sender: TObject);
var
  rast : real; // расстояние
  cena : real; // цена
  potr : real; // потребление на 100 км
  summ : real; // сумма
  mes: string;
begin
  rast := StrToFloat(Edit1.Text);
  cena := StrToFloat(Edit2.Text);
  potr := StrToFloat(Edit3.Text);
  summ := rast / 100 * potr * cena;
  if  CheckBox1.Checked  then
      summ := summ * 2;
  mes := 'Поездка на дачу';
  if CheckBox1.Checked then
     mes := mes + ' и обратно';
  mes := mes + 'обойдется в ' + FloatToStrF(summ,ffGeneral,4,2)
             + ' руб.';
  Label4.Caption := mes;           
end;

end.
