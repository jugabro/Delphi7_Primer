unit WinSound_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MPlayer;

type
  TForm1 = class(TForm)
    MediaPlayer1: TMediaPlayer; // медиаплеер
    Label1: TLabel;             // информационное сообщение
    ListBox1: TListBox;         // список  WAV-файлов
    Label2: TLabel;             // выбранный из списка файл
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
  SOUNDPATCH='c:\windows\media\';  // положение звуковых файлов
  ModeStr: array[TMPModes] of string =
    ('Not ready', 'Stopped', 'Playing', 'Recording', 'Seeking', 'Paused', 'Open');

  var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
var
     SearchRec: TSearchRec;   // структура, содержаща€ информацию о файле,
                              // удовлетвор€ющем условию поиска
begin
     Form1.MediaPlayer1.Play;

     // сформируем список WAV-файлов, наход€щихс€
     // в каталоге c:\windows\media
     if FindFirst(SOUNDPATCH+'*.wav', faAnyFile, SearchRec) =0 then
     begin
          // в каталоге есть файл с расширением WAV
          // добавим им€ этого файла в список
          Form1.ListBox1.Items.Add(SearchRec.Name);
          // пока в каталоге есть другие файлы с расширением WAV
          while (FindNext(SearchRec) = 0) do
              Form1.ListBox1.Items.Add(SearchRec.Name);
     end;
end;

// щелчек на элементе списка
procedure TForm1.ListBox1Click(Sender: TObject);
begin
 // вывести в поле метки Label2 им€ выбранного файла
 Label2.Caption:=ListBox1.Items[ListBox1.itemIndex];
end;

// щелчок на кнопке компонента MediaPlayer
procedure TForm1.MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
  var DoDefault: Boolean);
begin
     if (Button = btPlay) and (Label2.Caption <> '') then
     begin
        // нажата кнопка Play
        with MediaPlayer1 do
          begin
             FileName:=SOUNDPATCH+Label2.Caption; // им€ выбранного файла
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
