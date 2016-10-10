unit school2_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, ExtCtrls, DBCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Table1: TTable;              // таблица (вся база данных)
    Query1: TQuery;           // запрос (записи БД, удовлетворяющие критерию выбора)
    DataSource1: TDataSource;    // источник данных - таблица или запрос
    DBGrid1: TDBGrid;         // таблица для отображения БД или результата выполнения запроса
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    Button1: TButton;         // кнопка запрос
    Button2: TButton;         // кнопка Все записи
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

 // щелчок на кнопке Запрос
procedure TForm1.Button1Click(Sender: TObject);
var
    fam: string[30];
begin
    fam:=InputBox('Выборка информации из БД',
                  'Укажите фамилию и щелкните на OK.', '');
    if fam <> '' // пользователь ввел фамилию
    then
       begin
         with form1.Query1 do begin
           Close;       // закрыть файл-результат выполнения предыдущего запроса
           SQL.Clear;   // удалить текст предыдущего запроса
           // записываем новый запрос в свойство SQL
           SQL.Add('SELECT Fam, Name, Class');
           SQL.Add('FROM ":Школа:school.db"');
           SQL.Add('WHERE');
           SQL.Add('(Fam = "'+ fam + '")');
           SQL.Add('ORDER BY Name, Fam');
           Open;         // активизируем выполнение запроса
         end;

         { *** другой вариант изменения критерия запроса
         begin
           Query1.Close;
           Query1.SQL[3]:='(Fam="'+ fam + '")';
           Query1.Open;
           DataSource1.DataSet:=Query1;
         end;
         }


         if Query1.RecordCount <> 0 then
              DataSource1.DataSet:=Query1 // отобразить рез-т выполнения запроса
            else begin
              ShowMessage('В БД нет записей, удовлетворяющих критерию запроса.');
              DataSource1.DataSet:=Table1;
            end;
       end;
end;

// щелчок на кнопке Все записи
procedure TForm1.Button2Click(Sender: TObject);
begin
     DataSource1.DataSet:=Table1; // источник данных - таблица
end;

// активизация формы
procedure TForm1.FormActivate(Sender: TObject);
begin
     DataSource1.DataSet := Table1;
     Table1.Active := True;
end;

end.
