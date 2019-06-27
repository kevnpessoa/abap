REPORT zpr_test002.

DATA: it_result   TYPE TABLE OF zcds_sflight,
      it_fieldcat TYPE slis_t_fieldcat_alv.

SELECT *
  FROM zcds_sflight
  INTO TABLE @it_result
    UP TO 30 ROWS.

CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
  EXPORTING
    i_program_name         = sy-repid
    i_structure_name       = 'zcds_sflight'
  CHANGING
    ct_fieldcat            = it_fieldcat
  EXCEPTIONS
    inconsistent_interface = 1
    program_error          = 2
    OTHERS                 = 3.

DELETE it_fieldcat INDEX 1.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_callback_program = sy-repid
    it_fieldcat        = it_fieldcat
    "is_layout                = wa_layout
    i_save             = 'A'
  TABLES
    t_outtab           = it_result
  EXCEPTIONS
    program_error      = 1
    OTHERS             = 2.
