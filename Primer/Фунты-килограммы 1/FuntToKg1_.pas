unit FuntToKg1_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MPlayer;

type
  TForm1 = class(TForm)
    Edit1: TEdit;       // ���� ����� ���� � ������
    Button1: TButton;   // ������ ��������
    Label2: TLabel;     // ���� ������ ����������
    Label1: TLabel;     // ���� ��������������� ���������
    MediaPlayer1: TMediaPlayer; // ����������
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

// ������ �� ������ ��������
procedure TForm1.Button1Click(Sender: TObject);
var
   f: real;  // ��� � ������
   k: real;  // ��� � �����������
begin
   form1.Label2.Caption:='';
   try // �������� ������, ���� � ����
       // Edit1 ����� �� �����
      f:=StrToFloat(Edit1.Text);
      Form1.MediaPlayer1.Play;  // �������� ������
      k:=f*0.4095;
      label2.caption:=Edit1.text+' �. - ��� ' +
                      FloatToStrF(k,ffGeneral,4,2)+' ��.';
   except
       on EConvertError do // ������ ��������������
       begin
         // ��������� � ��������� ���� "������"
         Form1.MediaPlayer1.FileName:='c:\windows\media\chord.wav';
         Form1.MediaPlayer1.Open;
         Form1.MediaPlayer1.Play;  // �������� ������
         ShowMessage('������! ��� ������� ������ ������.');
         form1.Edit1.SetFocus; // ������ � ���� �����
         // ����������� ����
         Form1.MediaPlayer1.FileName:='c:\windows\media\ding.wav';
         Form1.MediaPlayer1.Open;
       end;
   end;
 end;
end.
