// ����� ����� � ��������� �������� � ��� ������������
// ������������ ����������� ��������� Find
unit FindFile_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  FileCtrl;

type
  TForm1 = class(TForm)
    Edit1: TEdit;       // ��� ������
    Edit2: TEdit;       // ��� ������
    Memo1: TMemo;       // ��������� ������
    Button1: TButton;   // ������ �����
    Button2: TButton;   // ������ �����
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
   FileName: string;  // ��� ��� ����� �������� �����
   cDir: string;
   n: integer;       // ���-�� ������, ��������������� �������

// ����� ����� � ������� ��������
procedure Find;
var
   SearchRec: TSearchRec; // ���������� � ����� ��� ��������
begin
   GetDir(0,cDir); // �������� ��� �������� ��������
   if cDir[length(cDir)] <> '\' then cDir := cDir+'\';

   if FindFirst(FileName, faArchive,SearchRec) = 0 then
       repeat
          if (SearchRec.Attr and faAnyFile) = SearchRec.Attr then
             begin
               Form1.Memo1.Lines.Add(cDir +  SearchRec.Name);
               n := n + 1;
             end;
        until FindNext(SearchRec) <> 0;

       // ��������� ������������ �������� ��������
       if FindFirst('*', faDirectory, SearchRec) = 0 then
          repeat
              if (SearchRec.Attr and faDirectory) = SearchRec.Attr then
                  begin
                    // �������� .. � . ���� ��������,
                    // �� � ��� ������� �� ���� !!!
                    if SearchRec.Name[1] <> '.' then
                       begin
                         ChDir(SearchRec.Name);// ����� � �������
                         Find; // ��������� ����� � �����������
                         ChDir('..');// ����� �� ��������
                       end;
                  end;
          until FindNext(SearchRec) <> 0;
end;

// ���������� �������, ��������� �������������
function GetPath(mes: string):string;
var
  Root: string;      // �������� �������
  pwRoot : PWideChar;
  Dir: string;
begin
  Root := ''; // �������� ������� - ����� ������� ����
  GetMem(pwRoot, (Length(Root)+1) * 2);
  pwRoot := StringToWideChar(Root,pwRoot,MAX_PATH*2);
  if SelectDirectory(mes, pwRoot, Dir)
     then
          if length(Dir) = 2  // ������������ ������ �������� �������
              then GetPath := Dir+'\'
              else GetPath := Dir
     else
          GetPath := '';
end;

// ������ �� ������ �����
procedure TForm1.Button1Click(Sender: TObject);
begin
        Memo1.Clear;             // �������� ���� Memo1
        Label4.Caption := '';
        FileName := Edit1.Text;  // ��� ������
        cDir := Edit2.Text;      // ��� ������
        n:=0;                    // ���-�� ��������� ������
        ChDir(cDir);             // ����� � ������� ������ ������
        Find;                    // ������ �����
        if n = 0 then
           ShowMessage('������, ��������������� �������� ������ ���.')
        else Label4.Caption := '������� ������:' + IntToStr(n);
end;

// ������ �� ������ �����
procedure TForm1.Button2Click(Sender: TObject);
var
  Path: string;
begin
  Path := GetPath('�������� �����');
  if Path <> ''
     then Edit2.Text := Path;
end;

end.
