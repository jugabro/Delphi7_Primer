unit ShowAVI_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Animate1: TAnimate;  // ��������� Animate
    Button1: TButton;    // ������ ����-����
    Button2: TButton;    // ��������� ����
    Button3: TButton;    // ���������� ����
    RadioButton1: TRadioButton; //  �������� ���� ��������
    RadioButton2: TRadioButton; //  �� �������� ��������

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;   // �����
  CFrame: integer; // ����� ������������� �����
                   // � ������ ����������� ���������
implementation

{$R *.DFM}

// � ���������� �����
procedure TForm1.Button2Click(Sender: TObject);
begin
     if CFrame = 1 then Button2.Enabled := True;
     if CFrame < Animate1.FrameCount then
     begin
        CFrame := CFrame + 1;
        // ������� ����
        Animate1.StartFrame := CFrame;
        Animate1.StopFrame := CFrame;
        Animate1.Active := True;

        if CFrame = Animate1.FrameCount // ������� ���� - ���������
               then Button2.Enabled:=False;
     end;
end;

// � ����������� �����
procedure TForm1.Button3Click(Sender: TObject);
begin
     if CFrame = Animate1.FrameCount
         then Button2.Enabled := True;
     if CFrame > 1 then
     begin
        CFrame := CFrame - 1;
        // ������� ����
        Animate1.StartFrame := CFrame;
        Animate1.StopFrame := CFrame;
        Animate1.Active := True;

        if CFrame = 1 // ������� ���� - ������
            then Form1.Button3.Enabled := False;
     end;
end;

// ����������� ������ ��������� ���� ��������
procedure TForm1.RadioButton1Click(Sender: TObject);
begin
     Button1.Enabled:=True; // �������� ������ ����
     // ������� ������������ ������ ����������� ���������
     Form1.Button3.Enabled:=False;
     Form1.Button2.Enabled:=False;
end;

// ����������� ������ ����������� ���������
procedure TForm1.RadioButton2Click(Sender: TObject);
begin
     Button2.Enabled:=True;  // ������ ��������� ���� ��������
     Button3.Enabled:=False; // ������ ���������� ���� ����������

     // ������� ����������� ������ ���� - ����� ���� ��������
     Button1.Enabled:=False;
end;

// ���� � ��������� ��������� ��������
procedure TForm1.Button1Click(Sender: TObject);
begin
     if Animate1.Active = False // � ������ ������ �������� �� ����������
        then begin
          Animate1.StartFrame:=1; // ����� � �������
          Animate1.StopFrame:=Animate1.FrameCount; // �� ��������� ����
          Animate1.Active:=True;
          Button1.caption:='����';
          RadioButton2.Enabled:=False;
        end
      else  // �������� ������������
        begin
          Animate1.Active:=False; // ���������� �����������
          Button1.caption:='����';
          RadioButton2.Enabled:=True;
        end;
end;

end.
