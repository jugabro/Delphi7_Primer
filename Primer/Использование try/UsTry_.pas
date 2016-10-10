unit UsTry_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;      // ����������
    Edit2: TEdit;      // �������������
    Label5: TLabel;    // ��������� ������� - ���
    Button1: TButton;  // ������ ���������
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
   u: real; // ����������
   r: real; // �������������
   i: real; // ���
begin
   Label5.Caption := '';
   try
      // ����������, ������� �����
      // ������� ���������� (������)
      u := StrToFloat(Edit1.Text);
      r := StrToFloat(Edit2.Text);
      i := u/r;
      except
        on EZeroDivide do  // ������� �� ����
            begin
               ShowMessage(' ������������� �� ����� ���� ����� ����!');
               exit;
             end;
        on EConvertError do  // ���������� ������������� ������ �������� � �����
             begin
                ShowMessage('���������� � ������������� ������ ���� ������ ������.'+#13+
                            '��� ������ �������� ����� ����������� �������.');
                exit;
             end;
      end;
      Label5.caption:=FloatToStr(i)+' �';
end;
end.
