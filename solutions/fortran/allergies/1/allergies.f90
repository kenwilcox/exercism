
module allergies
  implicit none
  character(len=12) :: allergens(8) = (/'eggs        ', &
  'peanuts     ','shellfish   ','strawberries', &
  'tomatoes    ','chocolate   ','pollen      ','cats        '/)

contains

  logical function allergicTo(allergy_str, allergy_key)
    character(len=*), intent(in) :: allergy_str
    integer, intent(in) :: allergy_key
    character(len=64) :: binary
    integer :: i
    write(binary,'(b0)') allergy_key
    i =  len_trim(binary) + 1
    i = i - findloc(allergens, allergy_str, dim=1)
    allergicTo = binary(i:i) .eq. '1'
  end function


  function allergicList(allergy_key)
    integer, intent(in) :: allergy_key
    character(len=100) :: allergicList
    integer :: i
    allergicList = ' '
    do i = 1, 8
      if (allergicTo(allergens(i), allergy_key)) then
        allergicList = trim(allergicList) // ' ' // allergens(i)
      end if
    end do
    allergicList = adjustl(allergicList)
  end function



end module
