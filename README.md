## PMKID Attacks on WiFI Pineapple / OpenWRT
Both tools are originally created by ZerBea (https://github.com/ZerBea/)  
Ported to OpenWRT and maintained by: Andreas Nilsen @adde88

## Content
The **bin** folder contains the pre-compiled IPK packages, made for the Pineapples.
The **net** folder contains the folders to both tools Makefiles

## Information
This attack was discovered accidentally while looking for new ways to attack the new WPA3 security standard.  
WPA3 will be much harder to attack because of its modern key establishment protocol called "Simultaneous Authentication of Equals" (SAE).

The main difference from existing attacks is that in this attack, capture of a full EAPOL 4-way handshake is not required.  
The new attack is performed on the RSN IE (Robust Security Network Information Element) of a single EAPOL frame.

At this time, we do not know for which vendors or for how many routers this technique will work, but we think it will work against all 802.11i/p/q/r networks with roaming functions enabled (most modern routers).

The main advantages of this attack are as follow:  

 - No more regular users required - because the attacker directly
   communicates with the AP (aka "client-less" attack)
 - No more waiting for a complete 4-way handshake between the regular
   user and the AP
 - No more eventual retransmissions of EAPOL frames (which can lead to
   uncrackable results)
 - No more eventual invalid passwords sent by the regular user
 - No more lost EAPOL frames when the regular user or the AP is too far
   away from the attacker
 - No more fixing of nonce and replaycounter values required (resulting
   in slightly higher speeds)
 - No more special output format (pcap, hccapx, etc.) - final data will
   appear as regular hex encoded string

The RSN IE is an optional field that can be found in 802.11 management frames.
One of the RSN capabilities is the PMKID. 

The PMKID is computed by using HMAC-SHA1 where the key is the PMK and the data part is the concatenation of a fixed string label "PMK Name", the access point's MAC address and the station's MAC address.

 - PMKID = HMAC-SHA1-128(PMK, "PMK Name" | MAC_AP | MAC_STA)1

Since the PMK is the same as in a regular EAPOL 4-way handshake this is an ideal attacking vector.
We receive all the data we need in the first EAPOL frame from the AP.
