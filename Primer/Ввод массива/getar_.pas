unit getar_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  a : array[1..5] of integer; // ������
  summ: integer;              // ����� ���������
  sr:  real;                  // ������� ��������������
  i: integer;                 // ������
begin
  // ���� �������
  // �������, ��� ���� ������ ������, �� ���������������
  // �� ������� ������� ����� ����
  for i:= 1 to 5 do
     if Length(StringGrid1.Cells[i-1,0]) <> 0
        then a[i] := StrToInt(StringGrid1.Cells[i-1,0])
        else a[i] := 0;

  // ��������� �������
  summ := 0;
  for i :=1 to 5 do
      summ := summ + a[i];
  sr := summ / 5;

  // ����� ����������
  Label2.Caption :=
        '����� ���������: ' + IntToStr(summ) + #13+
        '������� ��������������: ' + FloatToStr(sr);
end;

procedure TForm1.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin

    case Key of
        #8,'0'..'9' :  ; // ����� � <Back Space>
                 #13:    // <Enter>
                      if StringGrid1.Col < StringGrid1.ColCount - 1
                         then StringGrid1.Col := StringGrid1.Col + 1;
             '.',',':
                      begin
                         // ����� � ������� ������� ���������� ������������
                         Key := DecimalSeparator;
                         
                      end;

        else    key := Chr(0);  // ��������� �������
    end;
end;

end.
