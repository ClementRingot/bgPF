CLASS lsc_zr_test_table_crt DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zr_test_table_crt IMPLEMENTATION.

  METHOD save_modified.

DATA: ls_ZTEST_TABLE_CRT TYPE ZTEST_TABLE_CRT.

LOOP AT update-zr_test_table_crt INTO data(ls_update).
ls_ZTEST_TABLE_CRT = CORRESPONDING #( ls_update MAPPING FROM
ENTITY ).
MODIFY ZTEST_TABLE_CRT FROM @ls_ZTEST_TABLE_CRT.
ENDLOOP.

LOOP AT delete-zr_test_table_crt INTO data(ls_delete).
ls_ZTEST_TABLE_CRT = CORRESPONDING #( ls_delete MAPPING FROM
ENTITY ).
DELETE ZTEST_TABLE_CRT FROM @ls_ZTEST_TABLE_CRT.
ENDLOOP.

LOOP AT create-zr_test_table_crt INTO data(ls_create).
ls_ZTEST_TABLE_CRT = CORRESPONDING #( ls_create MAPPING FROM
ENTITY ).
MODIFY ZTEST_TABLE_CRT FROM @ls_ZTEST_TABLE_CRT.
    DATA(new) = NEW zbgpf(  ).
    DATA background_process TYPE REF TO if_bgmc_process_single_op.
    TRY.
        background_process = cl_bgmc_process_factory=>get_default(  )->create(  ).
        background_process->set_operation_tx_uncontrolled( new ).
        background_process->save_for_execution(  ).
      CATCH cx_bgmc INTO DATA(exception).
    ENDTRY.
ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS LHC_ZR_TEST_TABLE_CRT DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZR_TEST_TABLE_CRT
        RESULT result.
ENDCLASS.

CLASS LHC_ZR_TEST_TABLE_CRT IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
ENDCLASS.
