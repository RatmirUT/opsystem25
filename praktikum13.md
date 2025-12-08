1)
## Ülesanne 3 — esimene.sh

```bash
#!/bin/bash

echo "Sisesta oma nimi:"
read nimi

echo "Sisesta oma eriala:"
read eriala

echo "Sisesta oma matriklinumber:"
read matrikkel

echo ""
echo "Sinu andmed:"
echo "Nimi: $nimi"
echo "Eriala: $eriala"
echo "Matriklinumber: $matrikkel"
```
<img width="660" height="520" alt="Screenshot 2025-12-08 104530" src="https://github.com/user-attachments/assets/5b864cb9-a6cc-4607-99fb-18b360e565e1" />

2)
##Ülesanne 4 - rename.sh 
```bash
#!/bin/bash

A=$1
B=$2

for fail in *.$A
do
    if [ -f "$fail" ]; then
        uus="${fail%.$A}.$B"
        mv "$fail" "$uus"
        echo "Nimetati ümber: $fail -> $uus"
    fi
done

```
<img width="660" height="208" alt="Screenshot 2025-12-08 105010" src="https://github.com/user-attachments/assets/d11143aa-f1be-4072-b247-7bfb9ab9fa53" />

3)
##Ülesanne 5 - otsi_proc.sh
```bash
#!/bin/bash
IFS=$'\n'

for rida in $(ps -A)
do
    puhastatud=$(echo " $rida" | tr -s ' ')
    pid=$(echo "$puhastatud" | cut -d ' ' -f2)
    nimi=$(echo "$puhastatud" | cut -d ' ' -f4)

    if [ "$nimi" = "$1" ]; then
        echo "Leitud protsess: PID=$pid   Nimi=$nimi"
    fi
done

```
<img width="466" height="160" alt="Screenshot 2025-12-08 105713" src="https://github.com/user-attachments/assets/2061852c-4e48-46ce-9ee5-5a91aca3b708" />

4)
##Ülesanne 6 - astenda.sh
```bash
#!/bin/bash

astenda() {
    alus=$1
    aste=$2
    tulemus=1
    count=0

    while [ $count -lt $aste ]
    do
        tulemus=$(($tulemus * $alus))
        count=$(($count + 1))
    done

    echo $tulemus
}

vastus=$(astenda 9 5)
echo "9^5 = $vastus"


```
<img width="692" height="214" alt="Screenshot 2025-12-08 110624" src="https://github.com/user-attachments/assets/4449f26e-97f6-4be3-92c4-628d03caf384" />

5)
##Ülesanne 7 - ChatGPT lahendus

<img width="650" height="111" alt="Screenshot 2025-12-08 111325" src="https://github.com/user-attachments/assets/076fbc91-03ba-4721-8561-fdfcc09d6ef2" />
<img width="902" height="830" alt="Screenshot 2025-12-08 111347" src="https://github.com/user-attachments/assets/5008d444-871a-46fa-8e30-e4c51bfb3a91" />
<img width="856" height="479" alt="Screenshot 2025-12-08 111355" src="https://github.com/user-attachments/assets/14431ba5-f5a8-4458-9727-076c3b44da78" />
