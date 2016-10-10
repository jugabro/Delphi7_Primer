unit rdrec_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    RadioButton1: TRadioButton; // переключатель Все
    RadioButton2: TRadioButton; // переключатель Выбрать
    ComboBox1: TComboBox;       // комбинированный список
                                // для ввода названия страны
    Memo1: TMemo;               // поле вывода записей, удовлетворяющих
                                // условию запроса
    Button1: TButton;           // кнопка OK
    GroupBox1: TGroupBox;
    Label1: TLabel;             // текст Страна
    procedure Button1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
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
type
    // тип медали
    TKind = (GOLD,SILVER,BRONZE);

    // запись файла
    TMedal = record
       country:string[20];
       sport:string[20];
       person:string[40];
       kind:TKind;
    end;

var
   f: file of TMedal;  // файл записей
   rec: TMedal;        // запись, прочитанная из файла
   n: integer;         // кол-во записей удовлетворяющих запросу
   st: string[80];

begin
  AssignFile(f,'a:\medals.db');
  {$I-}
  Reset(f);  // открыть файл для чтения
  {$I-}
  if IOResult <> 0 then
    begin
      ShowMessage('Ошибка открытия файла БД.');
      Exit;
    end;

  // обработка БД
  if RadioButton2.Checked then
        Memo1.Lines.Add('*** ' + ComboBox1.Text + ' ***');

  n := 0;
  Memo1.Clear; // очистить список поля Memo
  while not EOF(f) do
      begin
          read(f, rec); // прочитать запись
          if  RadioButton1.Checked or
              (rec.country = ComboBox1.Text) then
          begin
              n := n + 1;
              st := rec.person+ ', ' + rec.sport;
              if RadioButton1.Checked then
                 st := st + ', '+ rec.country;
              case rec.kind of
                 GOLD:  st := st+ ', золото';
                 SILVER:st := st+ ', серебро';
                 BRONZE:st := st+ ', бронза';
             end;
             Memo1.Lines.Add(st);
          end;
      end;
      CloseFile(f);
      if n = 0 then
         ShowMessage('В БД нет запрашиваемой информации.');
end;

// переключатель Выбрать
procedure TForm1.RadioButton2Click(Sender: TObject);
begin
        Label1.Enabled := True;
        ComboBox1.Enabled := True;   // теперь поле Страна доступно
        ComboBox1.SetFocus;          // курсор в поле Страна
end;

// переключатель Все
procedure TForm1.RadioButton1Click(Sender: TObject);
begin
        Label1.Enabled := False;
        ComboBox1.Enabled := False;   // теперь поле Страна не доступно
end;

end.
