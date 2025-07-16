CLASS zcl_law_movecorr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_law_movecorr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TYPES:
      BEGIN OF lty_line_struct1,
        col1 TYPE c LENGTH 3,
        col2 TYPE c LENGTH 3,
      END OF lty_line_struct1,

      BEGIN OF lty_line_struct2,
        col2 TYPE c LENGTH 3,
        col3 TYPE c LENGTH 3,
      END OF lty_line_struct2,

      BEGIN OF lty_struct1,
        col1   TYPE c LENGTH 3,
        col2   TYPE c LENGTH 3,
        lt_tab TYPE STANDARD TABLE OF lty_line_struct1 WITH EMPTY KEY,
      END OF lty_struct1,

      BEGIN OF lty_struct2,
        col2   TYPE c LENGTH 3,
        lt_tab TYPE STANDARD TABLE OF lty_line_struct2 WITH EMPTY KEY,
        col4   TYPE c LENGTH 3,
      END OF lty_struct2.

    DATA:
      ls_struct1 TYPE lty_struct1,
      ls_struct2 TYPE lty_struct2.

    " Populate
    ls_struct1 = VALUE #(
        col1 = 'a1'
        col2 = 'a2'
        lt_tab = VALUE #(
            ( col1 = 'a11' col2 = 'a12' )
            ( col1 = 'a21' col2 = 'a22' )
        ) ).

    ls_struct2 = VALUE #(
        col2 = 'x1'
        lt_tab = VALUE #(
            ( col2 = 'x11' col3 = 'x12' )
            ( col2 = 'x21' col3 = 'x22' )
            ( col2 = 'x31' col3 = 'x32' )
        )
        col4 = 'x4'
    ).
  ENDMETHOD.
ENDCLASS.
