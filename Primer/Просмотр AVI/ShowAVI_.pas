unit ShowAVI_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Animate1: TAnimate;  // компонент Animate
    Button1: TButton;    // кнопка ѕуск-—топ
    Button2: TButton;    // следующий кадр
    Button3: TButton;    // предыдущий кадр
    RadioButton1: TRadioButton; //  просмотр всей анимации
    RadioButton2: TRadioButton; //  по кадровый просмотр

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
  Form1: TForm1;   // форма
  CFrame: integer; // номер отображаемого кадра
                   // в режиме покадрового просмотра
implementation

{$R *.DFM}

// к следующему кадру
procedure TForm1.Button2Click(Sender: TObject);
begin
     if CFrame = 1 then Button2.Enabled := True;
     if CFrame < Animate1.FrameCount then
     begin
        CFrame := CFrame + 1;
        // вывести кадр
        Animate1.StartFrame := CFrame;
        Animate1.StopFrame := CFrame;
        Animate1.Active := True;

        if CFrame = Animate1.FrameCount // текущий кадр - последний
               then Button2.Enabled:=False;
     end;
end;

// к предыдущему кадру
procedure TForm1.Button3Click(Sender: TObject);
begin
     if CFrame = Animate1.FrameCount
         then Button2.Enabled := True;
     if CFrame > 1 then
     begin
        CFrame := CFrame - 1;
        // вывести кадр
        Animate1.StartFrame := CFrame;
        Animate1.StopFrame := CFrame;
        Animate1.Active := True;

        if CFrame = 1 // текущий кадр - первый
            then Form1.Button3.Enabled := False;
     end;
end;

// активизаци€ режима просмотра всей анимации
procedure TForm1.RadioButton1Click(Sender: TObject);
begin
     Button1.Enabled:=True; // доступна кнопка ѕуск
     // сделать недоступными кнопки покадрового просмотра
     Form1.Button3.Enabled:=False;
     Form1.Button2.Enabled:=False;
end;

// активизаци€ режима покадрового просмотра
procedure TForm1.RadioButton2Click(Sender: TObject);
begin
     Button2.Enabled:=True;  // кнопка —ледующий кадр доступна
     Button3.Enabled:=False; // кнопка ѕредыдущий кадр недоступна

     // сделать недоступной кнопку ѕуск - вывод всей анимации
     Button1.Enabled:=False;
end;

// пуск и остановка просмотра анимации
procedure TForm1.Button1Click(Sender: TObject);
begin
     if Animate1.Active = False // в данный момент анимаци€ не выводитьс€
        then begin
          Animate1.StartFrame:=1; // вывод с первого
          Animate1.StopFrame:=Animate1.FrameCount; // по последний кадр
          Animate1.Active:=True;
          Button1.caption:='—топ';
          RadioButton2.Enabled:=False;
        end
      else  // анимаци€ отображаетс€
        begin
          Animate1.Active:=False; // остановить отображение
          Button1.caption:='ѕуск';
          RadioButton2.Enabled:=True;
        end;
end;

end.
