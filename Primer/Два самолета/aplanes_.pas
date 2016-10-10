unit aplanes_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  sky,aplane: TBitMap; // ������� ������: ���� � �������

implementation

{$R *.DFM}

procedure TForm1.FormPaint(Sender: TObject);
begin
     // ������� ������� ������
     sky := TBitMap.Create;
     aplane := TBitMap.Create;

     // ��������� ��������
     sky.LoadFromFile('sky.bmp');
     aplane.LoadFromFile('aplane.bmp');

     Form1.Canvas.Draw(0,0,sky);      // ��������� ����
     Form1.Canvas.Draw(20,20,aplane); // ��������� ������ ��������

     aplane.Transparent:=True;
     // ������ �������� �������, ���� ������� ��������� � ������
     // ����� ������ ����� �������� ������, �� ��������������
     Form1.Canvas.Draw(120,20,aplane); // ��������� ������� ��������

     // ���������� ������
     sky.free;
     aplane.free;
end;

end.
