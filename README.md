## hcxdumptool + hcxtools (v5.1.4) 
## For Wifi Pineapple MK6 (TETRA/NANO)  
#### OpenWRT 15.05 - MIPS (ar71xx)  

===================================  
All tools are originally created by @ZerBea  
Ported to OpenWRT by: Andreas Nilsen / @adde88

This repo. contains the compiled IPK packages, and the Makefiles needed to compile the projects yourself.  

Feel free to donate if you want to help me out keeping stuff up to date.  
Alot of time and effort goes into keeping everything updated and ported properly. :)
  

**hcxdumptool - bitmasks**:
```
--enable_status=<digit>            : enable real-time display (waterfall)
                                     only incomming traffic
                                     only once at the first occurrence due to MAC randomization of CLIENTs
                                     bitmask:
                                         0: no status (default)
                                         1: EAPOL
                                         2: ASSOCIATION and REASSOCIATION
                                         4: AUTHENTICATION
                                         8: BEACON and PROBERESPONSE
                                        16: ROGUE AP
                                        32: GPS (once a minute)
                                        64: internal status (once a minute)
                                       128: run as server
                                       256: run as client
                                       512: EAP
                                      1024: EAP NAK
                                     characters < 0x20 && > 0x7e are replaced by .
                                     example: show everything but don't run as server or client (1+2+4+8+16 = 31)
                                              show only EAPOL and ASSOCIATION and REASSOCIATION (1+2 = 3)
```

[![paypal](https://www.paypalobjects.com/en_US/NO/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4HJM939H9PHWW)
