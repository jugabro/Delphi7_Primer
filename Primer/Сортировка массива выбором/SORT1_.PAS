unit sort1_;

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

procedure TForm1.Button1Click(Sender: TObject);
const
   SIZE=10;
var
   a:array[1..SIZE] of integer;
   min:integer; { номер минимального элемента в части
                  массива от i до верхней границы массива }
   j:integer; { номер эл-та, сравниваемого с минимальным }
   buf:integer; { буфер, используемый при обмене эл-тов массива }

   i,k:integer;

begin
   // ввод массива
   for i:=1 to SIZE do
       a[i]:=StrToInt(StringGrid1.Cells[i-1,0]);

   label2.caption:='';
   for i:=1 to SIZE-1 do
      begin
         { поиск минимального эл-та
         в части массива от a[1] до a[SIZE]}
         min:=i;
         for j:=i+1 to SIZE do
            if a[j] < a[min]
               then min:=j;
            { поменяем местами a[min]  и a[i] }
	    buf:=a[i];
	    a[i]:=a[min];
	    a[min]:=buf;

	    { вывод массива }
	    for k:=1 to SIZE do
                Label2.caption:=label2.caption+' '+IntTostr(a[k]);
            Label2.caption:=label2.caption+#13;
      end;
      Label2.caption:=label2.caption+#13+'Массив отсортирован.';
end;

end.
