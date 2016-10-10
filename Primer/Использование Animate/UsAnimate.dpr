program UsAnimate;

uses
  Forms,
  UsAnimate_ in 'UsAnimate_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
