BITS 64
;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=
;TEST_FILE_META_END
    ;TEST_BEGIN_RECORDING
    lea rdi, [rsp-0x80]
    FSTENV [rdi]
    FLDENV [rdi]
    mov edi, 0
    ;TEST_END_RECORDING

