unit vrun1;

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
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// ������ �� ������ ���������
procedure TForm1.Button1Click(Sender: TObject);
var
    dist : integer; // ���������, ������
    t:     real;    // �����, ��� ������� �����

    min : integer;  // �����, ������
    sek : integer;   // �����, �������

    v: real;        // ��������
begin
    // �������� �������� ������ �� ����� �����
    dist := StrToInt(Edit1.Text);
    t := StrToFloat(Edit2.Text);

    // ��������������� ��������������
    min := Trunc(t);  // ���-�� ����� - ��� ����� ����� ����� t
    sek := Trunc(t*100) mod 100; // ���-�� ������ - ��� ������� ����� ����� t

    // ����������
    v := (dist/1000) / ((min*60 + sek)/3600);

    // ����� ����������
    label4.Caption := '���������: '+ Edit1.Text + ' �' + #13 +
                      '�����: ' + IntToStr(min) + ' ��� ' +
                                 IntToStr(sek) + ' ��� ' + #13 +
                      '��������: ' + FloatToStrF(v,ffFixed,4,2) + ' ��/���';

end;

// ������ �� ������ ���������
procedure TForm1.Button2Click(Sender: TObject);
begin
        Form1.Close;
end;

// ������� ������� � ���� ���������
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    // Key - ������, ��������������� ������� �������.
    // ���� ������ ������������, �� ��������� �������� ���
    // �� ������ � ����� 0. � ���������� ����� ������ � ����
    // �������������� �� ���������� � � ������������ ���������
    // �����������, ��� ��������� �� ��������� �� ������� ���������
    // ������.
    case Key of
      '0'..'9':                  ; // �����
      #8      :                  ; // <Backspace>
      #13     : Edit2.SetFocus   ; // <Enter>

      // ��������� ������� - ���������
      else Key :=Chr(0);  // ������ �� ����������
    end;
end;



procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
      '0'..'9':   ; // �����

      ',','.' :
          // ����� ��� �������
          begin
             if Key = '.' then Key := ','; // �������� ����� �������
             // ��������, ���� �� � ���� Edit2 �������
             if Pos(',',Edit2.Text) <> 0 // ������� ��� ����
                 then Key:=Char(0);      // ������ ������� �� ����������
          end;

      #8      :                  ; // <Backspace>

      // ��������� ������� - ���������
      else Key :=Chr(0);  // ������ �� ����������
    end;
end;

end.
