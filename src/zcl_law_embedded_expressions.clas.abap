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
    out->write( |{ lv_number NUMBER = USER }| ).
    out->write( |{ cl_abap_context_info=>get_system_date(  ) DATE = USER }| ).
    out->write( |{ cl_abap_context_info=>get_system_time(  ) TIME = USER }| ).
    out->write( |{ utclong_current(  ) TIMESTAMP = USER }| ).
  ENDMETHOD.
ENDCLASS.
