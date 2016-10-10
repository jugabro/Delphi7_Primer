unit pogoda_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;      // дата
    Edit2: TEdit;      // температура
    Button1: TButton;  // кнопка Добавить
    Label1: TLabel;
    Label2: TLabel;

    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
   DBNAME = 'a:\pogoda.db';
var
   db: TextFile; // файл - база данных

procedure TForm1.FormActivate(Sender: TObject);
begin
  AssignFile(db, DBNAME);
  {$I-}
  Append(db);
  if IOResult = 0
     then
         begin
            Edit1.Text:= DateToStr(Date); // Получить текущую дату
            Edit2.SetFocus; // курсор в поле Edit2
         end
     else
       begin
          Rewrite(db);
          if IOResult <> 0 then
             begin
                 // сделать недоступными поля ввода
                 // и командную кнопку
                 Edit1.Enabled := False;
                 Edit2.Enabled := False;
                 Button1.Enabled := False;

                 ShowMessage('Ошибка зоздания '+DBNAME);
             end;
       end;
end;

// щелчок на кнопке Добавить
procedure TForm1.Button1Click(Sender: TObject);
begin
   if (Length(edit1.text)=0) or (Length(edit2.text)=0)
     then ShowMessage('Ошибка ввода данных.'
                      +#13+'Все поля должны быть заполнены.')
     else writeln(db, edit1.text,' ',edit2.text);
end;

// Событие OnClose возникает при закрытии формы
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        CloseFile(db); // закрыть файл БД
end;

end.
