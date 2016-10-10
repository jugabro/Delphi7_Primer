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

{ Ѕинарный поиск в массиве }
procedure TForm1.Button1Click(Sender: TObject);
const
   SIZE=10;
var
   a:array[1..SIZE] of integer; { массив }
   obr:integer;                 { образец дл€ поиска}

   verh:integer; { верхн€€ граница поиска }
   niz: integer; { нижн€€ граница поиска }
   sred:integer; { номер среднего элемента }

   found:boolean;{ TRUE - совпадение образца с элементом массива }
   n:integer;    {  число сравнений с образцом }

   i:integer;

begin
   // ввод массива и образца
   for i:=1 to SIZE do
       a[i]:=StrToInt(StringGrid1.Cells[i-1,0]);
   obr := StrToInt(Edit1.text);

   // поиск
   verh:=1;
   niz:=SIZE;
   n:=0;
   found:=FALSE;
   label3.caption:='';


   if CheckBox1.State = cbChecked
      then Label3.caption:='verh'+#9+'niz'#9'sred'#13;

   // бинарный поиск в массиве
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
                          +'—овпадение с элементом номер '
                          + IntToStr(sred)+#13
                          + 'Cравнений ' + IntToStr(n)
       else label3.caption:=label3.caption
                          +'ќбразец в массиве не найден.';
end;


// нажатие клавиши в €чейке StringGrid
procedure TForm1.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then  // нажата клавиша <Enter>
        if StringGrid1.Col < StringGrid1.ColCount - 1
            then // курсор в следующую €чейку таблицы
                 StringGrid1.Col := StringGrid1.Col +1
            else // курсор в поле Edit1, в поле ввода образца
                 Edit1.SetFocus; 

end;

// нажатие клавиши в поле Edit1
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 // нажата <Enter>
      then  // сделать активной командную кнопку
            Button1.SetFocus;
end;

end.
