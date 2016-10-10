unit dlist3_;

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
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
	l_name:string[20];  // ���
	next: TPStudent;    // ��������� ������� ������
  end;

var
  head: TPStudent;  // ������ (������) ������

procedure TForm1.Button1Click(Sender: TObject);
var
   node: TPStudent;  // ����� ���� ������
   curr: TPStudent;  // ������� ���� ������
   pre:  TPStudent;  // ����������, ������������ curr, ����
begin
   new(node); // �������� ������ �������� ������
   node^.f_name:=Edit1.Text;
   node^.l_name:=Edit2.Text;
   // ���������� ���� � ������
   // ������� ������ ���������� ����� � ������ ��� ����
   curr:=head;
   pre:=NIL;
   { ��������!
     ���� ����������� ���� ������� ��������
     �� (node.f_name>curr^.f_name)and(curr<>NIL)
     �� ��� ���������� ������� ���� ��������� ������ �������
     ����������, ��� ��� curr = NIL �, �������������,
     ���������� curr.^name ���!
     � ������������ �������� ������� ������ �� ���������, ��� ���
     ������� ����������� ������� (curr <> NIL), �������� ��������
     FALSE � ������ ������� � ���� ������ �� �����������.
   }
   while (curr <> NIL)and(node.f_name > curr^.f_name)  do
   begin
     // ��������� �������� ������ ��������
     pre:= curr;
     curr:=curr^.next; // � ���������� ����
   end;
   if pre = NIL
     then
        begin
          // ����� ���� � ������ ������
          node^.next:=head;
	  head:=node;
        end
     else
        begin
          // ����� ���� ����� pre, ����� curr
	  node^.next:=pre^.next;
          pre^.next:=node;
        end;

   Edit1.text:='';
   Edit2.text:='';
   Edit1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
 curr: TPStudent;  // ������� ������� ������
 n:integer; // ����� (���-�� ���������) ������
 st:string; // ��������� ������������� ������
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
    then ShowMessage('������:'+#13+st)
    else ShowMessage('� ������ ��� ���������.');
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
     head:=NIL;
end;

// ������ �� ������ �������
procedure TForm1.Button3Click(Sender: TObject);
var
  curr:TPStudent; // �������, ����������� ����
  pre: TPStudent; // ���������� ����
  found:boolean;  // TRUE - ����, ������� ���� �������, ���� � ������

begin
  if head = NIL then
     begin
        MessageDlg('������ ������!',mtError,[mbOk],0);
        Exit;
     end;
  curr:=head;   // ������� ���� - ������ ����
  pre:=NIL;     // ����������� ���� ���
  found:=FALSE;

  // ����� ����, ������� ���� �������
  while (curr <> NIL) and (not found) do
      begin
          if (curr^.f_name = Edit1.Text) and (curr^.l_name = Edit2.Text)
            then found:=TRUE // ������ ���� ������
            else  // � ���������� ����
               begin
                 pre:=curr;
                 curr:=curr^.next;
               end;
      end;
      if found then
         begin
            // ������ ���� ������
            if MessageDlg('���� ����� ������ �� ������!',
                           mtWarning,[mbOk,mbCancel],0) <> mrYes
               then Exit;

            // ������� ����
            if pre = NIL
               then  head:=curr^.next      // ������� ������ ���� ������
               else pre^.next:=curr.next;
             Dispose(curr);
             MessageDlg('����' + #13 +
                      '���:'+Edit1.Text + #13 +
                      '�������:' + Edit2.Text + #13 +
                      '������ �� ������.',
                      mtInformation,[mbOk],0);
         end
      else // ����, ������� ���� �������, � ������ ���
           MessageDlg('����' + #13 +
                      '���:' + Edit1.Text + #13 +
                      '�������:' + Edit2.Text + #13 +
                      '� ������ �� ������.',
                      mtError,[mbOk],0);
      Edit1.Text:='';
      Edit1.Text:='';
      Edit1.SetFocus;
end;


end.
