program aplanes;

uses
  Forms,
  aplanes_ in 'aplanes_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
