program b_found;

uses
  Forms,
  b_found_ in 'b_found_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
