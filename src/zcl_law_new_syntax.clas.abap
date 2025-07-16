CLASS zcl_law_new_syntax DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_law_new_syntax IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES:
      BEGIN OF lty_students,
        id   TYPE i,
        name TYPE string,
      END OF lty_students.

    TYPES: ltt_students TYPE STANDARD TABLE OF lty_students WITH EMPTY KEY.

    DATA(lo_string) = NEW string( 'Hello World!' ).


    DATA(lt_vbak) = VALUE ltt_students(
        ( id = 1 name = 'Law' )
        ( id = 2 name = 'Starpish' )
    ).

    " Add the initial entries to a new table with new values
    DATA(lt_students2) = VALUE #( BASE lt_vbak ( id = 3 name = 'Cotton' ) ).

    out->write( REDUCE i(
        INIT s = 0
        FOR i = 1 UNTIL i > 10
        NEXT s += 1
    ) ).

    out->write( lt_students2 ).
    out->write( lo_string->* ).
  ENDMETHOD.

ENDCLASS.
