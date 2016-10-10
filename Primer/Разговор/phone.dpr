program phone;

uses
  Forms,
  Phone_u in 'Phone_u.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
