unit ushh_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtrls, HHOPENLib_TLB, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;     // ���� �������
    Edit2: TEdit;     // ������ ������� (��� html �����)
    Button1: TButton;  // ActiveX ��������� Hhopen
    Label2: TLabel;
    Label3: TLabel;

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

// ������ �� ������ �������
procedure TForm1.Button1Click(Sender: TObject);
var
  HelpFile : string;       // ���� �������
  HelpTopic : string;      // ������ �������
  pwHelpFile : PWideChar;  // ��� ����� ������� ��� ��������� �� ������ WideChar
  pwHelpTopic : PWideChar; // ������ �������, ��� ��������� �� WideChar ������
begin
  HelpFile := Edit1.Text;
  HelpTopic := Edit2.Text;

  // �������� ������ ��� WideChar �����
  GetMem(pwHelpFile, Length(HelpFile) * 2);
  GetMem(pwHelpTopic, Length(HelpTopic)*2);

  // ������������� Ansi ������ � WideString ������
  pwHelpFile := StringToWideChar(HelpFile,pwHelpFile,MAX_PATH*2);
  pwHelpTopic := StringToWideChar(HelpTopic,pwHelpTopic,32);

  // ������� ���������� ����������
  Form1.Hhopen1.OpenHelp(pwHelpFile,pwHelpTopic);

end;

end.
