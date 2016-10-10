program funt2kg;

{$APPTYPE CONSOLE}

// ������� Rus ����������� ANSI-������ � ASCII-������
function Rus(mes: string):string;
    //  � ANSI ������� ����� ���������� ������� �� 192 �� 255,
    //  � ASCII - �� 128 �� 175 (�..��..�) � �� 224 239 (�..�).
    var
        i: integer; // ����� ��������������� �������
    begin
        for i:=1 to length(mes) do
           case mes[i] of
              '�'..'�' : mes[i] := Chr(Ord(mes[i]) - 64);
              '�'..'�' : mes[i] := Chr(Ord(mes[i]) - 16);
           end;
        rus := mes;
    end;

// �������� ���������
var
       f:real;     // ��� � ������ }
       w:real;     // ��� � ������� }
       k:integer;  // ���-�� ��������� }
       g:integer;  // ���-�� ����� }

       // w = f*0,4095 = k*1000 + g

begin
    writeln( Rus('�����-����������') );
    writeln( Rus('������� ��� � ������ � ������� <Enter>') );
    write('-> ');
    readln(f);

    w := f * 409.5; // ���� ���� - ��� 409,5 ��.
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

    write(f:4:2, Rus(' �. - ��� ') );
    if k >= 1 then write(k, Rus(' ��. ') );
    writeln(g, Rus(' ��.') );
    write( Rus('��� ���������� ������� <Enter>') );
    readln;
end.

