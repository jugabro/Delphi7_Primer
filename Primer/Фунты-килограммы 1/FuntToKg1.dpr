program FuntToKg1;

uses
  Forms,
  FuntToKg1_ in 'FuntToKg1_.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '�����-����������';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
