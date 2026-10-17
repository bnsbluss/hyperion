# I3 Engine Editor V3

Memindahkan skin **Avatar V2** Point Blank ke **karakter V1**, supaya skin itu memakai bone V1:
skeleton, ragdoll, serta titik senjata dan helm (WeaponPointDummy / HelmetPointDummy).
Mesh dan tekstur tetap dari skin V2. Indeks bone di setiap vertex dipindahkan berdasarkan **nama bone**,
lalu hasilnya dibaca ulang dan diverifikasi otomatis.

## 
| Item | Keterangan |
|---|---|
| `I3Engine Tools V3.exe` | **Satu menu untuk semua alat di bawah ini.** Klik dua kali, pilih kartunya. Semua alat ada di dalam satu berkas exe ini; yang dibuka dijalankan sebagai program sendiri, jadi boleh dibuka beberapa sekaligus. Ada pencarian, saringan kategori, dan tema gelap/terang. |
| `I3Chara Convert Bone V3.exe` | Konversi skin V2 ke karakter V1. Klik dua kali. |
| `I3Scene Convert v3.exe` | Perbaiki file `.i3s` client baru (senjata dan karakter: skin, mask, headgear) supaya bisa dibuka i3Viewer2; hasilnya `<nama>_convert.i3s`. |
| `I3CHR Editor V3.exe` | Editor `.I3CHR` **karakter dan senjata** — jenis filenya dikenali sendiri waktu dibuka. Klik dua kali, atau jatuhkan file `.I3CHR` ke atasnya. |
| `I3CHR Maker V3.exe` | **Bikin `.I3CHR` senjata BARU dari nol** — tanpa menyalin senjata lain. Pilih jenis senjatanya, daftar state-nya terisi sendiri dari hasil sapuan 758 senjata bawaan. Klik dua kali. |
| `I3Path Editor V3.exe` | Editor jalur AI map (`World\<Map>\Path.i3Path`) di atas denah map. |
| `I3INS Editor V3.exe` | Editor objek map (`.i3INS`: respawn, kaca, kotak area) dalam tampilan 3D bertekstur atau denah map 2D. |
| `I3Bone Weight V3.exe` | Ikat bobot bone ke model yang belum ber-bone (mis. kepala baru dari OBJ). |
| `I3Collision Editor V3.exe` | Lihat, tambah, dan hapus collision map (`_Col_Hero.I3S` badan, `_Col_Hit.I3S` peluru) dalam tampilan 3D bertekstur atau di atas denah map. |
| `I3RSC Editor V3.exe` | Editor daftar resource `.RSC`: lihat/ubah tipe, nama, dan jalur tiap entri, tambah/hapus/geser, **ambil entri dari RSC lain**, serta buka dan simpan langsung dari dalam `.i3Pack`. Mengerti dua bentuk RSC sekaligus. Klik dua kali. |
| `I3RSC Editor V3.pyw` | Versi Python-nya (harus satu folder dengan `i3rsc.py` dan `i3pack.py`). |
| `I3Pack Editor V3.exe` | Editor paket `.i3Pack` (isi `Pack\` client): lihat, extract, ganti, tambah, hapus berkas di dalam pack, proteksi SECURE, drag & drop, File Browser, ikon per jenis file, dan konversi gambar `.i3VTexImage` <-> `.tga`. Klik dua kali. |
| `I3Pack Editor V3.pyw` | Versi Python-nya (harus satu folder dengan `i3pack.py` dan `i3vtex.py`). |
| `i3vtex.py` | Pustaka + CLI gambar atlas `.i3VTexImage` <-> `.tga` (dipakai menu konversi di editor pack). |
| `i3obj.py` | Pustaka + CLI ekspor mesh `.i3s` ke `.obj` (satu file dengan group, atau satu file per mesh). |
| `i3bersih.py` | Pustaka + CLI convert `.i3s` client baru ke format lama + buka enkripsi index array, bone dijaga. |
| `i3pack.py` | Mesin pack + command line (`python i3pack.py --help`). |
| `I3Chara Convert Bone V3.pyw` | Versi jendela untuk Python 3 (harus satu folder dengan `pindah_bone.py`). |
| `pindah_bone.py` | Mesin konversi + command line. |
| `I3Character Convert V3.zip` | Paket program + folder `Base Chara` untuk dibagikan. |
| `Base Chara\Female\REBEL_Female.I3S` | Sumber bone + animasi **perempuan**. |
| `Base Chara\Male\SWAT_Male.I3S` | Sumber bone + animasi **laki-laki**. |
| `Base I3CHR\SWAT_Female\SWAT_Female.I3CHR` | Sumber daftar animasi **perempuan** untuk file `.I3CHR` karakter hasil. |
| `Base I3CHR\SWAT_Male\SWAT_Male.I3CHR` | Sumber daftar animasi **laki-laki**. |
| `Base String\Character.txt` | Daftar nama dan keterangan karakter di game (teks UTF-16). Karakter baru ditambahkan ke file ini. |
| `Chara_Config\Character.i3RegXML` | Registry karakter game (dibuka dengan PropertyEditor). Karakter baru ditambahkan sebagai key baru di `RegistryRoot > Character`. |
| `Avatar\Skin\` | Skin V2 (badan), terpecah per LOD0–LOD3. |
| `Avatar\Mask\` | Wajah V2, untuk skin yang tanpa wajah. |
| `Avatar\Headgear\` | Rambut V2, untuk skin yang tanpa rambut. |
| `I3ToolsViewer\` | i3Viewer2, untuk memeriksa file `.i3s`. |

## Dua kategori karakter Avatar V2

Skin Avatar V2 dijual terpisah-pisah, jadi satu karakter selalu butuh tambahan:

| Kategori | Contoh | Yang harus ditambahkan |
|---|---|---|
| Skin **tanpa wajah** (pakai kerudung/topeng) | `Avatar\Skin\F_S_AR_Priest-Red` | **Wajah (Mask)**, mis. `Avatar\Mask\F_M_Chou` |
| Skin **tanpa rambut** (kepala sudah ada) | `Avatar\Skin\IF_S_Dajeong-Red` | **Rambut (Headgear)**, mis. `Avatar\Headgear\IF_H_Dajeong` |

Keduanya punya kolom sendiri di jendela program, jadi tinggal pilih yang sesuai. Kalau file salah kolom,
program menolak dan memberitahu kolom yang benar (wajah punya bobot bone, rambut menempel kaku).

## Cara pakai

1. Buka `I3Chara Convert Bone V3.exe` (atau `I3Chara Convert Bone V3.pyw`).
2. **Bone + animasi karakter**: pilih **Perempuan** (REBEL_Female) atau **Laki-laki** (SWAT_Male).
   Base-nya diambil otomatis dari folder `Base Chara` di samping program. Tombol **Base lain...**
   untuk memakai karakter V1 milik sendiri.
3. **Skin V2 (badan)**: pilih file `.i3s` skin. Kalau terpecah per LOD, pilih `..._LOD0` sampai `..._LOD3` sekaligus.
4. **Wajah (Mask)**: isi hanya kalau skin-nya tanpa wajah. Pilih semua file LOD mask-nya sekaligus.
5. **Rambut (Headgear)**: isi hanya kalau skin-nya tanpa rambut.
6. **Nama karakter hasil**: terisi otomatis dari nama skin. Dipakai untuk nama folder, nama file,
   dan path tekstur `Chara/<nama>/`.
7. **Nama di game (daftar)** dan **Keterangan**: tulisan yang muncul di game, terisi otomatis dari nama
   karakter (`Dajeong_Red` jadi `Dajeong {col:255,153,51,255}(Red){/col}`). Boleh diganti sendiri;
   `{col:r,g,b,a}...{/col}` adalah warna tulisannya di game.
8. **ID karakter (_IDNumber)** dan **UIShapeIndex**: nomor karakter di registry game. Keduanya terisi otomatis
   dengan nomor terbesar yang sudah ada + 1, dan boleh diganti sendiri.
9. Klik **Konversi**. Log menampilkan pasangan LOD, bone yang dialihkan, dan hasil verifikasi.
10. Klik **Buka folder hasil**, lalu salin folder itu ke folder `Chara` di game.

| Opsi | Default | Fungsi |
|---|---|---|
| Salin tekstur | aktif | Menyalin tekstur `.i3i` dari folder skin/wajah/rambut ke folder hasil. Kalau sebuah tekstur tidak ada di folder sumbernya, dicari juga di folder input lain, di folder program, dan di subfolder `Tekstur` sebelah program. |
| Buang Teamband | aktif | Mesh `Teamband_L` / `Teamband_R` (gelang tim) tidak dipasang. |
| Salin tekstur clan | aktif | Menyalin logo clan `Clan_PointBlank_Diff.i3i` dari folder `Avatar\Clan` sebelah program ke folder hasil. Semua skin V2 memakai tekstur ini di mesh `Model_Clan`; tanpa file itu i3Viewer2 selalu memintanya saat membuka hasil. |
| Buat file animasi `.I3CHR` | aktif | Membuat `<nama>\<nama>.I3CHR` dari `Base I3CHR`, dengan path `.I3S` diarahkan ke karakter ini. |
| Tambahkan ke `Base String\Character.txt` | aktif | Menambahkan baris `_Name` dan `Description` karakter ini ke daftar karakter game. |
| Tambahkan ke `Chara_Config\Character.i3RegXML` | aktif | Menambahkan key karakter baru di registry game, lengkap dengan `_ResPath`, `_IDNumber`, dan `UIShapeIndex`. |

### File `.I3CHR` dan daftar karakter (sejak 18 September 2026)

Sesudah konversi berhasil, program membuat dua hal lagi supaya karakternya langsung bisa dipakai di game.

**1. `<nama>\<nama>.I3CHR`** di folder hasil, disalin dari `Base I3CHR\SWAT_Female\SWAT_Female.I3CHR`
(kalau base-nya perempuan) atau `Base I3CHR\SWAT_Male\SWAT_Male.I3CHR` (laki-laki). Yang diubah **hanya
path file `.I3S`** di dalamnya, jadi `Chara\<nama>\<nama>.I3S`. **Nama set animasinya sengaja tidak
diubah** (tetap `SWAT_Female` / `SWAT_Male`): engine memakai nama itu untuk mencari animasi, dan karakter
resmi pun begitu — kalau nama itu diganti, client gagal memuat karakternya (`i3Chara::OnLoad` ...
`Asserted : pNewChara`). Hasilnya dibaca ulang dan diperiksa (semua AI, state, dan animasi).

**2. Dua baris di `Base String\Character.txt`**, yaitu nama dan keterangan karakter di game:

```
Character\<nama>\_Name        <TAB>  Harvest ViperRed {col:255,153,51,255}(Red){/col}
Character\<nama>\Description  <TAB>  {col:255,153,51,255}Belum Tersedia - By BlacklistPB{/col}
```

File itu tetap ditulis UTF-16 seperti aslinya dan baris lama tidak diubah. Kalau karakter dengan nama sama
sudah ada di situ, barisnya diperbarui di tempat, bukan ditambah dua kali. Sebelum diubah pertama kali, file
lama disalin ke `Base String\Character._backup.txt`, dan backup itu tidak pernah ditimpa lagi.

**3. Key karakter baru di `Chara_Config\Character.i3RegXML`**, di bawah `RegistryRoot > Character`. Key-nya
**disalin utuh dari karakter contoh yang sejenis kelamin** (`Harvest_ViperRed` untuk perempuan, `Boarder_Ucok`
untuk laki-laki), jadi semua nilai lain ikut apa adanya (HP, kecepatan jalan, `DamageRate`, `_SexType`, `_Type`,
dan seterusnya, untuk ke-16 negara). Yang diganti hanya:

| Nilai | Isi |
|---|---|
| nama key | nama karakter baru |
| `_ResPath` | `Chara/<nama>/<nama>.I3CHR` |
| `_IDNumber` | angka dari kolom **7. ID karakter** |
| `UIShapeIndex` | angka dari kolom **UIShapeIndex** |
| `__Make Time`, `__Update Time` | waktu sekarang |

Kedua nomor itu diusulkan otomatis dari nomor terbesar yang sudah ada + 1 (di file Anda sekarang `_IDNumber`
terbesar 465 dan `UIShapeIndex` terbesar 205, jadi usulannya 466 dan 206). Kalau `_IDNumber` yang diisi sudah
dipakai karakter lain, program **menolak** dan menyebut nama karakter yang memakainya; kalau `UIShapeIndex`-nya
kembar, program tetap menulis tapi memberi catatan di log. Karakter yang namanya sudah ada tidak diduplikat -
ketiga nilai itu saja yang diperbarui. File lama dibackup sekali ke `Chara_Config\Character._backup.i3RegXML`,
dan sesudah ditulis, XML-nya dibaca ulang serta dibandingkan: semua karakter lain harus sama persis.

Sesudah itu registry-nya tetap perlu Anda ubah ke bentuk yang dibaca client (`.Pef` lewat PropertyEditor)
seperti biasa; program ini hanya menulis file `.i3RegXML`-nya.

Kalau salah satu dari ketiga langkah ini gagal, hasil konversi `.I3S` tetap dipakai dan alasannya muncul di log.
Semuanya bisa dimatikan lewat Opsi.

## Skin yang bentuk skeleton-nya tidak seragam

Tidak semua skin V2 disusun sama:

- Sebagian (Dajeong, Priest) memakai 67 bone di LOD0/LOD1 dan 29 bone di LOD2/LOD3.
- Sebagian lagi (Gowoon, Dasom, SpiderNatasha) memakai **67 bone di semua LOD**.
- Ada juga yang seluruh skeleton-nya bergeser beberapa milimeter (Dasom turun 2,5 mm), atau yang vertex-nya
  menyimpan **warna** (Dasom, SpiderNatasha).

Semua bentuk itu sekarang diterima. Bone lebih yang tidak ada di LOD V1 (mis. bone jari di LOD2/LOD3)
otomatis dialihkan ke bone induknya, persis seperti cara karakter V1 membuat LOD jauhnya.

**Pasangan LOD mengikuti nama file** (sejak 17 September 2026). File skin `..._LOD0` masuk LOD0 base,
`..._LOD1` ke LOD1, dan seterusnya, selama bone-nya muat. Sebelumnya pasangan dipilih dari pose bone, dan pada
`IF_S_Dasom-Red` itu menukar LOD0 dan LOD2: badan penuh masuk LOD0 (tampilan orang pertama) dan lengan masuk
LOD2. Cek baris `LODx (...) <- ..._LODx.i3s` di log; kalau nomor di nama file tidak bisa dipakai, log
menulis *"PERINGATAN: nomor LOD di nama file ... tidak dipakai"*.

## Memilih Perempuan atau Laki-laki

Animasi pria dan wanita berbeda, jadi base harus sejenis dengan skin.

| Base | Untuk | Catatan |
|---|---|---|
| `Base Chara\Female\REBEL_Female.I3S` | skin + wajah perempuan | LOD0 dan LOD1-nya memakai satu skeleton, dan 12 bone jari (telunjuk & tengah) posenya berbeda dengan skin V2, jadi jari di model orang ketiga bisa sedikit meleset. Program memberi peringatan. |
| `Base Chara\Male\SWAT_Male.I3S` | skin + wajah laki-laki | Skin perempuan otomatis ditolak karena skeleton-nya beda. |

Wajah (Mask) juga ikut aturan ini: mask perempuan hanya cocok dengan base perempuan. Kalau tertukar,
pesan error-nya: *"pose bone-nya tidak cocok dengan base V1 (selisih 0.33)"*.

## Wajah (Mask)

Mask berisi kepala + wajah yang sudah di-skin ke bone `Head`, `Neck`, `Spine3`, dan biasanya terpecah
jadi beberapa file (`..._LOD1`, `..._LOD2`, `..._LOD3`). Program memasangkan file paling detail ke LOD
paling detail: LOD1 → LOD1, LOD2 → LOD2, LOD3 → LOD3. LOD0 (pandangan orang pertama) tidak dipasangi
wajah karena memang tidak terlihat.

Kalau file mask-nya kurang, LOD sisanya tidak dapat wajah dan program memberitahu lewat log:
*"LOD3: tidak ada wajah (Mask) / kepala yang cocok"* — jadi dari jauh karakter bisa tampak tanpa kepala.
Sebaiknya masukkan semua file LOD-nya.

## Rambut / headgear V2

Rambut di sistem Avatar V2 berupa part **Headgear** tersendiri. Bentuknya berbeda dengan wajah:
mesh-nya **tidak punya bobot bone** dan koordinatnya lokal terhadap titik pasang `Bone_HeadGearAttach`.

Tool ini mengubahnya menjadi mesh gaya V1: vertex diputar dan dipindahkan ke koordinat model memakai
matriks bone dummy di file rambut dikali posisi titik pasang dari skeleton skin, lalu diikat kaku ke
bone `Head` seperti rambut karakter V1 asli. Rotasinya otomatis, tidak ada yang perlu diatur.
Part seperti ini hanya dipasang di LOD orang ketiga (LOD1–LOD3).

## Tekstur yang tidak ikut di folder skin

Beberapa tekstur dipakai bersama dan tidak disertakan di folder skin V2, mis. `Clan_PointBlank_Diff.i3i`
(logo clan; skin merujuknya sebagai `Avatar/Clan_PointBlank_Diff.i3i`). Letakkan file clan di folder `Avatar\Clan`
sebelah program dan biarkan opsi **Salin tekstur clan** aktif: setiap konversi menyalinnya ke folder hasil
(log: *"tekstur disalin: Clan_PointBlank_Diff.i3i (dari folder clan)"*). Kalau log masih menyebut
*"tekstur tidak ditemukan: ..."*, ada dua cara lain:

- Taruh satu salinan file itu di folder program (atau di subfolder `Tekstur` sebelah program) — sejak itu
  setiap konversi menyalinnya sendiri ke folder hasil.
- Atau jangan pasang mesh-nya sama sekali: tambahkan `Model_Clan` di daftar buang mesh
  (`--drop-mesh Model_Clan` di command line).

Hal serupa bisa terjadi pada rambut: `IF_H_Middle_Spronk-Purple` merujuk tekstur normal/specular milik
varian **Yellow**, jadi kalau folder Yellow tidak ada, yang hilang hanya peta normal/specular-nya —
warna rambut tetap tampil.

## Enkripsi index array (IIA2)

Skin dari client baru kadang memakai index array terenkripsi. Data itu disalin apa adanya, dan tool akan
memberi peringatan seperti: *"N index array dari skin masih terenkripsi (IIA2)"*. Kalau mesh tampil rusak di
client lama, buka file hasilnya di i3Viewer2 lalu pilih **Cifrado → Quitar IIA2 y guardar**.
Skin Dajeong termasuk yang terenkripsi; skin Priest tidak.

## Sudah diuji di game (12 September 2026)

- `IF_S_Dajeong-Red` + rambut `IF_H_Dajeong`, base **Perempuan** (REBEL_Female): tampil benar di game
  (rambut, wajah, dan animasi karakter normal).
- Karakter hasil konversi + `.I3CHR` buatan editor (disalin dari `SWAT_Female.I3CHR`, **hanya path `.I3S`
  yang diganti**): masuk game, animasi idle dan senjata jalan normal. Cara ini yang dipakai untuk semua
  karakter di folder `Chara\`.

- `F_S_SX_HarvestFarmer-Red` (LOD0–LOD3, skin client baru lengkap dengan topi), base Perempuan
  (17 September 2026): bisa di-equip dan tampil lengkap dengan topi setelah perapian di atas.
- `IF_S_Dasom-Red` (LOD0–LOD3) + part `IF_H_Dajeong_Shaman-Blue`, base Perempuan (17 September 2026):
  tampil benar di game setelah LOD dipasangkan sesuai nama file. `IF_S_Dasom-Blue` + rambut
  `IF_H_Dasom_Hanbok-Red` juga jalan.

## Batasan

- Skeleton base dan skin harus sejenis (perempuan dengan perempuan, laki-laki dengan laki-laki).
  Kalau bone atau pose tidak cocok, tool menolak dan tidak membuat file.
- Class dari client baru yang tidak dikenal client lama dibuang otomatis: `i3ReflectMap*` (efek pantulan)
  dan `i3SpecHighlightsAttr` (parameter kilap).
- Bone khusus V2 dialihkan ke induknya: `Bone_HeadGearAttach` dan `Bone_FaceGearAttach` → `Head`,
  `Bone_HolsterAttach` → `R Thigh`, `Bone_BeltAttach` → `Pelvis`.
- Titik senjata dan helm memakai milik karakter base, bukan milik skin.
- Mesh lama karakter base yang tidak terpakai ikut tersimpan, sehingga file berukuran sekitar 2 MB.
  Ini tidak berpengaruh di game. **Jangan menyimpan ulang file hasil secara penuh di i3Viewer2 / tool
  i3Engine lain** hanya untuk membuangnya (lihat bagian berikut).

## Perapian otomatis untuk client lama (sejak 17 September 2026)

`Harvest_ViperRed` (skin `F_S_SX_HarvestFarmer-Red` dari client baru) terbuka di i3Viewer2 tapi tidak bisa di-equip
di game. Hasil uji bertahap di game: **node bernama `..._Alpha_...`** (bagian transparan topi
`A_H_FarmerHat_Harvest`) yang ditolak client. Sejak itu program otomatis:

| Yang dilakukan | Pesan di log |
|---|---|
| Kata `Alpha` di nama mesh diganti `Trans` (mis. `A_H_FarmerHat_Harvest_Trans_LOD1`) | - |
| `Model_Clan_LOD1..3` diseragamkan jadi `Model_Clan` seperti karakter V1 | - |
| Vertex color yang semuanya putih dibuang (tampilan sama) | *vertex color (semua putih) dibuang dari N mesh* |
| Tekstur yang tertanam di file skin ditulis jadi file `.i3i` di folder hasil | *tekstur tertanam dijadikan file: ...* |
| Normal map format client baru (0x07) tidak dipasang | *normal map format client baru (0x07) tidak dipasang* |

Dengan aturan ini hasil Harvest_ViperRed sama persis dengan file yang sudah jalan di game. Karakter lain yang
vertex color-nya putih (Dasom, SpiderNatasha, Samurai Girl) hasilnya sedikit berubah (warna putih dibuang); file
lama yang sudah jalan tidak perlu dikonversi ulang.

## File hasil jangan disimpan ulang di tool i3Engine

`Dasom_Red.I3S` (17 September 2026) bisa dibuka di i3Viewer2 tapi error di game. Penyebabnya: file hasil
konversi disimpan ulang oleh tool i3Engine (dari folder `Desktop\HeavyRain`), dan tool itu menulis ulang
seluruh file ke format barunya:

- versi header `0x90001` (file V1 dan hasil konversi: `0x80001`),
- daftar bone `BMA1` jadi `BMA2`,
- semua objek disusun ulang, objek yang tidak terpakai dibuang, dan ada byte sampah `CC CC CC CC`.

i3Viewer2 memakai engine baru sehingga tetap bisa membukanya, tapi client lama tidak. Kalau file hasil perlu
diubah, ulangi konversinya. Langkah **Cifrado → Quitar IIA2** tetap aman: `Dasom_Blue.I3S` yang sudah
di-strip masih berformat `0x80001` dan jalan di game.

## Pesan error yang umum

| Pesan | Artinya |
|---|---|
| `file base harus karakter V1 dengan tepat 1 i3Body ... Apakah base dan skin tertukar?` | File base bukan karakter V1. |
| `tidak ada body skin V2 yang cocok untuk LOD ...: bone X, Y tidak ada di sumber` | Skin-nya memang untuk skeleton lain; bone yang disebut tidak ada di file skin. |
| `nama bone-nya cocok tapi pose bind-nya beda jauh (51 dari 56 bone)` | Jenis kelamin base salah: skin perempuan dipasang di base laki-laki atau sebaliknya. |
| `... bukan file rambut (Headgear): mesh-nya punya bobot bone ...` | File itu wajah/mask, pindahkan ke kolom Wajah. |
| `... bukan file wajah (Mask) / kepala: mesh-nya menempel kaku ...` | File itu rambut/headgear, pindahkan ke kolom Rambut. |
| `... pose bone-nya tidak cocok dengan base V1 (selisih 0.33)` | Wajah perempuan dipakai dengan base laki-laki, atau sebaliknya. |
| `class ... di dalam mesh belum didukung` | Skin memakai class yang belum dikenal tool. Simpan log-nya untuk ditambahkan dukungannya. |

Windows SmartScreen atau antivirus bisa memperingatkan `I3Chara Convert Bone V3.exe` karena exe-nya tidak bertanda tangan.
Di SmartScreen pilih **More info → Run anyway**.

## Command line

`pindah_bone.py` dan `I3Chara Convert Bone V3.exe` menerima argumen yang sama. Exe menulis log ke `I3Chara Convert Bone V3.log`.

```
python pindah_bone.py --gender female --skin Avatar\Skin\IF_S_Dajeong-Red\IF_S_Dajeong-Red_LOD0.i3s --skin Avatar\Skin\IF_S_Dajeong-Red\IF_S_Dajeong-Red_LOD1.i3s --skin Avatar\Skin\IF_S_Dajeong-Red\IF_S_Dajeong-Red_LOD2.i3s --skin Avatar\Skin\IF_S_Dajeong-Red\IF_S_Dajeong-Red_LOD3.i3s --headgear Avatar\Headgear\IF_H_Dajeong\IF_H_Dajeong.I3S --out Dajeong_Red\Dajeong_Red.I3S --tex-prefix "Chara/Dajeong_Red/" --copy-tex --clan-dir Avatar\Clan --drop-mesh Teamband
```

| Argumen | Fungsi |
|---|---|
| `--gender female` / `--gender male` | Base V1 bawaan dari folder `Base Chara`. |
| `--base FILE` | Karakter V1 lain sebagai sumber bone (pengganti `--gender`). |
| `--skin FILE` | Skin V2 (badan). Ulangi untuk setiap file LOD. |
| `--mask FILE` | Wajah V2 dari `Avatar\Mask`. Ulangi untuk setiap file LOD. |
| `--headgear FILE` | Rambut V2 dari `Avatar\Headgear`. Boleh diulang. |
| `--part FILE` | Part tambahan lain; jenisnya dikenali sendiri. |
| `--out FILE` | File `.I3S` hasil. |
| `--tex-prefix TEKS` | Path tekstur di dalam game, misalnya `Chara/Dajeong_Red/`. |
| `--copy-tex` | Salin tekstur ke folder hasil. |
| `--clan-dir FOLDER` | Folder logo clan (mis. `Avatar\Clan`); tekstur clan yang dipakai skin ikut disalin ke folder hasil. |
| `--drop-mesh TEKS` | Jangan pasang mesh yang namanya mengandung teks ini. Boleh diulang. |
| `--head`, `--head-exclude=TEKS` | (Hanya command line, sudah tidak ada di jendela program.) Pasang kepala asli karakter V1, kecuali bagian yang cocok dengan TEKS. |
| `--no-fit-bind` | Jangan sesuaikan inverse bind LOD base dengan skin (normalnya disesuaikan otomatis). |

Di PowerShell, tulis `--head-exclude=` (tanpa tanda kutip kosong) untuk memasang semua bagian kepala.

## I3Scene Convert v3 (program kedua: file I3S client baru, senjata dan karakter)

`I3Scene Convert v3.exe` memperbaiki file `.i3s` **dari client baru** (file yang tidak bisa dibuka i3Viewer2) supaya
bisa dibuka i3Viewer2, dipakai client lama, dan untuk karakter dipakai sebagai skin di I3Chara Convert Bone V3.
Jenis file dikenali otomatis:

| Jenis | Contoh | Yang dilakukan |
|---|---|---|
| **Karakter** (skin, mask, headgear) | `Avatar\Skin\F_S_SX_HarvestFarmer-Red\F_S_SX_HarvestFarmer-Red_LOD1.i3s`, `Avatar\Headgear\A_H_FarmerHat_Harvest\A_H_FarmerHat_Harvest.I3S` | lihat tabel karakter di bawah |
| **Senjata** | `Weapon\Harvest_Pitchfork\Harvest_Pitchfork.I3S` | mode mandiri, lihat tabel senjata di bawah |
| Sudah format lama | skin V2 biasa seperti `F_S_AR_Priest-Red` | dilewati, tidak perlu dikonversi |

Cara pakai:

1. Buka `I3Scene Convert v3.exe`, di **1. File I3s** klik **Pilih...**. Boleh memilih beberapa file sekaligus, mis.
   `LOD0` sampai `LOD3` sebuah skin. Di bawah kolomnya muncul jenisnya, mis. "4 file: karakter 4".
2. Hasilnya disimpan **di folder yang sama** dengan nama file ditambah **`_convert.i3s`**, mis.
   `F_S_SX_HarvestFarmer-Red_LOD1_convert.i3s`. Untuk satu file, nama hasil dan foldernya boleh diubah.
3. **Path tekstur di game**: kosongkan supaya path tekstur di dalam file tidak diubah (untuk skin memang begitu).
4. Klik **Konversi**. Setiap hasil dibaca ulang dan diperiksa (log: *Verifikasi OK*).
5. Buka hasilnya di **i3Viewer2**, lalu **Cifrado → Quitar IIA2 (strip)** dan simpan (index array client baru
   terenkripsi).
6. Karakter: pilih keempat file `_convert.i3s` di kolom **2. Skin V2** I3Chara Convert Bone V3 seperti skin V2 biasa.

Yang diubah pada file **karakter**:

| Masalah di file client baru | Yang dilakukan |
|---|---|
| Pembungkus **I3SN** 4 byte di depan | dilepas |
| Format vertex **Platform 8** (tangent punya slot `w`, mis. `0x2008C4AF`) | ditulis ulang jadi VA30 biasa seperti skin V2 lama |
| **i3SamplerAttr** (daftar tekstur baru) | `i3TextureEnableAttr` + `i3TextureBindAttr` (tekstur `_Diff`) |
| `i3MaterialAttr` gaya baru (`MAT2`, 108 byte) | material lama 68 byte; warna dan shininess diambil dari `MAT2` |
| **i3AlphaBlendAttr** | rambut: `i3AlphaTestEnableAttr` + `i3AlphaFuncAttr` (acuan 50); bagian transparan topi: + `i3BlendEnableAttr` + `i3BlendModeAttr` |
| Tekstur `_Norm`/`_Spec`/`_Ref`/`_Emissive` yang tidak dipakai lagi | dibuang dari file |

Catatan karakter:

- Skin memakai tekstur dari folder lain juga: topi `Avatar\Headgear\A_H_FarmerHat_Harvest\` dan logo clan
  `Avatar\Clan_PointBlank_Diff.i3i`. Dengan opsi **Salin tekstur** tekstur itu disalin ke folder hasil (logo clan diambil
  dari `Avatar\Clan`), jadi i3Viewer2 tidak bertanya lagi. Tekstur yang tidak ketemu disebut di log (PERINGATAN).
- Normal map client baru memakai format tekstur baru (`0x07`), karena itu defaultnya hanya tekstur warna yang dipasang.
- Diuji: HarvestFarmer-Red LOD0–LOD3 dan topi A_H_FarmerHat_Harvest terbuka di i3Viewer2 lengkap dengan tekstur
  (status bar: `VA30 P8=0 NewClass=0`), lalu keempat LOD dikonversi I3Chara Convert Bone V3 ke base perempuan:
  Verifikasi OK dan karakter tampil lengkap dengan topi. **Belum diuji di game.**

Mode **senjata** (mandiri) tidak mengubah bentuk, bone, maupun ukuran senjata — hanya bagian yang bikin file itu ditolak:

| Masalah di file client baru | Yang dilakukan |
|---|---|
| Pembungkus **I3SN** 4 byte di depan | dilepas, jadi file `I3R2` biasa |
| Format vertex **Platform 8** (`0x200004A7`, tangent punya slot `w`) | ditulis ulang jadi VA30 biasa |
| Material **i3SamplerAttr / i3RasterizerAttr / i3AlphaBlendAttr** | diganti material gaya lama: `i3TextureEnableAttr` + `i3TextureBindAttr` + `i3MaterialAttr` |
| `i3MaterialAttr` gaya baru (tag `MAT2`, 108 byte, parameter PBR) | diganti material V1 68 byte: ambient, diffuse, emissive, specular, shininess terisi |
| Index array terenkripsi (**IIA2**) | tidak bisa dibongkar dari luar — lihat langkah di bawah |

Senjata hasil: buka di **i3Viewer2**, **Cifrado → Quitar IIA2 (strip)**, simpan (status bar jadi *"Cifrado: limpio (sin
hits)"*), lalu salin ke folder `Weapon` di game.

Catatan tekstur: file client baru memakai tekstur gaya **PBR**. Hanya tekstur warna (`_Diff`) yang cocok
dengan material lama; `_Norm` dan `_Spec` kalau dipasang malah membuat model **merah**. Karena itu defaultnya
hanya tekstur warna yang dipasang. Opsi *"Pasang juga peta normal + specular"* disediakan untuk mencoba-coba.

```
python pindah_karakter.py --file Avatar\Skin\F_S_SX_HarvestFarmer-Red\F_S_SX_HarvestFarmer-Red_LOD0.i3s --file Avatar\Skin\F_S_SX_HarvestFarmer-Red\F_S_SX_HarvestFarmer-Red_LOD1.i3s
python pindah_karakter.py --file Avatar\Headgear\A_H_FarmerHat_Harvest\A_H_FarmerHat_Harvest.I3S --copy-tex
python pindah_karakter.py --file Weapon\Harvest_Pitchfork\Harvest_Pitchfork.I3S
```

| Argumen | Fungsi |
|---|---|
| `--file FILE` | File `.i3s` client baru; boleh diulang. Karakter atau senjata dikenali otomatis. |
| `--out FILE` | File hasil (hanya untuk satu `--file`). Bawaan: `<nama>_convert.i3s` di folder yang sama. |
| `--tex-prefix TEKS` | Folder tekstur di game. Bawaan: path tekstur di file tidak diubah. |
| `--copy-tex` | Salin tekstur ke folder hasil. |
| `--peta-lengkap` | Pasang juga peta normal + specular. |

Program lama untuk senjata tetap ada (`python pindah_senjata.py --senjata ... --out ...`), termasuk **mode pindah bone**
`--base Weapon\Kukrii\Kukrii.I3S` yang memutar mesh dari rantai bone senjata baru ke rantai bone senjata V1, menulis
ulang tangent/binormal ke gaya V1 (bilangan tetap 16.16), dan memakai material serta fisika senjata V1 itu. Kolom
"Senjata V1" sudah tidak ada di jendela program; mode itu hanya lewat command line.

## I3CHR Editor V3 (program ketiga: daftar animasi karakter dan senjata)

File `.I3CHR` menyimpan **daftar animasi dan mesin status** sebuah karakter — file `.I3S` hanya menyimpan
mesh dan bone-nya. Isinya:

| Bagian | Contoh |
|---|---|
| `i3Chara` | akar: nama karakter + path `.I3S`-nya |
| `i3AIContext` | pohon: `Lower > Stand`, `Upper > 1PV > AssaultRifle > AK-47 > AttackIdle` |
| `i3AI` | mesin status + "driver"-nya (`AIDriverCharaLower`, `AIDriverCharaUpper_AssaultRifle`, ...) |
| `i3AIState` | satu status: `Back`, `Idle`, `Attack`, `JumpStart`, `DeathBackA`, ... |
| `i3Animation` | path file animasi `.i3a`, mis. `CHARA/SWAT_FEMALE/3PV/COMMON/LOW_STAND_MOVEBACK.I3A` |

`SWAT_Female.I3CHR` misalnya berisi 1.291 AI, 16.132 state, dan 4.385 animasi.

**Senjata memakai file `.I3CHR` yang sama bentuknya**, cuma jauh lebih kecil, jadi sejak 22 September 2026
program ini menangani keduanya: file yang dibuka dikenali sendiri, dan tampilannya ikut berganti — lihat
bagian **Mode senjata** di bawah.

Yang bisa dikerjakan:

1. **Lihat pohonnya** — klik cabang AI untuk melihat daftar state-nya.
2. **Membuat karakter baru dari karakter lain** — salin `.I3CHR` milik karakter yang animasinya mau
   dipakai (mis. `SWAT_Female.I3CHR`), lalu **ganti kolom "File .I3S" saja** jadi
   `Chara\<NamaBaru>\<NamaBaru>.I3S`, simpan sebagai `<NamaBaru>.I3CHR` di folder karakter itu.
   **Kolom "Nama" jangan diubah**: engine memakainya untuk mencari set animasi, dan karakter resmi pun
   begitu — `Chou_HalloweenNurse.I3CHR` isinya tetap bernama `SWAT_Female`. Kalau nama itu diganti,
   client gagal memuatnya (`i3Chara::OnLoad` ... `Asserted : pNewChara`).
3. **Ubah identitas karakter** — kotak "Karakter" di atas: nama (node `i3Chara`) dan path file `.I3S`
   yang dipakai (`Chara\SWAT_Female\SWAT_Female.I3S`). Berguna kalau file ini mau dipakai karakter lain.
4. **Ubah satu state** — ganti path animasi, kecepatan (1 = normal), dan waktu blend (detik), lalu Simpan.
5. **Cari & ganti massal** — mis. ganti `SWAT_FEMALE` jadi `REBEL_FEMALE` di semua path sekaligus
   (4.383 path sekali klik), supaya karakter memakai animasi karakter lain.
6. **Ekspor/impor CSV** — bongkar jadi tabel, edit di Excel, lalu tulis balik. Nilai angkanya ditulis
   dengan 9 angka penting supaya tidak berubah sendiri waktu diimpor.
7. **Tambah state** dan **salin cabang senjata** — lihat dua bagian di bawah.

Setiap kali menyimpan, file dibaca ulang dan dicek: jumlah AI, state, animasi, dan isinya harus sama
dengan yang ada di layar. Menyimpan tanpa mengubah apa pun menghasilkan file yang **identik byte-per-byte**
dengan aslinya.

```
python i3chr.py --file SWAT_Female.I3CHR --daftar
python i3chr.py --file SWAT_Female.I3CHR --ganti SWAT_FEMALE REBEL_FEMALE --out SWAT_Female_baru.I3CHR
python i3chr.py --file SWAT_Female.I3CHR --nama Rica_Female --scene "Chara\Rica_Female\Rica_Female.I3S" --out Rica_Female.I3CHR
python i3chr.py --file SWAT_Female.I3CHR --ekspor SWAT_Female.csv
python i3chr.py --file SWAT_Female.I3CHR --impor SWAT_Female.csv --out SWAT_Female_baru.I3CHR
```

### Mengisi atau mengganti animasi satu state

Klik satu state di pohon, lalu isi panel kanan:

- **Animasi** - path file `.i3a`. Bisa diketik sendiri, atau klik **Pilih dari paket...**, pilih file
  `.i3AnimPack`, lalu pilih animasinya (ada kotak cari): path dan durasinya langsung terisi.
- **Durasi** - panjang animasinya dalam detik. Kalau dikosongkan atau tidak disentuh, program mengambilnya dari
  state lain yang sudah memakai animasi yang sama.
- Klik **Terapkan ke state ini**, lalu **Simpan**.

State yang **belum punya animasi** ditandai `(kosong)` di pohon - misalnya `UI_IdleA`/`UI_IdleB` beberapa senjata,
yang membuat idle di layar Info Detail terlihat tegang (kasus Saiga_BlackTortoise). State seperti itu sekarang bisa
langsung diisi di sini.

Mengganti animasi di panel ini **hanya mengubah state itu**; state lain yang memakai animasi yang sama tidak ikut
berubah. Kalau path yang diisi belum pernah ada di file, program menambahkan entri animasi baru untuknya. Huruf besar
atau kecil tidak masalah, game tidak membedakannya. Animasinya juga boleh diambil dari paket senjata lain: game
mencarinya di semua paket (terbukti: Saiga_BlackTortoise memakai idle dari paket shotgun biasa).

### Menambah state baru

Kalau senjatanya sama sekali belum punya state yang dibutuhkan - misalnya Baseball_Bat tidak punya `UI_IdleA` dan
`UI_IdleB` - klik cabangnya (mis. `AttackIdle`) atau salah satu state di dalamnya, lalu klik **Tambah state ke cabang
ini...** di bawah pohon. Pilihan di daftar berisi nama state yang dimiliki senjata lain dengan driver yang sama tapi
belum ada di sini; nama lain juga boleh diketik sendiri.

- State baru muncul bertanda `(kosong)` di posisi urut abjad dan langsung terpilih. Isi **Animasi** (atau **Pilih dari
  paket...**), atur **Waktu blend** (idle lobby resmi memakai 0,3), klik **Terapkan ke state ini**, lalu **Simpan**.
- Isinya (bendera perilaku, kecepatan, blend) disalin dari state bernama sama milik senjata yang paling mirip - untuk
  Baseball_Bat itu M-7 versi 3PV. Catatan di bawah jendela memberi tahu dari mana isinya disalin.
- Susunan objek di dalam file diatur supaya polanya tetap sama dengan file resmi; nomor objek lain tidak ada yang
  bergeser.

Ada 16 senjata di SWAT_Female yang belum punya `UI_IdleA`/`UI_IdleB` sama sekali (8 pisau, 3 Mission, 2 SMG, dan
masing-masing 1 ShotGun, DualKnife, Shield).

### Menyalin cabang senjata (mis. membuat AI Harvest_Pitchfork dari 2023_U20_WC_Trophy)

Untuk senjata yang belum punya cabang AI sama sekali, salin cabang senjata yang gerakannya paling mirip:

1. Klik cabang senjatanya di pohon, mis. `Upper > 1PV > Knife > 2023_U20_WC_Trophy`.
2. Klik **Salin cabang ini...** di bawah pohon, lalu ketik nama baru (mis. `Harvest_Pitchfork`).
3. Biarkan **Sekalian salin cabang yang sama di Upper > 3PV > Knife** tercentang, supaya 1PV dan 3PV dibuat sekaligus.
4. Klik **Salin**, periksa cabang barunya di pohon, lalu **Simpan**.

- Seluruh isi cabang ikut tersalin: cabang anak (`AttackIdle`), AI, dan semua state beserta bendera, kecepatan,
  blend, durasi, dan event-nya. Cabang asal tidak berubah, dan nomor objek lain tidak ada yang bergeser.
- Cabang baru **memakai animasi cabang asal** (untuk Trophy:
  `Chara/SWAT_Female/1PV/2023_U20_WC_Trophy/2023_U20_WC_Trophy/Attack_A.i3a` dan seterusnya), jadi langsung ada
  gerakannya.
- Kalau paket animasi dengan nama baru sudah ada (path seperti `.../Harvest_Pitchfork/Harvest_Pitchfork/Attack_A.i3a`),
  centang **Ganti teks di path animasi cabang baru**. Teks nama lama di path diganti nama baru **hanya di cabang
  baru**. Jangan pakai kotak *Cari & ganti* di bawah untuk ini: kotak itu mengubah path di seluruh file, termasuk
  cabang asal.
- Animasi per state tetap bisa diganti satu per satu lewat panel kanan.
- Penyalinan ditolak kalau nama itu sudah ada di induk yang sama, kalau yang dipilih cabang paling atas
  (`Upper`/`Lower`), atau kalau cabangnya memakai event berisi suara (senjata lempar seperti K-400, HK45 dual, busur).
  Untuk kasus terakhir, pakai senjata lain sebagai contoh. Kalau salah satu dari 1PV/3PV ditolak, tidak ada yang
  disalin sama sekali.
- Cabang ini dibuat per file: ulangi di `.I3CHR` karakter lain yang juga harus bisa memegang senjata itu.

```
python i3chr.py --file SWAT_Female.I3CHR --salin-cabang "Upper>1PV>Knife>2023_U20_WC_Trophy" Harvest_Pitchfork --salin-cabang "Upper>3PV>Knife>2023_U20_WC_Trophy" Harvest_Pitchfork --out SWAT_Female_baru.I3CHR
```

### Mode senjata (sejak 22 September 2026)

File `.I3CHR` senjata isinya sama bentuknya dengan milik karakter, cuma jauh lebih ringkas:

| | karakter | senjata |
|---|---|---|
| `i3AIContext` | ribuan, berpohon | **satu** |
| `i3AI` | 1.291 | **satu**, driver `AIDriverMasterGun_Type` |
| `i3AIState` | 16.135 | 11 (senjata V1) sampai 17 (senjata V3) |
| rantai suara di dalam state | tidak ada | **ada** — bunyi reload, kokang, lepas magasin |

Begitu file dibuka, tulisan tebal di atas jendela menyebut **KARAKTER** atau **SENJATA** beserta isinya,
dan tampilan yang cocok yang dipasang. Yang hanya ada di mode senjata:

- **Daftar state beserta suaranya.** Tiap state bisa dibuka dan isinya berupa baris `suara 1`, `suara 2`,
  ... lengkap dengan detik keberapa bunyinya dipicu, file `.wav`-nya, dan panjang suaranya. Klik barisnya
  untuk mengubah ketiganya. Satu file `.wav` biasanya dipakai banyak peristiwa sekaligus — kalau
  filenya diganti, program menyebutkan berapa peristiwa yang ikut berubah.
- **Kolom "Ulang".** Menandai state yang bendera "diputar berulang"-nya menyala.
- **Tombol "Perbaiki untuk V1".** Bendera "ulang" itulah yang bikin senjata V3 **tidak bisa menembak**
  di client V1 dan animasi `Idle`-nya diam. Tombol ini membersihkannya — perubahannya cuma **4 byte**,
  semua state, animasi, suara, dan durasi tetap seperti aslinya. Sudah terbukti di game.
- **Tombol "Konversi dari senjata lain..."** Memakai susunan state senjata V1 sebagai rangka lalu
  mengisinya dengan animasi dan suara senjata lain. Dipakai kalau file donornya terlalu berbeda untuk
  sekadar diperbaiki benderanya.
- **Tombol "Periksa durasi".** Membandingkan durasi tiap state dengan panjang animasi sebenarnya di
  `.i3AnimPack` senjata itu (dicari sendiri di sebelah file `.I3CHR`). Yang tidak cocok ditandai merah.
  Angka durasi di `.I3CHR` cuma salinan — engine memutar animasi sepanjang aslinya, jadi yang harus
  diperbaiki animasinya, lewat **I3Anim Editor V3**.
- **Tombol "Pilih..."** di sebelah kotak Animasi: ambil animasi langsung dari `.i3AnimPack` senjata itu,
  path dan durasi aslinya terisi berdua sekaligus. Ini cara paling aman supaya durasinya tidak meleset.

Kenapa senjata harus lewat tampilan ini dan bukan tampilan karakter: objek `i3SoundNode` menyimpan 52 byte
(`SND1`) **di luar** ukuran yang tercatat di tabel objek. Kalau objek itu membesar — misalnya nama
suaranya diganti jadi lebih panjang — ia pindah ke ekor file, dan tanpa penanganan khusus 52 byte itu
tertinggal. Client lalu menolak seluruh file (`i3SoundNode::OnLoad : Could not read data`), senjatanya
tetap kelihatan di tangan tapi **tidak punya mesin status sama sekali, jadi tidak bisa menembak**.
Sekarang pengamanan itu ada di dasar program, jadi semua penyimpanan aman — termasuk file karakter, yang
ternyata juga punya 37 `i3SoundNode` semacam itu (cabang senjata lempar, HK45 dual, busur).

```
python i3senjata.py --file BB_PinkDragon.I3CHR
python i3senjata.py --file BB_PinkDragon.I3CHR --perbaiki-v1 --out BB_PinkDragon_V1.I3CHR
python i3senjata.py --file AKS74U.I3CHR --donor BB_PinkDragon.I3CHR --out BB_PinkDragon.I3CHR
```

## I3Anim Editor V3 (program keempat: paket animasi .i3AnimPack)

Klik dua kali `I3Anim Editor V3.pyw`. Jendelanya dibagi tiga kolom: daftar **animasi** di kiri, daftar **trek**
(tulang) di tengah, dan **kunci** (isi gerakan per frame: waktu, posisi, rotasi) di kanan.

Cara pakai:

1. **Buka...** lalu pilih file `.i3AnimPack`, misalnya `Chara_SWAT_Female_Assault.i3AnimPack`.
2. Klik animasi yang mau diubah di kolom kiri. Kolom tengah langsung menampilkan tulang-tulangnya; klik salah satu
   tulang untuk melihat gerakannya frame demi frame.
3. **Ganti gerakan dari paket ini...** untuk menukar gerakan antar animasi di file yang sama, atau
   **Ganti gerakan dari paket lain...** untuk mengambil gerakan dari file `.i3AnimPack` lain. Yang muncul di daftar
   pilihan cuma animasi yang jumlah trek dan tipenya sama, jadi tidak bisa salah pilih.
4. Kalau durasinya beda, program menawarkan menyamakan dengan durasi slot lama - **terima saja**, kalau tidak
   gerakannya selesai lebih cepat/lambat daripada timer senjata dan kelihatan aneh.
5. **Ekspor .i3a...** menyimpan animasi yang dipilih sebagai file `.i3a` mandiri (wadah I3R2 berisi
   `i3TransformSequence`, sama seperti file animasi lepas bawaan engine). Program akan meminta file **`.I3S`
   karakternya** - ini penting: kebanyakan tulang tidak menyimpan posisi di animasi, jadi posisinya harus diambil
   dari skeleton. Tanpa itu engine mengeluh *"Invalid value of matrix in Skeleton Bone"* dan modelnya rusak.
6. **Nama** dan **Durasi (detik)** bisa diubah langsung lewat kotak di bawah.
7. **Simpan** atau **Simpan sebagai...**. Hasilnya langsung dibaca ulang dan diperiksa.

Simpan dulu file aslinya sebelum ditimpa - ukuran file hasil bisa berbeda dari aslinya.

## i3anim.py (versi baris perintah)

Satu file `.i3AnimPack` menyimpan puluhan sampai ratusan animasi untuk satu karakter + satu jenis senjata,
misalnya `Chara_SWAT_Female_Assault.i3AnimPack` berisi 117 animasi (AK47, AN94, AS_Val, ...).

```
python i3anim.py --file Chara_SWAT_Female_Assault.i3AnimPack --daftar
python i3anim.py --file Chara_SWAT_Female_Assault.i3AnimPack --trek 4
python i3anim.py --file Chara_SWAT_Female_Assault.i3AnimPack --salin Chara_SWAT_Female_Assault.i3AnimPack 7 4 --durasi 4 2.5 --out baru.i3AnimPack
```

- `--daftar` : nomor, tipe, jumlah trek (tulang), durasi, dan nama tiap animasi.
- `--trek NO` : daftar tulang yang dipakai animasi itu (`IK`, `Spine1`, `R Hand`, ...), jumlah kunci, durasi.
- `--salin PAKET NO_SUMBER NO_TUJUAN` : tukar isi satu animasi dengan animasi lain. Misalnya biar gerakan
  `Reload_A` memakai gerakan `Reload_B`.
- `--durasi NO DETIK` : ubah panjang animasi. **Hampir selalu perlu sesudah `--salin`** - animasi yang dicomot
  biasanya durasinya beda dari slot tujuannya, jadi gerakannya selesai duluan lalu tangan menggantung menunggu
  timer reload senjata habis (itu yang bikin "agak aneh"). Samakan dengan durasi asli slot tujuan.
- `--ganti-nama NO NAMA`, `--ekstrak NO FILE`, `--ganti NO FILE` untuk pekerjaan lanjutan.
- Hasil disimpan dengan `--out`, dan langsung diperiksa ulang (kolam kunci harus utuh).

- `--kunci NO TREK` : tampilkan isi kunci satu tulang - waktu, posisi, dan rotasi tiap frame.
- `--i3a NO FILE` : ekspor satu animasi jadi file `.i3a` mandiri; pakai bersama
  `--skeleton FILE.I3S` supaya posisi tulangnya benar.

Gerakan (kunci posisi dan rotasi) disimpan dalam satu kolam bersama di depan file, dan animasi cuma menyimpan
*nomor* kunci. Kalau animasi dicomot dari paket lain, program memetakan ulang nomor-nomor itu dan menambahkan
kunci yang belum ada ke kolam, jadi menyalin antar paket sekarang aman. Syaratnya jumlah trek dan tipenya sama.

Penanda versi `APF1`, `APF2`, dan `APF3` isinya sama saja, jadi ketiganya bisa dibuka.

**Yang belum bisa:** sekitar 37 paket APF3 dan hampir semua paket APF2 susunannya masih belum dikenal - daftar,
tukar animasi sepaket, dan ubah durasi tetap jalan, tapi baca/salin kunci ditolak dengan pesan yang jelas.

## I3Path Editor V3 (program kelima: jalur AI map .i3Path)

File `World\<Map>\Path.i3Path` menyimpan **jalur jalan AI** sebuah map: titik-titik yang dilewati bot dan
sambungan antar titik. Crackdown punya 48 titik dan 69 sambungan.

Cara pakai:

1. Klik dua kali `I3Path Editor V3.exe` (atau `.pyw`), **Buka...**, pilih misalnya `World\Crackdown\Path.i3Path`.
2. Kalau di folder yang sama ada `<Map>_World.I3S` (mis. `Crackdown_World.I3S`), **denah map dari atas** langsung
   digambar di belakang jalur: dinding dan benda terlihat terang, lantai gelap. Kalau tidak ketemu, klik
   **Pilih mesh...**.
3. Pilih alat di kanan (atau tekan 1-4 sesudah mengeklik denah):
   - **1 Pilih / geser titik** - klik titik lalu seret untuk memindahkannya; klik garis untuk memilih sambungan.
   - **2 Tambah titik** - klik di denah. Kalau ada titik terpilih, titik baru langsung disambung darinya, jadi
     jalur bisa digambar beruntun.
   - **3 Sambung dua titik** - klik titik pertama lalu titik kedua.
   - **4 Hapus** - klik titik (sambungannya ikut terhapus) atau klik garis sambungan.
4. Panel **Titik terpilih**: ubah X, Y (tinggi), Z, dan Nilai, lalu **Terapkan**. **Y = permukaan** menaruh titik
   di atas permukaan denah.
5. Panel **Sambungan terpilih**: **Dua arah** (bot bisa lewat bolak-balik) atau satu arah (garis merah berpanah,
   mis. lompat turun dari tempat tinggi), **Balik arah**, **Hapus sambungan**.
6. **Simpan** (Ctrl+S). Hasilnya langsung dibaca ulang dan diperiksa. **Urungkan** (Ctrl+Z) membatalkan langkah
   terakhir.

Tampilan: roda mouse = zoom, tahan klik kanan = geser denah, **Pas ke layar** memusatkan jalur. Kuning = sambungan
dua arah, merah berpanah = satu arah, titik ungu = Nilai bukan 0. Denah menghadap sama seperti **minimap game**: +Z ke
atas, **+X ke kiri** (sebelum 14 September 2026 denah ketiga editor map tercermin kiri-kanan; datanya tidak terpengaruh).

Catatan:

- Tinggi (Y) titik baru ikut titik terpilih atau titik terdekat. Centang **Tinggi (Y) ikut permukaan denah**
  supaya titik baru dan titik yang digeser ikut permukaan. Hati-hati di bawah atap: denah menyimpan permukaan
  **tertinggi**, jadi di bawah atap tingginya ikut atap. Titik jalur resmi Crackdown rata-rata 0,25 m di atas lantai.
- Menghapus titik membuat nomor titik sesudahnya maju satu; sambungannya diurus program.
- Crackdown hanya punya satu sambungan satu arah: titik 15 (tinggi 3,25 m) ke titik 16 (1,83 m), turun 1,42 m.
- **Nilai** titik: di Crackdown 8 titik bernilai 20 dan titik tengah (19) bernilai 70. Artinya belum dipastikan,
  jadi biarkan kalau ragu.
- **Map baru**: buka `Path.i3Path` mana pun, **Kosongkan jalur...**, **Pilih mesh...** map barunya, gambar jalurnya,
  lalu **Simpan sebagai...** `World\<MapBaru>\Path.i3Path`. Daftar resource map (`Scene\<Map>\<Map>.RSC`) memuat
  `World/<Map>/Path.i3Path`, jadi letakkan di situ.
- Simpan tanpa perubahan menghasilkan file yang identik byte-per-byte dengan aslinya. **Belum diuji di game.**
- Map V3 (`V3 Crackdown\World\Crackdown\Path.i3Path`) juga bisa dibuka; mesh map-nya yang memakai node transform
  digambar dengan benar.

```
python i3path.py --file World\Crackdown\Path.i3Path --daftar
python i3path.py --file World\Crackdown\Path.i3Path --gambar Crackdown_jalur.png
python i3path.py --file World\Crackdown\Path.i3Path --ekspor Path.csv
python i3path.py --file World\Crackdown\Path.i3Path --impor Path.csv --out Path_baru.i3Path
```

- `--gambar PNG` : denah map dari atas beserta jalurnya. Mesh diambil otomatis dari folder yang sama, atau
  `--dunia FILE.I3S`.
- CSV berisi baris `titik` (no, x, y, z, nilai) dan baris `sambungan` (asal, tujuan, dua_arah 1/0); bisa diedit
  di Excel lalu diimpor lagi.

## I3INS Editor V3 (program keenam: objek map .i3INS)

File `World\Scene\<Map>\<Map>.i3INS` berisi **objek yang ditempatkan di map**: titik respawn, kaca, kotak area,
lampu. Crackdown punya 76 objek: 12 respawn, 35 kaca, 26 kotak area, 1 lampu, ditambah `Path` dan `World`.
Dua versi bisa dibuka: **GINS versi 3** (`World\Scene\Crackdown\Crackdown.i3INS`) dan **GINS versi 4** dari map yang
lebih baru (`V3 Crackdown\Crackdown\Crackdown.i3INS`, sama dengan isi paket client `Crackdown_Scene.i3Pack`).

Cara pakai:

1. Klik dua kali `I3INS Editor V3.exe` (atau `.pyw`), **Buka...**, pilih `World\Scene\Crackdown\Crackdown.i3INS`.
2. Mesh map (`World\Crackdown\Crackdown_World.I3S`) dan jalur AI (`Path.i3Path`) otomatis ikut dimuat: tab
   **Tampilan 3D** menampilkan map lengkap dengan tekstur, tab **Denah 2D** sebagai denah dari atas. Susunan folder V3
   (`V3 Crackdown\Crackdown\` dan `V3 Crackdown\World\Crackdown\`) juga dikenali. Kalau mesh tidak ketemu, klik
   **Pilih mesh...**.
3. Daftar di kiri mengelompokkan objek per jenis. Klik objek di daftar, atau klik penandanya:
   - **Respawn** = badan setinggi orang dengan panah arah hadap di lantai (di denah 2D: segitiga). **Merah = bendera 0,
     biru = bendera 1.** Di Crackdown masing-masing 6 titik: semua merah di separuh -Z (area bernama RED), semua biru
     di separuh +Z, jadi bendera ini pembagian tim.
   - **Kotak area** = kotak pemicu event seukuran aslinya: **hijau = Map Sector, jingga = World Section** (lihat
     "Kotak area = pemicu event" di bawah).
   - **Kaca** = panel biru muda (ukurannya perkiraan: mesh kacanya tidak ada di folder map), **Lampu** = bintang
     kuning dengan garis tegak ke lantai.
   - **Objek i3Obj** = penanda ungu dengan panah arah hadap, mis. Golem yang diimpor dari map lain.
4. **Seret** penanda untuk memindahkan objek, atau ubah di panel kanan: Posisi X/Y/Z, **Putar Y (°)**, Quaternion
   (untuk rotasi miring seperti lampu), Skala (untuk kotak = ukuran kotak), Bendera, lalu **Terapkan**.
5. **Tambah...** (Insert), **Duplikat** (Ctrl+D), **Ganti nama...** (F2), dan **Hapus** (Delete) ada di panel kanan
   dan di menu klik kanan daftar objek. Risikonya ada di "Tambah, duplikat, ganti nama, hapus" di bawah.
   **Impor objek dari map lain...** (panel kanan dan menu klik kanan) mengambil objek seperti Golem dari `.i3INS` map
   lain, lihat "Impor objek dari map lain" di bawah.
6. **Simpan** (Ctrl+S). File lama lebih dulu disalin ke **`<nama>._backup.I3INS`** (mis. `Crackdown._backup.I3INS`),
   lalu hasilnya dibaca ulang dan diperiksa. Urungkan dengan Ctrl+Z.

### Tampilan 3D (I3INS Editor)

| Mouse / tombol | Fungsi |
|---|---|
| Klik kiri | Pilih objek (respawn, kaca, dan lampu dulu, lalu kotak dari yang terkecil; klik lagi = objek berikutnya di titik itu) |
| Seret kiri | Geser objek terpilih mendatar. Respawn ikut berdiri di lantai map yang ditunjuk kursor (juga ke atap kontainer) selama **Seret respawn di 3D: tinggi ikut lantai map** dicentang |
| Shift + seret kiri | Geser naik/turun (Y) |
| Seret kanan | Putar kamera |
| Seret tengah, atau Shift + seret kanan | Geser kamera |
| Roda mouse | Zoom ke arah titik di bawah kursor |
| Klik tengah, atau Ctrl + klik kiri | Titik itu jadi pusat putaran kamera |
| F | Fokus kamera ke objek terpilih |
| W A S D / Q E | Jalan maju, mundur, kiri, kanan / turun, naik |
| Home, atau tombol **Pas ke layar** | Kembali ke pandangan awal |

- Kontrolnya sama dengan I3Collision Editor V3. Pandangan awal melihat seluruh map dari sisi -Z, sama dengan minimap
  game: +Z ke atas, +X ke kiri.
- Objek digambar transparan; bagian objek terpilih yang tertutup map tetap tampak redup. **Objek tembus pandang**
  membuat semua objek terlihat di balik tembok. **Mesh map** dan **Tekstur** menyembunyikan map atau teksturnya.
- **Tinggi Y dari / sampai** + **Saring** memotong map dan objek pada tinggi itu, mis. `sampai` = 4 untuk melihat
  respawn di dalam kontainer tanpa atapnya.
- **Nama objek** menampilkan label; label kotak ditambah nama event-nya, mis. `#58 Box_60 [m4]`.
- Mesh map lama (`World\Crackdown\Crackdown_World.I3S`) menyimpan teksturnya di dalam file, jadi ikut tampil
  bertekstur.
- Memakai OpenGL bawaan Windows. Kalau kartu grafis tidak mendukung, editor tetap bisa dipakai lewat **Denah 2D**.
  Versi `.pyw` butuh `i3gl.py` di folder yang sama.

### Kotak area = pemicu event

Setiap kotak area adalah **trigger tak terlihat** (tidak menghalangi pemain). Saat pemain masuk, game menjalankan
event `Scene\<Map>\_Generated\<event>.i3Evt`. Baris **Event** di panel kanan menyebut event itu, mis.
`m4.i3Evt -> Map Sector 4: RED 앞마당`.

| Jenis | Crackdown | Fungsi |
|---|---|---|
| **Map Sector** (hijau) | 19 kotak: event `map1`, `m2`-`m7`, `M8`-`M11`, `M13` | Mengganti **nama lokasi** pemain. Nama areanya ada di `World\<Map>\<Map>.i3WRD` (bahasa Korea): RED/BLUE 컨테이너 (kontainer), 갈림길 (persimpangan), 언덕 (bukit), 앞마당 (halaman depan), lalu 중앙 (tengah), 컨테이너A, 컨테이너B, 중앙 컨테이너. Dari isi client, kemungkinan nama ini yang muncul di pesan radio tim. |
| **World Section** (jingga) | 7 kotak: event `Cd01`, `Cd02`, `Cb03` | Mengganti **section** map: 5 kotak di dalam kontainer (section 1), 2 kotak di atap kontainer (section 2 dan 3). Dari nama fungsinya di engine, kemungkinan mengatur bagian map yang digambar. |

- Event dibaca dari `<Map>.RSC` dan folder `_Generated` di sebelah file `.i3INS`, nama area dari `<Map>.i3WRD`.
  Kalau file itu tidak ada (mis. `.i3INS` disalin sendirian), baris Event bertuliskan "tidak diketahui".
- **Tambahan** 48 byte di sebagian kotak berisi **nomor objek kotak induknya**: `Box_1`, `Box_3`, `Box_4`, `Box_5`
  menunjuk #50 `Box`, `Box_70`/`Box_700` menunjuk #61 `Box_7`, `Box_6020`/`Box_60201` menunjuk #66 `Box_602`.
  Menggandakan atau menghapus respawn menggeser nomor objek sesudahnya, jadi nomor induk ini **ikut disesuaikan**
  (sebelum versi ini tidak, sehingga induknya bisa menunjuk objek yang salah).
- Letak, putaran, dan ukuran kotak **juga tersimpan di `_Generated\Box_N.i3s`** (aktor PhysX). Kotak **baru, hasil
  duplikat, atau yang diganti namanya** mendapat file `.i3s` dengan posisi dan ukuran yang sama dengan kotaknya. Kotak
  lama yang hanya digeser atau diubah ukurannya tidak ikut diubah file `.i3s`-nya, dan mana yang dipakai game belum
  diuji; di data asli pun `Box_600` dan `Box_6002` sudah berselisih 0,2-0,3 m antara kedua file. Log mengingatkan hal
  ini saat kotak pertama kali diubah.

### Tambah, duplikat, ganti nama, hapus

| Jenis | Tambah / duplikat | Ganti nama | Hapus | Yang ikut diurus editor | Risiko |
|---|---|---|---|---|---|
| Respawn | ya | - (respawn tidak memakai nama) | ya | nomor objek sesudahnya dan nomor induk kotak | **Rendah** untuk memuat map. Jumlah respawn per tim yang berbeda dari map asli belum diuji di game. |
| Kotak area | ya | ya | ya | `_Generated\<nama>.i3s` baru (posisi dan ukuran PhysX ikut kotaknya), entri di `<Map>.RSC`, induk kotak | **Sedang.** Susunannya sama dengan hasil ekspor i3LevelDesign dan i3Viewer2 membuka file `.i3s` barunya, tapi kotak tambahan belum diuji di game. |
| Kaca | ya | ya | ya | nomor objek | **Sedang.** Kaca adalah objek i3Obj yang bisa pecah; belum diketahui apakah game menyinkronkan kaca antar pemain lewat nomor objek. |
| Objek i3Obj (mis. Golem hasil impor) | ya | ya | ya | nomor objek; entri template di `.RSC` saat diimpor | **Tinggi untuk Golem** (objek misi mode Destruction), lihat "Impor objek dari map lain". |
| Lampu | ya, dengan konfirmasi | ya | ya, dengan konfirmasi | nomor objek | **Belum diketahui.** Map bawaan hanya punya satu lampu (`Element`). |
| World, Path | - | - | - | - | Dikunci: World = akar dunia map, Path = penghubung jalur AI. |

- **Tambah...** membuka dialog: pilih jenis (respawn RED/BLUE, kotak, kaca, lampu), objek contoh, dan nama. Objek baru
  diletakkan di lantai map di tengah tampilan 3D (atau di tengah denah 2D), lalu bisa diseret. Kotak baru memakai event
  dan induk kotak contohnya.
- **Duplikat** menaruh salinan 1 m dari aslinya. Objek baru selalu masuk di belakang objek terakhir yang sejenis, jadi
  kotak baru tidak menggeser nomor objek mana pun.
- Nama hanya boleh huruf, angka, `_`, dan `-` (tanpa spasi, maksimal 63 karakter), dan tidak boleh sama dengan objek
  lain atau dengan file `.i3s` yang sudah ada di `_Generated`.
- **Hapus** kotak yang menjadi induk kotak lain: anak pertamanya menjadi induk baru, anak lain menunjuk ke sana.
  Konfirmasi hapus menyebut event kotaknya.
- Semua bisa diurungkan (Ctrl+Z) sebelum disimpan. **Tidak ada file yang dihapus**: file `.i3s` kotak yang dihapus atau
  diganti namanya tetap ada di `_Generated`, hanya entrinya di `.RSC` yang dibuang.
- **Backup saat menyimpan**: `<nama>._backup.I3INS`, dan `<nama>._backup.RSC` kalau `.RSC` ikut berubah. Backup dibuat
  sekali dan **tidak ditimpa** pada simpan berikutnya, jadi isinya tetap file sebelum pertama kali disimpan. Untuk
  membatalkan semua perubahan, salin backup kembali ke nama aslinya. Hapus file backup kalau ingin backup baru.
- File `.i3INS` yang disalin sendirian (tanpa `.RSC` dan `_Generated` di sebelahnya, mis. `HeavyRain\Crackdown.i3INS`):
  kotak baru tidak bisa dibuatkan file `.i3s`, jadi editor bertanya dulu sebelum menyimpan.

### Impor objek dari map lain (mis. Golem Giran2 ke Crackdown)

1. Buka map tujuan, mis. `Map\Scene\Crackdown\Crackdown.i3INS`.
2. Klik **Impor objek dari map lain...**, lalu **Pilih...** file `.i3INS` map sumber, mis.
   `Map\Scene\Giran2\Giran2.i3INS`. File `.RSC` map sumber harus ada di sebelahnya.
3. Daftar menampilkan objek yang bisa diimpor (kaca dan objek i3Obj) beserta template `.i3Obj` dan posisinya di map
   sumber. Pilih satu atau beberapa (Ctrl/Shift + klik), mis. `#2 Siege_Golem`. Kotak di bawah daftar menyebut entri
   `.RSC` yang ikut ditambahkan; entri yang sudah ada di map tujuan ditandai "(sudah ada)".
4. Klik **Impor ke map ini**. Objek muncul di lantai tengah tampilan 3D dalam keadaan terpilih, lalu bisa diseret dan
   diputar seperti objek lain. Nama yang sudah dipakai diberi akhiran, mis. `Siege_Golem_1`.
5. **Simpan**. `Crackdown._backup.I3INS` dan `Crackdown._backup.RSC` dibuat, lalu `Crackdown.RSC` mendapat entri
   template yang belum ada. Untuk Siege_Golem: `Sound/Object/Explosion/OB_SiegeGolem_wait.wav`,
   `Object/cgame/Siege_Golem/siege_golem.i3i`, `Object/cgame/Siege_Golem/Siege_Golem_Setting.i3s`,
   `Sound/Object/Explosion/OB_SiegeGolem_death.wav`, `Object/cgame/Siege_Golem/Siege_Golem.i3Obj`. Range_Golem memakai
   `WildHogCannon_*.wav` dan `Object/cgame/Range_Golem/...`.

- Yang disalin hanya **penempatan** objek (kode template, kelas, rotasi, skala, bendera) dan **entri daftar** di `.RSC`.
  File model, tekstur, suara, dan animasinya **tidak disalin**, dan memang tidak ada di folder `Map\Scene\Giran2`.
  Game mencarinya lewat path di atas, dan file itu ada di paket client: `Giran2_Scene.i3Pack` berisi
  `Siege_Golem.i3Obj`, sedangkan `Object_cgame_Siege_Golem.i3Pack` dan `Object_cgame_Range_Golem.i3Pack` berisi Setting,
  tekstur, dan animasi.
- Kotak area, respawn, lampu, World, dan Path tidak bisa diimpor. Kotak memakai event dan tabel area milik map sumber;
  respawn dan lampu cukup dibuat dengan **Tambah...**.
- GINS versi 3 (Giran2) ke versi 4 (Crackdown) diubah otomatis. Layer objek impor = layer yang paling banyak dipakai
  kaca/objek di map tujuan.
- Beberapa objek yang berdekatan tetap berjarak seperti di map sumber. Yang berjauhan (kedua Golem Giran2 terpisah
  lebih dari 100 m) dijajarkan 3 m.
- Sebelum disimpan semua bisa diurungkan (Ctrl+Z), dan objek impor yang dihapus lagi tidak menambah entri `.RSC`.
  Sesudah disimpan, menghapus objeknya tidak membuang entri template-nya dari `.RSC`. Untuk membatalkan impor
  sepenuhnya, kembalikan kedua file backup.

**Risiko Golem: tinggi, dan belum diuji di game.**

- Golem adalah **objek misi mode Destruction** di Giran/Giran2. Client punya kelas khusus (`CGameObjectSiegeGolem`)
  dan logika map sendiri (`gmap_giran`, `gmap_giran2`); darah, serangan, dan misinya diatur oleh mode dan server.
- Di Crackdown kemungkinannya: Golem tampil sebagai model diam, tidak tampil sama sekali (misalnya kalau
  `Siege_Golem.i3Obj` hanya dimuat saat bermain di Giran2), atau client error saat kode Golem mencari data mode
  Destruction.
- Animasi Golem (`Siege_Golem_Wait/Atk01/SpAtk01/Death.i3a`) dimuat oleh kode game, bukan lewat `.RSC`.
- Coba di room pribadi. Kalau client error atau crash, salin `Crackdown._backup.I3INS` dan `Crackdown._backup.RSC`
  kembali menjadi `Crackdown.i3INS` dan `Crackdown.RSC`.

Catatan:

- World dan Path tidak bisa dihapus, diduplikat, atau diganti nama; respawn tidak memakai nama.
- Tinggi (Y) respawn resmi Crackdown sekitar 1,6-1,9 m: titik respawn = telapak kaki, 0-0,2 m di atas lantai.
- Denah 2D menghadap sama seperti minimap game dan tampilan 3D (+X ke kiri), sama dengan I3Path Editor dan
  I3Collision Editor.
- **GINS versi 4**: respawn bernama `Respawn0`, dan tiap objek ada di sebuah **layer** (panel menampilkan nomor dan
  namanya, mis. `layer 3 (Layer1)`). Tabel layer dan semua byte yang belum dikenal ditulis ulang apa adanya; simpan
  tanpa perubahan identik byte-per-byte, termasuk untuk GINS yang diambil dari paket client.
- Mesh map V3 menyimpan vertex dengan sumbu Z ke atas di bawah node transform; denahnya digambar memakai transform
  itu, jadi hasilnya sama benarnya dengan map lama.
- Simpan tanpa perubahan menghasilkan file yang identik byte-per-byte. **Belum diuji di game.**

```
python i3ins.py --file World\Scene\Crackdown\Crackdown.i3INS --daftar
python i3ins.py --file World\Scene\Crackdown\Crackdown.i3INS --gambar Crackdown_objek.png
python i3ins.py --file World\Scene\Crackdown\Crackdown.i3INS --ekspor objek.csv
python i3ins.py --file World\Scene\Crackdown\Crackdown.i3INS --impor objek.csv --out Crackdown_baru.i3INS
```

CSV berisi satu baris per objek (no, nama, jenis, x, y, z, putar_y, qx..qw, skala, bendera). Ubah di Excel lalu
impor lagi; kalau kolom `putar_y` diubah, rotasinya dihitung dari situ. `--daftar` juga menyebut event tiap kotak area.

## I3Bone Weight V3 (program ketujuh: ikat bobot bone ke model)

Model baru yang dibuat dari **OBJ** biasanya **tidak punya bobot bone**: vertex-nya hanya posisi, normal, dan UV.
Contohnya `Avatar\Mask\M_M_Ucok\Ucok_Head_LOD1.i3s` (OBJ yang dimasukkan ke template mask `M_M_RedBulls_X_LOD1`).
Akibatnya kepala tidak ikut bone, dan kolom **Wajah (Mask)** di I3Chara Convert Bone V3 menolaknya karena dikira
rambut/headgear. Program ini memberi setiap vertex bobot bone.

Cara pakai:

1. Klik dua kali `I3Bone Weight V3.exe` (atau `.pyw`), **Pilih...** model yang belum ber-bone (boleh beberapa file).
2. **Bobot bone diambil dari**:
   - **Model lain yang sudah ber-bone** (disarankan): mask/skin asli yang bentuk dan letaknya mirip, mis.
     `Avatar\Mask\M_M_RedBulls\M_M_RedBulls_X_LOD1.i3s`. Kalau nama template masih tertinggal di mesh model
     (seperti `M_M_RedBulls_X` di kepala Ucok), kolom ini **terisi otomatis**. Tiap vertex mengambil bobot dari
     beberapa vertex sumber terdekat lalu dihaluskan, jadi pangkal leher ikut melentur seperti mask aslinya.
   - **Semua vertex ke satu bone** (mis. `Head`): seluruh mesh ikut satu bone secara kaku.
3. Klik **Ikat bobot**. Pratinjau di kanan mewarnai bobot bone terpilih (biru = 0%, merah = 100%). Pilih bone di
   daftar kanan, lalu geser **Uji gerak** (angguk / miring / geleng): mesh harus ikut bergerak. Sebelum diikat,
   bone-nya bergerak tapi mesh diam - itulah "bone tidak menempel".
4. Klik **Simpan**. Hasilnya `<nama>_Bone_LOD1.i3s` di folder model (file asli tidak diubah) plus salinan
   `_Bone_LOD2` dan `_Bone_LOD3`. Semua dibaca ulang dan diperiksa, dan log menyebut base yang cocok, mis.
   "Cocok untuk base laki-laki (SWAT_Male.I3S): LOD1, LOD2, LOD3".
5. Di **I3Chara Convert Bone V3**, pilih ketiga file `_Bone_LOD1..3` sekaligus di kolom **3. Wajah (Mask)**.

Tampilan: seret kiri = putar kamera, roda mouse = zoom, seret kanan = geser. **Depan** / **Samping** mengarahkan
kamera, warna **Bone terkuat** memberi satu warna per bone.

Sejak 2026-09-19 pratinjaunya digambar **OpenGL** (kartu grafis), seperti tab 3D di I3Collision Editor V3 dan
I3INS Editor V3. Bedanya dengan gambar lama: memutar kamera jadi mulus (Apex_Wattson: 13 ms per gambar, dulu
550-950 ms), **semua** segitiga digambar - dulu waktu diseret hanya 1 dari sekian segitiga yang ditampilkan -,
permukaannya diberi cahaya halus, dan nama kartu grafis muncul di kanan atas. Kalau OpenGL tidak bisa dipakai
(mis. remote desktop tanpa akselerasi), program otomatis kembali ke gambar lama dan menulis alasannya di log.

| Opsi | Default | Fungsi |
|---|---|---|
| LOD sumber | otomatis | Untuk sumber berisi beberapa LOD (mis. karakter V1): dipilih LOD yang pose bone-nya cocok dan vertex-nya paling banyak. |
| Vertex terdekat | 4 | Jumlah vertex sumber yang dirata-rata untuk tiap vertex. |
| Penghalusan | 2 | Berapa kali bobot dirata-rata dengan tetangganya di permukaan. 0 = tanpa. |
| Cocokkan arah normal | aktif | Vertex sumber yang menghadap berlawanan dilewati (mis. sisi dalam lengan dengan badan). |
| Gabungkan vertex kembar | aktif | Vertex dengan posisi, normal, dan UV yang sama persis digabung. Tampilan sama, file lebih kecil (kepala Ucok: 13.140 jadi 3.896 vertex, 482 KB jadi 234 KB). |
| Matikan normal map / specular tanpa tekstur | aktif | Hasil impor OBJ menyalakan normal map dan specular tanpa teksturnya; mask LOD3 asli juga hanya memakai tekstur diffuse. |
| Tangent | otomatis | Ditulis hanya kalau material masih memakai normal map (dihitung dari UV). |
| Salinan LOD2 & LOD3 | aktif | Satu file wajah hanya mengisi satu LOD, jadi tanpa salinan kepala hilang saat karakter dilihat dari jauh. |

Catatan:

- Model harus dibuat dari template yang ber-bone (punya skeleton), seperti hasil impor OBJ ke template mask.
- Sumber bobot harus sejenis: mask/skin laki-laki untuk model laki-laki. Kalau pose bone-nya beda jauh, log
  memberi peringatan.
- Tekstur yang tertanam di model (mis. `CJHead.i3i` di kepala Ucok) tetap ikut dan tampil.
- Diuji: kepala Ucok diikat dari mask RedBulls (Head 99%, Neck 0,6%, Spine3 0,4%, polanya sama dengan mask
  aslinya), lalu dikonversi bersama skin Berserker ke base laki-laki: verifikasi OK di LOD1-LOD3 dan tampil benar
  di i3Viewer2. **Belum diuji di game.**

```
python ikat_bone.py --model Avatar\Mask\M_M_Ucok\Ucok_Head_LOD1.i3s --sumber Avatar\Mask\M_M_RedBulls\M_M_RedBulls_X_LOD1.i3s --lod23
python ikat_bone.py --model Avatar\Mask\M_M_Ucok\Ucok_Head_LOD1.i3s --bone Head
```

Opsi lain: `--out FILE` (nama hasil untuk satu model), `--lod-sumber LOD1`, `--titik 4`, `--halus 2`,
`--abaikan-normal`, `--tanpa-gabung`, `--tangent auto|ya|tidak`, `--material-apa-adanya`.

## I3Collision Editor V3 (program kedelapan: collision map _Col_Hero / _Col_Hit)

Map punya dua file collision di `World\<Map>\` (contoh `V3 Crackdown\World\Crackdown\`):

| File | Isi |
|---|---|
| `<Map>_Col_Hero.I3S` | Collision **badan karakter**: lantai, tembok, peti, mobil. Crackdown: 227 bentuk (41 kotak, 184 convex, 2 triangle mesh). |
| `<Map>_Col_Hit.I3S` | Collision **peluru**: satu triangle mesh per material (beton, besi, kayu, kaca, kertas, ...). Material menentukan efek tembakan dan nilai tembus, mis. `TH_MET_90` = besi tipis, tembus 90. |

Cara pakai:

1. Klik dua kali `I3Collision Editor V3.exe` (atau `.pyw`), **Buka...**, pilih `Crackdown_Col_Hero.I3S` atau
   `Crackdown_Col_Hit.I3S`. Mesh map (`Crackdown_World.I3S` di folder yang sama) langsung dimuat: tab
   **Tampilan 3D** menampilkannya lengkap dengan tekstur dan lightmap, tab **Denah 2D** sebagai denah dari atas.
2. Hijau = kotak, biru = convex, jingga = triangle mesh, ungu = yang terpilih. Klik bentuk untuk memilih (yang paling
   kecil didahulukan; klik lagi di tempat yang sama untuk bentuk berikutnya di titik itu), atau pilih di daftar kiri.
3. Alat (klik tampilan dulu, lalu tekan angkanya):
   - **1 Pilih / geser** - seret bentuk terpilih untuk memindahkannya mendatar. Di 3D, **Shift+seret** = naik/turun.
   - **2 Tambah kotak** - seret persegi di lantai. Di 3D alas kotak otomatis setinggi lantai map yang diklik (kolom
     **Tinggi bawah** ikut terisi); di denah 2D, atau kalau "Di 3D: tinggi bawah = lantai map yang diklik" tidak
     dicentang, tinggi bawahnya diambil dari kolom itu. Tinggi kotak dan material dari panel **Kotak baru**.
   - **3 Hapus segitiga mesh** - seret persegi. Segitiga triangle mesh terpilih (atau semua mesh kalau
     "Alat 3 kena semua mesh" dicentang) yang titik tengahnya di dalam persegi dihapus. Di 3D, segitiga yang akan
     dihapus diwarnai merah selama persegi masih diseret.
4. Panel **Collision terpilih**: ubah Posisi X/Y/Z, Putar Y, Ukuran X/Y/Z (kotak), lalu **Terapkan**.
   **Gandakan** (Ctrl+D), **Hapus collision ini** (Delete), **Pusatkan** (di 3D: kamera fokus ke collision itu).
5. **Simpan** (Ctrl+S). File disusun ulang, dibaca ulang, dan diperiksa. **Urungkan** dengan Ctrl+Z.

### Tampilan 3D

| Mouse / tombol | Fungsi |
|---|---|
| Klik kiri | Pilih collision (bentuk kecil dulu; klik lagi = bentuk berikutnya di titik itu) |
| Seret kiri | Geser collision terpilih mendatar (X dan Z) |
| Shift + seret kiri | Geser naik/turun (Y) |
| Seret kanan | Putar kamera |
| Seret tengah, atau Shift + seret kanan | Geser kamera |
| Roda mouse | Zoom ke arah titik di bawah kursor |
| Klik tengah, atau Ctrl + klik kiri | Titik itu jadi pusat putaran kamera |
| F | Fokus kamera ke collision terpilih |
| W A S D / Q E | Jalan maju, mundur, kiri, kanan / turun, naik |
| Home, atau tombol **Pas ke layar** | Kembali ke pandangan awal |

- Pandangan awal melihat seluruh map dari sisi -Z, jadi arahnya sama dengan minimap game: +Z ke atas, +X ke kiri.
  Penunjuk sumbu di pojok kiri bawah (X merah, Y hijau, Z biru) selalu menunjukkan arah dunia.
- Collision digambar transparan. Bagian collision terpilih yang tertutup mesh map tetap tampak redup. Centang
  **Collision tembus pandang** supaya semua collision terlihat di balik tembok map. **Mesh map** dan **Tekstur**
  menyembunyikan map atau teksturnya.
- **Tinggi Y dari / sampai** + **Saring** di 3D memotong map dan collision pada tinggi itu, mis. `sampai` = 3 untuk
  melihat ke dalam tanpa atap. Crackdown punya atap collision raksasa di atas seluruh map (`SM_226`, Y 10 - 18,7).
- Baris di bawah tampilan menunjukkan koordinat permukaan map di bawah kursor. **Nama collision** menampilkan label;
  label yang bertumpuk dilewati.
- Memakai OpenGL bawaan Windows, tanpa pemasangan apa pun. Kalau kartu grafis tidak mendukung, tab 3D memberi pesan
  dan editor tetap bisa dipakai lewat **Denah 2D**. Versi `.pyw` butuh `i3gl.py` di folder yang sama.

Tips:

- Isi **Tinggi Y dari / sampai** lalu **Saring** untuk menyembunyikan lantai (di Crackdown sekitar Y 1,6) atau atap,
  supaya benda di tengah mudah diklik. Saringan ini juga membatasi alat 3.
- Supaya sebuah benda bisa **dilewati dan ditembus**: hapus bentuknya di `_Col_Hero`, lalu hapus segitiganya di
  `_Col_Hit` dengan alat 3.
- Supaya ada **tembok tak terlihat**: tambah kotak di `_Col_Hero` (menahan pemain) dan di `_Col_Hit` (menahan
  peluru; pilih materialnya di **Material dari**).

Catatan:

- Lantai besar juga collision (`SM_00` di Crackdown, 35 x 35 m). Kalau dihapus, pemain jatuh.
- Denah 2D menghadap sama seperti minimap game dan tampilan 3D (+X ke kiri).
- Segitiga yang dihapus dijadikan titik di data PhysX (jumlahnya tetap), jadi tidak bisa terkena lagi. Segitiga besar
  yang titik tengahnya di luar persegi tidak ikut terhapus.
- Kotak yang dipasang miring hanya bisa digeser dan diputar, ukurannya tidak.
- Simpan tanpa perubahan menghasilkan file yang identik byte-per-byte. Hasil editan terbuka normal di i3Viewer2.
  **Belum diuji di game**, dan client bisa saja membaca collision dari paket `.i3Pack` (mis. `Crackdown_Col.i3Pack`),
  bukan dari file lepas ini.

```
python i3col.py --file "V3 Crackdown\World\Crackdown\Crackdown_Col_Hero.I3S" --daftar
python i3col.py --file ..._Col_Hero.I3S --hapus SM_40 --out Crackdown_Col_Hero_baru.I3S
python i3col.py --file ..._Col_Hero.I3S --tambah-kotak 0,2.58,0,1,2,1,15 --out baru.I3S
python i3col.py --file ..._Col_Hit.I3S --tambah-kotak 0,2.58,0,1,2,1 --material CCR_ --out baru.I3S
python i3col.py --file ..._Col_Hit.I3S --hapus-area -2,-2,2,2 --out baru.I3S
python i3col.py --file ..._Col_Hero.I3S --gambar denah_collision.png
```

- `--tambah-kotak X,Y,Z,SX,SY,SZ[,PUTAR]`: pusat dan ukuran kotak dalam meter, Y = tinggi.
- `--hapus-area X0,Z0,X1,Z1[,YMIN,YMAX]`: hapus segitiga semua triangle mesh yang titik tengahnya di area itu.
- Opsi lain: `--geser NAMA,X,Y,Z`, `--putar NAMA,DERAJAT`, `--gandakan NAMA,DX,DY,DZ`, `--dunia FILE.I3S`.

## I3RSC Editor V3 (program ketiga belas: daftar resource `.RSC`)

`.RSC` adalah daftar berkas yang dimuat client untuk sebuah map atau sebuah kelompok
(karakter, senjata, efek, suara). Jalankan `I3RSC Editor V3.pyw`, atau jatuhkan sebuah
`.RSC` ke atasnya.

**Dua bentuk RSC, dan alat ini mengerti keduanya.** Inilah yang bikin RSC terasa "tidak biasa":

| bentuk | dipakai di | isinya |
|---|---|---|
| **RSC2** | RSC per-map, `Scene/<Map>/<Map>.RSC` | jalur ditulis dua kali, ada ekor 72 byte untuk tipe 5 dan 7 |
| **RSC1** | RSC global: `Chara/AnimPack.RSC`, `Chara/Character.RSC`, `Weapon/Weapon.RSC`, `Equip/*.RSC`, `Effect/Define/*.RSC`, `Sound/*.RSC` | **nama dan jalur terpisah**, tanpa ekor |

Di client Anda ada **109 berkas .RSC**: 90 bentuk RSC2 dan 19 bentuk RSC1. Alat lama hanya bisa
membaca yang RSC2, jadi 19 berkas global itu tidak bisa dibuka sama sekali.

Satu hal yang perlu diingat: **nomor tipe artinya berbeda di kedua bentuk**. Tipe 7 berarti
`.i3AnimPack` di RSC1, tapi `.i3s` di RSC2. Kalau Anda menyalin entri antar bentuk, alat ini
menghitung ulang nomornya sendiri dari ekstensi berkasnya.

### Ambil entri dari RSC lain

Tombol **`Ambil dari RSC lain...`** (Ctrl+I). Sumbernya boleh:

- **RSC lepas...** - sebuah berkas `.RSC` di mana saja, atau
- **Dari pack...** - langsung dari dalam sebuah `.i3Pack` (dipilih dari daftar RSC di dalamnya)

Entri yang **jalurnya sudah ada** di berkas tujuan ditampilkan abu-abu dan dilewati
(bisa dimatikan). Centang beberapa baris, tekan **Ambil yang dipilih**, selesai.

### Buka dan simpan langsung dari pack

`Berkas > Buka dari pack...` (Ctrl+P) membaca `.RSC` dari dalam `.i3Pack`, dan **Simpan**
menulisnya balik ke pack yang sama (ditanya dulu). Jadi tidak perlu extract-edit-masukkan lagi.

### Yang dijaga alat ini

- Field offset tiap entri **tidak dihitung ulang**. Banyak RSC bawaan menyimpan nilai basi di situ
  (`Holiday.RSC`: 113 dari 175 salah) dan engine jelas mengabaikannya. Ke-109 berkas di client
  Anda bisa dibuka dan ditulis ulang **byte demi byte sama persis**. Kalau memang mau dirapikan,
  ada `Entri > Normalkan offset entri`.
- Panjang **ekor** tiap entri ditentukan oleh pasangan (bentuk, tipe) - mis. di RSC2 entri `.wav`
  berekor 16 byte dan entri `.i3s`/`.i3WRD` berekor 72 byte. Alat ini mengambil panjangnya dari
  entri lain yang setipe **di berkas itu sendiri**, jadi entri apa pun aman dipindah ke posisi
  paling bawah dan entri baru langsung dapat ekor yang benar.
- Sesudah entri terakhir sering ada **penutup berkas**: RSC1 global menyimpan setelan di situ
  (mis. `Sound/*.RSC` 16 byte), dan **9 berkas di client Anda kena cap air** tool lain
  (`" RSC Reader - By Skript47 ..."`). Penutup itu disimpan terpisah dari entri, jadi menghapus
  entri terakhir **tidak ikut membuangnya**.
- Setiap Simpan ditulis ke berkas sementara, dibaca ulang, dan dibandingkan dulu sebelum menimpa.

### Baris perintah

```powershell
python i3rsc.py info Crackdown.RSC            # ringkasan: jumlah entri, bentuk, per tipe
python i3rsc.py daftar Crackdown.RSC          # semua entri
python i3rsc.py impor tujuan.RSC sumber.RSC   # ambil semua entri sumber (yang sudah ada dilewati)
```

## I3Pack Editor V3 (program kesepuluh: paket `.i3Pack` client)

Ditulis 23 September 2026 sebagai **pengganti `i3PackEditor.exe`** yang source-nya hilang.
Semua isi folder `Pack\` client itu file `.i3Pack`: satu wadah I3R2 berisi pohon folder
(`i3PackNode`) dan berkas-berkas di dalamnya. Program ini membuka, mengubah, dan menulisnya
kembali tanpa butuh engine i3 apa pun.

Jalankan `I3Pack Editor V3.pyw` (klik dua kali), atau jatuhkan satu file `.i3Pack` ke atasnya.

| Bagian jendela | Isi |
|---|---|
| Kiri | Pohon folder di dalam pack. |
| Kanan | Daftar berkas di folder yang dipilih: **Nama, Ukuran, Tipe, Cipher, Encoding, Diubah**, dengan **ikon jenis file** di depan nama. |
| Bawah | Log; setiap langkah dan setiap peringatan tercatat di sini. |

**Ikon**: ikonnya diambil dari folder `Icon\` di sebelah program. Nama file ikon = akhiran file yang
diwakilinya, jadi `I3I.ico` dipakai untuk semua `.i3i`, `Wav.ico` untuk `.wav`, `RSC.ico` untuk `.rsc`,
dan seterusnya — kalau Agan mau menambah jenis baru, tinggal taruh `<akhiran>.ico` di folder itu, tanpa
mengubah kode. Empat nama punya tugas khusus dan tidak dianggap akhiran file:

| File | Dipakai untuk |
|---|---|
| `IconExe.ico` | ikon jendela dan ikon `.exe`-nya |
| `Folder.ico` | folder di pohon panel kiri |
| `NoIcon.ico` | jenis file yang tidak punya ikon sendiri |
| `Kunci.ico` | gembok berkas terenkripsi (kalau tidak ada, digambar sendiri oleh program) |

**Tema terang / gelap**: menu **`Tampilan`** — pilihannya diingat di `I3Pack Editor V3.ini`
(`[umum] tema`), jadi waktu program dibuka lagi temanya tetap. Semua jendela ikut berganti,
termasuk yang sudah terbuka: pohon, daftar berkas, log, menu klik kanan, dan kotak dialog.
Tema terang memakai tampilan Windows biasa; tema gelap memakai tema ttk `clam` karena tema
bawaan Windows digambar OS dan mengabaikan pengaturan warna (kalau dipaksa, hasilnya belang).

**Tanda pemilik di dalam pack**

Menu **`Alat > Tanda pemilik di dalam pack...`**. Kalau aktif (bawaannya aktif, nama
`HeavyRain`), setiap kali pack disimpan nama Anda ikut ditempel **di ujung file** sebagai
teks biasa — bisa dibaca pakai Notepad atau hex editor:

```
[I3PACK-SIGN]
Pemilik : HeavyRain
Alat    : I3Pack Editor V3
Waktu   : 2026-10-06 22:04:57
Sidik   : 51fd96f9f2dc70964a0e2a1b8c3d5e7f
[/I3PACK-SIGN]
```

Tandanya **tidak mengganggu client sama sekali**: engine mencari isi pack lewat tabel objek
di header dan tidak pernah membaca byte di belakang isi terakhir. Menyimpan berkali-kali juga
tidak menumpuk — blok lamanya otomatis tidak ikut tertulis.

`Sidik` itu MD5 isi pack. Kalau ada yang menyunting pack-nya sesudah ditandai, sidiknya tidak
lagi cocok dan **`Alat > Info pack...`** akan menulis `SUDAH DISUNTING sesudah ditandai`.

Dua hal yang perlu diingat:

* kalau pack-nya pack map utama (`Pack/<Map>.i3Pack`) atau `Script.i3Pack`, **stempel kode
  proteksi dipasang SESUDAH menyimpan** — kodenya dihitung dari isi file, jadi tandanya harus
  sudah ada lebih dulu. Simpan dulu, baru `Alat > Apply the Zepetto.inc Protection Stamp.`
* ini untuk **pengecekan**, bukan kunci: orang yang menyimpan ulang pack itu dengan program
  yang sama bisa menimpa tanda Anda.

**Tanda pemilik juga di `.I3CHR`**

Tombol **`Tanda pemilik...`** sekarang juga ada di **I3CHR Editor V3** (panel karakter
maupun panel senjata) dan **I3CHR Maker V3**. Bentuk tandanya sama persis dengan yang di
pack, dan baris `Alat :` menyebut program mana yang menulisnya.

Setelannya **SATU untuk semua alat**, disimpan di `I3Tanda.ini` di sebelah program - jadi
nama cukup diisi sekali, mau lewat I3Pack Editor, I3CHR Editor, atau I3CHR Maker.

**File Browser: selalu di atas + ikon program**

Jendela **`Jelajah folder pack...` (Ctrl+B)** sekarang punya kotak centang **`Selalu di atas`**
di sebelah `Tampilkan pack kosong`, dan **menyala secara bawaan**. Dengan itu jendela File
Browser tidak tenggelam ke belakang saat Anda mengklik jendela editor utama - jadi bisa
dipakai sambil bekerja. Matikan kalau mengganggu; pilihannya diingat di
`I3Pack Editor V3.ini` (`[umum] jelajah_atas`).

Semua jendela program juga memakai **ikon program** (`Icon\IconExe.ico`), bukan lagi ikon bulu
bawaan tkinter - termasuk File Browser, kotak isi berkas, dan semua dialog.

**Format pack V1 / V3 (ditanyakan saat Simpan sebagai)**

Kotak kecil **`Format pack`** muncul saat Anda menekan **Simpan sebagai...**, dan saat
menekan **Simpan** pada pack yang **baru dibuat** (belum pernah disimpan). **Simpan**
biasa pada pack yang sudah ada **tidak bertanya** - packnya ditulis dengan formatnya
sendiri, jadi Ctrl+S tetap cepat seperti dulu.

Isi kotaknya:

| pilihan | artinya |
|---|---|
| **V1** | format client Point Blank V1 (penanda `0x90`). Semua map bawaan client V1 memakai ini. |
| **V3** | format client baru (penanda `0x98` + cipher V2). **Tidak terbaca client V1.** |

Format pack yang sedang dibuka sudah terpilih otomatis, jadi kalau Anda tinggal menekan
**Simpan** hasilnya sama seperti sebelumnya. Untuk mengubah format sebuah pack yang sudah
ada, pakai **Simpan sebagai...** lalu pilih format yang lain.
Yang diubah hanya cara daftar isi pack ditulis — isi berkas, urutan, dan flag SECURE tiap
berkas tidak disentuh sama sekali (packnya cuma menyusut/bertambah 2 byte per folder).

Kenapa ini penting: kalau pack map Anda berformat **V3**, client V1 tidak menganggapnya rusak —
packnya **dianggap kosong**. Akibatnya `.i3INS` tidak pernah dimuat, map tidak punya respawn,
dan di `BC.log` muncul:

```
GameCharaManager.cpp(2519) _GetRespawnPosition : 1 팀의 Respawn Position이 없습니다.
```

Cara cepat memeriksa: buka packnya, lihat baris **`format:`** di kotak log, atau
**`Bantuan > Info pack...`** — di situ tertulis `V1 (client lama...)` atau
`V3 (client baru ...) - TIDAK terbaca client V1`.

Untuk menulis format **V3** dibutuhkan tabel cipher V2 yang sudah dipelajari (Learning
Encrypted Key). Kalau belum ada satu pun, pilihan V3 dimatikan dan hanya V1 yang bisa dipakai.

**Tanda gembok**: berkas yang isinya **terenkripsi** (flag SECURE) dapat tempelan gembok kecil di pojok
kanan bawah ikonnya — **kuning** kalau isinya bisa dibuka, **merah** kalau cipher-nya V2 dan kuncinya
belum dipelajari (jadi isinya belum terbaca; pakai `Learning Encrypted Key`). Berkas yang jenisnya tidak
punya ikon pun tetap menampilkan gembok di atas `NoIcon.ico`. Gemboknya digambar sendiri oleh program,
tapi kalau Agan menaruh `Kunci.ico` di folder `Icon\`, itu yang dipakai. Folder `Icon\` ikut dibundel ke dalam
`.exe`, jadi exe-nya tetap ada ikon walau dipindah sendirian; kalau ada folder `Icon\` di sebelah exe,
yang itu yang dipakai (jadi bisa diganti tanpa build ulang).

Yang bisa dikerjakan:

- **Drag & drop**: tarik file atau folder dari Explorer, jatuhkan ke jendela ini.
  - File yang namanya **sudah ada** di folder terpilih akan **mengganti isinya**, dan status cipher slot itu
    dipertahankan (kalau slotnya SECURE, isi baru dienkripsi ulang otomatis).
  - File yang namanya belum ada **ditambahkan** tanpa enkripsi — nyalakan lewat `Alat > Proteksi semua` kalau perlu.
  - **Folder** yang ditarik ikut dibuatkan susunan foldernya di dalam pack, sampai ke subfolder.
  - Satu file **`.i3Pack`** yang ditarik akan **dibuka** sebagai pack.
  - Sebelum dikerjakan selalu muncul ringkasan (berapa yang diganti, berapa yang baru) untuk dikonfirmasi.
  - Catatan Windows: kalau Explorer dan program ini beda hak akses (mis. salah satunya dijalankan
    *Run as administrator*), Windows memblokir drop-nya. Jalankan keduanya dengan hak yang sama.
- **Kolom daftar berkas**:
  - **Tipe** — akhiran nama dalam huruf besar (`I3I`, `I3S`, `I3CHR`, ...).
  - **Cipher** — enkripsi slot berkasnya (`no`, `V1`, atau `V2.<tipe>:<key>` seperti `V2.2:3A`) **plus enkripsi di
    dalam isinya**: `int: IIA2(6)` berarti ada 6 index array terenkripsi di dalam file `.i3s` itu (juga dihitung
    `P8(n)` untuk VA30 Platform 8 dan `TEX2`/`TEX3`). Contoh: skin Dajeong terbaca `int: IIA2(6)`, skin Priest bersih.
  - **Encoding** — `BINER`, `ASCII`, `UTF-8`, atau `UTF-16 LE` dari isinya.
  - **Diubah** — jam saat isinya diganti/ditambah di sesi ini.
- **Tanda baris**: berkas yang isinya **ditimpa** (drop file dengan nama yang sama, ganti file, edit isi, atau ambil
  balik dari alat luar) barisnya jadi **merah**; berkas yang **baru ditambah** jadi **hijau muda**. Tandanya hilang
  sesudah pack ditutup/dibuka lagi.
- **File Browser** (`File > Jelajah folder pack...`, atau **Ctrl+B**): daftar semua `.i3Pack` di satu folder —
  **tinggal diketik**, daftarnya menyempit, **Enter** membuka yang teratas (panah bawah untuk memilih yang lain).
  Bentuknya mengikuti File Browser di PB SDK: kotak ketik di atas, pilihan awalan nama (`Weapon`, `Chara`, `Acc`, ...)
  di kanan, dan **"Tampilkan pack kosong"** — pack kosong (≤ 313 byte) ditandai abu-abu dan bisa disembunyikan,
  aturan yang sama dipakai PB SDK. Ada kolom ukuran dan tanggal (klik judul kolom untuk mengurutkan), klik kanan untuk
  *Tampilkan di Explorer* / salin nama / salin jalur, **F5** menyegarkan, dan folder terakhir diingat.
- **Buka isi dengan alat luar**: klik dua kali sebuah berkas — kalau jenis filenya sudah punya alat, berkas itu
  ditulis ke file sementara (dengan nama aslinya) lalu dibuka di program tersebut. Kalau belum ada alatnya,
  isinya ditampilkan di penampil bawaan (teks/hex). Keduanya selalu tersedia lewat klik kanan.
  - Sesudah program luar itu **menyimpan** perubahannya, program ini menanyakan apakah isinya mau **dimasukkan
    kembali ke dalam pack** — jadi alur ubah-tekstur/mesh tidak perlu extract-lalu-import manual.
  - Pengaturannya di `Alat > Atur alat luar per jenis file...`, tersimpan di `I3Pack Editor V3.ini` sebelah program.
    Waktu pertama dijalankan, alatnya **dideteksi sendiri** dari komputer ini:

    | Jenis file | Alat |
    |---|---|
    | `.i3i` | `i3ImageViewer.exe` |
    | `.i3s` | `i3Viewer2.exe` |
    | `.rsc` | `RSCEditor.exe` (atau `i3RSCGen.exe`) |
    | `.pef`, `.i3RegXML` | `PropertyEditor.exe` |
    | `.I3CHR`, `.i3Path`, `.i3INS`, `.i3AnimPack` | editor V3 yang ada di folder ini |
- **Pintasan keyboard dan mouse** (di daftar berkas):
  | Aksi | Cara |
  |---|---|
  | Ganti nama | **F2** (berkas, atau folder kalau yang dipilih di panel kiri) |
  | Hapus | **Delete** |
  | Pilih semua | **Ctrl+A** |
  | Pilih beberapa sekaligus | **seret kursor** (klik lalu tarik ke atas/bawah), atau Shift/Ctrl+klik |
  | Salin / potong / tempel | **Ctrl+C** / **Ctrl+X** / **Ctrl+V** |
  Salin-tempel bekerja antar folder di dalam pack, dan tetap terbawa kalau pack lain dibuka — jadi bisa
  memindahkan berkas dari satu pack ke pack lain. Isi, cipher, dan bendera berkasnya ikut disalin.
  **Ctrl+V juga menempel file yang di-copy dari Explorer** (sama seperti drag & drop).
- **Extract** semua isi pack, satu folder, atau berkas yang dipilih saja (menu File / Edit).
- **Ganti file** di dalam pack (`Edit > Ganti file...`) - isi baru harus file **polos**;
  kalau slotnya bertanda SECURE, program yang mengenkripsi ulang.
- **Tambah file**, **folder baru**, **ganti nama**, **hapus** (berkas maupun folder).
- **Lihat isi** (klik dua kali sebuah berkas): tampilan teks UTF-16, teks ASCII, atau hex.
  Isinya bisa diubah di situ dan disimpan balik ke dalam pack.
- **Import folder jadi pack** - seluruh isi sebuah folder dijadikan pack baru.
- **Cari dan ganti teks** di dalam isi semua berkas (UTF-16 LE, UTF-8, ASCII, cp1252),
  **ganti nama massal**, dan **extract string**.
- **Proteksi semua / lepas proteksi** - menyalakan atau mematikan enkripsi SECURE seluruh berkas.
- **Konversi gambar `.i3VTexImage` <-> `.tga`** (`Alat > Konversi gambar i3VTexImage`): lihat bagian tersendiri di bawah.
- **Ekspor mesh `.i3s` ke `.obj`** (`Alat > Ekspor mesh .i3s ke OBJ`): lihat bagian tersendiri di bawah.
- **Convert + bersihkan `.i3s`** (`Alat > Convert + bersihkan .i3s...`): lihat bagian tersendiri di bawah.

Setiap kali disimpan, hasilnya **dibaca ulang dan dibandingkan** dulu dengan isi di memori
(nama, jalur, isi, dan status cipher tiap berkas); kalau ada yang tidak cocok, file lama tidak
diganti. Penulisan lewat file sementara, jadi pack asli tidak pernah setengah tertulis.

### Konversi gambar `.i3VTexImage` <-> `.tga`

Atlas gambar UI client (`Locale\<negara>\UI_V12\VTexList\*.i3VTexImage`) bisa dibongkar jadi `.tga`
biasa, diedit di Photoshop/GIMP, lalu dipasang balik. Menunya di `Alat > Konversi gambar i3VTexImage`:

| Menu | Gunanya |
|---|---|
| `i3VTexImage -> TGA...` | pilih satu atau banyak file, lalu folder hasilnya |
| `TGA -> i3VTexImage...` | kebalikannya |
| `Satu folder: ...` | seluruh isi folder sekaligus |

Di daftar berkas, klik kanan sebuah `.i3VTexImage` yang ada **di dalam pack** juga memberi
**`Simpan sebagai TGA...`** dan **`Ganti isi dari TGA...`**.

Yang perlu Agan tahu:

- Susunannya: header 2048 byte (magic `VTIH` atau `HAZE`, lebar, tinggi, nomor slot, jalur `.tga` asalnya)
  lalu piksel **BGRA 8888** yang disimpan **per ubin 128x128**, bukan baris lurus. Kalau dibuka dengan alat
  yang tidak membongkar ubin, gambarnya kelihatan terulang 8 kali ke samping dan gepeng.
- Waktu memasang balik, **header file lama dipakai lagi** (nomor slot, bendera, jalur asal, magic), jadi
  client tetap mengenalinya. Ukuran TGA harus **sama persis** dengan gambar lama dan kelipatan 128.
- TGA-nya 32 bit tanpa kompresi, baris bawah dulu - **sama persis byte per byte** dengan keluaran alat VTex
  lain, jadi file dari kedua alat bisa ditukar-tukar.
- **File yang isinya masih disandi ditolak, bukan dibuka setengah jadi.** Sebagian file VTex client baru
  (di folder contoh: 349 dari 495) isinya dienkripsi cipher PBM - sekeluarga dengan cipher V2 `.i3Pack`,
  tapi **kuncinya lain dan beda-beda tiap file**, dan tidak satu pun cocok dengan 768 kunci yang bisa
  dikeluarkan `i3PackEditor.exe` lama. Alat VTex lain pun gagal di file yang sama (dicek dengan hasil
  keluarannya), jadi ini batas yang sama-sama belum tertembus, bukan kekurangan alat ini. Sisanya
  (132 file polos di folder contoh) bolak-balik **sama persis byte per byte**.
- CLI: `python i3vtex.py info|ke-tga|dari-tga|folder-ke-tga|folder-dari-tga ...`

### Ekspor mesh `.i3s` ke `.obj`

`Alat > Ekspor mesh .i3s ke OBJ` (bisa banyak file sekaligus), atau klik kanan sebuah berkas
`.i3s` **di dalam pack**. Ada dua pilihan:

| Pilihan | Hasilnya |
|---|---|
| **Satu OBJ berisi semua mesh** | satu file, tiap mesh jadi `g <nama>` |
| **Satu OBJ per mesh** | satu file untuk tiap mesh, seperti ekspor OBJ di PB SDK (`<nama i3s>_<nama group>.obj`) |

Untuk pilihan pertama, hasilnya **satu file `.obj` berisi seluruh mesh**, tiap mesh jadi satu `g <nama>` — jadi di
Blender/3ds Max semuanya masuk sekaligus dan tetap bisa dipilih satu-satu. Nama group-nya
`[LOD<n>_]<nama node>_<nomor blok>`, nomornya sama dengan nomor blok di PB SDK supaya gampang
dicocokkan. Posisi tiap mesh sudah dikalikan matriks `i3Transform` dari akar, jadi susunannya benar
apa adanya, tidak perlu digeser-geser lagi.

Yang ikut ditulis: posisi (`v`), normal (`vn`), dan UV (`vt`). Koordinat V dibalik tandanya persis
seperti ekspor OBJ di PB SDK, jadi hasil ini bisa diimpor balik lewat PB SDK tanpa UV terbalik.
Tekstur tidak ikut (tidak ada `.mtl`) — teksturnya `.i3i`, bukan format yang dikenal OBJ.

**Index array terenkripsi:** hampir semua `.i3s` client menyimpan index array-nya dalam keadaan
disandi (IIA2). Ternyata **cipher-nya sama persis dengan cipher V2 `.i3Pack`**, jadi tabel kunci yang
sudah ada di folder `Cipher V2\` langsung dipakai. Mesh yang kuncinya belum dipelajari **dilewati**
(bukan diekspor jadi bentuk kacau), dan sesudahnya program menawarkan `Learning Encrypted Key` untuk
kunci-kunci itu lalu mengekspor ulang. Contohnya `IF_S_Dajeong-Red_LOD1.i3s` memakai 6 kunci berbeda
di 6 mesh-nya.

- CLI: `python i3obj.py info <file.i3s...>`, `python i3obj.py obj <file...> [--ke <folder>]`
  (satu file), `python i3obj.py obj-pisah <file...> [--ke <folder>]` (satu file per mesh)

### Convert + bersihkan `.i3s` (client baru -> V1, wajib berbone)

`Alat > Convert + bersihkan .i3s (client baru -> V1)...`, atau klik kanan berkas `.i3s`
**di dalam pack** lalu `Convert + bersihkan .i3s ini...` — untuk yang di dalam pack, sesudah
selesai program menawarkan hasilnya **dimasukkan balik ke pack** menggantikan isi berkas itu.

Tiga langkah dalam sekali jalan:

1. **Convert** — rutenya sama persis dengan I3Scene Convert v3: jenis filenya dideteksi sendiri,
   skin/mask/headgear client baru lewat `pindah_karakter`, senjata client baru lewat
   `pindah_senjata`. File yang memang sudah format lama tidak dikonversi ulang, cuma disalin.
2. **Bersihkan index array (IIA2)** — index array `.i3s` client hampir selalu disandi. Di sini
   dibuka pakai tabel di folder `Cipher V2\`, lalu kata cipher-nya dinolkan. **Panjang datanya
   tidak berubah sama sekali, jadi tambalannya ditulis di tempat** — susunan objek, offset, dan
   tabel string tidak digeser sedikit pun. Ini bedanya dengan `Quitar IIA2` + Save di i3Viewer2:
   yang itu menulis ulang seluruh file (versi header berubah, BMA1 jadi BMA2, objek ditata ulang,
   orphan dibuang) sampai client lama bisa menolak hasilnya.
   Kunci yang belum dipelajari tidak dipaksa — array-nya dibiarkan apa adanya, kuncinya disebut,
   lalu ditawarkan `Learning Encrypted Key` dan convert ulang.
3. **Periksa bone** — jumlah tulang dan jumlah VA berbone di hasil dibandingkan dengan sumbernya.
   Kalau sumbernya berbone tapi hasilnya tidak, **file hasil dihapus dan konversi dianggap gagal**.

**Senjata bertingkat**: converter senjata lama cuma menangani satu mesh per LOD, jadi senjata seperti
`Kar98k_TSR_Carnaval` (23 mesh, digantung di beberapa `i3BoneRef` bersarang) dulu ditolak dengan pesan
`i3Geometry tidak ditemukan`. Sekarang kalau rute senjata gagal, program otomatis pindah ke rute umum
yang menyusun ulang seluruh adegan — hasilnya 3 LOD, 14.198 verteks, 23/23 index array polos, 14 tulang utuh.

- CLI: `python i3bersih.py info|convert|bersih <file.i3s...> [--ke <folder>]`
  (`bersih` = hanya buka IIA2, tanpa convert)




### Cipher SECURE

Ada dua macam enkripsi isi berkas, dan **dua-duanya sudah didukung penuh**:

Yang menentukan sebuah berkas terenkripsi atau tidak adalah **bit `0x0800`** di bendera entrinya —
bukan sekadar "bendera tidak nol". Ada pack yang memakai bendera `0x0001` padahal isinya polos
(mis. `Weapon_AUG_A3_Halloween2026`), dan berkas ber-cipher V2 biasanya bernilai `0x0801`.
Bit selain `0x0800` dipertahankan apa adanya waktu pack disimpan.

- **V1 "BitRotate"** (mask 0): tiap blok 2048 byte diputar 3 bit — ke kiri saat menulis, ke kanan
  saat membaca. Ini yang dipakai seluruh pack di client V1 Agan (236 berkas SECURE dari 27.271
  berkas di 3.557 pack). File seperti `Config\*.Pef` otomatis sudah polos waktu di-extract.
- **V2 "PBM"** (mask bukan 0, ditulis `V2.<tipe>:<key>`): dipakai pack client baru. Bentuknya bukan
  keystream biasa — isinya dipotong per 64 KB, dan di tiap potongan **tiap posisi punya tabel
  substitusi sendiri**, yang berubah lagi menurut sisa panjang potongan. Tabelnya **diukur**
  (bukan ditebak) dari `i3PackEditor.exe` lama, sekali per kunci.

### Pack client baru (3.88 ke atas) — sudah bisa dibuka langsung

Pack client baru ditandai penanda `0x98`: daftar berkasnya tidak diputar 2 bit seperti pack lama,
melainkan disandi cipher V2 per entri, dengan 2 byte tipe/key di depannya (dan kuncinya bisa
berbeda tiap folder dalam satu pack). Sesudah tabel kuncinya dipelajari, pack seperti itu
**dibuka langsung** — isi `.i3i`-nya pun terbaca dan bisa dibuka di i3ImageViewer.

Cara mempelajari kuncinya (**butuh `i3PackEditor.exe` lama, sekali saja per kunci, ±15 detik**):

- Di jendela: buka saja pack-nya, program yang menawarkan *"Learning Encrypted Key sekarang?"* — pilih Ya,
  tunjuk `i3PackEditor.exe` lama, tunggu sebentar. Tawaran itu muncul di tiga keadaan:
  - **daftar berkasnya** yang tersandi (pack tidak bisa dibuka sama sekali) — sesudah belajar, pack langsung dibuka;
  - **isi berkasnya** yang tersandi (pack terbuka tapi ada berkas mentah) — sesudah belajar, isinya langsung
    terbaca tanpa perlu buka ulang pack;
  - waktu berkas mentah itu mau dibuka di alat luar.
  Manual: klik kanan berkasnya → **"Learning Encrypted Key (berkas ini)"**, atau menu
  `Alat > Learning Encrypted Key...`.
- Lewat command line:

```
python i3pack.py pelajari-cipher i3PackEditor.exe --dari-pack Weapon_Baru.i3Pack
python i3pack.py pelajari-cipher i3PackEditor.exe 2:43 2:50
python i3pack.py pelajari-cipher i3PackEditor.exe --dari-folder "D:\...\Pack 3.88"
```

`--dari-folder` memindai seluruh pack di satu folder lalu memanen semua kunci yang belum ada.
Catatan ukuran: folder `Pack 3.88` memakai **278 kunci berbeda** di 5.516 pack — memanen semuanya
sekitar **1 jam** dan ±55 MB tabel. Kalau tidak diburu, cukup pelajari saat ketemu saja
(per kunci ±15 detik).

Tabelnya disimpan di folder **`Cipher V2\`** sebelah program (±192 KB per kunci). Sesudah itu
kunci tersebut **tidak butuh exe lama lagi**; kalau programnya dipindah, bawa folder itu juga.
Yang sudah ikut disiapkan (14 kunci): `1:00`, `1:10`, `1:38`, `1:90`, `2:00`, `2:02`, `2:20`, `2:38`,
`2:3A`, `2:43`, `2:50`, `2:58`, `2:8D`, dan satu lagi hasil pemanenan Agan sendiri.

Pemanenannya memeriksa dirinya sendiri: 2.561 file uji dienkripsi ulang memakai tabel hasil ukur
dan harus **sama persis** dengan keluaran exe lama sebelum tabelnya disimpan. Diuji juga ke pack
asli Agan (`Weapon_Tambourine_PBIC2024_Neon.i3Pack`): 10 dari 10 berkas identik dengan hasil
extract exe lama.

### Command line

```
python i3pack.py list <pack>                         daftar berkas
python i3pack.py tree <pack>                         susunan pohon
python i3pack.py info <pack>                         header + penghitung
python i3pack.py extract <pack> <folder>             extract semua
python i3pack.py extract-one <pack> <jalur> <file>   extract satu berkas
python i3pack.py replace-file <pack> <jalur> <file-sumber> [--save <out>]
python i3pack.py add-files <pack> <folder-di-pack> <file...> [--save <out>]
python i3pack.py delete-file <pack> <jalur> [--save <out>]
python i3pack.py delete-node <pack> <folder> [--save <out>]
python i3pack.py rename-file <pack> <jalur> <nama-baru> [--save <out>]
python i3pack.py rename-node <pack> <folder> <nama-baru> [--save <out>]
python i3pack.py replace-names <pack> <cari> <ganti> [--save <out>] [--dry-run]
python i3pack.py replace-text <pack> <cari> <ganti> [--encoding utf16le] [--in <jalur>] [--save <out>]
python i3pack.py strings <pack> [--encoding ...] [--min 6] [--in <jalur>]
python i3pack.py create <pack-baru> <folder>
python i3pack.py protect <pack> [--save <out>]
python i3pack.py unprotect <pack> [--save <out>]
```

Tanpa `--save`, pack yang dibuka **ditimpa**. `--dry-run` hanya melapor, tidak menulis.

### Uji

```
python uji_i3pack.py          # pustaka: cipher V1+V2, bendera entri, buat/ubah pack, baca 400 pack client,
                              # dan banding BYTE PER BYTE dengan i3PackEditor.exe lama
python uji_i3vtex.py          # konversi .i3VTexImage <-> .tga: 28 pemeriksaan, termasuk seluruh folder
                              # contoh (132 file polos bolak-balik sama persis byte per byte)
python uji_i3pack_exe.py      # exe hasil build diuji di folder tanpa file .py, 10 pemeriksaan
python uji_i3obj.py           # ekspor mesh .i3s ke OBJ: 32 pemeriksaan
python uji_i3bersih.py        # convert + bersihkan .i3s: 31 pemeriksaan
python uji_i3pack_gui.py      # jendela dijalankan di dalam proses, 147 pemeriksaan
                              # (termasuk drag & drop: pesan WM_DROPFILES sungguhan di-post
                              #  lalu dibiarkan di-dispatch mainloop, persis seperti
                              #  Explorer menjatuhkan file)
```

Uji banding itu yang paling penting: pack yang ditulis program ini **sama persis byte per byte**
dengan yang ditulis exe lama, termasuk hasil enkripsi ulang berkas SECURE.

## Membuat ulang exe-nya

Setelah `pindah_bone.py` atau `I3Chara Convert Bone V3.pyw` diubah:

```
python -m venv build_env
build_env\Scripts\python -m pip install pyinstaller==6.22.2
build_env\Scripts\pyinstaller --onefile --windowed --name "I3Chara Convert Bone V3" --paths . --hidden-import pindah_bone --hidden-import i3chr "I3Chara Convert Bone V3.pyw"
build_env\Scripts\pyinstaller --onefile --windowed --name "I3CHR Editor V3" --paths . --hidden-import i3chr --hidden-import i3senjata --hidden-import i3anim --hidden-import pindah_bone "I3CHR Editor V3.pyw"
build_env\Scripts\pyinstaller --onefile --windowed --name "I3Pack Editor V3" --paths . --hidden-import i3pack --hidden-import i3vtex --hidden-import i3obj --hidden-import i3bersih --hidden-import pindah_bone --hidden-import pindah_karakter --hidden-import pindah_senjata --icon Icon\IconExe.ico --add-data "Icon;Icon" "I3Pack Editor V3.pyw"
```

Hasilnya ada di `dist\I3Chara Convert Bone V3.exe`.

## I3Viewer Editor V3 (program keempat belas)

Untuk **mengambil model dari map lain dan menaruhnya di map Anda**, dalam tampilan 3D.

Buka `<Map>_World.I3S` (berkas lepas atau langsung dari dalam `.i3Pack`), lalu tekan
**"Ambil model dari map lain..."**, pilih scene sumbernya, pilih modelnya, dan modelnya muncul di
tengah pandangan. Sesudah itu tinggal diseret.

- **Seret biasa** = menggeser di lantai, **Shift + seret** = naik/turun.
- Panel kanan: nama, X / Y / Z (titik tumpu di lantai), putar Y, dan skala. Tekan **Terapkan**.
- **Duplikat** menggandakan model yang terpilih, **Hapus** membuangnya.
- **"Bisa dipindah"** membuat model bawaan map ikut bisa digeser.
- **Ctrl+Z** membatalkan, setepat-tepatnya (yang disimpan isi berkas utuh).
- Kamera: seret kanan = putar, seret tengah = geser, roda = zoom, WASD/QE = jalan,
  **F** = fokus ke model terpilih, **Home** = pas ke layar.

Yang perlu diketahui:

- **Teksturnya ikut sendiri.** Semua map menyimpan teksturnya di dalam `.I3S`, jadi tidak ada berkas
  pendamping yang harus disalin dan tidak ada pack tekstur yang harus disunting.
- Berkas hasil **tidak ditata ulang**: nomor versi dan seluruh objek lama tetap apa adanya, hanya objek
  baru yang ditambahkan. Ini penting - berkas map yang di-save ulang oleh tool i3Engine (versinya berubah
  jadi 0x00090001) sering ditolak client lama.
- Berlaku untuk scene V1 maupun V3 (`I3SN`). Kalau model asalnya dari client baru, vertex, material dan
  index array-nya disesuaikan otomatis saat diambil.
- Scene yang dibuka **dari pack** hanya bisa disimpan lewat "Simpan sebagai...". Masukkan kembali ke pack
  lewat I3Pack Editor V3, dan seperti biasa jangan menimpa pack aslinya - pakai salinan `" (2)"`.
### Ekspor ke .obj (untuk Blender, 3ds Max, dll.)

Tombol **"Ekspor .obj..."** di bilah alat, tepat di sebelah "Impor .obj...". Dialognya menanyakan
tiga hal:

**Yang diekspor** — seluruh scene, atau **model yang sedang terpilih saja**. Yang kedua berguna kalau
Anda cuma mau mengeluarkan satu bangunan dari sebuah map untuk disunting di Blender.

**Bentuk berkas** — dua-duanya ada:

- **Gabung** — satu berkas `.obj`, tiap mesh jadi satu `g` (group). Ini yang paling enak dibuka di
  Blender: semuanya masuk sekali impor dan tetap terpisah per objek.
- **Pisah** — satu berkas `.obj` per mesh, seperti ekspor OBJ di PB SDK. Namanya
  `<nama>_<mesh>.obj`, dan Anda diminta memilih foldernya.

**Ikut tekstur** (bawaan: ya) — menulis `.mtl` pendamping plus folder `<nama>_tex` berisi PNG tiap
tekstur. Tanpa ini modelnya terbuka abu-abu polos. Di mode **pisah**, semua berkasnya berbagi satu
`.mtl` yang sama, jadi PNG-nya tidak digandakan.

Yang perlu diketahui:

- **Yang diekspor adalah scene yang SEDANG terbuka**, termasuk suntingan yang belum disimpan. Jadi
  model yang baru Anda geser ikut terekspor di posisi barunya, tanpa harus Simpan dulu.
- Tekstur yang format `.i3i`-nya belum terpecahkan (kode 0x02 dan 0x07) **dilewati dengan catatan** —
  ekspornya tetap jalan, mesh itu saja yang tidak dapat gambar.
- Untuk scene **karakter**, sebagian mesh tidak dapat bahan karena ia LOD lain. Jumlahnya ditulis di
  catatan (`bahan: 7 dari 21 mesh dapat tekstur`). Meshnya tetap ikut terekspor.
- UV-nya ditulis dengan V dibalik tandanya, sama seperti ekspor OBJ di PB SDK — jadi berkasnya bisa
  bolak-balik lewat PB SDK maupun lewat **"Impor .obj..."** di alat ini sendiri tanpa teksturnya
  terbalik.

### Animasi dari Mixamo (I3BVH Convert V3)

Alat terpisah, `I3BVH Convert V3`, menjembatani gerakan Mixamo dengan animasi **`.i3a`** — dua arah.
**Berkas `.fbx` dari Mixamo bisa dipakai LANGSUNG; Blender tidak diperlukan lagi.**

**Mixamo → PB (cara singkat, tanpa Blender):**

1. Unduh gerakannya dari mixamo.com sebagai **FBX Binary**, Skin **Without Skin**, 30 FPS, Keyframe
   Reduction **none**; centang **In Place** kalau tidak mau karakternya berjalan keluar dari tempatnya.
2. Di I3BVH Convert V3: isi berkas `.fbx` itu dan berkas `.I3S` karakter yang mau dipakai, tekan
   **Gerakan → .i3a**.
3. Pasang hasilnya lewat I3Viewer Editor V3 → tab **Animasi** → **Pasang animasi dari .i3a...**

Isian nomor 1 menerima `.fbx` maupun `.bvh` — jenisnya dikenali dari isi berkasnya, bukan dari namanya.

**Lewat Blender (kalau FBX-nya versi lama atau ingin disunting dulu):** buka FBX di Blender, pilih
armature-nya, **File > Export > Motion Capture (.bvh)**, lalu pakai `.bvh` itu di isian nomor 1.
Blender tidak perlu plugin apa pun — impor FBX dan ekspor BVH sudah bawaan. Di kotak ekspornya
tidak ada yang perlu diatur: urutan kanal rotasi dibaca dari berkasnya.

**PB → Blender:** isi `.I3S` karakter + berkas `.i3a`, tekan **.i3a → BVH**, lalu buka hasilnya di
Blender lewat **File > Import > Motion Capture (.bvh)**.

Yang diurus sendiri oleh alatnya, tanpa perlu Anda atur:

- **Nama tulang.** 52 dari 63 tulang PB punya padanan Mixamo (`Pelvis`↔`Hips`, `R Little1`↔`RightHandPinky1`,
  dan seterusnya). Sisanya — `Root`, `IK`, `Pivot`, dan delapan tulang `Twist` — memang tidak ada di Mixamo
  dan dibiarkan diam di pose bind. Tabel pasangannya kelihatan di jendela, yang tanpa pasangan ditandai oranye.
- **Sumbu dan arah hadap.** BVH biasanya Y-atas, kerangka PB Z-atas. Alatnya mencoba 24 kemungkinan putaran
  dan memilih yang paling cocok dengan arah tulang.
- **Skala.** BVH sering keluar dalam sentimeter; perbandingannya dihitung dari bentang kerangka.
- **Rest pose yang berbeda.** Ini yang membuat gerakan Mixamo tidak bisa disalin mentah: `.i3a` menyimpan
  matriks lokal utuh, bukan selisih dari pose bind. Jadi yang dipindahkan orientasi di ruang dunia, lalu
  matriks lokalnya dihitung ulang mengikuti rantai induk karakter PB — panjang tulangnya tidak berubah.

Pilihan yang ada: kunci per detik (bawaan 30, sama seperti emote PB), rentang frame, **Diam di tempat**,
dan pemadatan trek yang tidak bergerak jadi satu kunci (berkas bawaan PB pun begitu: 315 dari 1.223 trek
di folder `Emote` cuma punya 1 kunci).

Catatan jujur: **belum pernah diuji dengan berkas Mixamo sungguhan** — di komputer ini tidak ada Blender
maupun berkas Mixamo. Yang sudah dibuktikan: kalau sebuah animasi PB diubah jadi rig "mirip Mixamo"
(52 tulang, nama `mixamorig:`, Y-atas, sentimeter) lalu di-retarget kembali, hasilnya sama dengan animasi
asalnya sampai **0,025 derajat**.

### Menyalin cabang yang punya suara atau efek (I3CHR Editor V3)

Dulu **"Salin cabang ini..."** menolak cabang yang state-nya memakai event berisi suara — pesannya
*"cabang seperti ini belum bisa disalin"*. Batas itu sudah dibuka.

Sekarang seluruh rantai peristiwanya ikut digandakan: `i3TimeSequence` → `i3TimeSequenceInfo` →
`i3SoundNode` → `i3SoundPlayInfo`. Yang **tidak** digandakan adalah berkas `.wav`-nya dan scene efeknya
— keduanya objek eksternal, jadi cukup dipakai bersama. Event yang memanggil efek (misalnya
`Effect/H/Emote_Air_Kiss_Heart.i3s` di emote Air_Kiss) juga sudah dikenali.

### Memasukkan .i3a ke dalam paket animasi (I3Anim Editor V3)

Supaya gerakan baru benar-benar dipakai karakter **di dalam game**, animasinya harus ada di dalam
`.i3AnimPack` — di situlah engine mencarinya berdasarkan jalur yang ditulis di berkas `.I3CHR`.
I3Anim Editor V3 sekarang bisa memasukkannya, dengan dua tombol baru:

- **"Ganti dari .i3a..."** — mengganti gerakan animasi yang sedang dipilih dengan isi berkas `.i3a`.
  Treknya dicocokkan lewat **nama tulang**, dan trek yang tidak ada di `.i3a` dibiarkan apa adanya.
  Cara ini **tidak perlu menyentuh `.I3CHR` sama sekali**: timpa saja animasi yang sudah ditunjuk
  sebuah state (misalnya `UI_IdleA` di lobi), dan karakternya langsung memainkan gerakan baru itu.
- **"Tambah .i3a..."** — menambahkan animasi **baru** ke paket. Anda diminta mengisi jalur mayanya,
  misalnya `chara/swat_female/3pv/common/emote_gangnam.i3a` — itulah yang nanti ditulis di `.I3CHR`
  (lewat I3CHR Editor V3) supaya state tertentu memakainya.

Jadi rantai lengkapnya: **Mixamo → `.fbx` → I3BVH Convert V3 → `.i3a` → I3Anim Editor V3 →
`.i3AnimPack`**.

Yang perlu diketahui: `.i3a` selalu membawa keempat kanal (posisi, rotasi, skala, waktu), sedangkan
95% trek di paket bawaan tidak punya kanal posisi sama sekali. Karena itu saat **mengganti**, bentuk
kanal slot tujuan diikuti — posisi yang nilainya tetap dibuang kalau slot aslinya memang tidak
punya, sehingga ekspor lalu impor lagi menghasilkan isi yang sama persis. Posisi yang benar-benar
bergerak selalu dipertahankan.

Belum diuji di dalam game.

### Daftar objek dan tulang

Panel kiri sekarang **pohon scene**, sama bentuknya dengan Grafo de Escena di i3Viewer2: akar, lalu
`i3Transform`, `i3Body`, `i3BoneRef`, `i3LOD`, dan seterusnya. Warnanya: **hijau** = bisa dipindah,
**biru** = punya mesh, **cokelat** = rangka/badan/LOD. Memilih model di 3D otomatis membuka dan menyorot
barisnya; kotak **Cari** mendatarkan pohon jadi daftar hasil.

Centang **Tulang** di toolbar menggambar kerangka karakter — garis biru antar-tulang dengan titik kuning di
sendinya, tetap terlihat walau di dalam mesh. Map biasa tidak punya kerangka, jadi centang itu tidak
berpengaruh di sana.

### Kenapa mengeklik mobil di Crackdown memilih tanahnya

Ada dua hal, dan cuma satu yang bug:

1. **Aturan pemilihannya memang salah** dan sudah diperbaiki. Dulu yang dipakai calon pertama yang kotak
   batasnya kena sinar; kotak batas satu batch di Crackdown seluas 589 × 17 × 496 m, jadi hampir selalu
   menang. Sekarang yang dipakai **segitiga terdekat** yang sungguh kena. Diukur dengan 200 sinar acak:
   aturan lama salah pada **64 di antaranya (32%)**.

2. **Tapi Crackdown memang tidak punya objek "mobil".** Mesh map itu digabung **per bahan**, bukan per
   benda: 24 model bernama `Crackdown_1` masing-masing seluas ±34 × 1 × 35 m, dan `Humvee_Glass` bukan
   mobil melainkan seluruh kaca di map digabung jadi 176 segitiga selebar 32 × 40 m. Badan mobilnya berada
   di dalam satu batch bersama tanahnya, jadi memilihnya pasti ikut memilih batch itu. Lihat kolom
   **Ukuran** di pohon: kalau ukurannya puluhan meter, itu batch, bukan satu benda.

   Map seperti RothenVillage sebaliknya — di sana tiap benda memang objek sendiri
   (`Object_RothenVillage_Snowman_01`), dan memilihnya terasa pas. Memecah batch jadi benda-benda terpisah
   belum bisa dilakukan alat ini.

### Memutar, tekstur, animasi, dan karakter

**Memutar dengan mouse.** Di model yang terpilih:

| | |
|---|---|
| seret | geser di lantai (kiri/kanan, maju/mundur) |
| **Shift** + seret | naik / turun |
| **Ctrl** + seret | putar - mendatar = kiri/kanan, tegak = atas/bawah |
| **Ctrl + Shift** + seret | miringkan |

Modelnya berputar **di tempat** - titik tumpunya tidak bergeser. Angkanya juga bisa diketik di tab
**Penempatan** (Putar Y / Putar X / Putar Z), dan tombol **"Tegakkan lagi"** mengembalikan ketiganya ke nol
tanpa memindahkan model.

**Mengganti tekstur** - tab **Tekstur**. Daftarnya menunjukkan tekstur apa saja yang dipakai model itu
(diffuse, normal, specular, lightmap), lengkap dengan nama dan ukurannya. **"Ganti dari berkas .i3i..."**
menukarnya; kalau ukuran pikselnya berbeda dari yang lama Anda ditanya dulu, karena UV model dibuat untuk
ukuran yang lama. **"Simpan tekstur ini ke .i3i..."** mengeluarkannya untuk disunting di luar. Teksturnya
harus berupa `.i3i` - alat ini tidak mengubah PNG jadi `.i3i`.

**Animasi** - tab **Animasi**. Tekan **"Pasang animasi dari .i3a..."** lalu pilih berkasnya. Ada dua cara
pasang, dan alatnya memilih sendiri sesuai isi scene:

- **Scene karakter (punya `i3Body`)** — SELURUH trek `.i3a` dipasang ke kerangkanya lewat kotak
  **Animation** milik `i3Body`, persis seperti yang dilakukan i3Viewer2 kalau Anda klik `i3Body` lalu
  mengisi kotak itu. Bedanya di sini tidak perlu diklik apa-apa: begitu dipasang, modelnya langsung
  bergerak. Ini yang dipakai berkas bawaan PB juga — animasi di dalam `Mermaid_ViperRed.I3S` ternyata
  sama persis, byte per byte, dengan `Emote\Salsa_Dance.i3a`.
- **Scene map (tanpa `i3Body`)** — satu trek saja yang dipasang, ke node pembungkus modelnya, karena yang
  digerakkan seluruh model sekaligus (bukan tulang per tulang). Kalau `.i3a`-nya punya banyak trek Anda
  diminta memilih satu.

**"Lepas animasi"** membatalkannya dan objeknya ikut dibuang, jadi berkasnya kembali persis seperti semula.

**Pratinjau gerak.** Di tab yang sama ada kotak **Pratinjau gerak**: tombol **Jalankan / Berhenti** dan
penggeser waktu, plus kotak centang **Gerakkan** di toolbar. Modelnya benar-benar dianyam ulang tiap frame
dan kalau **Tulang** dicentang rangkanya ikut bergerak. Sasarannya **60 fps** dan angka yang benar-benar
tercapai ditampilkan di sebelah waktunya — pada WarDog_Red (7.367 verteks yang digambar) satu frame
sekitar 14 ms, dan yang benar-benar terukur di jendela **58-59 fps** — sudah mentok di vsync layar. Pratinjau ini cuma
tampilan — berkasnya tidak ikut berubah, jadi menyimpan sesudah memutar tetap menghasilkan berkas yang sama.

Perlu dicatat: **belum diuji di dalam game** apakah client V1 memutar animasi scene sementara `.I3CHR` juga
menggerakkan karakternya. Yang sudah pasti, i3Viewer2 langsung memutarnya tanpa satu pun baris di log-nya.

**Scene karakter.** `.I3S` karakter sekarang bisa dibuka juga: bagian-bagiannya (`Model_Arms_Material`,
`Model_LowBody_Material`, ...) muncul sebagai model, tergambar bertekstur, dan bisa diambil ke dalam map
seperti model biasa. Dua catatan: LOD0 karakter itu tangan orang-pertama, jadi yang digambar LOD dengan
segitiga terbanyak; dan tekstur karakter berupa jalur luar, jadi kalau berkas `.i3i`-nya tidak ada di
sebelahnya log akan bilang "tidak ditemukan".

### Tabrakan

Model yang baru ditaruh belum menghalangi siapa pun sampai dibuatkan tabrakan. Itu sekarang ada di alat ini:

- Saat scene dibuka, berkas `<Map>_Col_Hero.I3S` (tabrakan pemain) dan `<Map>_Col_Hit.I3S` (tabrakan peluru)
  **dicari sendiri** - di sebelah berkas scene, atau di pack `<Map>_Col*.i3pack` kalau scene-nya dibuka dari
  pack. Kalau tidak ketemu, pakai **"Buka berkas..."**.
- Pilih modelnya, centang **Pemain** dan/atau **Peluru**, lalu tekan **"Buat tabrakan untuk model ini"**.
  Kotaknya mengikuti ukuran dan putaran model, bukan kotak gemuk sejajar sumbu.
- Sesudah itu kotaknya **ikut sendiri** setiap kali model digeser, diputar, diskalakan, atau diganti nama,
  dan ikut terhapus kalau modelnya dihapus.
- Centang **"Tampilkan tabrakan di 3D"** untuk melihat semuanya: tabrakan bawaan map sebagai rangka tipis,
  kotak model yang terpilih diisi kuning.
- **Simpan** menyimpan scene sekaligus berkas tabrakan yang berubah. Kalau berkas tabrakannya berasal dari
  pack, Anda akan diminta memilih tempat menyimpannya - pack aslinya tidak ditimpa.

Satu hal yang perlu diperhatikan: sebagian "model" di dalam map sebenarnya **satu batch berisi banyak benda
yang tersebar** (contohnya `Object_RothenVillage_Ork_Cask` = semua tong di desa itu, kotaknya 75 x 1 x 44 m).
Lihat kolom **Ukuran** di daftar model sebelum mengambil; kalau ukurannya puluhan meter, itu batch, bukan satu
benda. Alatnya juga bertanya dulu sebelum membuat kotak tabrakan yang sisinya lebih dari 15 m.

Sekalian diperbaiki di versi ini: tampilan 3D dulu selalu membaca index array sebagai 16 bit, padahal
hampir separuh map memakai 32 bit. Map seperti RothenVillage karena itu tampil berantakan di I3Collision,
I3INS dan I3Path Editor. Sekarang sudah benar di semuanya.

## I3CHR Maker V3 (program keenam belas: bikin `.I3CHR` senjata dari nol)

Bedanya dengan **I3CHR Editor V3**: yang itu MENYUNTING `.I3CHR` yang sudah ada,
yang ini MEMBUAT yang baru — dari nol, tanpa menyalin senjata lain sama sekali.
Jadi tidak ada lagi sisa nama senjata cetakan di dalam hasilnya.

Dasarnya pengukuran, bukan tebakan: **758 berkas `.I3CHR` senjata** di folder
`Pack\` client disapu, dan dari situ ketahuan bahwa **driver sebuah senjata sudah
menentukan daftar state-nya**. Untuk 43 dari 48 driver, daftar state yang dipakai
mayoritas senjata bawaan sama persis. Jadi begitu jenis senjatanya dipilih,
nama-nama state-nya terisi sendiri dan tidak ada yang perlu dikarang.

### Cara pakai

1. **Nama senjata** — misalnya `Ninjato`. Jalur scene (`Weapon\Ninjato\Ninjato.I3S`)
   dan nama berkas keluarannya terisi sendiri.
2. **Jenis senjata** — `melee`, `pisau`, `kapak`, `knuckle`, `pistol`, `assault`,
   `smg`, `sniper`, `shotgun`, `mg`, `granat`, `bom`, `busur`. Combo Driver di
   sebelahnya boleh dipakai langsung kalau mau memilih salah satu dari ke-48 driver;
   labelnya menyebutkan berapa senjata bawaan yang memakainya, jadi kelihatan mana
   yang umum.
3. **Paket animasi** (boleh dilewati) — tunjuk `.i3AnimPack` senjata itu, atau
   tekan **Dari pack client...** dan pilih `.i3Pack`-nya; paketnya dikeluarkan
   sendiri. Lalu **Cocokkan otomatis**: animasi DAN durasinya terisi dari paket.
   Durasi dibaca dari paketnya, bukan ditebak — itu yang biasanya bikin gerakan
   senjata tidak sinkron.
4. **State** — tabelnya bisa dirapikan satu per satu: isi Animasi (tombol
   **Pilih...** menampilkan isi paket beserta durasinya), Durasi, Blend, lalu
   **Terapkan**. **Kosongkan** mengosongkan satu state. State yang tidak dapat
   pasangan sengaja DIBIARKAN kosong — animasi yang salah lebih mengganggu
   daripada state yang diam.
5. **Tambah suara...** — file `.wav`, detik ke berapa, dan panjangnya. Boleh
   beberapa suara dalam satu state (mis. remove / load / reload).
6. **Nama node i3Chara** — tiga pilihan, dan ketiganya ada di senjata bawaan:
   nama senjata itu sendiri (pola senjata DASAR seperti AKS74U, 870MCS, Kukrii),
   kosong, atau nama senjata lain (pola senjata turunan seperti AK-47_SOPMOD yang
   memakai nama `AK-47`). Bawaannya nama sendiri.
7. **Buat .I3CHR**. Berkasnya langsung diperiksa ulang; kalau ada yang tidak benar
   berkasnya DIHAPUS dan alasannya ditulis di panel Catatan.

Hasilnya masih bisa disunting lagi di **I3CHR Editor V3** seperti biasa.

### Yang TIDAK dibuat alat ini

Hanya mesin keadaannya (state, animasi, durasi, suara). Senjata barunya masih
butuh berkas lain yang dibuat alat lain:

| | dibuat dengan |
|---|---|
| `.I3S` (model) | **I3SWeapon Maker** (dari `.glb`/`.fbx`/`.obj`) |
| `.i3AnimPack` (animasi) | **I3Anim Editor V3** (+ **I3BVH Convert V3** untuk gerakan Mixamo) |
| entri `Weapon.pef` | PropertyEditor |
| entri `Weapon.RSC` | **I3RSC Editor V3** |
| pack-nya | **I3Pack Editor V3** |

Animasi yang disebut di sini harus BENAR-BENAR ada di paket animasi senjata itu;
kalau tidak, state-nya diam saja. Untuk senjata MELEE di client V1 ini, gerakan
yang terlihat sebagian besar datang dari cabang KARAKTER, bukan dari `.I3CHR`
senjatanya — jadi model senjatanya memang nyaris tidak bergerak, dan itu normal.

### Baris perintah

```powershell
# daftar ke-48 driver beserta berapa senjata bawaan memakainya
python i3chrbaru.py --daftar-driver

# senjata melee baru, animasi dan durasi dicocokkan dari paketnya
python i3chrbaru.py --nama Ninjato --driver melee --out Ninjato.I3CHR ^
    --animpack Ninjato.i3AnimPack --auto

# satu animasi untuk semua state, plus satu suara di state Fire
python i3chrbaru.py --nama Pedang --driver pisau --out Pedang.I3CHR ^
    --semua-anim "Weapon/Pedang/Resource/Idle.i3a" ^
    --suara "Fire=Sound/Weapon/WM_Pedang.wav,0.1,0.5"

# periksa sebuah .I3CHR senjata (punya sendiri atau bawaan)
python i3chrbaru.py --info Ninjato.I3CHR --animpack Ninjato.i3AnimPack
```

`--info` melaporkan ukuran, jumlah objek, driver, nama i3Chara, scene, daftar
state beserta mana yang terisi, dan apakah ada rujukan maju. Kalau `--animpack`
diberikan, durasi tiap state ikut dibandingkan dengan durasi sebenarnya di paket.

### Ekor 8 byte sesudah `i3AIContext` (perbaikan 06/10/2026)

Uji pertama di game GAGAL, dan sebabnya satu hal yang tidak kelihatan dari dalam
Python: **engine membaca 8 byte di luar ukuran objek `i3AIContext` yang
dideklarasikan**. Berkas tanpa byte itu ditolak dengan

```
[F] i3AIContext.cpp(573) : i3AIContext::OnLoad
    i3ResourceManager __LoadResource i3Chr <gagal>
```

Diukur di 762 `.I3CHR` berkonteks di client: tidak satu pun punya kurang dari 8 byte
sesudah `i3AIContext` (753 tepat 8 byte nol, 9 lebih karena ada teks cap air modder
di situ). Isinya tidak penting — yang wajib cuma bisa dibaca. Alat ini sekarang
selalu menulisnya, dan `--info` **menolak** berkas yang kurang, dengan menyebut pesan
client yang sebenarnya.

Kalau Anda punya `.I3CHR` senjata buatan alat lain yang ditolak client dengan baris
`i3AIContext::OnLoad`, periksa dengan `--info`: besar kemungkinan ekornya hilang.

Berkas yang disunting **I3CHR Editor V3** tidak terkena — ia menyalin wilayah data
berkasnya utuh, jadi ekornya ikut terbawa (sudah diuji bolak-balik di Kukrii, M-7
dan 870MCS: byte-identik).

**Terbukti di game 06/10/2026** sesudah perbaikan ini — Katana yang seluruh bytenya
dibuat alat ini, tanpa mengkloning senjata mana pun, dimuat dan dipakai client.


## I3SWeapon Maker (program keenam belas: model 3D jadi senjata `.i3s`)

Dulu bernama **I3Senjata Convert V3**; namanya diganti 06/10/2026, isinya sama
(ditambah opsi Geser di bawah).

`.glb` / `.gltf` / `.fbx` / `.obj` jadi senjata Point Blank `.i3s` V1 — dibangun
dari nol, **tanpa mengkloning senjata bawaan**, jadi tidak ada sisa nama senjata
lain di dalam hasilnya. Tulang, bobot verteks dan tekstur ikut dari sumbernya,
daftar LOD dibuat otomatis, dan animasi sumbernya bisa sekalian ditulis sebagai
`.i3a`.

### Kalau posisi senjatanya meleset di tangan

Isi baris **Geser X/Y/Z** di kartu "Orientasi & ukuran" (satuannya **meter**):

| sumbu | arah |
|---|---|
| **X** | kiri / kanan |
| **Y** | atas / bawah |
| **Z** | maju / mundur (ujung senjata ke arah +) |

Diukur di 6 senjata melee bawaan: X selalu sumbu tipisnya (0,03–0,09 m), dan
pangkal senjata selalu di ujung negatif sumbu panjangnya. Koma desimal diterima
(`0,05` maupun `0.05`).

Isian ini menggeser senjata **utuh** — mesh, tulang, dan matriks bind-nya ikut —
jadi mesh ber-skin tidak akan lepas dari tulangnya. Dibiarkan `0` berarti tidak ada
yang berubah sama sekali (hasilnya identik byte dengan sebelum opsi ini ada).

Dua isian di atasnya untuk masalah lain: **Skala manual** kalau ukurannya salah
(kosong = ukuran asli dipakai apa adanya; senjata jarak-dekat bawaan panjangnya
0,30–1,82 m), dan **Putar X/Y/Z** dalam derajat kalau orientasi otomatisnya salah.

Baris perintah:

```powershell
python i3senjatabaru.py --sumber Pedang.glb --out Pedang.I3S --nama Pedang ^
    --geser 0.05,-0.02,0.10
```
