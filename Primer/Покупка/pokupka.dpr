program pokupka;

uses
  Forms,
  pokupka_1 in 'pokupka_1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
