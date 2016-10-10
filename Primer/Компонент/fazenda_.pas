unit fazenda_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NkEdit;

type
  TForm1 = class(TForm)
    NkEdit1: TNkEdit;     // расстояние
    NkEdit2: TNkEdit;     // цена литра бензина
    NkEdit3: TNkEdit;     // потребление бензина на 100 км
    CheckBox1: TCheckBox; // True - поезда туда и обратно
    Button1: TButton;     // кнопка Вычислить
    Label4: TLabel;       // поле вывода результата расчета
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;

    procedure Button1Click(Sender: TObject);
    procedure NkEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure NkEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure NkEdit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// нажатие клавиши в поле Расстояние
procedure TForm1.NkEdit1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Char(VK_RETURN)
       then NkEdit2.SetFocus;  // переместить курсор в поле Цена
end;

// нажатие клавиши в поле Цена
procedure TForm1.NkEdit2KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Char(VK_RETURN)
       then NkEdit3.SetFocus;  // переместить курсор в поле Потребление
end;

// нажатие клавиши в поле Потребление
procedure TForm1.NkEdit3KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Char(VK_RETURN)
       then Button1.SetFocus; // // сделать активной кнопку Вычислить
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
  rast := StrToFloat(NkEdit1.Text);
  cena := StrToFloat(NkEdit2.Text);
  potr := StrToFloat(NkEdit3.Text);
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
