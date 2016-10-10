program brustyle;

uses
  Forms,
  brustyle_ in 'brustyle_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
