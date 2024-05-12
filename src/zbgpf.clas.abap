CLASS zbgpf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_bgmc_op_single_tx_uncontr.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbgpf IMPLEMENTATION.

  METHOD if_bgmc_op_single_tx_uncontr~execute.

    TRY.
        "DUMMY HTTP POST REQUEST
        DATA(dest) = cl_http_destination_provider=>create_by_url( 'https://www.toptal.com/developers/postbin/1715546470795-0149276999291' ).
        DATA(client) = cl_web_http_client_manager=>create_by_http_destination( dest ).
        DATA(req) = client->get_http_request(  ).
        DATA(post) = client->execute( if_web_http_client=>post )->get_text(  ).
        client->close(  ).
      CATCH cx_root INTO DATA(error). "Catch all exceptions
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
