program ushh;

uses
  Forms,
  ushh_ in 'ushh_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Использование ActiveX';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
