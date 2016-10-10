unit Phone_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;       // ���� ����� ������������ ���������
    Edit2: TEdit;       // ���� ����� ������ ��� ������
    Button1: TButton;   // ������ ���������
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
        PAY = 0.15;     // ���� ����� ������ ��������� 0.15 �����
        DISCOUNT = 0.2; // ������ 20 ���������
var
	Time:Real;	// ������������ ���������
	Day:integer;	// ���� ������
	Summa:real;	// ��������� ���������
begin
        //�������� �������� ������
        Time:=StrToFloat(Edit1.Text);
        Day:=StrToInt(Edit2.Text);

        // ��������� ��������� ���������
	Summa:= PAY*Time;
        // ���� ���� ������� ��� �����������, �� ���������
        // ��������� �� �������� ������
	if (Day = 6) OR (Day = 7)
		then Summa:=Summa*(1 -DISCOUNT);

        // ����� ���������� ����������
        label3.caption:='� ������ '+FloatToStr(Summa)+'���.';
end;

end.
