5.1
a)Faili lugemiseks:

1)Kataloogil: x

2)Failil: r

b) Faili kustutamiseks:

1)Kataloogil: w ja x

2)Failil: õigusi pole vaja (---)

5.2
chmod a=x (annab ainult käivitamisõiguse (x), aga ei anna lugemisõigust (r).) ei ole piisav, sest shell peab skripti sisu lugema enne käske täitmist.
Shelli skriptifaili käivitamiseks on vaja nii lugemis- (r) kui käivitamisõigust (x).

5.3
Igal kasutajal on vaikimisi omanimeline grupp, et lihtsustada failiõiguste haldamist ja muuta süsteem turvalisemaks.

5.4,

Faili uusfail.txt sisu kuvamiseks peab tavakasutajal kataloogil olema x (sisenemisõigus) ja failil r (lugemisõigus).

<img width="1609" height="579" alt="Screenshot 2025-10-06 112108" src="https://github.com/user-attachments/assets/c0474555-a061-4b4e-8eee-9dbed41e4c52" />

5.5

Setuid on vajalik, et programm saaks töötada faili omaniku õigustes isegi siis, kui seda käivitab tavakasutaja.
<img width="827" height="600" alt="Screenshot 2025-10-17 143819" src="https://github.com/user-attachments/assets/b6abe782-9d27-4ac9-92cf-1b017b9c97e9" />

5.6
Jah

Setuid-programmid jooksutavad koodi omaniku (või root-i) privileegidega. Kui sellises programmis on turvaauk, võivad pahatahtlikud kasutajad selle kaudu saavutada kõrgemad õigused.

5.7
Kui kataloogile on pandud sticky bit, siis faile kataloogist saavad kustutada ainult:

1)faili omanik

2)kataloogi omanik

3)root 

5.8

file: hinded.txt

owner: ratmir

group: ratmir

user::rw-

group::---

other::---


5.9

1)Kui failile on pandud immutability (chattr +i), siis keegi ei saa faili sisu muuta ega faili kustutada, mitte isegi root ei saa faili otse kirjutada ega kustutada.

2)Kui root soovib faili kustutada või muuta, peab root esmalt eemaldama +i atribuudi ja alles seejärel toimetama:
