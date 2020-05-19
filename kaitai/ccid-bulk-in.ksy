meta:
  id: ccid_bulk_in
  title: Response Frame
  endian: le
seq:
  - id: stx
    contents: [0x02]
  - id: bulk_in_header
    type:
      switch-on: bulk_in
      cases:
        1: rdr_to_pc_data_block
        2: rdr_to_pc_escape
        3: rdr_to_pc_slot_status
    doc: CCID-like header
  - id: apdu_response_or_addata
    type: apdu_rd
  - id: checksum
    size: 1
  - id: etx
    contents: [0x03]
instances:
  bulk_in:
    pos: 1
    type: b80
enums:
  slot_enum:
    0: picc
    1: icc
    2: sam
types:
  rdr_to_pc_data_block:
    doc: response to PC_to_RDR_IccPowerOn and PC_to_RDR_XfrBlock messages
    seq:
      - id: message_type
        contents: [0x80]
      - id: length
        type: u4
        doc: Size of extra bytes of this message
      - id: slot
        type: u1
        enum: slot_enum
        doc: Same value as in Bulk-OUT message
      - id: seq
        type: u1
        doc: Same value as in Bulk-OUT message
      - id: status
        type: u1
        doc: defined in DWG_Smart-Card_CCID_Rev110.pdf Section 6.2.6
      - id: error
        type: u1
        doc: defined in DWG_Smart-Card_CCID_Rev110.pdf Section 6.2.6
      - id: chain_parameter
        contents: [0x00]
        doc: RFU (TPDU exchange level)
      - id: data
        size: length
        type: data_block
        doc: |
          This field contains the data returned
          by the CCID.
    types:
      data_block:
        seq:
          - id: data
            size-eos: true
  rdr_to_pc_escape:
    doc: response to PC_to_RDR_Escape messages
    seq:
      - id: message_type
        contents: [0x83]
      - id: length
        type: u4
        doc: Size of extra bytes of this message
      - id: slot
        type: u1
        enum: slot_enum
        doc: Same value as in Bulk-OUT message
      - id: seq
        type: u1
        doc: Same value as in Bulk-OUT message
      - id: status
        type: u1
        doc: defined in DWG_Smart-Card_CCID_Rev110.pdf Section 6.2.6
      - id: error
        type: u1
        doc: defined in DWG_Smart-Card_CCID_Rev110.pdf Section 6.2.6
      - id: rfu
        contents: [0x00]
        doc: RFU
      - id: data
        size: length
        type: escape_block
        doc: |
          This field contains the data returned
          by the CCID.
    types:
      escape_block:
        seq:
          - id: data
            size-eos: true
  rdr_to_pc_slot_status:
    doc: |
      response to PC_to_RDR_IccPowerOff,
      PC_to_RDR_GetSlotStatus messages and
      Class specific ABORT request
    seq:
      - id: message_type
        contents: [0x83]
      - id: length
        type: u4
        doc: |
          contents: [0x00000000]
          Size of extra bytes of this message
      - id: slot
        type: u1
        enum: slot_enum
        doc: Same value as in Bulk-OUT message
      - id: seq
        type: u1
        doc: Same value as in Bulk-OUT message
      - id: status
        type: u1
        doc: defined in DWG_Smart-Card_CCID_Rev110.pdf Section 6.2.6
      - id: error
        type: u1
        doc: defined in DWG_Smart-Card_CCID_Rev110.pdf Section 6.2.6
      - id: clock_status
        type: u1
        enum: clock_status_enum
    enums:
      clock_status_enum:
        0x00: clock_running
        0x01: clock_stopped_in_state_l
        0x02: clock_stopped_in_state_h
        0x03: clock_stopped_in_an_unknown_state
  apdu_rd:
    seq:
      - id: apdu_rd
        size-eos: true
