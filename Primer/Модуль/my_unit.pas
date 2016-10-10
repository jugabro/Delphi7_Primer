unit my_unit;

interface // объявления процедур и функций,
          // которые доступны программам,
          // использующим этот модуль

  // функция IsInt проверяет, является ли символ
  // допустимым во время ввода целого числа
  function IsInt(ch : char) : Boolean;

  // проверяет, является ли символ допустимым
  // во время ввода дробного числа
  function IsFloat(ch : char; st: string) : Boolean;


implementation // реализация модуля

   // проверяет, является ли символ допустимым
   // во время ввода целого числа
   function IsInt(ch : char) : Boolean;
   begin
       if      (ch >= '0') and (ch <= '9') // цифры
            or (ch = #13)                  // клавиша <Enter>
            or (ch = #8)                   // клавиша <Backspace>
         then IsInt := True    // символ допустим
         else IsInt := False;  // недопустимый символ
   end;

   // проверяет, является ли символ допустимым
   // во время ввода дробного числа
   function IsFloat(ch : char; st: string) : Boolean;
   begin
      if      (ch >= '0') and (ch <= '9') // цифры
           or (ch = #13)                  // клавиша <Enter>
           or (ch = #8)                   // клавиша <Backspace>
      then
           begin
              IsFloat := True;  // символ верный
              Exit;             // выход из функции
           end;

      case ch of
         '-': if Length(st) = 0 then IsFloat := True;
         ',': if    ( Pos(',',st) = 0)
                 and (st[Length(st)] >= '0')
                 and (st[Length(st)] <= '9')
              then // разделитель можно ввести только после цифры
                   // и если он еще не введен
                      IsFloat := True;
         else // остальные символы запрещены
              IsFloat := False;
      end;
   end;

end.
