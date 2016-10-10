program fr_memo;

uses
  Forms,
  fr_memo_ in 'fr_memo_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
