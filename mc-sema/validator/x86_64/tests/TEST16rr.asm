BITS 64
;TEST_FILE_META_BEGIN
;TEST_TYPE=TEST_F
;TEST_IGNOREFLAGS=FLAG_AF
;TEST_FILE_META_END
    ; TEST16rr
    mov cx, 0x0
    mov dx, 0x1
    ;TEST_BEGIN_RECORDING
    test cx, dx
    ;TEST_END_RECORDING
