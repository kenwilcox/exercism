unit uTwoFer;

interface

  function twoFer(name:String = 'you'): String;

implementation

  function twoFer(name:String = 'you'): String;
  begin
      Result := 'One for ' + name + ', one for me.';
  end;

end.

