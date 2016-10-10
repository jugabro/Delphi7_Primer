unit UsAnimate_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Animate1: TAnimate;  // поле вывода анимации
    Label1: TLabel;      // поле вывода информационного сообщения
    PuskButton: TButton; // кнопка Пуск
    StopButton: TButton; // кнопка Стоп
    procedure PuskButtonClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.PuskButtonClick(Sender: TObject);
begin
   Form1.Animate1.Active:=True;
   form1.PuskButton.Enabled:=False;
   form1.StopButton.Enabled:=True;
end;

procedure TForm1.StopButtonClick(Sender: TObject);
begin
    Form1.Animate1.Active:=False;
    form1.StopButton.Enabled:=False;
    form1.PuskButton.Enabled:=True;
end;

end.
