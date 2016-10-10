unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    Edit1: TEdit;      // поле ввода веса в фунтах
    Button1: TButton;  // кнопка "Вычислить"
    Label1: TLabel;
    Label3: TLabel;
    ListBox1: TListBox; // список стран
    Label4: TLabel;     // поле вывода рез-та - веса в килограммах
    procedure FormCreate(Sender: TObject);
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
 

procedure TForm1.FormCreate(Sender: TObject);
begin
{
ListBox1.items.add('Россия');
ListBox1.items.add('Австрия');
ListBox1.items.add('Англия');
ListBox1.items.add('Германия');
ListBox1.items.add('Дания');
ListBox1.items.add('Исландия');
ListBox1.items.add('Италия');
ListBox1.items.add('Нидерланды');
}
ListBox1.itemindex:=0;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
   funt:real; { вес в фунтах }
   kg:real;   { вес в килограммах }
   k:real;    { коэффициент пересчета }
begin
 case ListBox1.ItemIndex of
      0: k:=0.4059;  { Россия }
      1: k:=0.453592;{ Англия }
      2: k:=0.56001; { Австрия }
      3..5,7:k:=0.5; { Германия, Дания, Исландия, Нидерланды }
      6: k:=0.31762; { Италия }
 end;
 funt:=StrToFloat(Edit1.Text);
 kg:=k*funt;
 label4.caption:=Edit1.Text
                 + ' фунт. - '
                 + FloatToStrF(kg,ffFixed,6,3)
                 + ' кг.';
end;

end.
