program aplane1;

uses
  Forms,
  aplane1_ in 'aplane1_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'На ковре вертолете ...';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
