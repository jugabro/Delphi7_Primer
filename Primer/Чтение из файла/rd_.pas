unit rd_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
   f: TextFile;       // ����
   fName: String[80]; // ��� �����
   buf: String[80];   // ����� ��� ������ �� �����

begin
   fName := Edit1.Text;
   AssignFile(f, fName);

   {$I-}
   Reset(f);  // ������� ��� ������
   {$I+}
   if IOResult <> 0 then
     begin
       MessageDlg('������ ������� � ����� ' + fName,
                   mtError,[mbOk],0);
       exit;
     end;

   // ������ �� �����
   while not EOF(f) do
     begin
        readln(f, buf);       // ��������� ������ �� �����
        Memo1.Lines.Add(buf); // �������� ������ � ���� Memo1
     end;

   CloseFile(f); // ������� ����
end;

// ������ � ����
procedure TForm1.Button2Click(Sender: TObject);
var
   f: TextFile;       // ����
   fName: String[80]; // ��� �����
   i: integer;
begin
   fName := Edit1.Text;
   AssignFile(f, fName);

   Rewrite(f);  // ������� ��� ����������

   // ������ � ����
   for i:=0 to Memo1.Lines.Count do // ������ ���������� � ����
          writeln(f, Memo1.Lines[i]);

   CloseFile(f); // ������� ����

   MessageDlg('������ �������� � ���� ',mtInformation,[mbOk],0);
end;


end.
