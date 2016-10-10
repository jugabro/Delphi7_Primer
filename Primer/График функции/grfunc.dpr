program grfunc;

uses
  Forms,
  grfunc_ in 'grfunc_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
