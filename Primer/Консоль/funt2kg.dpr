program funt2kg;

{$APPTYPE CONSOLE}

// Функция Rus преобразует ANSI-строку в ASCII-строку
function Rus(mes: string):string;
    //  В ANSI русские буквы кодируются числами от 192 до 255,
    //  в ASCII - от 128 до 175 (А..Яа..п) и от 224 239 (р..я).
    var
        i: integer; // номер обрабатываемого символа
    begin
        for i:=1 to length(mes) do
           case mes[i] of
              'А'..'п' : mes[i] := Chr(Ord(mes[i]) - 64);
              'р'..'я' : mes[i] := Chr(Ord(mes[i]) - 16);
           end;
        rus := mes;
    end;

// основная программа
var
       f:real;     // вес в фунтах }
       w:real;     // вес в граммах }
       k:integer;  // кол-во килограмм }
       g:integer;  // кол-во грамм }

       // w = f*0,4095 = k*1000 + g

begin
    writeln( Rus('Фунты-килограммы') );
    writeln( Rus('Введите вес в фунтах и нажмите <Enter>') );
    write('-> ');
    readln(f);

    w := f * 409.5; // один фунт - это 409,5 гр.
    if w > 1000 then
         begin
           k:=Trunc(w/1000);
           g:=Round(w - k*1000);
         end
    else
         begin
           k:=0;
           g:=Round(w);
         end;

    write(f:4:2, Rus(' ф. - это ') );
    if k >= 1 then write(k, Rus(' кг. ') );
    writeln(g, Rus(' гр.') );
    write( Rus('Для завершения нажмите <Enter>') );
    readln;
end.

