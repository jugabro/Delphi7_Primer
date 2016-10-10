
unit shpic_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, {jpeg,} StdCtrls, Menus;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  aSearchRec : TSearchRec;

  aPath : String; // каталог, в котором находятся иллюстрации
  aFile : String; // файл иллюстрации
  n: integer = 0;

  iw,ih: integer; // первоначальный размер компонента Image

implementation

{$R *.DFM}

// изменение размера области вывода иллюстрации пропорционально
// размеру иллюстрации
Procedure ScaleImage;
var
    pw, ph : integer;      // размер иллюстрации
    scaleX, scaleY : real; // масштаб по X и Y
    scale : real;          // масштаб
begin
      // иллюстрация уже загружена
      // получим ее размеры
      pw := Form1.Image1.Picture.Width;
      ph := Form1.Image1.Picture.Height;
      if pw > iw // ширина иллюстрации больше ширины компонента Image
          then scaleX := iw/pw  // нужно масштабировать
          else scaleX := 1;
      if ph > ih // высота иллюстр. больше высоты компонента
          then scaleY := ih/ph  // нужно масштабировать
          else scaleY := 1;

      // выберем наименьший коэффициент
      if  scaleX < scaleY
          then scale := scaleX
          else scale := scaleY;

      // изменим размер области вывода иллюстрации
      Form1.Image1.Height := Round(Form1.Image1.Picture.Height*scale);
      Form1.Image1.Width := Round(Form1.Image1.Picture.Width*scale);
      // так как Strech = True и размер области пропорционален
      // размеру картинки, то картинка масштабируется без искажений
end;

// вывести первую иллюстрацию
procedure FirstPicture;
var
   r : integer; // результат поиска файла
begin
   aPath := Form1.Edit1.Text;
   r := FindFirst(aPath+'*.bmp',faAnyFile,aSearchRec);
   if r = 0 then
      begin
          aFile := aPath + aSearchRec.Name;
          Form1.Image1.Picture.LoadFromFile(aFile); // загрузить иллюстрацию
          ScaleImage;
          r := FindNext(aSearchRec); // найти следующий файл
          if r = 0 then  // еще есть файлы иллюстраций
             Form1.Button1.Enabled := True;
      end;
end;

// вывести следующую иллюстрацию
Procedure NextPicture();
var
   r : integer;
begin
   aFile := aPath + aSearchRec.Name;
   Form1.Image1.Picture.LoadFromFile(aFile);
   ScaleImage;

   // подготовим вывод след иллюстрации
   r := FindNext(aSearchRec); // найти следующий файл
   if r <> 0
      then // больше нет иллюстраций
         Form1.Button1.Enabled := False;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
   Image1.AutoSize := False;
   Image1.Stretch := True;     // разрешим масштабирование

   // запомним первоначальный размер области вывода иллюстрации
   iw := Image1.Width;
   ih := image1.Height;

   Button1.Enabled := False; // сделаем недоступной кнопку Дальше
   FirstPicture; // вывести первую иллюстрацию
end;

// щелчок на кнопке Дальше
procedure TForm1.Button1Click(Sender: TObject);
begin
    NextPicture;
end;

end.
