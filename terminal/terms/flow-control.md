# Flow Control

https://onlinedocs.microchip.com/oxy/GUID-167CA20A-2C0F-4CBC-A693-9FD032B9B193-en-US-1/GUID-850A70C1-E766-47A6-A0B4-00AAD3BE946F.html

Flow control methods
- XON/XOF is software flow control (in the terminal, ^Q is XON, ^S is OFF)
- RTS/CTS Request-To-Send, Clear-To-Send
- DTR/DSR Data-Terminal-Ready, Data-Set-Ready


## Software Flow Control

Software flow control uses the XON/XOFF (Transmit ON/Transmit OFF) method. This method has an advantage over hardware flow control methods since it does not require additional hardware lines, which significantly reduces wiring complexity.

In the **XON/XOFF method**, special characters are sent by the receiver to the transmitter that are used to suspend and resume transactions. These characters are not specifically defined by any standard, such as ASCII. However, the ASCII standard provides generic device control characters, DC1-DC4. 

The UART module specifically uses the ASCII control characters DC1 (0x11) and DC3 (0x13) as the XON and XOFF control characters, respectively. 

When one terminal is unable to accept data, it sends the XOFF character to the other terminal, which in turn suspends transmission. When the other terminal is ready to accept data again, it simply sends the XON character back to the first terminal, which resumes transmission. 

The Software Flow Control Transmit Enable Status (XON) bit of the UxFIFO STATUS register can be used to determine if the transmitter is enabled/disabled.

```
Dc Hx       Dc Hx     Dc Hx     Dec Hx
16 10 DLE   48 30 0   80 50 P   112 70 p
17 11 DC1   49 31 1   81 51 Q   113 71 q ‹‹‹
18 12 DC2   50 32 2   82 52 R   114 72 r
19 13 DC3   51 33 3   83 53 S   115 73 s ‹‹‹
```

- XON  uses `DC1`, i.e. 11ʰ or 00_10001ᵇ, obtained as ^q or ^Q
- XOFF uses `DC3`, i.e. 13ʰ or 00_10011ᵇ, obtained as ^s or ^S
- the letters q/Q differ in case (bit 5) 


```
                          ctrl bit      shift bit
                             ↓              ↓
00-10001 DC1   01-10001 1    10-10001 Q    11-10001 q
00-10010 DC2   01-10010 2    10-10010 R    11-10010 r
00-10011 DC3   01-10011 3    10-10011 S    11-10011 s
```

That's why `^S` pauses the ongoing transmission, freezing the screen, while `^Q` resumes it, unfreezing the screen; it's got nothing to do with those letters but with the fact that the first 5 bits (0-4) make a group of related characters that are different from each other only in the bit 5 (shift bit) and bit 6 (control bit). The first 5 bits of the ASCII binary code for `DC1` are `10001` the same as for `1`, `Q` and `q`:
- 0-0-10001 DC1
- 0-1-10001 1
- 1-0-10001 Q
- 1-1-10001 q

Using the "Shift" modifer with `q` flips the bit 5 to get `Q`. In a shifted-state (with CapsLock engaged), holding Shift with `Q` flips the bit 5 and we get `q`. When the "Control" modifer is used with either `q` or `Q`, the control character `DC1` is entered. When the Control modifer is engaged, terminals cannot tell whether the Shift key is also pressed or not, i.e. they cannot differentiate between `q` and `Q` (obtained as `S-q`, i.e. `Shift-q`) in such situations.

## Hardware Flow Control

For hardware flow control, the UART module utilizes a RTS/CTS flow control scheme commonly found in RS-232 (Recommended Standard 232) networks. The RS-232 standard defines the signals connecting Data Terminal Equipment (DTE) to Data Communication Equipment (DCE). In addition to the standard transmit (TX) and receive (RX) lines, RTS flow control uses the Request-to-Send (RTS) and Clear-to-Send (CTS) lines. The UART module also provides a third line, the Transmit Drive Enable (TXDE) line, to control an RS-485 transceiver.

The UART module is configured as a DTE device; therefore, UART hardware configures the RTS signal as an output, while the CTS signal is an input. In a DCE system, the opposite is true; the RTS signal is an input, while the CTS signal is an output. It is important to note that connections between DTE and DTE devices (Figure 1-2) are different than connections between DTE and DCE devices (Figure 1-3).

The active-low RTS and CTS signals work together to control transmission flow. Hardware flow is typically controlled by the DTE device, which could be considered a 'master' device. In the case of a DTE-to-DTE configuration, either device can act as a master. When one DTE device wishes to transmit data, the DTE device pulls the RTS line low, which signals the slave device, through its CTS input, to begin to monitor its RX input. When the slave device is ready to accept the data, it pulls its RTS line low, informing the master, through its CTS line, to begin sending data. Once the transaction has completed, the master device pulls the RTS line high.

In a DTE-to-DCE configuration, the DTE is considered the master and the DCE is considered a slave. In this configuration, when the DTE device wishes to transmit data, the DTE device pulls the RTS line low, which signals the DCE device, through its RTS line, to begin to monitor its RX line. When the DCE device is ready to accept the data, it pulls its CTS line low, informing the DTE device, through its CTS connection, to begin sending data.
