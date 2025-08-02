
module armstrong_numbers
  implicit none
contains

  logical function isArmstrongNumber(i)
    integer, intent(in) :: i
    integer :: temp, total, digits

    isArmstrongNumber = i >= 0
    if (.not. isArmstrongNumber) return

    isArmstrongNumber = i < 10
    if (isArmstrongNumber) return

    total = 0
    digits = int(log10(real(i))) + 1
    temp = i

    do while (temp > 0)
      total = total + mod(temp, 10) ** digits
      temp = temp / 10
    end do
    isArmstrongNumber = i == total
  end function

end module
