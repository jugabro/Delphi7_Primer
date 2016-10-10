unit test2_;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label5: TLabel;   // поле вывода вопроса
    Image1: TImage;   // область вывода иллюстрации
    Panel1: TPanel;
    Button1: TButton; // кнопка "Ok", "Дальше", "Завершить"

    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SelectorClick(Sender: TObject);  // объявление вставлено вручную
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1; // форма

implementation

const
  N_ANSWERS=4; // четыре варианта ответов 
  N_LEVEL=4;   // четыре уровня оценки 

var
  // динамически создаваемые компоненты
  answer: array[1..N_ANSWERS] of TLabel; // альтернативные ответы
  selector: array[1..N_ANSWERS+1] of TRadioButton; // кнопки выбора ответа

  f:TextFile;
  fn:string; // имя файла вопросов

  level:array[1..N_LEVEL] of integer; // сумма, соответствующая уровню 
  mes:array[1..N_LEVEL] of string;// сообщение, соответствующее уровню
  score:array[1..N_ANSWERS] of integer; // очки за выбор ответа 
  summa:integer;  // набрано очков
  vopros:integer; // номер текущего вопроса 
  n_otv:integer;  // число вариантов ответа 
  otv:integer;    // номер выбранного ответа 

// установка формы в исходное состояние 
Procedure ResetForm(frm:TForm1);
 var
  i:integer;
 begin
     for i:=1 to N_ANSWERS do
     begin
       answer[i].width:=frm.ClientWidth-answer[i].left-5;
       answer[i].Visible:=FALSE;
       Selector[i].Visible:=FALSE;
     end;
     frm.Label5.width:=frm.ClientWidth-frm.Label5.left-5;
     frm.Image1.Visible:=False;
 end;

// определение достигнутого уровня 
procedure Itog(summa:integer;frm:TForm1);
  var
   i:integer;
   buf:string;
  begin
   buf:='';
   str(summa:5,buf);
   buf:='Результаты тестирования'+chr(13)
		+'Всего баллов: '+buf;
   i:=1;
   while (summa < level[i]) and (i<N_LEVEL) do
         i:=i+1;
   buf:=buf+chr(13)+mes[i]+#13+#13+#13+#13+'Все права на программу-оболочку'+#13'принадлежат Культину Н.Б.';
   frm.Label5.caption:=buf;
  end;

procedure TForm1.FormCreate(Sender: TObject);
var
   i: integer;
begin
   // создадим пять меток для вывода вопроса и альтернативных ответов
   for i:=1 to N_ANSWERS do
   begin
       answer[i]:=TLabel.Create(self);
       answer[i].Parent:=Form1;
       answer[i].Left:=36;
       answer[i].WordWrap:=True;
   end;

   // создадим радиокнопки для выбора ответа
   for i:=1 to N_ANSWERS+1 do
   begin
       selector[i]:=TRadioButton.Create(self);
       selector[i].Parent:=self;
       selector[i].Caption:='';
       selector[i].Width:=17;
       selector[i].Left:=16;
       selector[i].Visible:=False;
       selector[i].Enabled:=True;
       selector[i].OnClick:=SelectorClick;
   end;
   ResetForm(Form1);
end;

// вывод начальной информации о тесте 
procedure info(var f:TextFile;l:TLabel);
var
   s,buf:string;
begin
   buf:='';
   repeat
         readln(f,s);
         if s[1] <> '.'
            then buf:=buf+s+' ';
   until s[1] ='.';
   Form1.Label5.caption:=buf;
end;

// прочитать информацию об оценках за тест 
Procedure GetLevel(var f:TextFile);
var
   i:integer;
   buf:string;
begin  // заполняем значения глобальных массивов 
     i:=1;
     repeat
         readln(f,buf);
         if buf[1] <> '.' then begin
            mes[i]:=buf;
            readln(f,level[i]);
            i:=i+1;
         end;
     until buf[1]='.';
end;

// масштабирование иллюстрации
Procedure ScalePicture;
var
  w,h:integer; // максимально допустимые размеры картинки
  scaleX:real; // коэф. масштабирования по X
  scaleY:real; // коэф. масштабирования по Y
  scale:real;  // общий коэф. масштабирования
  i:integer;
begin
  // вычислить максимально допустимые размеры картинки
  w:=Form1.ClientWidth-Form1.Label5.Left;
  h:=Form1.ClientHeight
               - Form1.Panel1.Height -5
               - Form1.Label5.Top
               - Form1.Label5.Height - 5;
  for i:=1 to N_ANSWERS do
     if answer[i].Caption <> ''
        then h:=h-answer[i].Height-5;

  // здесь определена максимально допустимая величина иллюстрации
       // определить масштаб
     if w>Form1.Image1.Picture.Width
        then scaleX:=1
        else scaleX:=w/Form1.Image1.Picture.Width;
     if h>Form1.Image1.Picture.Height
        then scaleY:=1
        else scaleY:=h/Form1.Image1.Picture.Height;
     if ScaleY<ScaleX
        then scale:=scaleY
        else scale:=scaleX;
     // здесь масштаб определен
     Form1.Image1.Top:=Form1.Label5.Top+Form1.Label5.Height+5;
     Form1.Image1.Left:=Form1.Label5.Left;
     Form1.Image1.Width:=Round(Form1.Image1.Picture.Width*scale);
     Form1.Image1.Height:=Round(Form1.Image1.Picture.Height*scale);
     Form1.Label5.Visible:=TRUE;
end;

// вывод вопроса на экран
Procedure VoprosToScr(var f:TextFile;frm:TForm1;var vopros:integer);
  var
   i:integer;
   code:integer;
   s,buf:string;
   ifn:string; // файл иллюстрации
  begin
     vopros:=vopros+1;
     str(vopros:3,s);
     frm.caption:='Вопрос' + s;
     //Выведем текст вопроса 
     buf:='';
     repeat
           readln(f,s);
           if (s[1] <> '.') and (s[1] <> '\')
              then buf:=buf+s+' ';
     until (s[1] ='.') or (s[1] ='\');
     frm.Label5.caption:=buf;

     if s[1] = '\'
       then // к вопросу есть иллюстрация
        begin
          frm.Image1.Tag:=1;
          ifn:=copy(s,2,length(s));
          try
            frm.Image1.Picture.LoadFromFile(ifn);
            except
              on E:EFOpenError do
                 frm.tag:=0;
          end // try 
        end
        else frm.Image1.Tag:=0;

     // Читаем варианты ответов
     for i:=1 to N_ANSWERS do
     begin
       answer[i].caption:='';
       answer[i].Width:=frm.ClientWidth-Form1.Label5.Left-5;
     end;
     i:=1;
     repeat
           buf:='';
           repeat // читаем текст варианта ответа
                  readln(f,s);
                  if (s[1]<>'.') and (s[1] <> ',')
                     then buf:=buf+s+' ';
           until (s[1]=',')or(s[1]='.');

           // прочитан альтернативный ответ
           val(s[2],score[i],code);
           answer[i].caption:=buf;
           i:=i+1;
     until s[1]='.';
     // здесь прочитана иллюстрация и альтернативные ответы

     if Form1.Image1.Tag =1  // есть иллюстрация к вопросу ?
        then begin
          ScalePicture;
          Form1.Image1.Visible:=TRUE;
         end;

     // вывод альтернативных ответов
     i:=1;
     while (answer[i].caption <> '') and (i <= N_ANSWERS) do
     begin
        if i = 1
        then
           if frm.Image1.Tag =1
                then answer[1].top:=frm.Image1.Top+frm.Image1.Height+5
                else answer[i].top:=frm.Label5.Top+frm.Label5.Height+5
        else
           answer[i].top:=answer[i-1].top+ answer[i-1].height+5;
        selector[i].top:=answer[i].top;
        selector[i].visible:=TRUE;
        answer[i].visible:=TRUE;
        i:=i+1;
     end;
  end;

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
  begin
     ResetForm(Form1);
     if ParamCount = 0
        then
          begin
             Label5.font.color:=clRed;
             Label5.caption:='Не задан файл вопросов теста.';
             Button1.caption:='Ok';
             Button1.tag:=2;
             Button1.Enabled:=TRUE
          end
     else begin
          fn:=ParamStr(1);
          assignfile(f,fn);
          {$I-}
          reset(f);
          {I+}
          if IOResult=0 then
             begin
                  Info(f,Label5);
                  GetLevel(f);
             end;
          summa:=0;
     end;
end;

procedure TForm1.Button1Click(Sender: TObject);
  begin
     case Button1.tag of
       0: begin
               Button1.caption:='Дальше';
               Button1.tag:=1;
               Selector[N_ANSWERS+1].Checked:=TRUE;
               // вывод первого вопроса 
               Button1.Enabled:=False;
               ResetForm(Form1);
               VoprosToScr(f,Form1,vopros)
          end;
       1: begin // вывод остальных вопросов 
               summa:=summa+score[otv];
               Selector[N_ANSWERS+1].Checked:=TRUE;
               Button1.Enabled:=False;
               ResetForm(Form1);
               if not eof(f)
                  then VoprosToScr(f,Form1,vopros)
                  else
                     begin
                        closefile(f);
                        Button1.caption:='Ok';
                        Form1.caption:='Результат';
                        Button1.tag:=2;
                        Button1.Enabled:=TRUE;
                        Itog(summa,Form1);
                     end;
          end;
       2: begin // завершение работы 
            Form1.Close;
          end;
     end;
end;

procedure TForm1.SelectorClick(Sender: TObject);
 var
   i:integer;
 begin
  i:=1;
  while selector[i].Checked = FALSE do
    i:=i+1;
  otv:=i;
  Button1.enabled:=TRUE;
 end;
end.
