unit test1_;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls
  ,jpeg;


type
  TForm1 = class(TForm)
    // ������
    Label5: TLabel;
    // �������������� ������
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    // ����������� ������ ������
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;

    Image1: TImage;   // ������� ������ �����������
    Button1: TButton; // ������ OK, ������

    RadioButton5: TRadioButton; // "���������" ������

    Panel1: TPanel;

    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;     // �����

implementation

const
   N_LEV=4; // ������ ������ ������ 
   N_ANS=4; // ������ �������� ������� 

var
  f:TextFile;
  fn:string; // ��� ����� �������� 

  level:array[1..N_LEV] of integer; // �����, ��������������� ������ 
  mes:array[1..N_LEV] of string;    // ���������, ��������������� ������

  score:array[1..N_ANS] of integer; // ���� �� ����� ������
  summa:integer;  // ������� �����
  vopros:integer; // ����� �������� �������
  n_otv:integer;  // ����� ��������� ������
  otv:integer;    // ����� ���������� ������

// ����� ��������� ���������� � �����
procedure info(var f:TextFile;l:TLabel);
var
   s,buf:string;
begin
   buf:='';
   repeat
         readln(f,s);
         if s[1] <> '.'
            then buf := buf + s+ ' ';
   until s[1] ='.';
   l.caption:=buf;
end;

// ��������� ���������� �� ������� �� ����
Procedure GetLevel(var f:TextFile);
var
   i:integer;
   buf:string;
begin  // ��������� �������� ���������� ��������
     i:=1;
     repeat
         readln(f,buf);
         if buf[1] <> '.' then begin
            mes[i]:=buf;
            readln(f,level[i]);
            i:=i+1;
         end;
     until buf[1]='.';
end;

// ��������������� �����������
Procedure ScaleImage(Image1:TImage);
var
  w,h:integer; // ����������� ���������� ������� ��������
  scaleX:real; // ����. ��������������� �� X
  scaleY:real; // ����. ��������������� �� Y
  scale:real;  // ����� ����. ���������������

begin
  // ��������� ����������� ���������� ������� ��������
     w:=Form1.ClientWidth-10;
     h:=Form1.ClientHeight
               - Form1.Panel1.Height -5
               - Form1.Label5.Top
               - Form1.Label5.Height - 5;
  if Form1.Label1.Caption <> ''
     then h:=h-Form1.Label1.Height-5;
  if Form1.Label2.Caption <> ''
     then h:=h-Form1.Label2.Height-5;
  if Form1.Label3.Caption <> ''
     then h:=h-Form1.Label3.Height-5;
  if Form1.Label4.Caption <> ''
     then h:=h-Form1.Label4.Height-5;
     // ���������� �������
     if w>Image1.Picture.Bitmap.Width
        then scaleX:=1
        else scaleX:=w/Image1.Picture.Bitmap.Width;
     if h>Image1.Picture.Bitmap.Height
        then scaleY:=1
        else scaleY:=h/Image1.Picture.Bitmap.Height;
     if ScaleY<ScaleX
        then scale:=scaleY
        else scale:=scaleX;
     // ����� ������� ���������
     Image1.Top:=Form1.Label5.Top+Form1.Label5.Height+5;
     Image1.Width:=Round(Image1.Picture.Bitmap.Width*scale);
     Image1.Height:=Round(Image1.Picture.Bitmap.Height*scale);
end;

// ����� ������� �� �����
Procedure VoprosToScr(var f:TextFile;frm:TForm1;var vopros:integer);
  var
   i:integer;
   code:integer;
   s,buf:string;
   ifn:string; // ���� �����������
  begin
     vopros:=vopros+1;
     str(vopros:3,s);
     frm.caption:='������' + s;
     //������� ����� �������
     buf:='';
     repeat
           readln(f,s);
           if (s[1] <> '.') and (s[1] <> '\')
              then buf:=buf+s+' ';
     until (s[1] ='.') or (s[1] ='\');
     frm.Label5.caption:=buf;

     if s[1] <> '\'
       then Form1.Image1.Tag:=0
       else // � ������� ���� �����������
        begin
          Form1.Image1.Tag:=1;
          ifn:=copy(s,2,length(s));
          try
            Form1.Image1.Picture.LoadFromFile(ifn);
            except
              on E:EFOpenError do
                 frm.tag:=0;
          end; // try
        end;

     // ������ �������� �������
     i:=1;
     repeat
        buf:='';
        repeat // ������ ����� �������� ������
          readln(f,s);
          if (s[1]<>'.') and (s[1] <> ',')
                then buf:=buf+s+' ';
        until (s[1]=',')or(s[1]='.');
        // �������� �������������� �����
        val(s[2],score[i],code);
        case i of
            1: frm.Label1.caption:=buf;
            2: frm.Label2.caption:=buf;
            3: frm.Label3.caption:=buf;
            4: frm.Label4.caption:=buf;
        end;
        i:=i+1;
     until s[1]='.';
     // ����� ��������� ����������� � �������������� ������
     // ����� ������� ��� �������
     if Form1.Image1.Tag =1  // ���� ����������� � �������
        then begin
          ScaleImage(Form1.Image1);
          Form1.Image1.Visible:=TRUE;
         end;
     // ����� �������������� �������
     if Form1.Label1.Caption <> ''
     then begin
        if Form1.Image1.Tag =1
            then frm.Label1.top:=frm.Image1.Top+frm.Image1.Height+5
            else frm.Label1.top:=frm.Label5.Top+frm.Label5.Height+5;
        frm.RadioButton1.top:=frm.Label1.top;
        frm.Label1.visible:=TRUE;
        frm.RadioButton1.visible:=TRUE;
     end;

     if Form1.Label2.Caption <> ''
     then begin
        frm.Label2.top:=frm.Label1.top+ frm.Label1.height+5;
        frm.RadioButton2.top:=frm.Label2.top;
        frm.Label2.visible:=TRUE;
        frm.RadioButton2.visible:=TRUE;
     end;

     if Form1.Label3.Caption <> ''
     then begin
        frm.Label3.top:=frm.Label2.top+ frm.Label2.height+5;
        frm.RadioButton3.top:=frm.Label3.top;
        frm.Label3.visible:=TRUE;
        frm.RadioButton3.visible:=TRUE;
     end;

     if Form1.Label4.Caption <> ''
     then begin
        frm.Label4.top:=frm.Label3.top+ frm.Label3.height+5;
        frm.RadioButton4.top:=frm.Label4.top;
        frm.Label4.visible:=TRUE;
        frm.RadioButton4.visible:=TRUE;
     end;
  end;

Procedure ResetForm(frm:TForm1);
begin // ������� ���������� ��� ����� � �����������

     frm.Label1.Visible:=FALSE;
     frm.Label1.caption:='';
     frm.Label1.width:=frm.ClientWidth-frm.Label1.left-5;
     frm.RadioButton1.Visible:=FALSE;

     frm.Label2.Visible:=FALSE;
     frm.Label2.caption:='';
     frm.Label2.width:=frm.ClientWidth-frm.Label2.left-5;
     frm.RadioButton2.Visible:=FALSE;

     frm.Label3.Visible:=FALSE;
     frm.Label3.caption:='';
     frm.Label3.width:=frm.ClientWidth-frm.Label3.left-5;
     frm.RadioButton3.Visible:=FALSE;

     frm.Label4.Visible:=FALSE;
     frm.Label4.caption:='';
     frm.Label4.width:=frm.ClientWidth-frm.Label4.left-5;
     frm.RadioButton4.Visible:=FALSE;

     frm.Label5.width:=frm.ClientWidth-frm.Label5.left-5;

     frm.Image1.Visible:=FALSE;
end;

// ����������� ������������ ������
procedure Itog(summa:integer;frm:TForm1);
  var
   i:integer;
   buf:string;
  begin
   buf:='';
   str(summa:5,buf);
   buf:='���������� ������������'+chr(13)
		+'����� ������: '+buf;
   i:=1;
   while (summa < level[i]) and (i<N_LEV) do
         i:=i+1;
   buf:=buf+chr(13)+mes[i];
   frm.Label5.caption:=buf;
  end;

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
  begin
     ResetForm(Form1);
     if ParamCount = 0
     then begin
             Label5.caption:= '�� ����� ���� �������� �����.';
             Button1.caption:='Ok';
             Button1.tag:=2;
             Button1.Enabled:=TRUE
          end
     else begin
          fn := ParamStr(1);
          assignfile(f,fn);
          //$I-
          reset(f);
          //I+
          if IOResult=0 then
             begin
                Info(f,Label5); // ��������� � ������� ���������� � �����
                GetLevel(f);    // ��������� ���������� �� ������� ������
             end;
     end;
end;

procedure TForm1.Button1Click(Sender: TObject);
  begin
     case Button1.tag of
       0: begin
               Button1.caption:='������';
               Button1.tag:=1;
               RadioButton5.Checked:=TRUE;
               // ����� ������� �������
               Button1.Enabled:=False;
               ResetForm(Form1);
               VoprosToScr(f,Form1,vopros)
          end;
       1: begin // ����� ��������� ��������
               summa:=summa+score[otv];
               RadioButton5.Checked:=TRUE;
               Button1.Enabled:=False;
               ResetForm(Form1);
               if not eof(f)
                  then VoprosToScr(f,Form1,vopros)
                  else
                     begin
                        summa:=summa+score[otv];
                        closefile(f);
                        Button1.caption:='Ok';
                        Form1.caption:='���������';
                        Button1.tag:=2;
                        Button1.Enabled:=TRUE;
                        Itog(summa,Form1);
                     end;
          end;
       2: begin // ���������� ������
            Form1.Close;
          end;
     end;
end;

procedure TForm1.RadioButtonClick(Sender: TObject);
 begin
  if sender = RadioButton1
  then otv:=1
  else if sender = RadioButton1
          then otv:=2
          else if sender = RadioButton3
                  then otv:=3
                  else otv:=4;
  Button1.enabled:=TRUE;
end;

end.
