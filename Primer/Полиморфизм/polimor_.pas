unit polimor_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
   // базовый класс
   TPerson = class
   	fName: string; // имя
   	constructor Create(name:string);
   	function info:string; virtual;
   end;

   // класс Студент
   TStud = class(TPerson)
   	fGr:integer; // номер группы
   	constructor Create(name:string;gr:integer);
   	function info:string; override;
   end;

   // класс Преподаватель
   TProf = class(TPerson)
   	fdep:string; // название кафедры
   	constructor Create(name:string;dep:string);
   	function info:string; override;
   end;

const
  SZL = 10; // размер списка
var
  Form1: TForm1;
  List: array[1..SZL] of TPerson; // список
  n:integer = 0;                  // кол-во людей в списке

implementation

{$R *.DFM}
constructor TPerson.Create(name:string);
    begin
        fName := name;
    end;

constructor TStud.Create(name:string;gr:integer);
    begin
       inherited create(name); // вызвать конструктор базового класса
       fGr := gr;
    end;

constructor TProf.create(name:string; dep:string);
    begin
        inherited create(name); // вызвать конструктор базового класса
        fDep := dep;
    end;

function TPerson.Info:string;
   begin
      result := fname;
   end;

function TStud.Info:string;
   begin
      result := fname + ' гр.' + IntToStr(fGr);
   end;

function TProf.Info:string;
   begin
      result := fname + ' каф.' + fDep;
   end;

// щелчок на кнопке Добавить
procedure TForm1.Button1Click(Sender: TObject);
   begin
     if n < SZL then
       begin
          // добавить объект в список
           n:=n+1;
           if Radiobutton1.Checked
               then // создадим объект TStud
                  List[n]:=TStud.Create(Edit1.Text,StrToInt(Edit2.Text))
               else // создать объект TProf
                   List[n]:=TProf.Create(Edit1.Text,Edit2.Text);
         
          // очистить поля ввода
          Edit1.Text := '';
          Edit2.Text := '';
          Edit1.SetFocus;  // курсор в поле Фамилия
       end
     else ShowMessage('Список заполнен!');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i:integer; // индекс
  st:string; // список
begin
  for i:=1 to SZL do
     if list[i] <> NIL then st:=st + list[i].info + #13;
  ShowMessage('Список'+#13+st);
end;

end.
