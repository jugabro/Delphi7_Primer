unit RewAp_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
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

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
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

procedure TForm1.Button2Click(Sender: TObject);
var
   f: TextFile;       // ����
   fName: String[80]; // ��� �����
   i: integer;
begin
   fName := Edit1.Text;
   AssignFile(f, fName);

   Append(f);  // ������� ��� ����������

   // ������ � ����
   for i:=0 to Memo1.Lines.Count do // ������ ���������� � ����
          writeln(f, Memo1.Lines[i]);

   CloseFile(f); // ������� ����

   MessageDlg('������ ��������� � ���� ',mtInformation,[mbOk],0);
end;

end.
