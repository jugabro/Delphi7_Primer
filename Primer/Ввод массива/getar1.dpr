program getar1;

uses
  Forms,
  getar_1 in 'getar_1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
