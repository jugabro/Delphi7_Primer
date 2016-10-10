unit s_found_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Edit2: TEdit;
    StringGrid1: TStringGrid;
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

{ ����� � ������� ��������� }
procedure TForm1.Button1Click(Sender: TObject);
const
   SIZE=5;
var
   a: array[1..SIZE] of integer; // ������
   obr: integer;                 // ������� ��� ������}
   found: boolean;               // TRUE - ���������� ������� � ��������� ������� }
   i: integer;                   // ������ �������� ������� }

begin
   // ���� �������
   for i:=1 to SIZE do
       a[i] := StrToInt(StringGrid1.Cells[i-1,0]);

   // ���� ������� ��� ������
   obr := StrToInt(edit2.text);

   // �����
   found := FALSE; // ����� ������� ��-�� � ������� ���
   i := 1;
   repeat
         if a[i] = obr
            then found := TRUE
            else i := i+1;
   until (i > SIZE) or (found = TRUE);

   if found
      then ShowMessage('���������� � ��������� ����� '
                       +IntToStr(i)+#13+'����� �������.')
      else ShowMessage('���������� � �������� ���.');
end;

end.
