CLASS zcl_law_for_new DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_law_for_new IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TYPES:
      BEGIN OF lty_agency,
        agency_id   TYPE /dmo/agency_id,
        name        TYPE /dmo/agency_name,
        street      TYPE /dmo/street,
        postal_code TYPE /dmo/postal_code,
        city        TYPE /dmo/city,
      END OF lty_agency.

    DATA: lt_agency TYPE STANDARD TABLE OF lty_agency.

*    " Get Data
*    READ ENTITIES OF zac_i_travel_m
*    ENTITY zac_i_travel_m
*    ALL FIELDS WITH VALUE #( ( %tky-TravelId = '0000000001' ) )
*    RESULT DATA(lt_result).
    SELECT FROM /dmo/agency
    FIELDS *
    INTO TABLE @DATA(lt_result).

    IF sy-subrc IS INITIAL.
      lt_agency = VALUE #(
        FOR ls_agency " Work Area to be assigned
        IN lt_result " Table to be looped)
        LET ls_base = VALUE lty_agency( city = 'Roma' )
        IN ( CORRESPONDING #( BASE ( ls_base ) ls_agency ) ) ).
*        WHERE ( city = 'Roma' ) " Filter
      " Manually map the fields
*        (
*            " Columns to be mapped
*            " <table field> = <work area>-<field>
*            agency_id = ls_agency-agency_id
*            city = ls_agency-city
*            name = ls_agency-name
*            postal_code = ls_agency-postal_code
*            street = ls_agency-street
*        )
*        ( CORRESPONDING #( ls_agency ) ) ).
    ENDIF.

    TYPES:
      BEGIN OF lty_numbers,
        number       TYPE i,
        numbertimes2 TYPE i,
      END OF lty_numbers.

    DATA: lt_tab TYPE STANDARD TABLE OF lty_numbers.

    lt_tab = VALUE #( FOR i = 0 THEN i + 1 WHILE i LE 10 ( number = i numbertimes2 = i * 2 ) ).

    out->write( lt_agency ).
    out->write( lt_tab ).
  ENDMETHOD.
ENDCLASS.
