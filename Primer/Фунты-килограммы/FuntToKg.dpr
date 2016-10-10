program FuntToKg;

uses
  Forms,
  FuntToKg_1 in 'FuntToKg_1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Фунты-килограммы';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
