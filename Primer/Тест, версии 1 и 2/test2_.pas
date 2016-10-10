unit test2_;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label5: TLabel;   // ���� ������ �������
    Image1: TImage;   // ������� ������ �����������
    Panel1: TPanel;
    Button1: TButton; // ������ "Ok", "������", "���������"

    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SelectorClick(Sender: TObject);  // ���������� ��������� �������
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1; // �����

implementation

const
  N_ANSWERS=4; // ������ �������� ������� 
  N_LEVEL=4;   // ������ ������ ������ 

var
  // ����������� ����������� ����������
  answer: array[1..N_ANSWERS] of TLabel; // �������������� ������
  selector: array[1..N_ANSWERS+1] of TRadioButton; // ������ ������ ������

  f:TextFile;
  fn:string; // ��� ����� ��������

  level:array[1..N_LEVEL] of integer; // �����, ��������������� ������ 
  mes:array[1..N_LEVEL] of string;// ���������, ��������������� ������
  score:array[1..N_ANSWERS] of integer; // ���� �� ����� ������ 
  summa:integer;  // ������� �����
  vopros:integer; // ����� �������� ������� 
  n_otv:integer;  // ����� ��������� ������ 
  otv:integer;    // ����� ���������� ������ 

// ��������� ����� � �������� ��������� 
Procedure ResetForm(frm:TForm1);
 var
  i:integer;
 begin
     for i:=1 to N_ANSWERS do
     begin
       answer[i].width:=frm.ClientWidth-answer[i].left-5;
       answer[i].Visible:=FALSE;
       Selector[i].Visible:=FALSE;
     end;
     frm.Label5.width:=frm.ClientWidth-frm.Label5.left-5;
     frm.Image1.Visible:=False;
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
   while (summa < level[i]) and (i<N_LEVEL) do
         i:=i+1;
   buf:=buf+chr(13)+mes[i]+#13+#13+#13+#13+'��� ����� �� ���������-��������'+#13'����������� �������� �.�.';
   frm.Label5.caption:=buf;
  end;

procedure TForm1.FormCreate(Sender: TObject);
var
   i: integer;
begin
   // �������� ���� ����� ��� ������ ������� � �������������� �������
   for i:=1 to N_ANSWERS do
   begin
       answer[i]:=TLabel.Create(self);
       answer[i].Parent:=Form1;
       answer[i].Left:=36;
       answer[i].WordWrap:=True;
   end;

   // �������� ����������� ��� ������ ������
   for i:=1 to N_ANSWERS+1 do
   begin
       selector[i]:=TRadioButton.Create(self);
       selector[i].Parent:=self;
       selector[i].Caption:='';
       selector[i].Width:=17;
       selector[i].Left:=16;
       selector[i].Visible:=False;
       selector[i].Enabled:=True;
       selector[i].OnClick:=SelectorClick;
   end;
   ResetForm(Form1);
end;

// ����� ��������� ���������� � ����� 
procedure info(var f:TextFile;l:TLabel);
var
   s,buf:string;
begin
   buf:='';
   repeat
         readln(f,s);
         if s[1] <> '.'
            then buf:=buf+s+' ';
   until s[1] ='.';
   Form1.Label5.caption:=buf;
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
Procedure ScalePicture;
var
  w,h:integer; // ����������� ���������� ������� ��������
  scaleX:real; // ����. ��������������� �� X
  scaleY:real; // ����. ��������������� �� Y
  scale:real;  // ����� ����. ���������������
  i:integer;
begin
  // ��������� ����������� ���������� ������� ��������
  w:=Form1.ClientWidth-Form1.Label5.Left;
  h:=Form1.ClientHeight
               - Form1.Panel1.Height -5
               - Form1.Label5.Top
               - Form1.Label5.Height - 5;
  for i:=1 to N_ANSWERS do
     if answer[i].Caption <> ''
        then h:=h-answer[i].Height-5;

  // ����� ���������� ����������� ���������� �������� �����������
       // ���������� �������
     if w>Form1.Image1.Picture.Width
        then scaleX:=1
        else scaleX:=w/Form1.Image1.Picture.Width;
     if h>Form1.Image1.Picture.Height
        then scaleY:=1
        else scaleY:=h/Form1.Image1.Picture.Height;
     if ScaleY<ScaleX
        then scale:=scaleY
        else scale:=scaleX;
     // ����� ������� ���������
     Form1.Image1.Top:=Form1.Label5.Top+Form1.Label5.Height+5;
     Form1.Image1.Left:=Form1.Label5.Left;
     Form1.Image1.Width:=Round(Form1.Image1.Picture.Width*scale);
     Form1.Image1.Height:=Round(Form1.Image1.Picture.Height*scale);
     Form1.Label5.Visible:=TRUE;
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

     if s[1] = '\'
       then // � ������� ���� �����������
        begin
          frm.Image1.Tag:=1;
          ifn:=copy(s,2,length(s));
          try
            frm.Image1.Picture.LoadFromFile(ifn);
            except
              on E:EFOpenError do
                 frm.tag:=0;
          end // try 
        end
        else frm.Image1.Tag:=0;

     // ������ �������� �������
     for i:=1 to N_ANSWERS do
     begin
       answer[i].caption:='';
       answer[i].Width:=frm.ClientWidth-Form1.Label5.Left-5;
     end;
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
           answer[i].caption:=buf;
           i:=i+1;
     until s[1]='.';
     // ����� ��������� ����������� � �������������� ������

     if Form1.Image1.Tag =1  // ���� ����������� � ������� ?
        then begin
          ScalePicture;
          Form1.Image1.Visible:=TRUE;
         end;

     // ����� �������������� �������
     i:=1;
     while (answer[i].caption <> '') and (i <= N_ANSWERS) do
     begin
        if i = 1
        then
           if frm.Image1.Tag =1
                then answer[1].top:=frm.Image1.Top+frm.Image1.Height+5
                else answer[i].top:=frm.Label5.Top+frm.Label5.Height+5
        else
           answer[i].top:=answer[i-1].top+ answer[i-1].height+5;
        selector[i].top:=answer[i].top;
        selector[i].visible:=TRUE;
        answer[i].visible:=TRUE;
        i:=i+1;
     end;
  end;

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
  begin
     ResetForm(Form1);
     if ParamCount = 0
        then
          begin
             Label5.font.color:=clRed;
             Label5.caption:='�� ����� ���� �������� �����.';
             Button1.caption:='Ok';
             Button1.tag:=2;
             Button1.Enabled:=TRUE
          end
     else begin
          fn:=ParamStr(1);
          assignfile(f,fn);
          {$I-}
          reset(f);
          {I+}
          if IOResult=0 then
             begin
                  Info(f,Label5);
                  GetLevel(f);
             end;
          summa:=0;
     end;
end;

procedure TForm1.Button1Click(Sender: TObject);
  begin
     case Button1.tag of
       0: begin
               Button1.caption:='������';
               Button1.tag:=1;
               Selector[N_ANSWERS+1].Checked:=TRUE;
               // ����� ������� ������� 
               Button1.Enabled:=False;
               ResetForm(Form1);
               VoprosToScr(f,Form1,vopros)
          end;
       1: begin // ����� ��������� �������� 
               summa:=summa+score[otv];
               Selector[N_ANSWERS+1].Checked:=TRUE;
               Button1.Enabled:=False;
               ResetForm(Form1);
               if not eof(f)
                  then VoprosToScr(f,Form1,vopros)
                  else
                     begin
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

procedure TForm1.SelectorClick(Sender: TObject);
 var
   i:integer;
 begin
  i:=1;
  while selector[i].Checked = FALSE do
    i:=i+1;
  otv:=i;
  Button1.enabled:=TRUE;
 end;
end.
