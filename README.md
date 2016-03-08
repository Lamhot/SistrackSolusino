# SistrackSolusino
Test for web developer
Created by:
Lamhot J.M. Siagian

1	Data Interface Description
Pada subbab dijelaskan mengenai deskripsi data pada basis data dalam bentuk Entity Relation Diagram (ERD), CDM (Conceptual Data Model), dan PDM (Physical Data Model), serta design  database dari phpmyadmin.
1.1	ERD 
Entity Relational Diagram dari db_kampus dapat dilihat pada Gambar 1.
Here entity digram for case study:
![digram](https://cloud.githubusercontent.com/assets/6355277/13598879/d384d738-e552-11e5-99f2-81615410ed73.png) 
Gambar 1. ERD db_kampus
1.2	CDM
Berikut adalah gambaran Conceptual Data Model (CDM) dari db_kampus dapat dilihat pada Gambar 2.
![pdm](https://cloud.githubusercontent.com/assets/6355277/13599237/78157d06-e554-11e5-89c0-6107786f08ef.png) 
Gambar 2.Conseptual Data Modeling (CDM) db_kampus
1.3	PDM
Berikut adalah gamabar PDM(Physical data modeling) dari studi kasus db_kampus dapat dilihat pada Gambar 3.
![pdm2](https://cloud.githubusercontent.com/assets/6355277/13599278/a37aa8fe-e554-11e5-8665-52335b691576.png)
Gambar 3.Physical Data Modeling db_kampus
1.4	Design Database dari phpmyadmin
 ![db admin](https://cloud.githubusercontent.com/assets/6355277/13599311/c29dc7a2-e554-11e5-9a2c-44fd7a8d43bf.png)
Gambar 4.Design Database dari phpmyadmin

2	Perintah Sql
1.	Mengetahui jadwal ngajar dosen tertentu di hari tertentu

SELECT t_dosen.nama_dosen,t_jadwal.date,t_jadwal.star_time,t_jadwal.end_time,t_lokasi.nama_lokasi FROM t_dosen
JOIN dosen_mk ON t_dosen.id_dosen=dosen_mk.id_dosen
JOIN t_mata_kuliah 
ON t_mata_kuliah.id_mata_kuliah=dosen_mk.id_mk
JOIN t_jadwal
ON t_jadwal.id_dosen_mk=dosen_mk.id_dosen_mk
JOIN t_lokasi
ON t_lokasi.id_lokasi=t_jadwal.id_lokasi

Hasil:
![hasil4](https://cloud.githubusercontent.com/assets/6355277/13599201/523ba7b8-e554-11e5-9b97-082b42dc8e1b.png)

2.	Mengetahui jadwal untuk mata kuliah tertentu
![query2](https://cloud.githubusercontent.com/assets/6355277/13599134/1db6c2e8-e554-11e5-95d6-2309ea838a0a.png)
Hasil:
![hasil3](https://cloud.githubusercontent.com/assets/6355277/13599114/feef5546-e553-11e5-8b49-6975f71d368e.png)
3.	Untuk mengetahui jadwal mata kuliah dan dosen yang masuk pada hari tertentu.

![query](https://cloud.githubusercontent.com/assets/6355277/13599079/d1ccf046-e553-11e5-8571-584d766a410d.png)

SELECT t_dosen.nama_dosen,t_mata_kuliah.nama_mata_kuliah,t_jadwal.date,t_jadwal.star_time,t_jadwal.end_time,t_lokasi.nama_lokasi FROM t_dosen
JOIN dosen_mk ON t_dosen.id_dosen=dosen_mk.id_dosen
JOIN t_mata_kuliah 
ON t_mata_kuliah.id_mata_kuliah=dosen_mk.id_mk
JOIN t_jadwal
ON t_jadwal.id_dosen_mk=dosen_mk.id_dosen_mk
JOIN t_lokasi
ON t_lokasi.id_lokasi=t_jadwal.id_lokasi

Hasil:
![hasil2](https://cloud.githubusercontent.com/assets/6355277/13599047/acbfb888-e553-11e5-9e96-1c786c861f70.png)
 
4.	Untuk mengetahui jadwal satu kelas dalam  hari.
SELECT t_dosen.nama_dosen,t_mata_kuliah.nama_mata_kuliah,t_jadwal.date,t_jadwal.star_time,t_jadwal.end_time,
t_lokasi.nama_lokasi,t_kelas.nama_kelas
FROM t_dosen
JOIN dosen_mk ON t_dosen.id_dosen=dosen_mk.id_dosen
JOIN t_mata_kuliah 
ON t_mata_kuliah.id_mata_kuliah=dosen_mk.id_mk
JOIN t_jadwal
ON t_jadwal.id_dosen_mk=dosen_mk.id_dosen_mk
JOIN t_lokasi
ON t_lokasi.id_lokasi=t_jadwal.id_lokasi
JOIN kelas_jadwal
ON t_jadwal.id_jadwal=kelas_jadwal.id_jadwal
JOIN t_kelas
ON t_kelas.id_kelas=kelas_jadwal.id_kelas

Hasil:
![hasil](https://cloud.githubusercontent.com/assets/6355277/13599006/8483fe1a-e553-11e5-882b-2f7a94cb4b98.png)

