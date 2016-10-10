unit pokupka_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
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

// ������������
procedure Summa;
var
    cena: real;       // ����
    kol: integer;     // ����������
    s: real;          // �����
    mes: string[255]; // ���������
begin
    cena := StrToFloat(Form1.Edit1.Text);
    kol := StrToInt(Form1.Edit2.Text);
    s := cena * kol;
    if s > 500 then
       begin
           s := s * 0.9;
           mes := '��������������� ������ 10%' + #13;
       end;
     mes := mes+ '��������� �������: '
            + FloatToStrF(s,ffFixed,4,2) +' ���.';
     Form1.Label3.Caption := mes;
end;

// ������ �� ������ ���������
procedure TForm1.Button1Click(Sender: TObject);
begin
        Summa; // ��������� ����� �������
end;

// ������� ������� � ���� ���������� 
procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
      '0' .. '9',#8:  ;    // ����� � <Backspace>
      #13:        Summa;   // ��������� ��������� �������
      else Key := Chr(0);  // ������ �� ����������
    end;
end;

// ������� ������� � ���� ����
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
       '0' .. '9', #8 :     ;      //����� � <Backspace>

        #13: Form1.Edit2.SetFocus; // <Enter>

        '.', ',':
             begin
                if  Key = '.'
                    then Key:=',';
                if Pos(',',Edit1.Text) <> 0
                    then  Key:= Chr(0);
             end;
         else    // ��� ��������� ������� ���������
             Key := Chr(0);
   end;
end;

end.
