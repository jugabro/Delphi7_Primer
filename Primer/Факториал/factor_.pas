unit factor_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Label2: TLabel;
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

// ����������� �������
function factorial(n: integer): integer;
begin
    if n > 1
       then factorial := n * factorial(n-1) // ������� �������� ���� ����
       else factorial:= 1;  // ��������� 1 ����� 1
end;

procedure TForm1.Button1Click(Sender: TObject);
var
   k:integer; // �����, ��������� �������� ���� ���������
   f:integer; // �������� ���������� ����� k
begin
   k := StrToInt(Edit1.Text);
   f := factorial(k);
   label2.caption:='��������� ����� '+Edit1.Text
                  +' ����� '+IntToStr(f);
end;

end.
