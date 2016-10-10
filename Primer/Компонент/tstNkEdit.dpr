program tstNkEdit;

uses
  Forms,
  tstNkEdit_ in 'tstNkEdit_.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
