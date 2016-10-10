program shpic;

uses
  Forms,
  shpic_ in 'shpic_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Слайд-проектор';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
