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
    Edit1: TEdit;       // �������
    Edit2: TEdit;       // ���
    Button1: TButton;   // ������ ��������
    Button2: TButton;   // ������ ��������
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
  TPStudent=^TStudent; //��������� �� ��� TStudent

  TStudent = record
        f_name:string[20];  // �������
	l_name: string[20]; // ���
	next: TPStudent;    // ��������� ������� ������
  end;

var
  head: TPStudent;  // ������ (������) ������

// �������� ������� � ������ ������
procedure TForm1.Button1Click(Sender: TObject);
var
   curr: TPStudent;  // ����� ������� ������
begin
   new(curr); // �������� ������ ��� �������� ������
   curr^.f_name := Edit1.Text;
   curr^.l_name := Edit2.Text;

   // ���������� � ������ ������
   curr^.next := head;
   head := curr;

   // �������� ���� �����
   Edit1.text:='';
   Edit2.text:='';
end;

// ������� ������
procedure TForm1.Button2Click(Sender: TObject);
var
 curr: TPStudent;  // ������� ������� ������
 n:integer;        // ����� (���-�� ���������) ������
 st:string;        // ��������� ������������� ������
begin
 n := 0;
 st := '';
 curr := head;  // ��������� �� ������ ������� ������
 while curr <> NIL do
    begin
      n := n + 1;
      st := st + curr^.f_name + ' ' + curr^.l_name +#13;
      curr := curr^.next;  // ��������� �� ��������� �������
    end;

 if n <> 0
    then ShowMessage('������:' + #13 + st)
    else ShowMessage('� ������ ��� ���������.');
end;

end.
