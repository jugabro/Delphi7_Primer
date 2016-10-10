unit UsMP_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MPlayer, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;             // информационное сообщение
    Panel1: TPanel;             // панель, на которую выводится анимация
    Button1: TButton;           // кнопка Ok
    MediaPlayer1: TMediaPlayer; // универсальный проигрыватель

    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
begin
     form1.MediaPlayer1.Play; // воспроизведение анимации
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     // определим размер области вывода анимации
     // на поверхности формы
     MediaPlayer1.DisplayRect:=Rect(0,0,60,60);
end;

end.
