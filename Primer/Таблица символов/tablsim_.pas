unit tablsim_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
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

procedure TForm1.FormActivate(Sender: TObject);
var
   st:string;   // ������� ����������� ��� ������ ��������
   dec: byte;   // ��� �������
   i,j:integer; // ����� ������ � ������� �������

begin
   st:='';
   dec:=192;
   for i:=0 to 15 do // ����������� �����
   begin
     dec:=i + 192;
     for j:=1 to 4 do // ������ �������
     begin
       st:=st+chr(dec)+'-'+IntToStr(dec)+'  ';
       dec:=dec + 16;
     end;
     st:=st + #13;   // ������� � ����� ������ ������
   end;
   Label1.caption:=st;
end;


end.
