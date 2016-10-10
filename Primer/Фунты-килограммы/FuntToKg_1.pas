unit FuntToKg_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
   r: integer;
   FName: string;

begin
   FName:='c:\tem\test.txt';
   r:=MessageDlg('Файл '+ FName + ' будет удален.',mtWarning,[mbOk,mbCancel],0);
end;

end.
