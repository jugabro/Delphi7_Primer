unit road_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
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

procedure TForm1.FormActivate(Sender: TObject);
var
   i:integer;
begin
   // нумераци€ строк
   for i:=1 to 10 do
       StringGrid1.Cells[0,i]:=IntToStr(i);
   // нумераци€ колонок
   for i:=1 to 10 do
       StringGrid1.Cells[i,0]:=IntToStr(i);
   // описание предопределенной карты
   StringGrid1.Cells[1,2]:='1';
   StringGrid1.Cells[2,1]:='1';
   StringGrid1.Cells[1,3]:='1';
   StringGrid1.Cells[3,1]:='1';
   StringGrid1.Cells[1,4]:='1';
   StringGrid1.Cells[4,1]:='1';
   StringGrid1.Cells[3,7]:='1';
   StringGrid1.Cells[7,3]:='1';
   StringGrid1.Cells[4,6]:='1';
   StringGrid1.Cells[6,4]:='1';
   StringGrid1.Cells[5,6]:='1';
   StringGrid1.Cells[6,5]:='1';
   StringGrid1.Cells[5,7]:='1';
   StringGrid1.Cells[7,5]:='1';
   StringGrid1.Cells[6,7]:='1';
   StringGrid1.Cells[7,6]:='1';
end;


procedure TForm1.Button1Click(Sender: TObject);
const
   N=10;{ кол-во вершин графа}
var
   map:array[1..N,1..N]of integer; { арта. map[i,j не 0, если точки i и j соединены }
   road:array[1..N]of integer;     { ƒорога - номера точек карты }
   incl:array[1..N]of boolean;     { incl[i] равен TRUE, если точка с номером i включена в road }
   start,finish:integer;           { Ќачальна€ и конечна€ точки }
   found:boolean;
   i,j:integer;
procedure step(s,f,p:integer);
var
   c:integer;{ Ќомер точки,в которую делаем очередной шаг }
   i:integer;
begin
   if s=f then
   begin
       { “очки s и f совпали !}
       found:=TRUE;
       Label1.caption:=Label1.caption+#13+'ѕуть:';
       for i:=1 to p-1 do
          Label1.caption:=Label1.caption+' '+IntToStr(road[i]);
   end
   else begin
	{ выберем очередную точку }
	for c:=1 to N do
           begin { провер€ем все вершины }
	      if(map[s,c]<> 0)and(NOT incl[c])
              { точка соединена с текущей и не включена в маршрут}
                  then begin
			 road[p]:=c;{ добавим вершину в путь }
			 incl[c]:=TRUE;{ пометим вершину как включенную }
			 step(c,f,p+1);
			 incl[c]:=FALSE;
                         road[p]:=0;
                  end;
           end;
   end;
end;{ конец процедуры step }

begin
   Label1.caption:='';
   { инициализаци€ массивов }
   for i:=1 to N do road[i]:=0;
   for i:=1 to N do incl[i]:=FALSE;

   { ввод описани€ карты из SrtingGrid.Cells}
   for i:=1 to N do
       for j:=1 to N do
          if StringGrid1.Cells[i,j] <> ''
              then map[i,j]:=StrToInt(StringGrid1.Cells[i,j])
              else map[i,j]:=0;

   start:=StrToInt(Edit1.text);
   finish:=StrToInt(Edit2.text);

   road[1]:=start;{ внесем точку в маршрут }
   incl[start]:=TRUE;{ пометим ее как включенную }

   step(start,finish,2);{ищем вторую точку маршрута }

   // проверим, найден ли хот€ бы один путь
   if not found
       then Label1.caption:='”казанные точки не соединены!';

end;
end.
