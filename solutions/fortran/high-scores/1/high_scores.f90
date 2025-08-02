
module high_scores
  implicit none
contains

function scores(score_list) result(sc)
  integer, dimension(:) :: score_list
  integer :: sc(size(score_list))
  sc = score_list
end function scores

integer function latest(score_list)
  integer, dimension(:) :: score_list
  latest = score_list(size(score_list))
end function latest

integer function personalBest(score_list)
  integer, dimension(:) :: score_list
  personalBest = maxval(score_list)
end function personalBest

function personalTopThree(score_list)
  integer, dimension(:) :: score_list
  integer, dimension(3) :: personalTopThree
  integer :: sloc(3), i

  sloc(1) = maxloc(score_list, dim=1)
  if (size(score_list) >= 2) then
    sloc(2) = maxloc(score_list, dim=1, mask=[(i .ne. sloc(1), i=1, size(score_list))])
  end if
  
  if (size(score_list) >= 3) then
    sloc(3) = maxloc(score_list, dim=1, mask=[(i .ne. sloc(1) .and. i .ne. sloc(2), i=1, size(score_list))])
  end if

  personalTopThree = 0
  do i = 1, size(score_list)
    personalTopThree(i) = score_list(sloc(i))
  end do
end function personalTopThree

end module
