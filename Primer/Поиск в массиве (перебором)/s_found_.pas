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

{ поиск в массиве перебором }
procedure TForm1.Button1Click(Sender: TObject);
const
   SIZE=5;
var
   a: array[1..SIZE] of integer; // массив
   obr: integer;                 // образец для поиска}
   found: boolean;               // TRUE - совпадение образца с элементом массива }
   i: integer;                   // индекс элемента массива }

begin
   // ввод массива
   for i:=1 to SIZE do
       a[i] := StrToInt(StringGrid1.Cells[i-1,0]);

   // ввод образца для поиска
   obr := StrToInt(edit2.text);

   // поиск
   found := FALSE; // пусть нужного эл-та в массиве нет
   i := 1;
   repeat
         if a[i] = obr
            then found := TRUE
            else i := i+1;
   until (i > SIZE) or (found = TRUE);

   if found
      then ShowMessage('Совпадение с элементом номер '
                       +IntToStr(i)+#13+'Поиск успешен.')
      else ShowMessage('Совпадений с образцом нет.');
end;

end.
