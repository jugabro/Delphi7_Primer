program dinlist3;

uses
  Forms,
  dlist3_ in 'dlist3_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '������������� ������������ ������';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
