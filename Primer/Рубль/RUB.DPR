program rub;

uses
  Forms,
  rub_1 in 'rub_1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
