meta:
  id: ccid_status
  title: Status Frame
seq:
  - id: stx
    contents: [0x02]
  - id: status
    type: u1
    enum: status_enum
  - id: checksum
    size: 1
  - id: etx
    contents: [0x03]
enums:
  status_enum:
    0x00: ack
    0xff: checksum_error
    0xfe: length_error
    0xfd: etx_error
    0x99: timeout_error
    0x0000000000000000000000: nak
