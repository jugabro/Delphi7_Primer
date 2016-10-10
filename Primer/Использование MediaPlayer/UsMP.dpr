program UsMP;

uses
  Forms,
  UsMP_ in 'UsMP_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
