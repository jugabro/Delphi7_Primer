program mcircle;

uses
  Forms,
  mcircle_ in 'mcircle_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
