-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jul 2022 pada 19.31
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peminjaman4`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL,
  `kode_barang` varchar(25) NOT NULL,
  `kode_matkul` varchar(10) NOT NULL,
  `nama_barang` varchar(75) NOT NULL,
  `nup` int(11) NOT NULL,
  `jumlah_barang` varchar(15) NOT NULL,
  `status_akun` enum('tersedia','disimpan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `kode_barang`, `kode_matkul`, `nama_barang`, `nup`, `jumlah_barang`, `status_akun`) VALUES
(0, '3030301032', 'RTT191103', 'Digital Multimeter', 0, '10', 'tersedia'),
(0, '3060102038', 'RTT191103', 'Power Supply ', 0, '10', 'tersedia'),
(0, '3080141185', 'RTT191101', 'Oscilloscope', 0, '10', 'tersedia'),
(0, '3080804001', 'RTT191103', 'MultiMeter', 0, '10', 'tersedia'),
(0, '805', 'RTT191103', 'Protoboard', 0, '10', 'tersedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kerusakan`
--

CREATE TABLE `tb_kerusakan` (
  `id_kerusakan` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `kode_barang` varchar(25) NOT NULL,
  `jenis` enum('rendah','sedang','parah') NOT NULL,
  `keterangan` varchar(120) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kerusakan`
--

INSERT INTO `tb_kerusakan` (`id_kerusakan`, `id_petugas`, `id_peminjaman`, `kode_barang`, `jenis`, `keterangan`, `foto`, `created_at`) VALUES
(3, 1, 1, '3030301032', 'sedang', 'Ganti Fuse', '', '2022-07-14 12:04:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_konfigurasi`
--

CREATE TABLE `tb_konfigurasi` (
  `id_konfigurasi` int(11) NOT NULL,
  `maksimal_jam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mahasiswa`
--

CREATE TABLE `tb_mahasiswa` (
  `NIM` varchar(10) NOT NULL,
  `nama` varchar(75) NOT NULL,
  `prodi` varchar(15) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `kelompok` varchar(10) NOT NULL,
  `ktm` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_mahasiswa`
--

INSERT INTO `tb_mahasiswa` (`NIM`, `nama`, `prodi`, `kelas`, `kelompok`, `ktm`) VALUES
('', 'hakksk', 'ajsksk', '3', '3', ''),
('109', 'nama', 'prodi', 'kelas', '1', ''),
('123', 'sfh', 'hjk', '2', '4', ''),
('1235488', 'akskksk', 'akhajw', '3', '4', ''),
('1868135063', 'Dwi Nur Cahyo', 'D4 Jurusan Tele', '3A', '', '62cf655a2219e.png'),
('1931130011', 'Dwi Putri Rahayu', 'Telekomunikasi', '3A', '01', ''),
('1931130012', 'Dwi Putri Rahayu', 'Telekomunikasi', '3A', '2', ''),
('1931130108', 'Anindya Magreta', 'D3 Teknik Telek', '3A', '', '62d003c047129.jpg'),
('1931130126', 'Sekar Tanjung', 'D3 Teknik Telek', '3A', '', '62cf99580283b.jpg'),
('test', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_matakuliah`
--

CREATE TABLE `tb_matakuliah` (
  `kode_matkul` varchar(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `semester` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_matakuliah`
--

INSERT INTO `tb_matakuliah` (`kode_matkul`, `nama`, `semester`, `created_at`) VALUES
('RTT191101', 'Bengkel Elektromekanik', 1, '2022-06-15 14:20:28'),
('RTT191103', 'Praktikum Rangkaian Listrik', 1, '2022-06-15 14:20:56'),
('RTT191104', 'Praktikum Pengukuran Besaran Listrik', 1, '2022-06-15 14:20:04'),
('RTT191106	', 'Praktikum Piranti dan Rangkaian Elektronika	', 1, '2022-06-15 14:21:18'),
('RTT192103', 'Praktikum Telekomunikasi Analog dan Digital', 2, '2022-06-15 14:23:03'),
('RTT192105	', 'Praktikum Rangkaian Digital', 2, '2022-06-15 14:23:34'),
('RTT192109', 'Praktikum Saluran Transmisi', 2, '2022-06-15 14:24:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_peminjaman`
--

CREATE TABLE `tb_peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `NIM` varchar(10) NOT NULL,
  `tanggal_awal` datetime NOT NULL,
  `tanggal_berakhir` datetime DEFAULT NULL,
  `status` enum('diproses','disetujui','ditolak','dipinjam','selesai') NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `qrcode` varchar(75) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_peminjaman`
--

INSERT INTO `tb_peminjaman` (`id_peminjaman`, `NIM`, `tanggal_awal`, `tanggal_berakhir`, `status`, `keterangan`, `qrcode`, `created_at`) VALUES
(1, '1931130011', '2022-07-14 13:46:38', NULL, 'dipinjam', NULL, '62D0021EE5444.png', '2022-07-14 11:46:38'),
(2, '1931130126', '2022-07-14 13:47:22', NULL, 'selesai', '', '62D0024A0EEB5.png', '2022-07-14 11:47:22'),
(3, '1931130108', '2022-07-14 13:54:42', NULL, 'diproses', NULL, '62D00402E4B93.png', '2022-07-14 11:54:42'),
(4, '1931130126', '2022-07-14 14:06:15', NULL, 'diproses', NULL, '62D006B732D8B.png', '2022-07-14 12:06:15'),
(5, '1931130126', '2022-07-18 06:04:39', NULL, 'dipinjam', NULL, '62D4DBD7D15BB.png', '2022-07-18 04:04:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_peminjaman_detail`
--

CREATE TABLE `tb_peminjaman_detail` (
  `id_peminjaman_detail` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `kode_barang` varchar(25) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_peminjaman_detail`
--

INSERT INTO `tb_peminjaman_detail` (`id_peminjaman_detail`, `id_peminjaman`, `kode_barang`, `jumlah`) VALUES
(1, 1, '3030301032', 2),
(2, 2, '3030301032', 3),
(3, 0, '3030301032', 1),
(4, 0, '3060102038', 1),
(5, 4, '3060102038', 1),
(6, 4, '3030301032', 1),
(7, 5, '3060102038', 2),
(8, 5, '805', 1),
(9, 5, '3030301032', 2),
(10, 5, '3080804001', 1),
(11, 6, '3030301032', 1),
(12, 6, '3060102038', 1),
(13, 6, '805', 2),
(14, 7, '3080141185', 1),
(15, 8, '3080141185', 1),
(16, 9, '3080141185', 3),
(17, 10, '3080141185', 1),
(18, 11, '3080141185', 2),
(19, 12, '3080141185', 1),
(20, 13, '3030301032', 1),
(21, 13, '3060102038', 1),
(22, 13, '3080804001', 1),
(23, 13, '805', 1),
(24, 14, '3080141185', 1),
(25, 15, '3080141185', 3),
(26, 16, '3080141185', 2),
(27, 1, '3030301032', 1),
(28, 1, '3060102038', 1),
(29, 1, '3080804001', 1),
(30, 1, '805', 1),
(31, 2, '3080141185', 2),
(32, 3, '3030301032', 1),
(33, 3, '3060102038', 1),
(34, 4, '3060102038', 1),
(35, 5, '3030301032', 1),
(36, 5, '3060102038', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `id_petugas` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `NIP` varchar(20) DEFAULT NULL,
  `nama` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_petugas`
--

INSERT INTO `tb_petugas` (`id_petugas`, `id_user`, `NIP`, `nama`) VALUES
(1, 1, '1868135063', 'admin'),
(4, 23, '12345678', 'Dwi Putri Rahayu'),
(5, 24, '', 'Eko Parmuji');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_users`
--

CREATE TABLE `tb_users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status_akun` enum('aktif','nonaktif') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_users`
--

INSERT INTO `tb_users` (`id_user`, `username`, `password`, `status_akun`, `created_at`, `update_at`) VALUES
(1, 'admin', '$argon2i$v=19$m=65536,t=4,p=1$SEdxS3NYLmhCU2dwLlFJSw$urLr24Dj++BAUd2DvWM3INn+ko94N+LC71Zy4DLC7uQ', 'aktif', '2022-03-19 03:37:01', '2022-04-03 07:16:28'),
(23, 'Dwi Putri Rahayu', '$argon2i$v=19$m=65536,t=4,p=1$dG5jMjBVQVBXNmx4NjFqdw$+CNoJiG3MgVHSHcF8+/alEDsbzjnJdUKMkeLyeo4/4U', 'aktif', '2022-06-14 05:54:20', '2022-06-14 05:54:20'),
(24, 'Eko Parmuji', '$argon2i$v=19$m=65536,t=4,p=1$WjZ2Q2YuVHBxQTFPcGhodw$YVfX32g7ZNUaIuxknQHkpxFeo6bBEInOJeggr2iRdeM', 'aktif', '2022-07-14 12:06:40', '2022-07-14 12:06:40');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indeks untuk tabel `tb_kerusakan`
--
ALTER TABLE `tb_kerusakan`
  ADD PRIMARY KEY (`id_kerusakan`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_peminjaman` (`id_peminjaman`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indeks untuk tabel `tb_matakuliah`
--
ALTER TABLE `tb_matakuliah`
  ADD PRIMARY KEY (`kode_matkul`);

--
-- Indeks untuk tabel `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `NIM` (`NIM`);

--
-- Indeks untuk tabel `tb_peminjaman_detail`
--
ALTER TABLE `tb_peminjaman_detail`
  ADD PRIMARY KEY (`id_peminjaman_detail`),
  ADD KEY `id_peminjaman` (`id_peminjaman`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`id_petugas`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_kerusakan`
--
ALTER TABLE `tb_kerusakan`
  MODIFY `id_kerusakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_peminjaman_detail`
--
ALTER TABLE `tb_peminjaman_detail`
  MODIFY `id_peminjaman_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_kerusakan`
--
ALTER TABLE `tb_kerusakan`
  ADD CONSTRAINT `tb_kerusakan_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `tb_petugas` (`id_petugas`),
  ADD CONSTRAINT `tb_kerusakan_ibfk_3` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`);

--
-- Ketidakleluasaan untuk tabel `tb_peminjaman_detail`
--
ALTER TABLE `tb_peminjaman_detail`
  ADD CONSTRAINT `tb_peminjaman_detail_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`);

--
-- Ketidakleluasaan untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD CONSTRAINT `tb_petugas_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
