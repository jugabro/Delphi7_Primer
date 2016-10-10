unit aplane1_;

{$R images.res}  // включить файл ресурсов

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Back, bitmap, Buf : TBitMap; // фон, картинка, буфер
  BackRct,  BufRct: TRect;     // область фона, картинки, буфера

  x,y:integer; // координаты левого верхнего угла картинки
  W,H: integer; // размеры картинки

implementation

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
begin
  Back := TBitmap.Create;   // фон
  bitmap := TBitmap.Create; // картинка
  Buf := TBitmap.Create;    // буфер

  // загрузить из ресурса фон
  Back.LoadFromResourceName(HInstance,'FACTORY');
  Form1.Image1.canvas.Draw(0,0,Back);

  // загрузить из ресурса картинку, которая будет двигаться
  bitmap.LoadFromResourceName(HInstance,'APLANE');
  bitmap.Transparent := True;
  bitmap.TransParentColor := bitmap.canvas.pixels[1,1];

  // создать буфер для сохранения копии области фона, на которую
  // накладывается картинка
  W:= bitmap.Width;
  H:= bitmap.Height;
  Buf.Width:= W;
  Buf.Height:=H;
  Buf.Palette:=Back.Palette; // Чтобы обеспечить соответствие палитр !!
  Buf.Canvas.CopyMode:=cmSrcCopy;
  BufRct:=Bounds(0,0,W,H);

  x:=-W;
  y:=20;

  // определим сохраняемую область фона
  BackRct:=Bounds(x,y,W,H);
  // и сохраним ее
  Buf.Canvas.CopyRect(BufRct,Back.Canvas,BackRct);

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
     // восстановлением фона (из буфера) удалим рисунок
     Form1.image1.canvas.Draw(x,y,Buf);

     x:=x+2;
     if x>form1.Image1.Width then x:=-W;

     // определим сохраняемую область фона
     BackRct:=Bounds(x,y,W,H);
     // сохраним ее копию
     Buf.Canvas.CopyRect(BufRct,Back.Canvas,BackRct);

     // выведем рисунок
    Form1.image1.canvas.Draw(x,y,bitmap);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Back.Free;
 bitmap.Free;
 Buf.Free;
end;

end.

