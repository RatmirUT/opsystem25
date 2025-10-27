1.
Uued andmekandjad vajavad lähtestamist, et luua **partitsioonitabel ja failisüsteem**, eemaldada vanad andmed ning võimaldada operatsioonisüsteemil ketast õigesti kasutada ja mountida.

2.
1)Suurem ketaste tugi – GPT toetab >2TB kettaid, MBR maksimaalselt 2TB.

2)Rohkem partitsioone – GPT võimaldab 128 primaarpartitsiooni; MBR ainult 4 (või laiendatud).

3)Parandatud andmete terviklikkus – GPT salvestab mitme koopia partitsioonitabelist, MBR ainult ühe.

4)GUID-tunnus – iga partitsioonil on unikaalne GUID, mis vähendab konflikte ja lihtsustab hallatust.

3.
https://kodu.ut.ee/~ratmir/opsys/hdd.png

4.
<img width="790" height="141" alt="Screenshot 2025-10-27 114241" src="https://github.com/user-attachments/assets/a3dc1171-d08c-4a1e-938b-d690c21ad347" />

5.
-o ro → mountib ketta ainult lugemiseks, andmeid ei saa muuta.

-t auto → Linux tuvastab ketta failisüsteemi automaatselt, ei pea ise määrama (ext4, ntfs jne).

6.
Ubuntu asendas'mount -t auto' parameetri tegeliku failisüsteemi tüübiga, mis oli **ext4**.


7.
<img width="805" height="571" alt="Screenshot 2025-10-27 141021" src="https://github.com/user-attachments/assets/eb9ddf80-2730-4888-b5c7-caad0425b943" />
