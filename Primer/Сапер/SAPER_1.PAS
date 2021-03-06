unit saper_1;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, OleCtrls, HHOPENLib_TLB;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Hhopen1: THhopen;

    procedure Form1Create(Sender: TObject);
    procedure Form1Paint(Sender: TObject);
    procedure Form1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);

    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

uses saper_2;

{$R *.DFM}

const
   MR = 10; // ���-�� ������ �� ���������
   MC = 10; // ���-�� ������ �� �����������
   NM = 10; // ���-�� ���

   W    = 40;  // ������ ������ ����
   H    = 40;  // ������ ������ ����

var
   Pole: array[0..MR+1, 0.. MC+1] of integer; // ������ ����
   // �������� �������� �������:
   // 0..8 - ���������� ��� � �������� �������
   // 9 - � ������ ����
   // 100..109 - ������ �������
   // 200..209 - � ������ ��������� ���� 

   nMin  : integer;  // ���-�� ��������� ���
   nFlag : integer;  // ���-�� ������������ ������

   status : integer; // 0 - ������ ����; 1- ����; 2 -���������


Procedure NewGame(); forward; // ���������� ����� ����
Procedure ShowPole(Canvas : TCanvas; status : integer); forward;// ���������� ����
Procedure Kletka(Canvas : TCanvas; row, col, status : integer); forward; // ������� ���������� ������
Procedure Open( row, col : integer); forward;// ��������� ������� � ��� �������� ������, � ������� ��� ���
Procedure Mina(Canvas : TCanvas; x, y : integer); forward; // ������ ����
Procedure Flag( Canvas : TCanvas; x, y : integer); forward;// ������ ����

// ������� �� ����� ���������� ������
Procedure Kletka(Canvas : TCanvas; row, col, status : integer);
    var
         x,y : integer; // ���������� ������� ������
    begin
         x := (col-1)* W + 1;
         y := (row-1)* H + 1;

         if status = 0  then
             begin
               Canvas.Brush.Color := clLtGray;
               Canvas.Rectangle(x-1,y-1,x+W,y+H);
               exit;
             end;

         if Pole[row,col] < 100  then
           begin
             Canvas.Brush.Color := clLtGray;  // �� �������� - �����
             Canvas.Rectangle(x-1,y-1,x+W,y+H);
             // ���� ���� ��������� (status = 2), �� �������� ����
             if (status = 2) and (Pole[row,col] = 9)
                 then Mina(Canvas, x, y);
             exit;
           end;

    // ��������� ������
    Canvas.Brush.Color := clWhite;      // �������� �����
    Canvas.Rectangle(x-1,y-1,x+W,y+H);
    if  ( Pole[row,col] = 100 )
         then exit; // ������ �������, �� ��� ������

    if ( Pole[row,col] >= 101) and (Pole[row,col] <= 108 ) then
        begin
             Canvas.Font.Size := 14;
             Canvas.Font.Color := clBlue;
             Canvas.TextOut(x+3,y+2,IntToStr(Pole[row,col] -100 ));
             exit;
        end;

    if ( Pole[row,col] >= 200 ) then
            Flag(Canvas, x, y);

    if (Pole[row,col] = 109 ) then // �� ���� ���� �����������!
       begin
         Canvas.Brush.Color := clRed;
         Canvas.Rectangle(x-1,y-1,x+W,y+H);
       end;

    if ( (Pole[row,col] mod 10) = 9)  and  (status = 2) then
               Mina(Canvas, x, y);
end;

// ���������� ����
Procedure ShowPole(Canvas : TCanvas; status : integer);
    var
      row,col : integer;
    begin
       for row := 1 to MR do
         for col := 1 to MC do
              Kletka(Canvas, row, col, status);
    end;

// ����������� ������� ��������� ������� � ��� ��������
// ������, � ������� ��� ���
Procedure Open( row, col : integer);
    begin
	if Pole[row,col] = 0 then
            begin
               Pole[row,col] := 100;
               Kletka(Form1.Canvas, row,col, 1);
	       Open(row,col-1);
	       Open(row-1,col);
	       Open(row,col+1);
	       Open(row+1,col);
               //����������� �����������
               Open(row-1,col-1);
               Open(row-1,col+1);
               Open(row+1,col-1);
               Open(row+1,col+1);
	     end
	else
             if (Pole[row,col] < 100) and ( Pole[row,col] <> -3 ) then
                   begin
                      Pole[row,col] := Pole[row,col] + 100;
                      Kletka(Form1.Canvas, row, col, 1);
                   end;
    end;

// ����� ���� - ���������� ����� ����
procedure NewGame();

   var
     row,col : integer; // ���������� ������
     n : integer;       // ���������� ������������ ���
     k : integer;       // ���-�� ��� � �������� �������
   begin
     // ������� ��-�� �������, ��������������� �������
     // �������� ����.
     for row :=1 to MR do
        for col :=1 to MC do
	   Pole[row,col] := 0;

     // ��������� ����
     Randomize();  // ������������� ���
     n := 0; // ���-�� ���
     repeat
       row := Random(MR) + 1;
       col := Random(MC) + 1;
       if ( Pole[row,col] <> 9) then
         begin
            Pole[row,col] := 9;
            n := n+1;
         end;
   until ( n = NM );

   // ��� ������ ������ ��������
   // ���-�� ��� � �������� �������
   for row := 1 to MR do
   	for col := 1 to MC do
	   if ( Pole[row,col] <> 9 ) then
             begin
	   	k :=0 ;
		if Pole[row-1,col-1] = 9 then k := k + 1;
		if Pole[row-1,col]   = 9 then k := k + 1;
		if Pole[row-1,col+1] = 9 then k := k + 1;
		if Pole[row,col-1]   = 9 then k := k + 1;
		if Pole[row,col+1]   = 9 then k := k + 1;
		if Pole[row+1,col-1] = 9 then k := k + 1;
		if Pole[row+1,col]   = 9 then k := k + 1;
		if Pole[row+1,col+1] = 9 then k := k + 1;
		Pole[row,col] := k;
	     end;
   status := 0;  // ������ ����
   nMin   := 0;  // ��� ������������ ���
   nFlag  := 0;  // ��� ������

end;

// ������ ����
Procedure Mina(Canvas : TCanvas; x, y : integer);
begin
    with Canvas do
        begin
           Brush.Color := clGreen;
           Pen.Color := clBlack;
	   Rectangle(x+16,y+26,x+24,y+30);
	   Rectangle(x+8,y+30,x+16,y+34);
	   Rectangle(x+24,y+30,x+32,y+34);
	   Pie(x+6,y+28,x+34,y+44,x+34,y+36,x+6,y+36);

	   MoveTo(x+12,y+32); LineTo(x+26,y+32);
	   MoveTo(x+8,y+36);  LineTo(x+32,y+36);
	   MoveTo(x+20,y+22); LineTo(x+20,y+26);
	   MoveTo(x+8, y+30); LineTo(x+6,y+28);
           MoveTo(x+32,y+30); LineTo(x+34,y+28);
         end;
end;

// ������ ����
Procedure Flag( Canvas : TCanvas; x, y : integer);
    var
       p : array [0..3] of TPoint;  // ���������� ������ � ������ ����� ������
       m : array [0..4] of TPoint;  // ����� �
    begin
        // ������� ���������� ����� ������
	p[0].x:=x+4;   p[0].y:=y+4;
	p[1].x:=x+30;  p[1].y:=y+12;
	p[2].x:=x+4;   p[2].y:=y+20;
	p[3].x:=x+4;     p[3].y:=y+36;  // ������ ����� ������

        m[0].x:=x+8; m[0].y:=y+14;
	m[1].x:=x+8; m[1].y:=y+8;
	m[2].x:=x+10; m[2].y:=y+10;
	m[3].x:=x+12; m[3].y:=y+8;
	m[4].x:=x+12; m[4].y:=y+14;

        with Canvas do
          begin
            // ��������� ���� ����� � ���������
            Brush.Color := clRed;
            Pen.Color := clRed;

	    Polygon(p);  // ������

            // ������
	    Pen.Color := clBlack;
            MoveTo(p[0].x, p[0].y);
	    LineTo(p[3].x, p[3].y);

            // ����� �
            Pen.Color := clWhite;
	    Polyline(m);

            Pen.Color := clBlack;
          end;
end;

// ����� �� ���� ? ������� � ���������
procedure TForm1.N4Click(Sender: TObject);
    begin
        AboutForm.Top := Trunc(Form1.Top + Form1.Height/2 - AboutForm.Height/2);
        AboutForm.Left := Trunc(Form1.Left +Form1.Width/2 - AboutForm.Width/2);
        AboutForm.ShowModal;
    end;

procedure TForm1.Form1Create(Sender: TObject);
var
  row,col : integer;
begin
   // � �������������� ��-�� �������, ������� �������������
   // ������� �� ������� �������� ���� ������� ����� -3.
   // ��� �������� ������������ �������� Open ��� ����������
   // ������������ �������� �������� �������� ������ ������.
   for row :=0 to MR+1 do
        for col :=0 to MC+1 do
	   Pole[row,col] := -3;

   NewGame();  // "����������" ����
   Form1.ClientHeight := H*MR + 1;
   Form1.ClientWidth := W*MC + 1;
end;


// ������� ������ ���� �� ������� ����
procedure TForm1.Form1MouseDown(Sender: TObject; Button: TMouseButton;
                                Shift: TShiftState; X, Y: Integer);
  var
      row, col : integer;
  begin
     if status = 2 // ���� ���������
         then exit;

     if status = 0 then // ������ ������
           status := 1;

     // ����������� ���������� ���� � �������
     // ������ ����
     row := Trunc(y/H) + 1;
     col := Trunc(x/W) + 1;

     if Button = mbLeft then
        begin
            if Pole[row,col] = 9 then
               begin // ������� ������, � ������� ���� ����
                    Pole[row,col] := Pole[row,col] + 100;
                    status := 2;  // ���� ���������
                    ShowPole(Form1.Canvas, status);
               end
            else if  Pole[row,col] < 9 then
                       Open(row,col);
          end
          else
             if Button = mbRight then
                 if Pole[row,col] > 200 then
                     begin
                       // ������ ���� � ������� ������
                       nFlag := nFlag - 1;
                       Pole[row,col] := Pole[row,col] - 200;  // ������ ����
                       x := (col-1)* W + 1;
                       y := (row-1)* H + 1;
                       Canvas.Brush.Color := clLtGray;
                       Canvas.Rectangle(x-1,y-1,x+W,y+H);
                     end
                 else
                     begin // ��������� � ������ ����
                       nFlag := nFlag + 1;
                       if  Pole[row,col] = 9
                           then nMin := nMin + 1;
                       Pole[row,col] := Pole[row,col]+ 200;  // ��������� ����
                       if (nMin = NM) and (nFlag = NM) then
                           begin
                              status := 2;  // ���� ���������
                              ShowPole(Form1.Canvas, status);
                           end
                        else Kletka(Form1.Canvas, row, col, status);
                     end;
  end;

// ����� ���� ����� ����
procedure TForm1.N1Click(Sender: TObject);
begin
  NewGame();
  ShowPole(Form1.Canvas,status);
end;

// ����� �� ���� ? ������� �������
procedure TForm1.N3Click(Sender: TObject);

var
  HelpFile : string;       // ���� �������
  HelpTopic : string;      // ������ �������
  pwHelpFile : PWideChar;  // ���� ������� (��������� �� WideChar ������)
  pwHelpTopic : PWideChar; // ������ (��������� �� WideChar ������)
begin
  HelpFile := 'saper.chm';
  HelpTopic := 'saper_02.htm';

  // �������� ������ ��� WideChar �����
  GetMem(pwHelpFile, Length(HelpFile) * 2);
  GetMem(pwHelpTopic, Length(HelpTopic)*2);

  // ������������� Ansi ������ � WideString ������
  pwHelpFile := StringToWideChar(HelpFile,pwHelpFile,MAX_PATH*2);
  pwHelpTopic := StringToWideChar(HelpTopic,pwHelpTopic,32);

  // ������� ���������� ����������
  Form1.Hhopen1.OpenHelp(pwHelpFile,pwHelpTopic);

end;

procedure TForm1.Form1Paint(Sender: TObject);
begin
        ShowPole(Form1.Canvas, status);
end;


end.
