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
pass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
```
#### Penjelasan

* `cat dev/urandom` digunakan untuk membuat karakter sembarang, termasuk simbol.
* `tr -dc 'a-zA-Z0-9'` dipakai untuk mentranslasikan himpunan 1 jadi himpunan 2. Dalam kasus ini, tr dipakai untuk hanya mengeluarkan angka dan huruf dari dev/urandom.
* `fold -w 28` digunakan untuk membatasi banyak karakter yang dihasilkan.
* `head -n 1` digunakan untuk mengambilkan string dari baris awal sampai baris tertentu. Dalam kasus ini, head digunakan hanya untuk mengambil baris pertama hasil dev/urandom





### b. Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.

```bash
str=$1
str="${str//[[:digit:]]/}"
touch $str
echo $pass > $str
```
* `str=$1` Nama file diambil dari argumen pertama.
* `str="${str//[[:digit:]]/}"` semua digit dihilangkan dari nama file.
* `touch $str` membuat file baru dengan nama dari variabel str
* `echo $pass > $str` Password yang dihasilkan dicetak masuk ke dalam file sesuai dengan input argumen pertama.



### c. Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation)

```bash
hour=$(date +"%H")
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

Jam digunakan sebagai acuan enkripsi nama file sesuai enkripsi Caesar Cipher.
Misal jam 3, dibaga sebagai string "03". Karakter "a" berubah jadi "d", karakter "b" berubah jadi "e", dst.
Ekstensi dikeluarkan dari enkripsi. Ekstensi dikembalikan ketika proses enkripsi telah selesai
