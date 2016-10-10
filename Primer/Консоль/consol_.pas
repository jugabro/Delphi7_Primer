unit consol_;

interface

implementation

{ Так как текст программы набирается в Windows,
  а работает программа в Dos, то возникают проблемы
  при выводе русских букв, вместо которых на экране
  появляется абра-кадабра. Это объясняется тем, что
  русские буквы в Windows и в DOS кодируются разными числами.
  Поэтому в программе, работающей в DOS, нужно изменить кодировку
  русских букв.

  В Windows русские буквы кодируются числами от 192 до 255,
  в DOS - от 128 до 175 (А..Яа..п) и от 224 239 (р..я).
}

// Функция Rus преобразует Windows строку в DOS строку}
function Rus(mes: string):string;
var
   i: integer;
begin
   for i:=1 to length(mes) do
        case mes[i] of
           'А'..'п' : mes[i] := Chr(Ord(mes[i]) - 64);
           'р'..'я' : mes[i] := Chr(Ord(mes[i]) - 16);
        end;
   rus := mes;
end;

// проверка работоспособности функции Rus
begin
     writeln( Rus('У лукоморья дуб зеленый') );
     writeln( Rus('Златая цепь на дубе том.') );
     writeln;
     writeln( Rus('Для завершения нажмите <Enter>'));
     readln;
end.
