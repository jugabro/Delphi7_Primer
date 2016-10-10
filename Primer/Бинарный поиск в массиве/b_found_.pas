unit b_found_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);

    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{ �������� ����� � ������� }
procedure TForm1.Button1Click(Sender: TObject);
const
   SIZE=10;
var
   a:array[1..SIZE] of integer; { ������ }
   obr:integer;                 { ������� ��� ������}

   verh:integer; { ������� ������� ������ }
   niz: integer; { ������ ������� ������ }
   sred:integer; { ����� �������� �������� }

   found:boolean;{ TRUE - ���������� ������� � ��������� ������� }
   n:integer;    {  ����� ��������� � �������� }

   i:integer;

begin
   // ���� ������� � �������
   for i:=1 to SIZE do
       a[i]:=StrToInt(StringGrid1.Cells[i-1,0]);
   obr := StrToInt(Edit1.text);

   // �����
   verh:=1;
   niz:=SIZE;
   n:=0;
   found:=FALSE;
   label3.caption:='';


   if CheckBox1.State = cbChecked
      then Label3.caption:='verh'+#9+'niz'#9'sred'#13;

   // �������� ����� � �������
   repeat
     sred:=Trunc((niz-verh)/2)+verh;
     if CheckBox1.Checked
       then Label3.caption:=label3.caption
                 +IntToStr(verh) + #9
                 +IntToStr(niz) + #9
                 +IntToStr(sred) + #13;
     n:=n+1;
     if a[sred] = obr
        then found:=TRUE
        else
           if obr < a[sred]
              then niz:=sred-1
	      else verh:=sred+1;
   until (verh > niz) or found;

   if found
       then label3.caption:=label3.caption
                          +'���������� � ��������� ����� '
                          + IntToStr(sred)+#13
                          + 'C�������� ' + IntToStr(n)
       else label3.caption:=label3.caption
                          +'������� � ������� �� ������.';
end;


// ������� ������� � ������ StringGrid
procedure TForm1.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then  // ������ ������� <Enter>
        if StringGrid1.Col < StringGrid1.ColCount - 1
            then // ������ � ��������� ������ �������
                 StringGrid1.Col := StringGrid1.Col +1
            else // ������ � ���� Edit1, � ���� ����� �������
                 Edit1.SetFocus; 

end;

// ������� ������� � ���� Edit1
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 // ������ <Enter>
      then  // ������� �������� ��������� ������
            Button1.SetFocus;
end;

end.
