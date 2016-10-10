program pogoda;

uses
  Forms,
  pogoda_ in 'pogoda_.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
