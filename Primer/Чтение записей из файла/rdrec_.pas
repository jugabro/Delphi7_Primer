unit rdrec_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    RadioButton1: TRadioButton; // ������������� ���
    RadioButton2: TRadioButton; // ������������� �������
    ComboBox1: TComboBox;       // ��������������� ������
                                // ��� ����� �������� ������
    Memo1: TMemo;               // ���� ������ �������, ���������������
                                // ������� �������
    Button1: TButton;           // ������ OK
    GroupBox1: TGroupBox;
    Label1: TLabel;             // ����� ������
    procedure Button1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
type
    // ��� ������
    TKind = (GOLD,SILVER,BRONZE);

    // ������ �����
    TMedal = record
       country:string[20];
       sport:string[20];
       person:string[40];
       kind:TKind;
    end;

var
   f: file of TMedal;  // ���� �������
   rec: TMedal;        // ������, ����������� �� �����
   n: integer;         // ���-�� ������� ��������������� �������
   st: string[80];

begin
  AssignFile(f,'a:\medals.db');
  {$I-}
  Reset(f);  // ������� ���� ��� ������
  {$I-}
  if IOResult <> 0 then
    begin
      ShowMessage('������ �������� ����� ��.');
      Exit;
    end;

  // ��������� ��
  if RadioButton2.Checked then
        Memo1.Lines.Add('*** ' + ComboBox1.Text + ' ***');

  n := 0;
  Memo1.Clear; // �������� ������ ���� Memo
  while not EOF(f) do
      begin
          read(f, rec); // ��������� ������
          if  RadioButton1.Checked or
              (rec.country = ComboBox1.Text) then
          begin
              n := n + 1;
              st := rec.person+ ', ' + rec.sport;
              if RadioButton1.Checked then
                 st := st + ', '+ rec.country;
              case rec.kind of
                 GOLD:  st := st+ ', ������';
                 SILVER:st := st+ ', �������';
                 BRONZE:st := st+ ', ������';
             end;
             Memo1.Lines.Add(st);
          end;
      end;
      CloseFile(f);
      if n = 0 then
         ShowMessage('� �� ��� ������������� ����������.');
end;

// ������������� �������
procedure TForm1.RadioButton2Click(Sender: TObject);
begin
        Label1.Enabled := True;
        ComboBox1.Enabled := True;   // ������ ���� ������ ��������
        ComboBox1.SetFocus;          // ������ � ���� ������
end;

// ������������� ���
procedure TForm1.RadioButton1Click(Sender: TObject);
begin
        Label1.Enabled := False;
        ComboBox1.Enabled := False;   // ������ ���� ������ �� ��������
end;

end.
