unit dlist2_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
	l_name:string[20];  // имя
	next: TPStudent;    // следующий элемент списка
  end;

var
  head: TPStudent;  // начало (голова) списка

procedure TForm1.Button1Click(Sender: TObject);
var
   node: TPStudent;  // новый узел списка
   curr: TPStudent;  // текущий узел списка
   pre:  TPStudent;  // предыдущий, относительно curr, узел
begin
   new(node); // создание нового элемента списка
   node^.f_name:=Edit1.Text;  // фамилия
   node^.l_name:=Edit2.Text;  // имя
   // добавление узла в список
   // сначала найдем подходящее место в списке для узла
   curr:=head;
   pre:=NIL;
   { Внимание!
     если приведенное ниже условие заменить
     на (node.f_name>curr^.f_name)and(curr<>NIL)
     то при добавлении первого узла возникает ошибка времени
     выполнения, так как curr = NIL и, следовательно,
     переменной curr.^name нет!
     В используемом варианте условия ошибка не возникает, так как
     сначала проверяется условие (curr <> NIL), значение которого
     FALSE и второе условие в этом случае не проверяется.
   }
   while (curr <> NIL)and(node.f_name > curr^.f_name)  do
   begin
     // введенное значение больше текущего
     pre:= curr;
     curr:=curr^.next; // к следующему узлу
   end;
   if pre = NIL
     then
        begin
          // новый узел в начало списка
          node^.next:=head;
	  head:=node;
        end
     else
        begin
          // новый узел после pre, перед curr
	  node^.next:=pre^.next;
          pre^.next:=node;
        end;

   Edit1.text:='';
   Edit2.text:='';
   Edit1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
 curr: TPStudent;  // текущий элемент списка
 n:integer; // длина (кол-во элементов) списка
 st:string; // строковое представление списка
begin
 n:=0;
 st:='';
 curr:=head;
 while curr <> NIL do
    begin
      n:=n+1;
      st:=st+curr^.f_name+' '+curr^.l_name+#13;
      curr:=curr^.next;
    end;
 if n <> 0
    then ShowMessage('Список:'+#13+st)
    else ShowMessage('В списке нет элементов.');
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
     head:=NIL;
end;

end.
