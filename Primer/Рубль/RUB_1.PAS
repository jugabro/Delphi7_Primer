unit rub_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// ������� �������

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
  var
   n : integer;     // �����
   r : integer;     // ������� �� ������� n �� 10
   text: string[10]; // ����������� ���������� �����

  begin
    if Key = chr(VK_RETURN) then
        begin
           n := StrToInt(Edit1.Text);
           if n > 100
               then n:=n mod 100;
           if ( n >= 11) and ( n <= 14)
               then
                 text:=' ������'
               else
                 begin
                   r:= n mod 10;
                   case r of
                     1:      text:=' �����';
                     2 .. 4: text:=' �����';
                     else    text:=' ������';
                   end;
                 end;
           Label2.Caption := IntToStr(n)+ text;
        end;
  end;

end.
