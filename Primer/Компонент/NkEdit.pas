// компонент программиста
unit NkEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TNkEdit = class(TEdit)
  private
    FNumb: single; // число, находящееся в поле редактирования
    // Это описание функции доступа
    // и процедуры установки поля FNumb
    function GetNumb: single;
    procedure SetNumb(value:single);
  protected

    procedure KeyPress(var Key: Char); override;

   public

  published
    constructor Create(AOwner:TComponent); override;
    property Numb : single // свойство компонента
             read GetNumb
             write SetNumb;
  end;

procedure Register;

implementation

// процедура регистрации компонента
procedure Register;
begin
     RegisterComponents('Samples',[TNkEdit]);
end;

// конструктор компонента
constructor TNkEdit.Create(AOwner:TComponent);
begin
     // don't forget to call the ancestors' constructor
     inherited Create(AOwner);
end;

// функция доступа к полю FNumb
function TNkEdit.GetNumb:single;
begin
     try  // поле Text может быть пустым
        Result:=StrToFloat(text);
        except
           on EConvertError do
           begin
                Result:=0;
                text:='';
           end;
     end;
end;

// процедура записи в поле FNumb
procedure TNkEdit.SetNumb(Value:single);
begin
     FNumb:=Value;
     Text:=FloatToStr(value);
end;

// процедура обработки события KeyPress
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

    inherited KeyPress(key); // вызов процедуры обработки события
                             // OnKeyPress родительского класса

end;

end.

