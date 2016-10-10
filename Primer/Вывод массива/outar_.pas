unit outar_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}

const
  NT = 5;
var
  team:array[1..NT] of string[10] = ('Зенит','Динамо','Ротор','Спартак','СКА');

procedure TForm1.Button1Click(Sender: TObject);

var
  st:string;
  i:integer; // индекс, номер элемента массива
begin
   // формирование списка для отображения в форме
   for i:=1 to NT do
       st:=st+IntToStr(i)+' '+team[i]+#13;

   // вывод списка
   Label1.Caption := st;
end;

end.
