unit ushh_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtrls, HHOPENLib_TLB, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;     // файл справки
    Edit2: TEdit;     // раздел справки (имя html файла)
    Button1: TButton;  // ActiveX компонент Hhopen
    Label2: TLabel;
    Label3: TLabel;

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

// щелчок на кнопке Справка
procedure TForm1.Button1Click(Sender: TObject);
var
  HelpFile : string;       // файл справки
  HelpTopic : string;      // раздел справки
  pwHelpFile : PWideChar;  // имя файла справки как указатель на строку WideChar
  pwHelpTopic : PWideChar; // раздел справки, как указатель на WideChar строку
begin
  HelpFile := Edit1.Text;
  HelpTopic := Edit2.Text;

  // выделить память для WideChar строк
  GetMem(pwHelpFile, Length(HelpFile) * 2);
  GetMem(pwHelpTopic, Length(HelpTopic)*2);

  // преобразовать Ansi строку в WideString строку
  pwHelpFile := StringToWideChar(HelpFile,pwHelpFile,MAX_PATH*2);
  pwHelpTopic := StringToWideChar(HelpTopic,pwHelpTopic,32);

  // вывести справочную информацию
  Form1.Hhopen1.OpenHelp(pwHelpFile,pwHelpTopic);

end;

end.
