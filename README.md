## Soal Nomor 1

### a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit

#### Penyelesaian menggunakan awk:

```bash
awk -F "\t" '
BEGIN {}
{	reg=$13;
	if(reg != "Region")
	{
		profits[reg]=profits[reg]+$21+0
	}
}
END {
	print "Region dengan profit terkecil:"
	for(key in profits) 
		keysBackup[profits[key]]=key
	n = asort(profits, sortedProfits)
	for(i=1; 2>i; i++)
	{
		print keysBackup[sortedProfits[i]], sortedProfits[i]
	};
	print "\n"
}' Sample-Superstore.tsv
```
#### Penjelasan
Block BODY:
*  `awk -F "\t"` digunakan untuk memakai awk dengan Field Seperator berupa tab
* `reg=$13; if(reg != "Region"){profits[reg]=profits[reg]+$21+0}` Pertama kita memasukkan nilai-nilai di kolom 13 kedalam variabel reg, lalu mencek apakah reg="Region" untuk memilah baris pertama yaitu title tiap kolom. Lalu memasukkan nilai profit ke dalam sebuah array dengan index regionnya.

Block END:
* `print "Region dengan profit terkecil:"` digunakan untuk print tulisan "Region dengan profit terkecil:"
* `for(key in profits) keysBackup[profits[key]]=key` digunakan untuk menukar nilai index dan valuenya pada array profits yang berguna agar menyimpan nilai pada saat menggunakan `asort()` dan disimpan pada array keysBackup
* `n = asort(profits, sortedProfits)` digunakan untuk melakukan sorting pada array profits dan meletakkannya pada array sortedProfits
* `for(i=1; 2>i; i++)
    {
        print keysBackup[sortedProfits[i]], sortedProfits[i]
    };` untuk print value profit terkecil dengan menggunakan array backup dengan index  yang merupakan value terkecil dari profit.
* `Sample-Superstore.tsv` adalah file yang kita ambil datanya





### b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a

```bash
awk -F "\t" '
BEGIN {}
{reg=$13; stateTemp=$11;
	if(reg=="Central")
	{
		profits[stateTemp] = profits[stateTemp] +$21 +0
	}
}
END {
	for(key in profits) 
		backupKeys[profits[key]]=key
	n=asort(profits, sortedProfits)
	print "2 State yang memiliki profit paling kecil: "
	for(i=1; 3>i; i++)
	{
		print backupKeys[sortedProfits[i]], sortedProfits[i]
	}
	print "\n"
}' Sample-Superstore.tsv
```
#### Penjelasan
Block BODY:
*  `awk -F "\t"` digunakan untuk memakai awk dengan Field Seperator berupa tab
* `reg=$13; stateTemp=$11; if(reg=="Central") {profits[stateTemp] = profits[stateTemp] +$21 +0}` Pertama kita memasukkan nilai-nilai di kolom 13 kedalam variabel reg dan kolom 11 ke stateTemp, lalu mencek apakah reg="Central", yang merupakan region dengan profit terkecil. Lalu memasukkan dan mengakumulasikan nilai profit ke dalam sebuah array dengan index state.

Block END:
* `for(key in profits) keysBackup[profits[key]]=key` digunakan untuk menukar nilai index dan valuenya pada array profits yang berguna agar menyimpan nilai pada saat menggunakan `asort()` dan disimpan pada array keysBackup
* `n = asort(profits, sortedProfits)` digunakan untuk melakukan sorting pada array profits dan meletakkannya pada array sortedProfits
* `print "print "2 State yang memiliki profit paling kecil: "` digunakan untuk print tulisan "2 State yang memiliki profit paling kecil: "
* `for(i=1; 3>i; i++)
    {
        print backupKeys[sortedProfits[i]], sortedProfits[i]
    }` untuk print value profit terkecil dengan menggunakan array backup dengan index  yang merupakan value terkecil dari profit.
* `Sample-Superstore.tsv` adalah file yang kita ambil datanya



### c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b

```bash
awk -F "\t" '
BEGIN {}
{reg=$13;productTemp=$17; stateTemp=$11;
	if(reg=="Central" && (stateTemp=="Texas" || stateTemp=="Illinois"))
	{
		profits[productTemp]=profits[productTemp]+$21+0
	}
}
END {
	for(key in profits)
		keysBackup[profits[key]]=key
	asort(profits, sortedProfits)
	print "10 Barang yang memiliki profit paling kecil:"	
	for(p=1; 11>p; p++)
	{
		print keysBackup[sortedProfits[p]], sortedProfits[p]
	}
	print "\n"
}' Sample-Superstore.tsv
```
#### Penjelasan
Block BODY:
*  `awk -F "\t"` digunakan untuk memakai awk dengan Field Seperator berupa tab
* `reg=$13;productTemp=$17; stateTemp=$11;
	if(reg=="Central" && (stateTemp=="Texas" || stateTemp=="Illinois"))
	{
		profits[productTemp]=profits[productTemp]+$21+0
	}` Pertama kita memasukkan nilai-nilai di kolom 13 kedalam variabel reg, kolom 11 ke stateTemp, dan Kolom 17 ke productTemp lalu mencek apakah reg="Central", yang merupakan region dengan profit terkecil dan stateTemp texas dan illinois, yang merupakan 2 state dengan profit terkecil di region central. Lalu memasukkan dan mengakumulasikan nilai profit ke dalam sebuah array dengan index nama productnya.

Block END:
* `for(key in profits) keysBackup[profits[key]]=key` digunakan untuk menukar nilai index dan valuenya pada array profits yang berguna agar menyimpan nilai pada saat menggunakan `asort()` dan disimpan pada array keysBackup
* `n = asort(profits, sortedProfits)` digunakan untuk melakukan sorting pada array profits dan meletakkannya pada array sortedProfits
* `print "10 Barang yang memiliki profit paling kecil:"` digunakan untuk print tulisan "10 Barang yang memiliki profit paling kecil:"
* `for(p=1; 11>p; p++)
    {
        print keysBackup[sortedProfits[p]], sortedProfits[p]
    }` untuk print 10 value profit terkecil dengan menggunakan array backup dengan index  yang merupakan value terkecil dari profit.
* `Sample-Superstore.tsv` adalah file yang kita ambil datanya

## Soal Nomor 2

### a. membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka.

#### Penyelesaian:

```bash
i=$RANDOM
i=$((i % 3))

case $i in
	1)
	str="$(cat /dev/urandom | tr -dc '0-9' | fold -w 1 | head -n 1)$(cat /dev/urandom | tr -dc 'A-Z' | fold -w 1 | head -n 1)$(cat /dev/urandom | tr -dc 'a-z' | fold -w 1 | head -n 1)"
	;;
	2)
	str="$(cat /dev/urandom | tr -dc 'A-Z' | fold -w 1 | head -n 1)$(cat /dev/urandom | tr -dc 'a-z' | fold -w 1 | head -n 1)$(cat /dev/urandom | tr -dc '0-9' | fold -w 1 | head -n 1)"
	;;
	*)
	str="$(cat /dev/urandom | tr -dc 'a-z' | fold -w 1 | head -n 1)$(cat /dev/urandom | tr -dc '0-9' | fold -w 1 | head -n 1)$(cat /dev/urandom | tr -dc 'A-Z' | fold -w 1 | head -n 1)"
	;;
esac

z=3
z=$((z - 2))

i=$RANDOM
i=$((i % z))
if [ $i -eq 0 ]
then
	pass="$str"
	if [ $((z + 2)) -gt 3 ]
	then
	pass="$pass$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $((z - 1)) | head -n 1)"
	fi
elif [ $i -eq $((z - 1)) ]
then
	if [ $((z + 2)) -gt 3 ]
	then
	pass="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $((z - 1)) | head -n 1)$str"
	else
	pass="$str"
	fi
else
	pass="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $i | head -n 1)"
	i=$((i + 3))
	z=$((z + 2))
	let j=$z-$i
	pass="$pass$str$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $j | head -n 1)"
fi
```
#### Penjelasan

* `cat dev/urandom` digunakan untuk membuat karakter sembarang, termasuk simbol.
* `tr -dc 'a-zA-Z0-9'` dipakai untuk mentranslasikan himpunan 1 jadi himpunan 2. Dalam kasus ini, tr dipakai untuk hanya mengeluarkan angka dan huruf dari dev/urandom.
* `fold` digunakan untuk membatasi banyak karakter yang dihasilkan.
* `head -n 1` digunakan untuk mengambilkan string dari baris awal sampai baris tertentu. Dalam kasus ini, head digunakan hanya untuk mengambil baris pertama hasil dev/urandom
* Cara kerjanya adalah pertama program akan merandom angka sebuah angka dan kemudian akan di modulo dengan 3 untuk menentukan randomnya 3 karakter pertama yang pasti memuat huruf besar, huruf kecil, dan angka. Lalu program akan merandom angka lagi dan dimodulo dengan jumlah karakter yang ingin ditampilkan dikurangi dengan karakter yang sudah di random sebelumnya. Tujuannya untuk menaruh 3 karakter pertama yang dirandom disalah satu tempat, bisa didepan, belakang atau tengah.





### b. Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.

```bash
filename=$1
cek1=${filename#*.}
cek2=$(echo ${filename%.*} | tr -d [A-Za-z])

if [ "$cek2" == "" ]
then
	if [ "$cek1" == "$1" ]
	then
				
		echo $pass > "$filename.txt"
	fi
fi
```
* `filename=$1` Nama file diambil dari argumen pertama.
* `cek1=${filename#*.}` mengambil nama file dari depan sebelum titik untuk di cek
* `cek2=$(echo ${filename%.*} | tr -d [A-Za-z])` mengambil nama file dari belakang dan kemudian menghapus karakter yang berupa huruf sehingga jika ada simbol seperti titik,dll akan dimasukkan kedalam variabel itu
* `echo $pass > "$filename.txt"` Password yang dihasilkan dicetak masuk ke dalam file sesuai dengan input argumen pertama dengan extensi txt.



### c. Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation)

```bash
str=$1
hour=$(stat $1 | grep -F "Modify")
hour=${hour%:*}
hour=${hour%:*}
hour=${hour##* }

case "$hour" in
...
"03")
	str=$(echo "${str%.*}" | tr '[A-Za-z]' '[D-ZA-Cd-za-c]')
;;
...
esac

str="${str}.txt"
```
#### Penjelasan

Pertama program akan mengambil jam file tersebut di modifikasi terakhir menggunakan stat dan grep kata "Modify" lalu kalimat tersebut di proses hingga hanya mendapatkan jam terakhir file tersebut di modify
Misal jam 3, dibaga sebagai string "03". Karakter "a" berubah jadi "d", karakter "b" berubah jadi "e", dst.
User hanya menginputkan nama file yang ingin di enkripsi nya saja, tidak dengan ekstensinya. Ekstensi txt akan dimasukkan secara otomatis ketika proses berjalan.

### d. jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.

```bash
str1=$1
hour=$(stat $1 | grep -F "Modify")
hour=${hour%:*}
hour=${hour%:*}
hour=${hour##* }

case "$hour" in
...
"03")
	str2=$(echo "${str1%.*}" | tr '[D-ZA-Cd-za-c]' '[A-Za-z]')
;;
...
esac

str2="${str2}.txt"
mv $str1 $str2
```

#### Penjelasan

Pertama program akan mengambil jam file tersebut di modifikasi terakhir menggunakan stat dan grep kata "Modify" lalu kalimat tersebut di proses hingga hanya mendapatkan jam terakhir file tersebut di modify
Misal jam 3, dibaca sebagai string "03". Karakter akan dishift 3 karakter sebelumnya. Contoh "d" berubah jadi "a", karakter "e" berubah jadi "b", dst.
User hanya menginputkan nama file yang ingin di dekripsi nya saja, tidak dengan ekstensinya. Ekstensi txt akan dimasukkan secara otomatis ketika proses berjalan.

## Soal Nomor 3
### a. membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" serta menyimpan log messages wget kedalam sebuah file "wget.log".
#### Penyelesaian:

```bash
i=1
name1="pdkt_kusuma_"

while [ $i -lt 29 ]
do
	str1="$name1$i"
	DL="https://loremflickr.com/320/240/cat"

	wget -O $str1 $DL -a "wget.log"
	i=$((i + 1))
done
```
#### Penjelasan

28 file didownload dari link "https://loremflickr.com/320/240/cat" dan disimpan dengan nama "pdkt_kusuma_NO". Log message dari wget disimpan pada wget.log.





### b. Membuat crontab setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu

```cron
5 6-23/8 * * 0-5 /home/noradier/modul1/soal3/soal3.sh
```
#### Penyelesaian:
Penulisan perintah untuk menjalankan file bash di crontab (sesuai ketentuan)
* `5 6-23/8 * * 0-5 /home/noradier/modul1/soal3/soal3.sh` penulisan crontab untuk setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu dan menjalankan file yang ada di /home/noradier/modul1/soal3/soal3.sh


### c. buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate

```bash
folderName="duplicate"
if [ ! -d "$folderName" ]
then
	mkdir "$folderName"
fi

name1="pdkt_kusuma_"
name2="duplicate_"

grep 'Location' "wget.log" >> "location.log"
i=1

while [ $i -lt 29 ]
do
	str1="$name1$i"
	cek1=$(cat location.log | head -$i | tail -1)
	j=1
	p=0
	limit=$(ls -1 | grep ^pdkt | wc -l)

	while [ $p -lt $limit ] 
	do
		if [ $i -ne $j ]
		then
			if [ -f "$name1$j" ]
			then
			cek2=$(cat location.log | head -$j | tail -1)
				if [ "$cek1" == "$cek2" ]
				then
				count=$(ls -1 ./duplicate | wc -l)
				count=$((count + 1))
				str2="$name2$count"
				mv $str1 $str2
				mv $str2 ./duplicate
				break
				fi
			fi
		fi
		j=$((j + 1))
		p=$((p + 1))
	done

	i=$((i + 1))
done
```
#### Penjelasan

Hasil download diperiksa satu per satu dengan satu sama lain untuk mendeteksi file yang sama. Semua file kecuali satu yang merupakan duplikat disimpan pada folder "duplicate" dengan nama "duplicate_NO". Pemeriksaan menggunakan location.log, file yang menyimpan lokasi URL dari log message wget.log. Tiap baris diperiksa dengan baris lainnya sesuai dengan iterasi pemeriksaan tiap file gambar.
Dipakai gabungan command ls dan wc untuk menghitung banyak file dalam folder "duplikat" dan dengan grep untuk menghitung banyak file hasil download yang tersisa.

```bash
folderName="kenangan"
if [ ! -d "$folderName" ]
then
	mkdir "$folderName"
fi

name1="pdkt_kusuma_"
name3="kenangan_"

i=0
j=1
limit=$(ls -1 | grep ^pdkt | wc -l)

while [ $i -lt $limit ]
do	
	if [ -f "$name1$j" ]
	then
		str1="$name1$j"
		count=$(ls -1 ./kenangan | wc -l)
		count=$((count + 1))
		str2="$name3$count"
		mv $str1 $str2
		mv $str2 ./kenangan

		i=$((i + 1))
	else
		j=$((j + 1))
	fi
done
```
#### Penjelasan
Setelah diperiksa file duplikat, semua file yang tersisa dipindahkan ke folder "kenangan" dengan nama "kenangan_NO".
Dipakai gabungan command ls dan wc untuk menghitung banyak file dalam folder "kenangan" dan dengan grep untuk menghitung banyak file hasil download yang tersisa.

```bash
cat wget.log >> wget.log.bak
cat location.log >> location.log.bak
```

#### Penjelasan
Log message wget dan location di backup ke dalam file berekstensi .log.bak.
