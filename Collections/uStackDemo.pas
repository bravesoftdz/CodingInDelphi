unit uStackDemo;

interface

function IsPalindrome(const aString: string): Boolean;

implementation

uses
        Generics.Collections
      , System.SysUtils
      , Character
      ;

type
  TCharStack = TStack<Char>;

function IsPalindrome(const aString: string): Boolean;
var
  Stack: TCharStack;
  C: Char;
  TempStr: string;
  i: integer;
begin
  Stack := TCharStack.Create;
  try
    for C in aString do
    begin
      if TCharacter.IsLetter(C) then
        Stack.Push(TCharacter.ToLower(C));
    end;

    TempStr := '';
    for i := 0 to Stack.Count - 1 do
    begin
      TempStr := TempStr + Stack.Pop;
    end;

    Result := TempStr = aString;
  finally
    Stack.Free;
  end;
end;

end.
