program SqRoot;

uses
  Forms,
  SqRoot_ in 'SqRoot_.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Квадратное уравнение';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
