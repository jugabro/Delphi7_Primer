unit fazenda_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;         // ����������
    Edit2: TEdit;         // ���� ����� �������
    Edit3: TEdit;         // ����������� ������� �� 100 ��
    CheckBox1: TCheckBox; // True - ������� ���� � �������
    Button1: TButton;     // ������ ���������
    Label4: TLabel;       // ���� ������ ���������� �������
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

// ���������, �������� �� ������ ����������
// �� ����� ����� �������� �����
function IsFloat(ch : char; st: string) : Boolean;
begin
   if      (ch >= '0') and (ch <= '9') // �����
        or (ch = #13)                  // ������� <Enter>
        or (ch = #8)                   // ������� <Back Space>
   then
        begin
          IsFloat := True;  // ������ ������
          Exit;            // ����� �� �������
        end;

   case ch of
      '-': if Length(st) = 0 then IsFloat := True;
      ',': if    ( Pos(',',st) = 0)
             and (st[Length(st)] >= '0')
             and (st[Length(st)] <= '9')
           then // ����������� ����� ������ ������ ����� �����
                // � ���� �� ��� �� ������
                    IsFloat := True;
      else // ��������� ������� ���������
           IsFloat := False;
    end;
end;


{$R *.dfm}

// ������� ������� � ���� ����������
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Char(VK_RETURN)
       then Edit2.SetFocus  // ����������� ������ � ���� ����
       else If not IsFloat(Key,Edit2.Text) then Key := Chr(0);
end;

// ������� ������� � ���� ����
procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Char(VK_RETURN)
       then Edit3.SetFocus  // ����������� ������ � ���� �����������
       else If not IsFloat(Key,Edit2.Text) then Key := Chr(0);
end;

// ������� ������� � ���� �����������
procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Char(VK_RETURN)
       then Button1.SetFocus // // ������� �������� ������ ���������
       else If not IsFloat(Key,Edit2.Text) then Key := Chr(0);
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
  rast := StrToFloat(Edit1.Text);
  cena := StrToFloat(Edit2.Text);
  potr := StrToFloat(Edit3.Text);
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
