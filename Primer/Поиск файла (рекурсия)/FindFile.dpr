program FindFile;

uses
  Forms,
  FindFile_ in 'FindFile_.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
