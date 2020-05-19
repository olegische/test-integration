meta:
  id: apdu_fast_read
  title: APDU FAST_READ command for NTAG21x
instances:
  request:
    type: request
  respond:
    type: respond
types:
  request:
    seq:
      - id: cmd
        contents: [0x3a]
        doc: read multiple pages
      - id: start_addr
        type: u1
        doc: start page address
      - id: end_addr
        type: u1
        doc: end page address
      - id: crc
        size: 2
        doc: CRC according ISO/IEC 14443 (ISO-14443-3 CRC_A)
  respond:
    seq:
      - id: data
        size: (_root.request.end_addr - _root.request.start_addr) * 4
        doc: data content of the addressed pages (4 bytes per page)
      - id: crc
        size: 2
        doc: CRC according ISO/IEC 14443 (ISO-14443-3 CRC_A)
    instances:
      nak:
        type: b4
        enum: nak_enum
    enums:
      nak_enum:
        0x00: invalid_argument
        0x01: parity_or_crc_error
        0x04: invalid_auth_counter_overflow
        0x05: eeprom_write_error
