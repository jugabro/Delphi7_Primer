unit TestOfKomp_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NkEdit;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button1: TButton;
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

procedure TForm1.Button1Click(Sender: TObject);
var
  a,b,c : real; // коэффициенты
  d: real;      // дискриминант
  x1,x2: real;  // корни
begin
   a := NkEdit1.Numb;
   b := NkEdit2.Numb;
   c := NkEdit3.Numb;

   d:= b*b - 4*a*c;
   if d < 0
      then Label7.Caption := 'Уравнение не имеет решения.'
   else begin
      x1:= (-b + sqrt(d))/(2*a);
      x2:= ( b + sqrt(d))/(2*a);
      Label7.Caption :=
         'x1='+ FloatToStrF(x1,ffGeneral,7,4)+#13+
         'x2='+ FloatToStrF(x2,ffGeneral,7,4)
   end;
end;

end.
