unit my_unit;

interface // ���������� �������� � �������,
          // ������� �������� ����������,
          // ������������ ���� ������

  // ������� IsInt ���������, �������� �� ������
  // ���������� �� ����� ����� ������ �����
  function IsInt(ch : char) : Boolean;

  // ���������, �������� �� ������ ����������
  // �� ����� ����� �������� �����
  function IsFloat(ch : char; st: string) : Boolean;


implementation // ���������� ������

   // ���������, �������� �� ������ ����������
   // �� ����� ����� ������ �����
   function IsInt(ch : char) : Boolean;
   begin
       if      (ch >= '0') and (ch <= '9') // �����
            or (ch = #13)                  // ������� <Enter>
            or (ch = #8)                   // ������� <Backspace>
         then IsInt := True    // ������ ��������
         else IsInt := False;  // ������������ ������
   end;

   // ���������, �������� �� ������ ����������
   // �� ����� ����� �������� �����
   function IsFloat(ch : char; st: string) : Boolean;
   begin
      if      (ch >= '0') and (ch <= '9') // �����
           or (ch = #13)                  // ������� <Enter>
           or (ch = #8)                   // ������� <Backspace>
      then
           begin
              IsFloat := True;  // ������ ������
              Exit;             // ����� �� �������
           end;

      case ch of
         '-': if Length(st) = 0 then IsFloat := True;
         ',': if    ( Pos(',',st) = 0)
                 and (st[Length(st)] >= '0')
                 and (st[Length(st)] <= '9')
              then // ����������� ����� ������ ������ ����� �����
                   // � ���� �� ��� �� ������
                      IsFloat := True;
         else // ��������� ������� ���������
              IsFloat := False;
      end;
   end;

end.
