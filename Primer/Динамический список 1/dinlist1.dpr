program dinlist1;

uses
  Forms,
  dlist1_ in 'dlist1_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '������������ ������';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
