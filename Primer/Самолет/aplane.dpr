program aplane;

uses
  Forms,
  aplane_ in 'aplane_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Самолет';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
