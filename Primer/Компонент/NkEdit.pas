// ��������� ������������
unit NkEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TNkEdit = class(TEdit)
  private
    FNumb: single; // �����, ����������� � ���� ��������������
    // ��� �������� ������� �������
    // � ��������� ��������� ���� FNumb
    function GetNumb: single;
    procedure SetNumb(value:single);
  protected

    procedure KeyPress(var Key: Char); override;

   public

  published
    constructor Create(AOwner:TComponent); override;
    property Numb : single // �������� ����������
             read GetNumb
             write SetNumb;
  end;

procedure Register;

implementation

// ��������� ����������� ����������
procedure Register;
begin
     RegisterComponents('Samples',[TNkEdit]);
end;

// ����������� ����������
constructor TNkEdit.Create(AOwner:TComponent);
begin
     // don't forget to call the ancestors' constructor
     inherited Create(AOwner);
end;

// ������� ������� � ���� FNumb
function TNkEdit.GetNumb:single;
begin
     try  // ���� Text ����� ���� ������
        Result:=StrToFloat(text);
        except
           on EConvertError do
           begin
                Result:=0;
                text:='';
           end;
     end;
end;

// ��������� ������ � ���� FNumb
procedure TNkEdit.SetNumb(Value:single);
begin
     FNumb:=Value;
     Text:=FloatToStr(value);
end;

// ��������� ��������� ������� KeyPress
procedure TNkEdit.KeyPress(var key:char) ;
begin
    case key of
          '0'.. '9', #8, #13: ;
          '-': if Length(text)<>0 then key:=#0;
          else
               if not ((key = DecimalSeparator) and
                       (Pos(DecimalSeparator,text)=0))
                 then key:= #0;
    end;

    inherited KeyPress(key); // ����� ��������� ��������� �������
                             // OnKeyPress ������������� ������

end;

end.

