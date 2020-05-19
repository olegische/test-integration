# Client
**Field**  
**Card**  
**Reader**  
**Card Number**  
**Trusted Key**  
**Coordinates**  
**Lift Start Time**  
**Loader ID**  
**Lift Stop Time**  
**loaderShares1** -- Доли погрузчиков (для 9 погрузчиков). Offset: 79, type: u1  
**stateFlags** -- Регистр флагов и состояний. Offset: 1, type: u1

# Specification
**ACR1281S-C1 reader**  
**rs-232** -- baudrate = 9.6 kbps (default) || 19.2 kbps || 38.4 kbps || 57.6 kbps || 115.2 kbps || 230.4 kbps  
**rs-485**  
**CCID-like frame format** -- binary  
**Contactless Smary Card Reader**  
- **Contactless Tag**  
- **ISO 14443 Part 4 Type A and B**  
- **Mifare series**  
- **Extended APDU** -- max 64 kbytes  
**Contact Smart Card Reader**  
- **ISO 7816 Class A, B and C** -- 5V, 3V and 1.8V
- **T0 or T1 Protocol**  
- **Memory Card**  
- **ISO 7816 comptiant SAM Slot**  
**Integrated Circuit Card**  

## Standards
- ISO 14443
- ISO 7816
- CE
- FCC
- RoHS 2

## Methods
### Reader
- ACR_Open(portName) : phReader
- ACR_Close(hReader)
- ACR_GetNumSlots(hReader) : pNumSlots
- ACR_GetBaudRate(hReader) : pBaudRate
- ACR_SetBaudRate(hReader, baudRate)
- ACR_GetTimeouts(hReader) : pTimeouts
- ACR_SetTimeouts(hReader, pTimeouts)
### Card
- ACR_ExchangeApdu(hReader, slotNum, sendBuffer, sendBufferLen, pRecvBufferLen) : recvBuffer, pRecvBufferLen
- ACR_GetIccStatus(hReader, slotNum) : pIccStatus
- ACR_PowerOffIcc(hReader, slotNum)
- ACR_PowerOnIcc(hReader, slotNum, pAtrLen) : atr, pAtrLen
- ACR_SetProtocol(hReader, slotNum, prefferedProtocols) : pActiveProtocol
### Peripheral
- ACR_Control(hReader, slotNum, controlCode, inBuffer, inBufferSize, outBufferSize) : outBuffer, pBytesReturned
