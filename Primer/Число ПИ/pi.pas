unit pi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
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

procedure TForm1.Button1Click(Sender: TObject);

var
   pi:real;	{ ����������� �������� ��}
   t:real;	{ �������� ����������}
   n:integer;	{ ����� ����� ����}
   elem:real;	{ �������� ����� ����}
begin
     pi:=0;
     n:=1;
     elem:=1; { ����� ������ ����. ��. ������� ���������� while }
     t:=StrToFloat(edit1.text);
	while elem >= t do
           begin
             elem:=1/(2*n-1);
	     if (n MOD 2) = 0
	     	then pi:=pi-elem
	     	else pi:=pi+elem;
	     n:=n+1;
	   end;
	pi:=pi*4;
	label1.caption:= '�� ����� '+ FloatToStr(pi) + #13
	           + '�������������� '+IntTostr(n)+' ������ ����.';

end;

end.
