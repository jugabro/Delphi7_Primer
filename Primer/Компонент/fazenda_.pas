unit fazenda_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NkEdit;

type
  TForm1 = class(TForm)
    NkEdit1: TNkEdit;     // ����������
    NkEdit2: TNkEdit;     // ���� ����� �������
    NkEdit3: TNkEdit;     // ����������� ������� �� 100 ��
    CheckBox1: TCheckBox; // True - ������ ���� � �������
    Button1: TButton;     // ������ ���������
    Label4: TLabel;       // ���� ������ ���������� �������
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;

    procedure Button1Click(Sender: TObject);
    procedure NkEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure NkEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure NkEdit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// ������� ������� � ���� ����������
procedure TForm1.NkEdit1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Char(VK_RETURN)
       then NkEdit2.SetFocus;  // ����������� ������ � ���� ����
end;

// ������� ������� � ���� ����
procedure TForm1.NkEdit2KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Char(VK_RETURN)
       then NkEdit3.SetFocus;  // ����������� ������ � ���� �����������
end;

// ������� ������� � ���� �����������
procedure TForm1.NkEdit3KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Char(VK_RETURN)
       then Button1.SetFocus; // // ������� �������� ������ ���������
end;

// ������ �� ������ ���������
procedure TForm1.Button1Click(Sender: TObject);
var
  rast : real; // ����������
  cena : real; // ����
  potr : real; // ����������� �� 100 ��
  summ : real; // �����
  mes: string;
begin
  rast := StrToFloat(NkEdit1.Text);
  cena := StrToFloat(NkEdit2.Text);
  potr := StrToFloat(NkEdit3.Text);
  summ := rast / 100 * potr * cena;
  if  CheckBox1.Checked  then
      summ := summ * 2;
  mes := '������� �� ����';
  if CheckBox1.Checked then
     mes := mes + ' � �������';
  mes := mes + '��������� � ' + FloatToStrF(summ,ffGeneral,4,2)
             + ' ���.';
  Label4.Caption := mes;
end;


end.
