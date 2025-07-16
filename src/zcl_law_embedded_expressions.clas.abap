CLASS zcl_law_embedded_expressions DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_law_embedded_expressions IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT SINGLE
        FROM /dmo/agency
        FIELDS agency_id
        INTO @DATA(lv_agency_id).

    out->write( strlen( `Hello    ` ) ). " Includes leading spaces
    out->write( strlen( 'Hello    ' ) ). " Doesn't include leading spaces
    out->write( |{ lv_agency_id ALPHA = OUT }| ).
    out->write( cl_abap_tstmp=>utclong2tstmp( utclong_current(  ) ) ).


    DATA(lv_number) = 1000.
    out->write( |{ lv_number NUMBER = USER
        SIGN = RIGHTPLUS " Adds + sign after/before(LEFTPLUS) the value
    }| ).

    out->write( |{ cl_abap_context_info=>get_system_date(  ) DATE = USER }| ).
    out->write( |{ cl_abap_context_info=>get_system_time(  ) TIME = USER }| ).
    out->write( |{ utclong_current(  ) TIMESTAMP = USER }| ).

    DATA(lv_lower) = 'this was in lower case.'.
    out->write( |{ lv_lower CASE = UPPER
        WIDTH = 100 " You can set the width here.. it will adjust in your ALV :)
        ALIGN = RIGHT " Text alignment in cell in ALV
        PAD = 'X' " Replace the leading space with character defined
    }| ).

    out->write( |Hello\nWorld!| ). " \n = break
    out->write( |Hello\tWorld!| ). " \t = tab

  ENDMETHOD.
ENDCLASS.
