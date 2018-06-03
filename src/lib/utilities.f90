    !------------------------------------------------------------------------------
    !        IST/MARETEC, Water Modelling Group, Mohid modelling system
    !------------------------------------------------------------------------------
    !
    ! TITLE         : Mohid Model
    ! PROJECT       : Mohid Lagrangian Tracer
    ! MODULE        : utilities
    ! URL           : http://www.mohid.com
    ! AFFILIATION   : IST/MARETEC, Marine Modelling Group
    ! DATE          : March 2018
    ! REVISION      : Canelas 0.1
    !> @author
    !> Ricardo Birjukovs Canelas
    !
    ! DESCRIPTION:
    !> Module that provides useful back-end routines.
    !------------------------------------------------------------------------------

    module utilities_mod

    use vecfor
    use stringifor
    use simulation_precision_mod
    use simulation_logger_mod

    implicit none
    private

    !public routines
    public :: get_closest_twopow
    
    contains

    !---------------------------------------------------------------------------
    !> @Ricardo Birjukovs Canelas - MARETEC
    ! Routine Author Name and Affiliation.
    !
    !> @brief
    !> Public function that returns the closest power of 2 or a given real number
    !
    !> @param[in] num
    !---------------------------------------------------------------------------
    function get_closest_twopow(num) result(twopow)
    implicit none
    real(prec), intent(in) :: num
    real(prec) :: twopow
    integer :: i
    real(prec) :: dist1, dist2
    
    do i=-4, 10
        twopow = 2.0**i
        if (num < twopow) then
            dist1 = sqrt(twopow-num)
            dist2 = sqrt(num-2.0**(i-1))
            if (dist2 < dist1) then
                twopow = 2.0**(i-1)
                exit
            endif
            exit
        endif
    enddo
   
    end function get_closest_twopow

    end module utilities_mod