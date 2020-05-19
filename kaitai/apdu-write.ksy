meta:
  id: apdu_write
  title: APDU WRITE command for NTAG21x
instances:
  request:
    type: request
  respond:
    type: respond
types:
  request:
    seq:
      - id: cmd
        contents: [0xa2]
        doc: write one page
      - id: addr
        type: u1
        doc: page address
      - id: data
        size: 4
        doc: data
      - id: crc
        size: 2
        doc: CRC according ISO/IEC 14443 (ISO-14443-3 CRC_A)
  respond:
    seq:
      - id: ack
        contents: [0x0a]
        doc: Acknowledge (ACK)
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
