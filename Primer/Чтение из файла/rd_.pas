unit rd_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
   buf: String[80];   // буфер для чтения из файла

begin
   fName := Edit1.Text;
   AssignFile(f, fName);

   {$I-}
   Reset(f);  // открыть для чтения
   {$I+}
   if IOResult <> 0 then
     begin
       MessageDlg('Ошибка доступа к файлу ' + fName,
                   mtError,[mbOk],0);
       exit;
     end;

   // чтение из файла
   while not EOF(f) do
     begin
        readln(f, buf);       // прочитать строку из файла
        Memo1.Lines.Add(buf); // добавить строку в поле Memo1
     end;

   CloseFile(f); // закрыть файл
end;

// запись в файл
procedure TForm1.Button2Click(Sender: TObject);
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

   MessageDlg('Данные записаны в файл ',mtInformation,[mbOk],0);
end;


end.
