unit fr_memo_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
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

const
   SIZE=5;  // ������ �������
var
   a:array[1..SIZE]of string[30]; // ������
   n: integer; // ���������� �����, ��������� � ���� Memo
   i:integer;  // ������ �������� �������
   st:string;
begin
   n:=Memo1.Lines.Count;
   if n = 0 then
      begin
        ShowMessage('�������� ������ �� �������!');
        Exit;   // ����� �� ��������� ��������� �������
      end;

   // � ���� Memo ���� �����
   if n > SIZE then
      begin
        ShowMessage('���������� ��������� ����� ��������� ������ �������.');
        n:=SIZE; // ����� ������� ������ ������ SIZE �����
      end;
   for i:=1 to n do
      a[i]:=Form1.Memo1.Lines[i-1]; // ������ Memo ������������� � ����

   // ����� ������� � ���� ���������
   if n > 0 then
      begin
         st:='��������� ������:'+#13;
         for i:=1 to n do
            st:=st+IntToStr(i)+'  '+ a[i]+#13;
         ShowMessage(st);
      end;
end;
end.
