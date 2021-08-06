-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Agu 2021 pada 06.17
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simproduksi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `actual_time`
--

CREATE TABLE `actual_time` (
  `mill_no` int(11) NOT NULL,
  `po_no` varchar(16) NOT NULL,
  `style` varchar(24) NOT NULL,
  `collar` varchar(16) NOT NULL,
  `qty` int(11) NOT NULL,
  `start_cut` date NOT NULL DEFAULT current_timestamp(),
  `finish_cut` date NOT NULL DEFAULT current_timestamp(),
  `start_sew` date NOT NULL DEFAULT current_timestamp(),
  `finish_sew` date NOT NULL DEFAULT current_timestamp(),
  `start_qc` date NOT NULL DEFAULT current_timestamp(),
  `finish_qc` date NOT NULL DEFAULT current_timestamp(),
  `start_fin` date NOT NULL DEFAULT current_timestamp(),
  `finish_fin` date NOT NULL DEFAULT current_timestamp(),
  `buyreq` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_buyer`
--

CREATE TABLE `data_buyer` (
  `id_buyer` int(11) NOT NULL,
  `nama_buyer` varchar(64) NOT NULL,
  `no_hp` int(16) NOT NULL,
  `alamat` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_jadwal`
--

CREATE TABLE `data_jadwal` (
  `mill_no` int(11) NOT NULL,
  `po_no` varchar(16) NOT NULL,
  `style` varchar(24) NOT NULL,
  `collar` varchar(16) NOT NULL,
  `qty` int(11) NOT NULL,
  `start_cut` date NOT NULL DEFAULT current_timestamp(),
  `finish_cut` date NOT NULL DEFAULT current_timestamp(),
  `start_sew` date NOT NULL DEFAULT current_timestamp(),
  `finish_sew` date NOT NULL DEFAULT current_timestamp(),
  `start_qc` date NOT NULL DEFAULT current_timestamp(),
  `finish_qc` date NOT NULL DEFAULT current_timestamp(),
  `start_fin` date NOT NULL DEFAULT current_timestamp(),
  `finish_fin` date NOT NULL DEFAULT current_timestamp(),
  `buyreq` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_mesin`
--

CREATE TABLE `data_mesin` (
  `id_mesin` int(11) NOT NULL,
  `jenis_mesin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pemesanan`
--

CREATE TABLE `data_pemesanan` (
  `mill_no` int(11) NOT NULL,
  `po_no` varchar(16) NOT NULL,
  `nama_buyer` int(11) NOT NULL,
  `detail_buyer` int(11) NOT NULL,
  `style` varchar(24) NOT NULL,
  `type` int(11) NOT NULL,
  `collar` varchar(16) NOT NULL,
  `qty` int(11) NOT NULL,
  `exfty` date NOT NULL DEFAULT current_timestamp(),
  `prtkl` date NOT NULL DEFAULT current_timestamp(),
  `buyreq` date NOT NULL DEFAULT current_timestamp(),
  `input_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pengawas`
--

CREATE TABLE `data_pengawas` (
  `id_pengawas` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `no_hp` int(11) NOT NULL,
  `email` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_mesin`
--

CREATE TABLE `jenis_mesin` (
  `id_mesin` int(11) NOT NULL,
  `nama_mesin` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_produk`
--

CREATE TABLE `jenis_produk` (
  `id_type` int(11) NOT NULL,
  `name_type` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kapasitas_produksi`
--

CREATE TABLE `kapasitas_produksi` (
  `id_kp` int(11) NOT NULL,
  `jml_haric` int(11) NOT NULL,
  `jml_haris` int(11) NOT NULL,
  `jenis_mesin` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id_users` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `no_hp` int(16) NOT NULL,
  `password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id_users`, `email`, `no_hp`, `password`) VALUES
(1, 'anandasalsa@gmail.com', 0, '12345');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sec_pengguna`
--

CREATE TABLE `sec_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `check_by` int(11) NOT NULL,
  `pengawas_line` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `actual_time`
--
ALTER TABLE `actual_time`
  ADD PRIMARY KEY (`mill_no`);

--
-- Indeks untuk tabel `data_buyer`
--
ALTER TABLE `data_buyer`
  ADD PRIMARY KEY (`id_buyer`);

--
-- Indeks untuk tabel `data_jadwal`
--
ALTER TABLE `data_jadwal`
  ADD PRIMARY KEY (`mill_no`);

--
-- Indeks untuk tabel `data_mesin`
--
ALTER TABLE `data_mesin`
  ADD PRIMARY KEY (`id_mesin`),
  ADD KEY `jenis_mesin` (`jenis_mesin`);

--
-- Indeks untuk tabel `data_pemesanan`
--
ALTER TABLE `data_pemesanan`
  ADD PRIMARY KEY (`mill_no`),
  ADD KEY `input_by` (`input_by`),
  ADD KEY `nama_buyer` (`nama_buyer`),
  ADD KEY `type` (`type`),
  ADD KEY `detail_buyer` (`detail_buyer`);

--
-- Indeks untuk tabel `data_pengawas`
--
ALTER TABLE `data_pengawas`
  ADD PRIMARY KEY (`id_pengawas`);

--
-- Indeks untuk tabel `jenis_mesin`
--
ALTER TABLE `jenis_mesin`
  ADD PRIMARY KEY (`id_mesin`);

--
-- Indeks untuk tabel `jenis_produk`
--
ALTER TABLE `jenis_produk`
  ADD PRIMARY KEY (`id_type`);

--
-- Indeks untuk tabel `kapasitas_produksi`
--
ALTER TABLE `kapasitas_produksi`
  ADD PRIMARY KEY (`id_kp`),
  ADD KEY `jenis_mesin` (`jenis_mesin`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_users`);

--
-- Indeks untuk tabel `sec_pengguna`
--
ALTER TABLE `sec_pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD KEY `check_by` (`check_by`),
  ADD KEY `pengawas_line` (`pengawas_line`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `actual_time`
--
ALTER TABLE `actual_time`
  MODIFY `mill_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `data_buyer`
--
ALTER TABLE `data_buyer`
  MODIFY `id_buyer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `data_jadwal`
--
ALTER TABLE `data_jadwal`
  MODIFY `mill_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `data_mesin`
--
ALTER TABLE `data_mesin`
  MODIFY `id_mesin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `data_pemesanan`
--
ALTER TABLE `data_pemesanan`
  MODIFY `mill_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `data_pengawas`
--
ALTER TABLE `data_pengawas`
  MODIFY `id_pengawas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jenis_mesin`
--
ALTER TABLE `jenis_mesin`
  MODIFY `id_mesin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jenis_produk`
--
ALTER TABLE `jenis_produk`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kapasitas_produksi`
--
ALTER TABLE `kapasitas_produksi`
  MODIFY `id_kp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `sec_pengguna`
--
ALTER TABLE `sec_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `actual_time`
--
ALTER TABLE `actual_time`
  ADD CONSTRAINT `actual_time_ibfk_1` FOREIGN KEY (`mill_no`) REFERENCES `data_jadwal` (`mill_no`);

--
-- Ketidakleluasaan untuk tabel `data_jadwal`
--
ALTER TABLE `data_jadwal`
  ADD CONSTRAINT `data_jadwal_ibfk_1` FOREIGN KEY (`mill_no`) REFERENCES `data_pemesanan` (`mill_no`);

--
-- Ketidakleluasaan untuk tabel `data_mesin`
--
ALTER TABLE `data_mesin`
  ADD CONSTRAINT `data_mesin_ibfk_1` FOREIGN KEY (`jenis_mesin`) REFERENCES `jenis_mesin` (`id_mesin`);

--
-- Ketidakleluasaan untuk tabel `data_pemesanan`
--
ALTER TABLE `data_pemesanan`
  ADD CONSTRAINT `data_pemesanan_ibfk_1` FOREIGN KEY (`input_by`) REFERENCES `sec_pengguna` (`id_pengguna`),
  ADD CONSTRAINT `data_pemesanan_ibfk_3` FOREIGN KEY (`nama_buyer`) REFERENCES `data_buyer` (`id_buyer`),
  ADD CONSTRAINT `data_pemesanan_ibfk_4` FOREIGN KEY (`type`) REFERENCES `jenis_produk` (`id_type`),
  ADD CONSTRAINT `data_pemesanan_ibfk_5` FOREIGN KEY (`detail_buyer`) REFERENCES `kapasitas_produksi` (`id_kp`);

--
-- Ketidakleluasaan untuk tabel `kapasitas_produksi`
--
ALTER TABLE `kapasitas_produksi`
  ADD CONSTRAINT `kapasitas_produksi_ibfk_1` FOREIGN KEY (`jenis_mesin`) REFERENCES `data_mesin` (`id_mesin`);

--
-- Ketidakleluasaan untuk tabel `sec_pengguna`
--
ALTER TABLE `sec_pengguna`
  ADD CONSTRAINT `sec_pengguna_ibfk_1` FOREIGN KEY (`check_by`) REFERENCES `login` (`id_users`),
  ADD CONSTRAINT `sec_pengguna_ibfk_2` FOREIGN KEY (`pengawas_line`) REFERENCES `data_pengawas` (`id_pengawas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
