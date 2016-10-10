unit FuntToKg1_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MPlayer;

type
  TForm1 = class(TForm)
    Edit1: TEdit;       // поле ввода веса в фунтах
    Button1: TButton;   // кнопка Пересчет
    Label2: TLabel;     // поле вывода результата
    Label1: TLabel;     // поле информационного сообщения
    MediaPlayer1: TMediaPlayer; // медиаплеер
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

// щелчок на кнопке Пересчет
procedure TForm1.Button1Click(Sender: TObject);
var
   f: real;  // вес в фунтах
   k: real;  // вес в килограммах
begin
   form1.Label2.Caption:='';
   try // возможна ошибка, если в поле
       // Edit1 будет не число
      f:=StrToFloat(Edit1.Text);
      Form1.MediaPlayer1.Play;  // звуковой сигнал
      k:=f*0.4095;
      label2.caption:=Edit1.text+' ф. - это ' +
                      FloatToStrF(k,ffGeneral,4,2)+' кг.';
   except
       on EConvertError do // ошибка преобразования
       begin
         // определим и проиграем звук "Ошибка"
         Form1.MediaPlayer1.FileName:='c:\windows\media\chord.wav';
         Form1.MediaPlayer1.Open;
         Form1.MediaPlayer1.Play;  // звуковой сигнал
         ShowMessage('Ошибка! Вес следует ввести числом.');
         form1.Edit1.SetFocus; // курсор в поле ввода
         // восстановим звук
         Form1.MediaPlayer1.FileName:='c:\windows\media\ding.wav';
         Form1.MediaPlayer1.Open;
       end;
   end;
 end;
end.
