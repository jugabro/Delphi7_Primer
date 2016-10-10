unit SqRoot_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Label5: TLabel;
    Button2: TButton;
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

// ������ ���������� ���������
procedure SqRoot( a,b,c : real; var x1, x2 : real; var ok : boolean);
    { a,b,c - ������������ ���������
      x1,x2 - ����� ���������
      ok = True  - ������� ����
      ok = False - ������� ��� }
    var
        d : real; // ������������
    begin
        d:= Sqr( b ) - 4*a*c;
        if d < 0
             then
               ok := False  // ��������� �� ����� �������
        else
            begin
                ok := True;
                x1 := (-b + Sqrt(d)) / (2*a);
                x2 := ( b + Sqrt(d)) / (2*a);
            end;
    end;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
   k1,k2: real;  // ����� ���������
   rez: boolean; // True - ������� ����, False - ������� ���
   mes: string;  // ���������
begin
   SqRoot(StrToFloat(Edit1.Text), StrToFloat(Edit2.Text),
                     StrToFloat(Edit3.Text), k1,k2,rez);
   if rez then
       mes := '����� ���������' + #13 +
                 'x1='+FloatToStrF(k1,ffGeneral,4,2)+#13+
                 'x2='+FloatToStrF(k2,ffGeneral,4,2)+#13
   else
       mes := '��������� �� ����� �������';

   label5.Caption := mes;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
          winhelp(Form1.Handle,'sqroot.hlp',HELP_CONTEXT,1);
end;

end.
