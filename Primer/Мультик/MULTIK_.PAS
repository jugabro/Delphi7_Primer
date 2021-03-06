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
  FILMFILE = 'film2.bmp'; // ����� - bmp-����
  N_KADR=12; // ������ � ������ (��� ������� �����)

var
  Film: TBitMap;        // ������ - ��� �����
//  Kadr: TBitMap;        // ������� ����
  WKadr,HKadr: integer; // ������ � ������ �����
  CKadr: integer;       // ����� �������� �����
  RectKadr: TRect;      // ��������� � ������ ����� � ������
  Rect1 :  Trect;       // ���������� � ������ ������� ����������� ������

procedure TForm1.FormActivate(Sender: TObject);
begin
     Film := TBitMap.Create;
     Film.LoadFromFile(FILMFILE);
     WKadr := Round(Film.Width/N_Kadr);
     HKadr := Film.Height;

     Rect1 := Bounds(10,10,WKadr,HKadr);

     Ckadr:=0;

     Form1.Timer1.Interval := 150; // ������ ���������� ������ - 0.15 ���
     Form1.Timer1.Enabled:=True;   // ��������� ������
end;

// ��������� �����
procedure DrawKadr;
begin
  // ��������� ��������� �������� ����� � ������
  RectKadr:=Bounds(WKadr*CKadr,0,WKadr,HKadr);

  // ����� ����� �� ������
  Form1.Canvas.CopyRect(Rect1,Film.Canvas,RectKadr);

  // ������������ � ������ ���������� �����
  CKadr := CKadr+1;
  if CKadr = N_KADR
     then CKadr:=0;

end;

// ��������� ������� �� �������
procedure TForm1.Timer1Timer(Sender: TObject);
begin
     DrawKadr;
end;

end.
