CLASS zcl_law_let DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_law_let IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT SINGLE FROM /dmo/agency
    FIELDS *
    INTO @DATA(lt_agency).

    IF sy-subrc IS INITIAL.
      DATA(lv_sample) = CONV string(
          LET lv_text = 'Additional Text ' lv_separator = '-' " Declare variables via LET
          IN lt_agency-street && lv_separator && lv_text " Result
      ).

      out->write( lt_agency ).
      out->write( lv_sample ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
