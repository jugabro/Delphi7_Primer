unit wtest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;     // ���� ����� ����
    Edit2: TEdit;     // ���� ����� �����
    Button1: TButton; // ������ "���������"
    Label3: TLabel;   // ���� ������ ��������� - ���-�� ������ ���������
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
   w:real;   { ��� }
   h:real;   { ���� }
   opt:real; { ����������� ��� }
   d:real;   { ���������� �� ������������ ���� }
begin
   w:=StrToFloat(Edit1.text);
   h:=StrToInt(Edit2.Text);
   opt:=h-100;
   if w=opt
      then
          Label3.caption:='��� ��� ��������� !'
      else
          if w<opt
               then
                   begin
                         d:=opt-w;
                         Label3.caption:='��� ���� �����������, �� '
                                          + FloatTostr(d)+ '��.';
                   end
               else
                   begin
                        d:=w-opt;
                        Label3.caption:='���� ������� ��������, �� '
                                         + FloatTostr(d)+ ' ��.';
                   end;
  end;
end.


