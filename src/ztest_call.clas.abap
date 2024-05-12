CLASS ztest_call DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztest_call IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  TRY.
DATA(dest) = cl_http_destination_provider=>create_by_url( 'https://www.toptal.com/developers/postbin/1715537134683-0620718607679' ).
DATA(client) = cl_web_http_client_manager=>create_by_http_destination( dest ).
DATA(req) = client->get_http_request(  ).
DATA(post) = client->execute( if_web_http_client=>post )->get_text(  ).
client->close(  ).
CATCH cx_root INTO DATA(error). "Catch all exceptions

ENDTRY.
  ENDMETHOD.
ENDCLASS.
