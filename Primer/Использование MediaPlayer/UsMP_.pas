unit UsMP_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MPlayer, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;             // �������������� ���������
    Panel1: TPanel;             // ������, �� ������� ��������� ��������
    Button1: TButton;           // ������ Ok
    MediaPlayer1: TMediaPlayer; // ������������� �������������

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
     form1.MediaPlayer1.Play; // ��������������� ��������
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     // ��������� ������ ������� ������ ��������
     // �� ����������� �����
     MediaPlayer1.DisplayRect:=Rect(0,0,60,60);
end;

end.
