unit uTwoFer;

interface

  function twoFer(name:String = ''): String;

implementation

  function twoFer(name:String = ''): String;
  begin
    if name = '' then
    begin
      Result := 'One for you, one for me.';
    end
    else
      Result := 'One for ' + name + ', one for me.';
  end;

end.

