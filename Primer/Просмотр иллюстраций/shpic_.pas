
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

  aPath : String; // �������, � ������� ��������� �����������
  aFile : String; // ���� �����������
  n: integer = 0;

  iw,ih: integer; // �������������� ������ ���������� Image

implementation

{$R *.DFM}

// ��������� ������� ������� ������ ����������� ���������������
// ������� �����������
Procedure ScaleImage;
var
    pw, ph : integer;      // ������ �����������
    scaleX, scaleY : real; // ������� �� X � Y
    scale : real;          // �������
begin
      // ����������� ��� ���������
      // ������� �� �������
      pw := Form1.Image1.Picture.Width;
      ph := Form1.Image1.Picture.Height;
      if pw > iw // ������ ����������� ������ ������ ���������� Image
          then scaleX := iw/pw  // ����� ��������������
          else scaleX := 1;
      if ph > ih // ������ �������. ������ ������ ����������
          then scaleY := ih/ph  // ����� ��������������
          else scaleY := 1;

      // ������� ���������� �����������
      if  scaleX < scaleY
          then scale := scaleX
          else scale := scaleY;

      // ������� ������ ������� ������ �����������
      Form1.Image1.Height := Round(Form1.Image1.Picture.Height*scale);
      Form1.Image1.Width := Round(Form1.Image1.Picture.Width*scale);
      // ��� ��� Strech = True � ������ ������� ��������������
      // ������� ��������, �� �������� �������������� ��� ���������
end;

// ������� ������ �����������
procedure FirstPicture;
var
   r : integer; // ��������� ������ �����
begin
   aPath := Form1.Edit1.Text;
   r := FindFirst(aPath+'*.bmp',faAnyFile,aSearchRec);
   if r = 0 then
      begin
          aFile := aPath + aSearchRec.Name;
          Form1.Image1.Picture.LoadFromFile(aFile); // ��������� �����������
          ScaleImage;
          r := FindNext(aSearchRec); // ����� ��������� ����
          if r = 0 then  // ��� ���� ����� �����������
             Form1.Button1.Enabled := True;
      end;
end;

// ������� ��������� �����������
Procedure NextPicture();
var
   r : integer;
begin
   aFile := aPath + aSearchRec.Name;
   Form1.Image1.Picture.LoadFromFile(aFile);
   ScaleImage;

   // ���������� ����� ���� �����������
   r := FindNext(aSearchRec); // ����� ��������� ����
   if r <> 0
      then // ������ ��� �����������
         Form1.Button1.Enabled := False;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
   Image1.AutoSize := False;
   Image1.Stretch := True;     // �������� ���������������

   // �������� �������������� ������ ������� ������ �����������
   iw := Image1.Width;
   ih := image1.Height;

   Button1.Enabled := False; // ������� ����������� ������ ������
   FirstPicture; // ������� ������ �����������
end;

// ������ �� ������ ������
procedure TForm1.Button1Click(Sender: TObject);
begin
    NextPicture;
end;

end.
