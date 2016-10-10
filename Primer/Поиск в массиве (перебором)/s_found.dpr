program s_found;

uses
  Forms,
  s_found_ in 's_found_.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
