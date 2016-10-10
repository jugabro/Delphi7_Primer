program Test1;

uses
  Forms,
  test1_ in 'test1_.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
