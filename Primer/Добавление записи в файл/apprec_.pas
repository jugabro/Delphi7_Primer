unit apprec_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;             // ���������
    ComboBox1: TComboBox;     // ������
    ComboBox2: TComboBox;     // ��� ������
    RadioGroup1: TRadioGroup; // ������
    Button1: TButton;         // ������ ��������
    Label5: TLabel;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  // ��� ������
  TKind = (GOLD, SILVER, BRONZE);

  // ������ �����
  TMedal=record
     country: string[20];  //  ������
     sport:   string[20];  //  ��� ������
     person:  string[40];  //  ���������
     kind:    TKind;       //  ������
   end;

var
  Form1: TForm1;
  f: file of TMedal; // ���� ������� - ���� ������

implementation

{$R *.DFM}

// ����������� �����
procedure TForm1.FormActivate(Sender: TObject);
var
  resp : word; // ����� ������������
begin
  AssignFile(f, 'a:\medals.db');
  {$I-}
  Reset(f);  // ������� ����
  Seek( f, FileSize(f)); // ��������� ������ � ����� �����
  {$I+}
  if IOResult = 0
     then button1.enabled:=TRUE // ������ ������ �������� ��������
     else
       begin
         resp:=MessageDlg('���� ���� ������ �� ������.'+
                           '������� ����� ��?',mtInformation,[mbYes,mbNo],0);
         if resp = mrYes then
              begin
                {$I-}
                rewrite(f);
                {$I+}
                if IOResult = 0
                   then button1.enabled:=TRUE
                   else ShowMessage('������ �������� ����� ��.');
              end;
       end;
end;

// ������ �� ������ ��������
procedure TForm1.Button1Click(Sender: TObject);
var
  medal: TMedal;
begin
  with medal do
  begin
     country := ComboBox1.Text;
     sport   := ComboBox2.Text;
     person  := Edit1.Text;
     case  RadioGroup1.ItemIndex of
       0: kind := GOLD;
       1: kind := SILVER;
       2: kind := BRONZE;
     end;
  end;
  write(f, medal); // �������� ���������� ����� ������ � ����
end;

// ���������� ������ ���������
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     CloseFile( f );  // ������� ����
end;

end.
