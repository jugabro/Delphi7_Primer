program dinlist2;

uses
  Forms,
  dlist2_ in 'dlist2_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Динамический список 2';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
