program apprec;

uses
  Forms,
  apprec_ in 'apprec_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
