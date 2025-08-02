module sieve
  implicit none

contains

  function primes(limit) result(array)
    integer, intent(in) :: limit
    integer, allocatable :: array(:)
    logical :: is_prime(limit)
    integer :: i, j
    is_prime = .true.

    do i = 2, int(sqrt(real(limit)))
      if (is_prime(i)) then
        is_prime([(j, j = i**2, limit, i)]) = .false.
      end if
    end do

    array = pack([(i,i=2, limit)], is_prime(2:))
  end function primes

end module sieve
