program TestOfKomp;

uses
  Forms,
  TestOfKomp_ in 'TestOfKomp_.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
