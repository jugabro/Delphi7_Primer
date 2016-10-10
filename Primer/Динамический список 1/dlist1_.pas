unit dlist1_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;       // фамилия
    Edit2: TEdit;       // имя
    Button1: TButton;   // кнопка Добавить
    Button2: TButton;   // кнопка Показать
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
{$R *.DFM}

type
  TPStudent=^TStudent; //указатель на тип TStudent

  TStudent = record
        f_name:string[20];  // фамилия
	l_name: string[20]; // имя
	next: TPStudent;    // следующий элемент списка
  end;

var
  head: TPStudent;  // начало (голова) списка

// добавить элемент в начало списка
procedure TForm1.Button1Click(Sender: TObject);
var
   curr: TPStudent;  // новый элемент списка
begin
   new(curr); // выделить память для элемента списка
   curr^.f_name := Edit1.Text;
   curr^.l_name := Edit2.Text;

   // добавление в начало списка
   curr^.next := head;
   head := curr;

   // очистить поля ввода
   Edit1.text:='';
   Edit2.text:='';
end;

// вывести список
procedure TForm1.Button2Click(Sender: TObject);
var
 curr: TPStudent;  // текущий элемент списка
 n:integer;        // длина (кол-во элементов) списка
 st:string;        // строковое представление списка
begin
 n := 0;
 st := '';
 curr := head;  // указатель на первый элемент списка
 while curr <> NIL do
    begin
      n := n + 1;
      st := st + curr^.f_name + ' ' + curr^.l_name +#13;
      curr := curr^.next;  // указатель на следующий элемент
    end;

 if n <> 0
    then ShowMessage('Список:' + #13 + st)
    else ShowMessage('В списке нет элементов.');
end;

end.
