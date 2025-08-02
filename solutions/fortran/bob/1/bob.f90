module bob
  implicit none
contains

  function hey(statement)
    character(100) :: hey
    character(len=*), intent(in) :: statement
    logical :: is_empty, is_question, has_lowercase, has_uppercase, is_yelling
    integer :: i
    character :: c

    is_empty = len(trim(statement)) .eq. 0
    i = index(statement, '?')
    is_question = i .ne. 0 .and. i .eq. len(trim(statement))

    has_lowercase = .false.
    has_uppercase = .false.

    do i=1,len(statement)
      c = statement(i:i)
      has_lowercase = has_lowercase .or. ('a' .le. c .and. c .le. 'z')
      has_uppercase = has_uppercase .or. ('A' .le. c .and. c .le. 'Z')
    end do

    is_yelling = has_uppercase .and. .not. has_lowercase
    if (is_empty) then
       hey = "Fine. Be that way!"
    else if (is_question .and. is_yelling) then
      hey = "Calm down, I know what I'm doing!"
    else if (is_question) then
      hey = 'Sure.'
    else if (is_yelling) then
      hey = 'Whoa, chill out!'
    else
      hey = 'Whatever.'
    end if
  end function hey

end module bob
