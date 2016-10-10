program sort2;

uses
  Forms,
  sort2_ in 'SORT2_.PAS' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
