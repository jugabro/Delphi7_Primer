program RewAp;

uses
  Forms,
  RewAp_ in 'RewAp_.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
