unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    Edit1: TEdit;      // ���� ����� ���� � ������
    Button1: TButton;  // ������ "���������"
    Label1: TLabel;
    Label3: TLabel;
    ListBox1: TListBox; // ������ �����
    Label4: TLabel;     // ���� ������ ���-�� - ���� � �����������
    procedure FormCreate(Sender: TObject);
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
 

procedure TForm1.FormCreate(Sender: TObject);
begin
{
ListBox1.items.add('������');
ListBox1.items.add('�������');
ListBox1.items.add('������');
ListBox1.items.add('��������');
ListBox1.items.add('�����');
ListBox1.items.add('��������');
ListBox1.items.add('������');
ListBox1.items.add('����������');
}
ListBox1.itemindex:=0;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
   funt:real; { ��� � ������ }
   kg:real;   { ��� � ����������� }
   k:real;    { ����������� ��������� }
begin
 case ListBox1.ItemIndex of
      0: k:=0.4059;  { ������ }
      1: k:=0.453592;{ ������ }
      2: k:=0.56001; { ������� }
      3..5,7:k:=0.5; { ��������, �����, ��������, ���������� }
      6: k:=0.31762; { ������ }
 end;
 funt:=StrToFloat(Edit1.Text);
 kg:=k*funt;
 label4.caption:=Edit1.Text
                 + ' ����. - '
                 + FloatToStrF(kg,ffFixed,6,3)
                 + ' ��.';
end;

end.
