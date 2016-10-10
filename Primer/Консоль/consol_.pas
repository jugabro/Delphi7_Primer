unit consol_;

interface

implementation

{ ��� ��� ����� ��������� ���������� � Windows,
  � �������� ��������� � Dos, �� ��������� ��������
  ��� ������ ������� ����, ������ ������� �� ������
  ���������� ����-�������. ��� ����������� ���, ���
  ������� ����� � Windows � � DOS ���������� ������� �������.
  ������� � ���������, ���������� � DOS, ����� �������� ���������
  ������� ����.

  � Windows ������� ����� ���������� ������� �� 192 �� 255,
  � DOS - �� 128 �� 175 (�..��..�) � �� 224 239 (�..�).
}

// ������� Rus ����������� Windows ������ � DOS ������}
function Rus(mes: string):string;
var
   i: integer;
begin
   for i:=1 to length(mes) do
        case mes[i] of
           '�'..'�' : mes[i] := Chr(Ord(mes[i]) - 64);
           '�'..'�' : mes[i] := Chr(Ord(mes[i]) - 16);
        end;
   rus := mes;
end;

// �������� ����������������� ������� Rus
begin
     writeln( Rus('� ��������� ��� �������') );
     writeln( Rus('������ ���� �� ���� ���.') );
     writeln;
     writeln( Rus('��� ���������� ������� <Enter>'));
     readln;
end.
