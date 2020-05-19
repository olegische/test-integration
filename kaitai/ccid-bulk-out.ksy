meta:
  id: ccid_bulk_out
  title: CCID-like format is used for communication with ACR128S-C1 reader
  endian: le
seq:
  - id: stx
    contents: [0x02]
    doc: Start of Text, tells the reader start to receive the command, must equal to 0x02h
  - id: bulk_out_header
    type:
      switch-on: bulk_out
      cases:
        1: pc_to_rdr_icc_power_on
        2: pc_to_rdr_icc_power_off
        3: pc_to_rdr_get_slot_status
        4: pc_to_rdr_xfr_block
        5: pc_to_rdr_escape
    doc: CCID-liked Header
  - id: apdu_command_or_parameters
    type: apdu_cp
    doc: APDU command or parameter for accessing reader and card
  - id: checksum
    size: 1
    doc: error checking, equal to XOR {Bulk-OUT Header, APDU Command or Parameters}
  - id: etx
    contents: [0x03]
    doc: End of Text, tells the reader the command ended, must equal to 0x03h
instances:
  bulk_out:
    pos: 1
    type: b80
enums:
  slot_enum:
    0: picc
    1: icc
    2: sam
types:
  pc_to_rdr_icc_power_on:
    seq:
      - id: message_type
        contents: [0x62]
      - id: length
        type: u4
        doc: |
          contents : [0x00000000]
          Size of extra bytes of this message
      - id: slot
        type: u1
        enum: slot_enum
      - id: seq
        type: u1
        doc: Sequence number for command
      - id: power_select
        type: u1
        enum: power_select_enum
      - id: rfu
        size: 2
    enums:
      power_select_enum:
        0x00: automatic_voltage_selection
        0x01: voltage_5v
        0x02: voltage_3v
  pc_to_rdr_icc_power_off:
    seq:
      - id: message_type
        contents: [0x63]
      - id: length
        type: u4
        doc: |
          contents : [0x00000000]
          Size of extra bytes of this message
      - id: slot
        type: u1
        enum: slot_enum
      - id: seq
        type: u1
        doc: Sequence number for command
      - id: rfu
        size: 3
  pc_to_rdr_get_slot_status:
    seq:
      - id: message_type
        contents: [0x65]
      - id: length
        type: u4
        doc: |
          contents : [0x00000000]
          Size of extra bytes of this message
      - id: slot
        type: u1
        enum: slot_enum
      - id: seq
        type: u1
        doc: Sequence number for command
      - id: rfu
        size: 3
  pc_to_rdr_xfr_block:
    seq:
      - id: message_type
        contents: [0x6f]
      - id: length
        type: u4
        doc: Size of adData field of this message
      - id: slot
        type: u1
        enum: slot_enum
      - id: seq
        type: u1
        doc: Sequence number for command
      - id: bwi
        size: 1
        doc: |
          Used to extend the CCIDs Block Waiting
          Timeout for this current transfer. The
          CCID will timeout the block after “this
          number multiplied by the Block Waiting
          Time” has expired.
      - id: level_parameter
        size: 2
        doc: |
          contains: [0x0000]
          RFU (TPDU exchange level).
      - id: data
        size: length
        type: xfr_block
    types:
      xfr_block:
        seq:
          - id: data
            size-eos: true
  pc_to_rdr_escape:
    seq:
      - id: message_type
        contents: [0x6b]
      - id: length
        type: u4
        doc: Size of adData field of this message
      - id: slot
        type: u1
        enum: slot_enum
      - id: seq
        type: u1
        doc: Sequence number for command
      - id: rfu
        size: 3
      - id: data
        size: length
        type: escape_block
    types:
      escape_block:
        seq:
          - id: data
            size-eos: true
  apdu_cp:
    seq:
      - id: apdu_cp
        size-eos: true
