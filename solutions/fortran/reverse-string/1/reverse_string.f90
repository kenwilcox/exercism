module reverse_string
  implicit none
contains

  function reverse(input) result(reversed)
    character(*), intent(in) :: input
    character(len=len(input)) :: reversed
    integer :: i, j, k
    k = len(input)
    do i = 1,k
      j = k - i + 1
      reversed(i:i) = input(j:j)
    end do
  end function

end module
