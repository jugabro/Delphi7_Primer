program vrun;

uses
  Forms,
  vrun1 in 'vrun1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
