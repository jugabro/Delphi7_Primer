unit peter_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Mask, Db, DBTables,
  jpeg; // чтобы можно было выводить jpg иллюстрации

type
  TForm1 = class(TForm)
    Table1: TTable;            // база данных - таблица
    DataSource1: TDataSource;  // источник данных для полей
                               // редактирования-просмотра
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    Image1: TImage;
    DBEdit3: TDBEdit;
    DBNavigator1: TDBNavigator;
    Label4: TLabel;
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure Table1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  BmpPath: string;  // Путь к файлам иллюстраций. Иллюстрации
                    // находятся в подкаталоге Data каталога программы.

implementation
{$R *.DFM}

// выводит фотографию в поле Image1
procedure ShowFoto(foto: string);
  begin
    try
       Form1.Image1.Picture.LoadFromFile(BmpPath+foto);
       Form1.Image1.Visible:=True;
     except
       on EFOpenError do
       begin
         MessageDlg('Файл иллюстрации '+foto+' не найден.',
                     mtInformation, [mbOk], 0);
       end;
    end;
end;

// переход к другой записи (следующей, предыдущей,
// первой или последней)
procedure TForm1.Table1AfterScroll(DataSet: TDataSet);
begin
     if form1.DBEdit3.Visible
        then
          begin
             form1.DBEdit3.Visible := False;
             form1.Label4.Visible:=False;
          end;
     if Form1.DBEdit3.Text <> ''
        then ShowFoto(Form1.DBEdit3.Text)
        else form1.Image1.Visible:=False;
end;


// нажатие клавиши в поле Фото
procedure TForm1.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
         if Form1.DBEdit3.Text <> ''
             then ShowFoto(Form1.DBEdit3.Text) // показать иллюстрацию
             else form1.Image1.Visible:=False;
end;

// щелчок на компоненте Навигатор
procedure TForm1.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
     case Button of
     nbInsert: begin
                Image1.Visible:=False;  // скрыть область вывода иллюстрации
                DBEdit3.Visible:=True;  // показать поле Фото
                Label4.Visible:=True;   // показать метку Фото
               end;
     nbEdit:   begin  // редактирование записи
                 DBEdit3.Visible:=True;  // показать поле Фото
                 Label4.Visible:=True;   // показать метку Фото
               end;
     end;
end;


procedure TForm1.Table1BeforeOpen(DataSet: TDataSet);
begin
   BmpPath:=ExtractFilePath(ParamStr(0))+'data\';
end;

end.

