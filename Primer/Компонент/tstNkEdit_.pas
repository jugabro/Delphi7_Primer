unit tstNkEdit_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  NkEdit; // ссылка на модуль компонента

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  myEdit: TnkEdit; // компонент NkEdit
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
    // создадим компонент и поместим его на форму
    myEdit := TNkEdit.Create(self);
    myEdit.Parent := self;
    myEdit.Left := 8;
    myEdit.Top := 64;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
        label2.Caption := FloatToStr(myEdit.Numb);
end;

end.
