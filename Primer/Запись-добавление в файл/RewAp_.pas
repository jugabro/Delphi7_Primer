unit RewAp_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
   f: TextFile;       // файл
   fName: String[80]; // имя файла
   i: integer;
begin
   fName := Edit1.Text;
   AssignFile(f, fName);

   Rewrite(f);  // открыть для перезаписи

   // запись в файл
   for i:=0 to Memo1.Lines.Count do // строки нумеруются с нуля
          writeln(f, Memo1.Lines[i]);

   CloseFile(f); // закрыть файл

   MessageDlg('Данные ЗАПИСАНЫ в файл ',mtInformation,[mbOk],0);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   f: TextFile;       // файл
   fName: String[80]; // имя файла
   i: integer;
begin
   fName := Edit1.Text;
   AssignFile(f, fName);

   Append(f);  // открыть для добавления

   // запись в файл
   for i:=0 to Memo1.Lines.Count do // строки нумеруются с нуля
          writeln(f, Memo1.Lines[i]);

   CloseFile(f); // закрыть файл

   MessageDlg('Данные ДОБАВЛЕНЫ в файл ',mtInformation,[mbOk],0);
end;

end.
