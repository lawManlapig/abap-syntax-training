CLASS zcl_law_new_syntax DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun_out .
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_law_new_syntax IMPLEMENTATION.


  METHOD if_oo_adt_classrun_out~get.
  ENDMETHOD.


  METHOD if_oo_adt_classrun_out~write.
  ENDMETHOD.
  METHOD if_oo_adt_classrun~main.
    TYPES:
      BEGIN OF lty_students,
        id   TYPE i,
        name TYPE string,
      END OF lty_students.

    TYPES: ltt_students TYPE STANDARD TABLE OF lty_students WITH EMPTY KEY.


    DATA(lt_vbak) = VALUE ltt_students(
        ( id = 1 name = 'Law' )
        ( id = 2 name = 'Starpish' )
    ).

    out->write( lt_vbak ).
  ENDMETHOD.

ENDCLASS.
