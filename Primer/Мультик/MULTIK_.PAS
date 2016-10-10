unit multik_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;


type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;



implementation

{$R *.DFM}

const
  FILMFILE = 'film2.bmp'; // фильм - bmp-файл
  N_KADR=12; // кадров в фильме (для данного файла)

var
  Film: TBitMap;        // фильма - все кадры
//  Kadr: TBitMap;        // текущий кадр
  WKadr,HKadr: integer; // ширина и высота кадра
  CKadr: integer;       // номер текущего кадра
  RectKadr: TRect;      // положение и размер кадра в фильме
  Rect1 :  Trect;       // координаты и размер области отображения фильма

procedure TForm1.FormActivate(Sender: TObject);
begin
     Film := TBitMap.Create;
     Film.LoadFromFile(FILMFILE);
     WKadr := Round(Film.Width/N_Kadr);
     HKadr := Film.Height;

     Rect1 := Bounds(10,10,WKadr,HKadr);

     Ckadr:=0;

     Form1.Timer1.Interval := 150; // период обновления кадров - 0.15 сек
     Form1.Timer1.Enabled:=True;   // запустить таймер
end;

// отрисовка кадра
procedure DrawKadr;
begin
  // определим положение текущего кадра в фильме
  RectKadr:=Bounds(WKadr*CKadr,0,WKadr,HKadr);

  // вывод кадра из фильма
  Form1.Canvas.CopyRect(Rect1,Film.Canvas,RectKadr);

  // подготовимся к выводу следующего кадра
  CKadr := CKadr+1;
  if CKadr = N_KADR
     then CKadr:=0;

end;

// обработка сигнала от таймера
procedure TForm1.Timer1Timer(Sender: TObject);
begin
     DrawKadr;
end;

end.
