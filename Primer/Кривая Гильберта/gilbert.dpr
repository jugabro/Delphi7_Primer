program gilbert;

uses
  Forms,
  gilbert_ in 'gilbert_.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
