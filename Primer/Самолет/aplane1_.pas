unit aplane1_;

{$R images.res}  // �������� ���� ��������

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
  Back, bitmap, Buf : TBitMap; // ���, ��������, �����
  BackRct,  BufRct: TRect;     // ������� ����, ��������, ������

  x,y:integer; // ���������� ������ �������� ���� ��������
  W,H: integer; // ������� ��������

implementation

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
begin
  Back := TBitmap.Create;   // ���
  bitmap := TBitmap.Create; // ��������
  Buf := TBitmap.Create;    // �����

  // ��������� �� ������� ���
  Back.LoadFromResourceName(HInstance,'FACTORY');
  Form1.Image1.canvas.Draw(0,0,Back);

  // ��������� �� ������� ��������, ������� ����� ���������
  bitmap.LoadFromResourceName(HInstance,'APLANE');
  bitmap.Transparent := True;
  bitmap.TransParentColor := bitmap.canvas.pixels[1,1];

  // ������� ����� ��� ���������� ����� ������� ����, �� �������
  // ������������� ��������
  W:= bitmap.Width;
  H:= bitmap.Height;
  Buf.Width:= W;
  Buf.Height:=H;
  Buf.Palette:=Back.Palette; // ����� ���������� ������������ ������ !!
  Buf.Canvas.CopyMode:=cmSrcCopy;
  BufRct:=Bounds(0,0,W,H);

  x:=-W;
  y:=20;

  // ��������� ����������� ������� ����
  BackRct:=Bounds(x,y,W,H);
  // � �������� ��
  Buf.Canvas.CopyRect(BufRct,Back.Canvas,BackRct);

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
     // ��������������� ���� (�� ������) ������ �������
     Form1.image1.canvas.Draw(x,y,Buf);

     x:=x+2;
     if x>form1.Image1.Width then x:=-W;

     // ��������� ����������� ������� ����
     BackRct:=Bounds(x,y,W,H);
     // �������� �� �����
     Buf.Canvas.CopyRect(BufRct,Back.Canvas,BackRct);

     // ������� �������
    Form1.image1.canvas.Draw(x,y,bitmap);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Back.Free;
 bitmap.Free;
 Buf.Free;
end;

end.

