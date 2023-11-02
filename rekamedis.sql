-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Nov 2023 pada 07.25
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rekamedis`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_obat`
--

CREATE TABLE `tbl_obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `kegunaan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_obat`
--

INSERT INTO `tbl_obat` (`id`, `nama_obat`, `kegunaan`) VALUES
(3, ' Amoxicilin', 'Antibiotik'),
(4, 'Paracetamol', 'Demam, Nyeri'),
(6, ' obh', 'obat batuk'),
(7, ' haha', 'hihi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pasien`
--

CREATE TABLE `tbl_pasien` (
  `id` varchar(20) NOT NULL,
  `nama_pasien` varchar(255) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `gender` enum('P','W') NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_pasien`
--

INSERT INTO `tbl_pasien` (`id`, `nama_pasien`, `tgl_lahir`, `gender`, `no_telp`, `alamat`) VALUES
('231020054218', 'alexis', '2023-10-03', 'P', '0821263772912', 'Cikutra, Kota Bandung Selatan\r\n.'),
('231021083510', ' Ss', '2023-10-18', 'W', '123456778900', 'Cikarang'),
('231023100358', ' bardad', '2023-10-23', 'P', '0813214654684', 'demak, jawa tengah, indonesia\r\n'),
('231029032838', ' bapak', '1997-06-11', 'P', '08123456789', 'GENUK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_rekamedis`
--

CREATE TABLE `tbl_rekamedis` (
  `no_rm` varchar(15) NOT NULL,
  `tgl_rm` date NOT NULL,
  `id_pasien` varchar(20) NOT NULL,
  `keluhan` text NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `diagnosa` text NOT NULL,
  `obat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_rekamedis`
--

INSERT INTO `tbl_rekamedis` (`no_rm`, `tgl_rm`, `id_pasien`, `keluhan`, `id_dokter`, `diagnosa`, `obat`) VALUES
('RM-001-011123', '2023-11-01', '231023100358', 'batuk', 7, 'batuk', 'obh'),
('RM-001-021123', '2023-11-02', '231020054218', 'batuk', 7, 'batuk', 'obh'),
('RM-001-120823', '2023-08-12', '231023100358', 'batuk', 8, 'batuk', 'obh'),
('RM-001-150923', '2023-09-15', '231029032838', 'batuk', 8, 'batuk', 'obh'),
('RM-001-291023', '2023-10-29', '231029032838', 'ahhhh', 8, 'ihhh', 'obh'),
('RM-002-011123', '2023-11-01', '231029032838', 'batuk', 8, 'batuk', 'obh'),
('RM-002-021123', '2023-11-02', '231021083510', 'batuk', 8, 'batuk', 'obh'),
('RM-002-120823', '2023-08-12', '231021083510', 'batuk', 7, 'batuk', 'obh'),
('RM-002-291023', '2023-10-29', '231023100358', 'batuk', 7, 'batuk', 'obh'),
('RM-003-011123', '2023-11-01', '231023100358', 'batuk', 7, 'batuk', 'obh'),
('RM-003-291023', '2023-10-29', '231021083510', 'batuk', 7, 'batuk', 'obh');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `userid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jabatan` enum('1','2') NOT NULL COMMENT '1= admin, 2=dokter'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`userid`, `username`, `fullname`, `password`, `jabatan`) VALUES
(6, 'admin', 'admin', '$2y$10$TVaaRZ9EtZluuVrf.FIkcOjgfEmcsxgk1/2dYRaJzvYKLV/0etzya', '1'),
(7, 'Dokter', 'Dokter', '$2y$10$RfHV6mFO40QmyE5YjKJmOOcbn.Ij0OKQbp88KjXtmg3gs7TYQ69iO', '2'),
(8, 'Dokter Haydar', 'Haydar', '$2y$10$uEZFBWXQjC3Flm1iXWllT.nCM.Mz7gUzwz/prbK1GKCaFGba.qxWK', '2');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_obat`
--
ALTER TABLE `tbl_obat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_pasien`
--
ALTER TABLE `tbl_pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_rekamedis`
--
ALTER TABLE `tbl_rekamedis`
  ADD PRIMARY KEY (`no_rm`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_obat`
--
ALTER TABLE `tbl_obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_rekamedis`
--
ALTER TABLE `tbl_rekamedis`
  ADD CONSTRAINT `tbl_rekamedis_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `tbl_pasien` (`id`),
  ADD CONSTRAINT `tbl_rekamedis_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `tbl_user` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
