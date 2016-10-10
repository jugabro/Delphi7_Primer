unit WinSound_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MPlayer;

type
  TForm1 = class(TForm)
    MediaPlayer1: TMediaPlayer; // ����������
    Label1: TLabel;             // �������������� ���������
    ListBox1: TListBox;         // ������  WAV-������
    Label2: TLabel;             // ��������� �� ������ ����
    procedure FormActivate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
      var DoDefault: Boolean);
    procedure MediaPlayer1Notify(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  SOUNDPATCH='c:\windows\media\';  // ��������� �������� ������
  ModeStr: array[TMPModes] of string =
    ('Not ready', 'Stopped', 'Playing', 'Recording', 'Seeking', 'Paused', 'Open');

  var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
var
     SearchRec: TSearchRec;   // ���������, ���������� ���������� � �����,
                              // ��������������� ������� ������
begin
     Form1.MediaPlayer1.Play;

     // ���������� ������ WAV-������, �����������
     // � �������� c:\windows\media
     if FindFirst(SOUNDPATCH+'*.wav', faAnyFile, SearchRec) =0 then
     begin
          // � �������� ���� ���� � ����������� WAV
          // ������� ��� ����� ����� � ������
          Form1.ListBox1.Items.Add(SearchRec.Name);
          // ���� � �������� ���� ������ ����� � ����������� WAV
          while (FindNext(SearchRec) = 0) do
              Form1.ListBox1.Items.Add(SearchRec.Name);
     end;
end;

// ������ �� �������� ������
procedure TForm1.ListBox1Click(Sender: TObject);
begin
 // ������� � ���� ����� Label2 ��� ���������� �����
 Label2.Caption:=ListBox1.Items[ListBox1.itemIndex];
end;

// ������ �� ������ ���������� MediaPlayer
procedure TForm1.MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
  var DoDefault: Boolean);
begin
     if (Button = btPlay) and (Label2.Caption <> '') then
     begin
        // ������ ������ Play
        with MediaPlayer1 do
          begin
             FileName:=SOUNDPATCH+Label2.Caption; // ��� ���������� �����
             Open;
             //MediaPlayer1.Wait := True;
             //Play;
          end;
     end;
end;

procedure TForm1.MediaPlayer1Notify(Sender: TObject);
begin
with Sender as TMediaPlayer do
  begin
    Form1.Caption := ModeStr[Mode];
    { Note we must reset the Notify property to True }
    { so that we are notified the next time the }
    { mode changes }
    Notify := True;
  end;

end;

end.
