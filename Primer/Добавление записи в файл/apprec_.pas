unit apprec_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;             // спортсмен
    ComboBox1: TComboBox;     // страна
    ComboBox2: TComboBox;     // вид спорта
    RadioGroup1: TRadioGroup; // медаль
    Button1: TButton;         // кнопка Добавить
    Label5: TLabel;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  // тип медали
  TKind = (GOLD, SILVER, BRONZE);

  // запись файла
  TMedal=record
     country: string[20];  //  страна
     sport:   string[20];  //  вид спорта
     person:  string[40];  //  спортсмен
     kind:    TKind;       //  медаль
   end;

var
  Form1: TForm1;
  f: file of TMedal; // файл записей - база данных

implementation

{$R *.DFM}

// активизация формы
procedure TForm1.FormActivate(Sender: TObject);
var
  resp : word; // ответ пользователя
begin
  AssignFile(f, 'a:\medals.db');
  {$I-}
  Reset(f);  // открыть файл
  Seek( f, FileSize(f)); // указатель записи в конец файла
  {$I+}
  if IOResult = 0
     then button1.enabled:=TRUE // теперь кнопка Добавить доступна
     else
       begin
         resp:=MessageDlg('Файл базы данных не найден.'+
                           'Создать новую БД?',mtInformation,[mbYes,mbNo],0);
         if resp = mrYes then
              begin
                {$I-}
                rewrite(f);
                {$I+}
                if IOResult = 0
                   then button1.enabled:=TRUE
                   else ShowMessage('Ошибка создания файла БД.');
              end;
       end;
end;

// щелчок на кнопке Добавить
procedure TForm1.Button1Click(Sender: TObject);
var
  medal: TMedal;
begin
  with medal do
  begin
     country := ComboBox1.Text;
     sport   := ComboBox2.Text;
     person  := Edit1.Text;
     case  RadioGroup1.ItemIndex of
       0: kind := GOLD;
       1: kind := SILVER;
       2: kind := BRONZE;
     end;
  end;
  write(f, medal); // записать содержимое полей записи в файл
end;

// завершение работы программы
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     CloseFile( f );  // закрыть файл
end;

end.
