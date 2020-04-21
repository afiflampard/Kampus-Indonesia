-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 28 Agu 2019 pada 09.53
-- Versi Server: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jualan_learning_v3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `user_id` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `level` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `user_id`, `password`, `nama`, `level`) VALUES
(1, 'master', 'master', 'master', 'master'),
(2, 'admin', 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bimbel`
--

CREATE TABLE `bimbel` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bimbel`
--

INSERT INTO `bimbel` (`id`, `judul`, `text`, `image`) VALUES
(2, 'Bimbel Matematika', '&lt;p&gt;Testing&lt;/p&gt;', '190828014420536.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bimbel_daftar`
--

CREATE TABLE `bimbel_daftar` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `user_id` varchar(200) NOT NULL,
  `telepon` varchar(200) NOT NULL,
  `lokasi` text NOT NULL,
  `dibaca` varchar(20) NOT NULL DEFAULT 'No',
  `judul` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bimbel_daftar`
--

INSERT INTO `bimbel_daftar` (`id`, `nama`, `user_id`, `telepon`, `lokasi`, `dibaca`, `judul`) VALUES
(6, 'indra', 'indra21', '085244351343', 'Parepare', 'No', 'Bimbel Matematika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bimbel_lokasi`
--

CREATE TABLE `bimbel_lokasi` (
  `id` int(11) NOT NULL,
  `id_bimbel` int(200) DEFAULT NULL,
  `lokasi` varchar(200) DEFAULT NULL,
  `judul_bimbel` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bimbel_lokasi`
--

INSERT INTO `bimbel_lokasi` (`id`, `id_bimbel`, `lokasi`, `judul_bimbel`) VALUES
(1, 2, 'Parepare', 'Bimbel Matematika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku_master`
--

CREATE TABLE `buku_master` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `keterangan` text,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku_master`
--

INSERT INTO `buku_master` (`id`, `date`, `keterangan`, `jumlah`) VALUES
(5, '2019-08-27', 'Pembelian Buku Buku Jualan 1 Pada Rekening  - ', 168001);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_bank`
--

CREATE TABLE `data_bank` (
  `id` int(11) NOT NULL,
  `bank_jenis` varchar(200) DEFAULT NULL,
  `bank_nama` varchar(200) DEFAULT NULL,
  `bank_rekening` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_bank`
--

INSERT INTO `data_bank` (`id`, `bank_jenis`, `bank_nama`, `bank_rekening`) VALUES
(1, 'BRI', 'Indra Rani', '128318231239'),
(2, 'BNI', 'Indra Rani', '238102381203'),
(3, 'BCA', 'Indra Rani', '2139718239011'),
(4, 'Mandiri', 'Indra Rani', '129038129038');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_bonus`
--

CREATE TABLE `data_bonus` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) DEFAULT NULL,
  `poin` int(11) DEFAULT NULL,
  `image` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_bonus`
--

INSERT INTO `data_bonus` (`id`, `judul`, `poin`, `image`) VALUES
(1, 'Flashdisk 2GB', 10, 'bonus1.jpg'),
(2, 'Flashdisk 4GB', 20, 'bonus2.jpg'),
(3, 'Flashdisk 8GB', 30, 'bonus3.jpg'),
(4, 'Flashdisk 16GB', 50, 'bonus4.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_bonus_permintaan`
--

CREATE TABLE `data_bonus_permintaan` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `nama_barang` varchar(200) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `alamat` text,
  `penerima` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT 'Sedang Di Proses'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_bonus_permintaan`
--

INSERT INTO `data_bonus_permintaan` (`id`, `id_barang`, `nama_barang`, `user_id`, `alamat`, `penerima`, `status`) VALUES
(4, 1, 'Flashdisk 2GB', 'indra21', 'Provinsi : Sulawesi Selatan\r<br>Kota : Parepare\r<br>Alamat : Perumnas Wekke`e Blok E No 43\r<br>', 'Indra Rani', 'Telah Dikirim'),
(5, 1, 'Flashdisk 2GB', 'indra21', 'Provinsi : Sulawesi Selatan\r<br>Kota : Parepare\r<br>Alamat : Perumnas Wekke`e Blok E No 43\r<br>', 'Indra Rani', 'Sedang Di Proses');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_buku`
--

CREATE TABLE `data_buku` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `keterangan` text,
  `shopee` text NOT NULL,
  `tokopedia` text NOT NULL,
  `bukalapak` text NOT NULL,
  `lazada` text NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_buku`
--

INSERT INTO `data_buku` (`id`, `judul`, `harga`, `keterangan`, `shopee`, `tokopedia`, `bukalapak`, `lazada`, `image`) VALUES
(1, 'Buku Jualan 1', 100000, 'Ini Adalah Contoh Keterangan Singkat \r<br> Ini Mungkin Bisa Berisikan Beberapa Kalimat', 'http://shopee.com', 'http://tokopedia.com', 'http://bukalapak.com', 'http://lazada.com', 'buku1.jpg'),
(2, 'Buku Jualan 2', 130000, 'Ini Adalah Contoh Keterangan Singkat <br> Ini Mungkin Bisa Berisikan Beberapa Kalimat', 'http://shopee.com', 'http://tokopedia.com', 'http://bukalapak.com', 'http://lazada.com', 'buku2.jpg'),
(3, 'Buku Jualan 3', 220000, 'Ini Adalah Contoh Keterangan Singkat <br> Ini Mungkin Bisa Berisikan Beberapa Kalimat', 'http://shopee.com', 'http://tokopedia.com', 'http://bukalapak.com', 'http://lazada.com', 'buku3.jpg'),
(4, 'Buku Jualan 4', 340000, 'Ini Adalah Contoh Keterangan Singkat <br> Ini Mungkin Bisa Berisikan Beberapa Kalimat', 'http://shopee.com', 'http://tokopedia.com', 'http://bukalapak.com', 'http://lazada.com', 'buku4.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_jawaban`
--

CREATE TABLE `data_jawaban` (
  `id` int(11) NOT NULL,
  `kode_soal` varchar(200) DEFAULT NULL,
  `jenis_soal` varchar(200) NOT NULL,
  `soal` text,
  `nomor` int(11) DEFAULT NULL,
  `pilihan_a` text,
  `pilihan_b` text,
  `pilihan_c` text,
  `pilihan_d` text,
  `pilihan_e` varchar(200) DEFAULT NULL,
  `nilai_a` int(11) DEFAULT NULL,
  `nilai_b` int(11) DEFAULT NULL,
  `nilai_c` int(11) DEFAULT NULL,
  `nilai_d` int(11) DEFAULT NULL,
  `nilai_e` int(11) DEFAULT '0',
  `gambar` varchar(200) DEFAULT NULL,
  `pembahasan` text,
  `video` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_jawaban`
--

INSERT INTO `data_jawaban` (`id`, `kode_soal`, `jenis_soal`, `soal`, `nomor`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`, `pilihan_e`, `nilai_a`, `nilai_b`, `nilai_c`, `nilai_d`, `nilai_e`, `gambar`, `pembahasan`, `video`) VALUES
(3625, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Raja pertama kerajaan Sriwijaya adalahâ€¦', 1, 'A. Balaputeradewa', 'B. Sri Jayanasa', 'C. Samaratungga', 'D. Jayasingawarman', 'E. Sanggrama Wijayatungga', 0, 5, 0, 0, 0, NULL, '683 = Sri Jayanasa\n702 = Sri Indrawarman\n775 = Dharanindra\n792 = Samaratungga\n835 = Balaputradewa\n988 = Sri Cudamani Warmadewa\n1008 = Sri Mara-Vijayotunggawarman\n1025 = Sangrama-Vijayotunggawarman', ''),
(3626, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Kerajaan Janggala yang merupakan kerajaan hasil pembelahan dari Medang Kamulan dipipmpin olehâ€¦', 2, 'A. Airlangga', 'B. Jayabaya', 'C. Mapanji Garasakan', 'D. Samarawijaya', 'E. Kertajaya', 0, 0, 5, 0, 0, NULL, 'Airlangga = Kerjaan Kahuripan\nJayabaya = Kerajaan Kediri (Raja ke 3)\nSamarawijaya = Kerajaan Kediri (Raja Pertama)\nKertajaya = Kerjaan Kediri (Raja ke 8)', ''),
(3627, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Penyebab utama pecahnya Perang Dipenogoro adalahâ€¦', 3, 'A. Rakyat Mataram dihasut oleh para Bupati untuk memihak penjajah Belanda', 'B. Belanda mengusik makam leluhur Diponegoro di Tegal Rejo', 'C. Pangeran Diponegoro tidak menyukai tingkah laku Belanda', 'D. Pangeran Diponegoro bertikai dengan Sentot Prawirodirjo', 'E. Campur tangan Belanda dalam urusan Keraton Surakarta', 0, 5, 0, 0, 0, NULL, 'Belanda secara paksa mengambil tanah leluhur Diponegoro untuk proyek pembangunan jalan.', ''),
(3628, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Salah satu teori penyebaran agama Hindu-Budha di Indonesia yaitu teori Brahmana dikemukakan olehâ€¦', 4, 'A. Krom', 'B. Berg', 'C. Van Faber', 'D. Van Leur', 'E. Bosch', 0, 0, 0, 5, 0, NULL, 'Van Leur menyatakan bahwa agama dan kebudayaan Hindu-Buddha yang datang ke Indonesia dibawa oleh golongan Brahmana (golongan agama) yang sengaja diundang oleh penguasa Indonesia dalam rangka melegitimasi kekuasaan mereka sehingga setara dengan raja-raja di India.', ''),
(3629, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Perjanjian Salatiga di tanda tangani pada tanggalâ€¦', 5, 'A. 13 Maret 1757', 'B. 17 Maret 1757', 'C. 13 Februari 1755', 'D. 17 Maret 1755', 'E. 17 Februari 1755', 0, 5, 0, 0, 0, NULL, 'Perjanjian Salatiga ditandatangi pada tanggal 17 Maret 1757 untuk mengakhiri peperangan di jawa antara Hamengku Buwono I dan Paku Buwono III dengan Pangeran Sambernyawa.', ''),
(3630, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Peninggalan Suku Teotihuaca pada masa Peradaban di Amereika Tengah adalahâ€¦', 6, 'A. Templo Major', 'B. Chicen Itza', 'C. Mayan Calendar', 'D. Pyramid of the Sun', 'E. Machu Picchu', 0, 0, 0, 5, 0, NULL, 'Templo Major = Suku Aztec\nChicen Itza = Suku Maya\nMayan Calendar = Suku Maya\nPyramid of The Sun = Suku Teotihuaca\nMachu Picchu = Suku Inca', ''),
(3631, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Ilmu bantu sejarah yang mempelajari tentang uang logam kuno adalahâ€¦', 7, 'A. Ikonografi', 'B. Etnografi', 'C. Numimastik', 'D. Paleontologi', 'E. Paleantropologi', 0, 0, 5, 0, 0, NULL, 'Ikonografi = Patung\nEtnografi = suku bangsa\nNumimastik = uang logam kuno\nPaleontologi = makhluk purba (fosil)\nPaleantropologi = manusia purba', ''),
(3632, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Pithecantropus Erectus ditemukan olehâ€¦', 8, 'A. Ter Haar', 'B. Von Koenigswald', 'C. Eugene Dubois', 'D. Van Rietschoten', 'E. Oppenoorth', 0, 0, 5, 0, 0, NULL, 'Ter Haar = Homo Soloensis\nVon Koenigswald = Meganthropus Paleojavanicus\nEugene Dubois = Pithecantropus Erectus\nVan Rietschoten = Homo Wajakensis\nOppenoorth = Homo Soloensis', ''),
(3633, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Yang merupakan suku bangsa asli India adalah â€¦', 9, 'A. Arya', 'B. Dravida', 'C. Sakia', 'D. Mongol', 'E. Benggala', 0, 5, 0, 0, 0, NULL, 'Bangsa Dravida merupakan bangsa India Asli, memiliki ciri berbadan pendek dan gempal, hidung pesek, rambut keriting, serta berkulit Gelap.', ''),
(3634, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Syarif Hidayatullah merupakan nama asli dari ...', 10, 'A. Sunan Muria', 'B. Sunan Kalijaga', 'C. Sunan Gunung Jati', 'D. Sunan Giri', 'E. Sunan Gresik', 0, 0, 5, 0, 0, NULL, 'Syarif Hidayatullah atau Sunan Gunung Jati merupakan salah seorang dari Walisongo', ''),
(3635, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Berikut ini yang bukan merupakan prasasti peninggalan dari Kerajaan Sriwijaya adalah â€¦', 11, 'A. Prasasti Karang Berahi', 'B. Prasasti Talang Tuo', 'C. Prasasti Kota Kapur', 'D. Prasasti Kebun Kopi', 'E. Prasasti Telaga Batu', 0, 0, 0, 5, 0, NULL, 'Prasasti Kebun Kopi merupakan prasasti peninggalan Kerajaan Tarumanegara', ''),
(3636, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Tokoh yang melahirkan konsep Trias Politika adalah ...', 12, 'A. Montesquieu', 'B. J.J Rosseau', 'C. Voltaire', 'D. Aristoteles', 'E. Immanuel Kant', 5, 0, 0, 0, 0, NULL, 'Trias Politika yang diungkapkan Montesquieu yakni Eksekutif, Yudikatif, dan Legislative', ''),
(3637, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Konferensi Asia Afrika diselenggarakan di Bandung pada tanggal 18-24 April 1955. Berikut ini tokoh pencetus KAA, kecuali â€¦', 13, 'A. Adam Malik', 'B. Jawaharal Nehru', 'C. Sir John Kotelawala', 'D. U Nu', 'E. Moh. Ali', 5, 0, 0, 0, 0, NULL, 'Pencetus KAA :\n- Indonesia (Alisastro Amijoyo),\n- Burma ( U Nu),\n- Paskitan ( Moh. Ali ),\n- India (Jawaharal Nehru),\n- Sri Lanka ( Sir John Kotelawala)', ''),
(3638, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Sebelum KAA dilaksanakan pada tahun 1955, konferensi tersebut didahului dengan adanya konferensi yang diselenggarakan di Kota Bogor. Konferensi Bogor tersebut dilaksanakan pada tanggal ...', 14, 'A. 18-24 April 1955', 'B. 28-29 Desember 1954', 'C. 28 April-2 Mei 1954', 'D. 28 Maret-2 April 1954', 'E. 18-24 April 1954', 0, 5, 0, 0, 0, NULL, 'Konferensi Bogor atau Konferensi Pancanegara II merupakan konferensi pendahuluan sebelum KAA dilaksanakan. Konferensi Bogor dilaksanakan tanggal 28-29 Desember 1954', ''),
(3639, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Rancangan lambang negara Indonesia yang ditolak untuk disahkan merupakan usulan dari ...', 15, 'A. Moh. Hatta', 'B. Ahmad Soebarjo', 'C. Moh. Yamin', 'D. A.A. Maramis', 'E. Ir. Soekarno', 0, 0, 5, 0, 0, NULL, 'Rancangan yang diusulkan Moh. Yamin ditolak karena mengandung unsur-unsur matahari. Hal tersebut dianggap melambangkan Jepang', ''),
(3640, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Dalam UUD 1945 disebutkan bahwa Negara menghormati dan memelihara bahasa daerah sebagai kekayaan budaya nasional. Hal tersebut dinyatakan dalam Pasal â€¦', 16, 'A. Pasal 31 ayat (1)', 'B. Pasal 32 ayat (1)', 'C. Pasal 31 ayat (2)', 'D. Pasal 32 ayat (2)', 'E. Pasal 29 ayat (1)', 0, 0, 0, 5, 0, NULL, 'Menurut UUD 1945 Pasal 32 yaitu : (1) Negara memajukan kebudayaan nasional Indonesia di tengah peradaban dunia dengan menjamin kebebasan masyarakat dalam memelihara dan mengembangkan nilai-nilai budayanya. (2) Negara menghormati dan memelihara bahasa daerah sebagai kekayaan budaya nasional.', ''),
(3641, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Berikut ini pasal dalam UUD 1945 yang tidak pernah mengalami amandemen â€¦', 17, 'A. Pasal 29', 'B. Pasal 30', 'C. Pasal 31', 'D. Pasal 32', 'E. Pasal 33', 5, 0, 0, 0, 0, NULL, 'Pasal-pasal yang tidak mengalami amandemen adalah Pasal 4, 10, 12, 29, dan 35', ''),
(3642, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'MPR paling lambat dibentuk pada tanggal â€¦', 18, 'A. 17 Agustus 2000', 'B. 17 Agustus 2001', 'C. 17 Agustus 2002', 'D. 17 Agustus 2003', 'E. 17 Agustus 2004', 0, 0, 0, 5, 0, NULL, 'Sesuai dengan aturan peralihan pasal III', ''),
(3643, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Fakir miskin dan anak-anak terlantar dipelihara oleh â€¦', 19, 'A. Pemerintah', 'B. Presiden', 'C. Negara', 'D. DPR', 'E. Pemerintah Daerah', 0, 0, 5, 0, 0, NULL, 'Sesuai Pasal 34 ayat (1) UUD 1945', ''),
(3644, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Calon Hakim Agung diusulkan oleh ...', 20, 'A. MA', 'B. MK', 'C. MPR', 'D. DPR', 'E. KY', 0, 0, 0, 0, 5, NULL, 'Pasal 24A ayat (3) UUD 1945 amandemen ketiga: Calon hakim agung diusulkan Komisi Yudisial kepada Dewan Perwakilan Rakyat untuk mendapatkan persetujuan dan selanjutnya ditetapkan sebagai hakim agung oleh Presiden.', ''),
(3645, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Belanda mendirikan kongsi dagang yang bernama &lt;i&gt;Vereenigde Oost-Indische Compagnie&lt;/i&gt; (VOC) pada tanggalâ€¦', 21, 'A. 12 Maret 1596', 'B. 12 April 1596', 'C. 12 Mei 1596', 'D. 20 Maret 1602', 'E. 20 Mei 1602', 0, 0, 0, 5, 0, NULL, 'Kongsi Dagang atau Perusahaan Hindia Timur Belanda atau VOC didirikan pada 20 Maret 1602', ''),
(3646, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Sebelum munculnya Daendels, para petinggi VOC menjalankan kebijakan yang merugikan bangsa Indonesia seperti berikut, kecualiâ€¦', 22, 'A. sistem tanam paksa (cultuurstelsel)', 'B. wajib kerja (verplichte diensten)', 'C. penyerahan paksa hasil bumi (verplichte leveranties)', 'D. penarikan pajak hasil bumi (contingenten)', 'E. kerja paksa (rodi)', 5, 0, 0, 0, 0, NULL, 'sistem tanam paksa (cultuurstelsel) dilakukan pada masa kepemimpinan Johanes van den Bosch sebagai Gubernur Jenderal Hindia-Belanda. Ia menjalankankan tugas setelah kepemimpinan Daendels dan Thomas Stamford Raffles', ''),
(3647, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Yang merupakan pencetus Sumpah Pemuda adalahâ€¦', 23, 'A. Perhimpunan Indonesia Nederland, Partai Nasional Indonesia, dan PPPI', 'B. Perhimpunan Indonesia Nederland, Partai Nasional Indonesia, dan Pemuda Indonesia', 'C. Partai Nasional Indonesia, Pemuda Indonesia, Partai Indonesia Raya', 'D. Partai Nasional Indonesia, Pemuda Indonesia, dan Gabungan Politik Indonesia', 'E. Perhimpunan Indonesia Nederland, Partai Indonesia Raya, dan Pemuda Indonesia', 0, 5, 0, 0, 0, NULL, 'Pencetus Sumpah Pemuda adalah Perhimpunan Indonesia Nederland, Partai Nasional Indonesia, dan Pemuda Indonesia. Peristiwa ini dihadiri oleh organisasi PPPI, Jong Java, Jong Islamiten Bond, Jong Sumatranen Bond, Pemuda Indonesia, Jong Celebes, Jong Ambon, Jong Batak, dan Pemuda Kaum Betawi.', ''),
(3648, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Pembebasan Irian Barat pada masa demokrasi liberal dilakukan melalui jalur diplomasi dan jalur konfrontasi. Jalur diplomasi pembebasan Irian Barat dilakukan sejak kabinetâ€¦', 24, 'A. Kabinet Natsir', 'B. Kabiner Sukiman-Suwiryo', 'C. Kabinet Wilopo', 'D. Kabinet Ali Sastroamidjojo I', 'E. Kabinet Burhanuddin Harahap', 5, 0, 0, 0, 0, NULL, 'Jalur diplomasi pembebasan Irian Barat dilakukan sejak Kabinet Natsir (6 Oktober 1950 s.d. 21 Maret 1951). Berbagai perundingan bilateral dilakukan, namun masih belum berhasil.', ''),
(3649, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Hari Infranteri merupakan hari peringatan terjadinya peristiwa Ambarawa. Peristiwa ini adalah perlawanan TKR yang dipimpin oleh Kolonel Sudirman melawan tentara sekutu di Ambarawa. Peristiwa ini terjadi pada tanggalâ€¦', 25, 'A. 23 Maret 1945', 'B. 10 Desember 1945', 'C. 15 Desember 1945', 'D. 7 Desember 1946', 'E. 21 Juli 1947', 0, 0, 5, 0, 0, NULL, '23 Maret 1945 peristiwa Bandung Lautan Api,\n10 Desember 1945 peristiwa Medan Area,\n7 Desember 1946 peristiwa Westerling,\n21 Juli 1947 peristiwa Agresi Militer I', ''),
(3650, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Sejak Jepang kalah dari pihak sekutu dalam pertempuran di Laut Karang pada 7 Mei 1942, Jepang berupaya menarik simpati bangsa Indonesia. Jepang juga memanfaatkan para pemuda Indonesia dengan membentuk organisasi semi militer, yaituâ€¦', 26, 'A. Peta, Heiho, Seinendan, Fujinkai', 'B. Kaigun, Seinendan, Fujinkai, Keibodan', 'C. Fujinkai, Keibodan, Kaigun, Rikugun', 'D. Peta, Kaigun, Keibodan, Fujinkai', 'E. Seinendan, Fujinkai, Keibodan, Syusintai', 0, 0, 0, 0, 5, NULL, 'Organisasi semi militer yang dibentuk Jepang adalah Seinendan (barisan pemuda), Fujinkai (barisan wanita), Keibodan (barisan pembantu polisi), dan Syusintai (barisan pelopor). Selain itu, Jepang membentuk organisasi militer yakni Peta (pembela tanah air) dan Heiho (barisan pembantu prajurit Jepang). Sedangkan Kaigun adalah sebutan untuk angkatan laut dan Rikugun adalah sebutan untuk angkatan darat.', ''),
(3651, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Perang Paderi adalah perang melawan kolonial pada tahun 1821 s.d. 1837 di Minangkabau yang dipimpin olehâ€¦', 27, 'A. Pangeran Diponegoro', 'B. Tuanku Imam Bonjol', 'C. Teuku Umar', 'D. Pattimura', 'E. Sultan Ageng Tirtayasa', 0, 5, 0, 0, 0, NULL, 'Perang Paderi yang terjadi di Sumatera Barat berlangsung antara tahun 1803 hingga 1838 dipimpin oleh Tuanku Imam Bonjol', ''),
(3652, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Dewan Perwakilan Daerah (DPD) merupakan lembaga perwakilan daerah yang anggotanya merupakan wakil-wakli daerah provinsi yang dipilih melalui pemilihan umum. Anggota Dewan Perwakilan Daerah (DPD) dari setiap provinsi sebanyak â€¦ orang.', 28, 'A. empat orang', 'B. lima orang', 'C. enam orang', 'D. tujuh orang', 'E. delapan orang', 5, 0, 0, 0, 0, NULL, 'Anggota DPD dari setiap provinsi adalah 4 orang. Dengan demikian jumlah anggota DPD saat ini adalah seharusnya 136 orang. Masa jabatan anggota DPD adalah 5 tahun, dan berakhir bersamaan pada saat anggota DPD yang baru mengucapkan sumpah/janji.', ''),
(3653, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'MPR dapat memilih presiden dan wakil presiden apabila keduanya berhalangan tetap secara bersamaan dalam masa jabatannya selambat-lambatnya dalam waktu â€¦ hari.', 29, 'A.15 hari', 'B. 20 hari', 'C. 25 hari', 'D. 30 hari', 'E. 60 hari', 0, 0, 0, 5, 0, NULL, 'Sesuai dengan UUD 1945 Pasal 8 ayat (3), yaitu Jika Presiden dan Wakil Presiden mangkat, berhenti, diberhentikan, atau tidak dapat melakukan\nkewajibannya dalam masa jabatannya secara bersamaan, pelaksanaan tugas Kepresidenan adalah\nMenteri Luar Negeri, Menteri Dalam Negeri dan Menteri Pertahanan secara bersama-sama. Selambat-lambatnya tiga puluh hari setelah itu, Majelis Permusyawaratan Rakyat menyelenggarakan sidang untuk memilih Presiden dan Wakil Presiden dari dua pasangan calon Presiden dan wakil Presiden\nyang diusulkan oleh partai politik atau gabungan partai politik yang pasangan calon Presiden dan\nWakil Presidennya meraih suara terbanyak pertama dan kedua dalam pemilihan umum sebelumnya,\nsampai berakhir masa jabatannya.****)', ''),
(3654, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'DPR memiliki 11 komisi. Komisi XI memiliki ruang lingkup tugasâ€¦', 30, 'A. membidangi pertahanan, intelijen, luar negeri, dan komunikasi &amp; informasi', 'B. membidangi pemerintahan dalam negeri, otonomi daerah, aparatur negara, dan agraria', 'C. membidangi energi, sumber daya mineral, riset dan teknologi, dan lingkungan', 'D. membidangi agama, sosial, dan pemberdayaan perempuan', 'E. membidangi keuangan, perencanaan pembangunan nasional, perbankan, dan lembaga keuangan bukan bank', 0, 0, 0, 0, 5, NULL, 'Komisi I = membidangi pertahanan, intelijen, luar negeri, dan komunikasi &amp; informasi\nKomisi II = membidangi pemerintahan dalam negeri, otonomi daerah, pemilu, aparatur negara, dan agraria\nKomisi VII = membidangi energi, sumber daya mineral, riset dan teknologi, dan lingkungan\nKomisi VIII = membidangi agama, sosial, dan pemberdayaan perempuan\nKomisi XI = membidangi keuangan, perencanaan pembangunan nasional, perbankan, dan lembaga keuangan bukan bank', ''),
(3655, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Siapakah Tokoh Pendiri ASEAN yang berasal dari Singapura?', 31, 'A. Adam Malik', 'B. Tun Abdul Razak', 'C. Thanat Koman', 'D. Narciso Ramos', 'E. S. Rajaratnam', 0, 0, 0, 0, 5, NULL, 'Adam Malik berasal dari Indonesia\nTun Abdul Razak berasal dari Malaysia\nThanat Koman berasal dari Thailand\nNarciso Ramos berasal dari Filipina\nS. Rajaratnam berasal dari Singapura', ''),
(3656, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Revolusi Industri bermula di Inggris dan terjadi antara tahun 1750-1850. Faktor-faktor yang menyebabkan terjadinya Revolusi Industri adalah sebagai berikut, kecuali.....', 32, 'A. Situasi politik yang stabil. Adanya Revolusi Glorius/Agung tahun 1688 yang mengharuskan Raja bersumpah setia kepada Bill of Right sehingga raja tunduk tunduk kepada undang-undang dan hanya menarik pajak berdasarkan atas persetujuan parlemen', 'B. Adanya penemuan baru di bidang teknologi yang dapat mempermudah cara kerja dan meningkatkan hasil produksi, misalnya alat-alat pemintal, mesin tenun, mesin uap, dan sebagainya', 'C. Munculnya pemahaman baru, yaitu memperjuangkan kebebasan dan pemenuhan hak-hak asasi manusia', 'D. Pemerintah memberikan perlindungan hukum terhadap hasil-hasil penemuan baru (hak paten) sehingga mendorong kegiatan penelitian ilmiah', 'E. Kemakmuran Inggris akibat majunya pelayaran dan perdagangan sehingga dapat menyediakan modal yang besar untuk bidang usaha', 0, 0, 5, 0, 0, NULL, 'Revolusi Industri untuk kali pertamanya muncul di Inggris. Adapun faktor-faktor yang menyebabkannya adalah sebagai berikut:\n\n1. Situasi politik yang stabil. Adanya Revolusi Agung tahun 1688 yang mengharuskan raja bersumpah setia kepada Bill of Right sehingga raja tunduk kepada undang-undang dan hanya menarik pajak berdasarkan atas persejutuan parlemen.\n2. Inggris kaya bahan tambang, seperti batu bara, biji besi, timah, dan kaolin. Di samping itu, wol juga yang sangat menunjang industri tekstil.\n3. Adanya penemuan baru di bidang teknologi yang dapat mempermudah cara kerja dan meningkatkan hasil produksi, misalnya alat-alat pemintal, mesin tenun, mesin uap, dan sebagainya.\n4. Kemakmuran Inggris akibat majunya pelayaran dan perdagangan sehingga dapat menyediakan modal yang besar untuk bidang usaha. Di samping itu, di Inggris juga tersedia bahan mentah yang cukup karena Inggris mempunyai banyak daerah jajahan yang menghasilkan bahan mentah tersebut.\n5. Pemerintah memberikan perlindungan hukum terhadap hasil-hasil penemuan baru (hak paten) sehingga mendorong kegiatan penelitian ilmiah. Lebih-lebih setelah dibentuknya lembaga ilmiah Royal Society for Improving Natural Knowledge maka perkembangan teknologi dan industri bertambah maju.\n6. Arus urbanisasi yang besar akibat Revolusi Agraria di pedesaan mendorong pemerintah Inggris untuk membuka industri yang lebih banyak agar dapat menampung mereka.', ''),
(3657, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Berdasarkan sensus BPS tahun 2010, jumlah suku bangsa di Indonesia berjumlah.....', 33, 'A. 1340', 'B. 1328', 'C. 1350', 'D. 1335', 'E. 1300', 5, 0, 0, 0, 0, NULL, 'Terdapat lebih dari 300 kelompok etnik atau suku bangsa di Indonesia atau tepatnya 1.340 suku bangsa menurut sensus BPS tahun 2010.', ''),
(3658, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Senjata tradisional yang dipakai oleh pejuang Aceh untuk melawan penjajah adalah.....', 34, 'A. Keris', 'B. Pisau Belati', 'C. Bambu Runcing', 'D. Rencong', 'E. Panah', 0, 0, 0, 5, 0, NULL, 'Rencong dipakai oleh para pejuang Aceh dalam melawan penjajahan bangsa asing dulu, tidak hanya pejuang saja yang memakai rencong tapi juga raja-raja dan kaum bangsawan di Aceh', ''),
(3659, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Gunung yang terletak di perbatasan antara Jawa Tengah dan Jawa Timur adalah.....', 35, 'A. Gunung Semeru', 'B. Gunung Lawu', 'C. Gunung Slamet', 'D. Gunung Merapi', 'E. Gunung Kerinci', 0, 5, 0, 0, 0, NULL, 'Gunung Lawu terletak di Kabupaten Karanganyar, Jawa Tengah dan Kabupaten Magetan, Jawa Timur', ''),
(3660, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Agitator = ....', 36, 'A. Motivator', 'B. Penghasut', 'C. Pendukung', 'D. Pencetus', 'E. Orator', 0, 5, 0, 0, 0, NULL, 'Agitator adalah penghasut (KBBI)', ''),
(3661, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Pemugaran = ....', 37, 'A. Pengusiran', 'B. Penghancuran', 'C. Perbaikan', 'D. Pembaharuan', 'E. Pembongkaran', 0, 0, 0, 5, 0, NULL, 'Pemugaran adalah pembaharuan kembali (KBBI)', ''),
(3662, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Somasi = ....', 38, 'A. Isolasi', 'B. Revisi', 'C. Siomay', 'D. Teguran untu membayar', 'E. Usulan pembayaran', 0, 0, 0, 5, 0, NULL, 'Somasi adalah teguran untuk membayar (KBBI)', ''),
(3663, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Bergaul =', 39, 'A.Berteman', 'B. Bermain', 'C. Berkelakar', 'D. Bercanda', 'E. Berdendang', 5, 0, 0, 0, 0, NULL, 'Bergaul adalah berteman, bersahabat (KBBI)', ''),
(3664, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Mandiri &gt;&lt; â€¦..', 40, 'A. Swasembada', 'B. Mengikuti', 'C. Bergantung', 'D. Roboh', 'E. Berdikari', 0, 0, 5, 0, 0, NULL, 'Mandiri adalah dalam keadaan dapat berdiri sendiri, tidak bergantung pada orang lain.', ''),
(3665, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Ekuivalen &gt;&lt; â€¦...', 41, 'A. Berlawanan', 'B. Sama', 'C. Seimbang', 'D. Sepadan', 'E. Setingkat', 5, 0, 0, 0, 0, NULL, 'Ekuivalen adalah mempunyai nilai (ukuran, arti, atau efek) yang sama; seharga; sebanding; sepadan.', ''),
(3666, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Sapi : Rumput = .....', 42, 'A. Kambing : Gulai', 'B. Badak : Cula', 'C. Kerbau : Tanduk', 'D. Pagar : Tanaman', 'E. Manusia : Nasi', 0, 0, 0, 0, 5, NULL, 'Sapi memakan Rumput; Manusia memakan Nasi', ''),
(3667, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'KAKAKTUA : MERPATI = â€¦ : â€¦', 43, 'A. Gajah : Semut', 'B. Elang : Kupu-Kupu', 'C. Gurame : Kakap', 'D. Anjing : Herder', 'E. Singa : Naga', 0, 0, 5, 0, 0, NULL, 'Hubungan antara kedua hewan yang satu jenis yaitu sama-sama burung dan sama-sama ikan', ''),
(3668, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'AIR : ES = UAP : â€¦', 44, 'A. Air', 'B. Udara', 'C. Basah', 'D. Mendidih', 'E. Awan', 5, 0, 0, 0, 0, NULL, 'Jika air didinginkan menjadi es, maka jika uap didinginkan menjadi butir-butir air', ''),
(3669, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Kalimat di bawah ini yang mengandung kata tidak bakuâ€¦.', 45, 'A. Dia memiliki karier yang cukup bagus.', 'B. Hani bekerja di sebuah apotek ternama.', 'C. Hari ini adalah jadual kelas kami untuk bertanding.', 'D. Pekerjaannya adalah menganalisis laporan keuangan satuan kerja.', 'E. Dia membawa kuitansinya pulang ke rumah.', 0, 0, 5, 0, 0, NULL, 'Kata baku dari JADUAL adalah JADWAL', ''),
(3670, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'X, U, Q, â€¦', 46, 'A. I', 'B. J', 'C. K', 'D. L', 'E. M', 0, 0, 0, 5, 0, NULL, 'Deret dengan beda 3 dan 4 maka berikutnya 5. Sehingga, 5 huruf sebelum Q yaitu L', ''),
(3671, 'TryoutUSMSTAN-0828122737', 'Soal 1', '3 , 3 , 6 , 9 , 15 , 24 , â€¦.', 47, 'A. 39', 'B. 40', 'C. 41', 'D. 42', 'E. 43', 5, 0, 0, 0, 0, NULL, 'Deret tersebut memiliki pola yaitu penjumlahan dari 2 bilangan sebelumnya.\nKita lihat mulai bilangan ketiga:\n6 = 3+3\n9 = 6+3\n15 = 9+6\n24 = 15+9\nJadi, bilangan selanjutnya adalah 24+15 = 39', ''),
(3672, 'TryoutUSMSTAN-0828122737', 'Soal 1', '1 , 11 , 3 , 7 , 5 , 5 , ... , â€¦', 48, 'A. 7 , 5', 'B. 7 , 3', 'C. 3 , 7', 'D. 5 , 7', 'E. 4 , 5', 0, 5, 0, 0, 0, NULL, 'Deret tersebut terdiri dari dua bagian.\nDeret pertama: 1, 3, 5 (beda dua) jadi angka selanjutnya adalah 7.\nDeret kedua: 11, 7, 5 (merupakan bilangan prima) jadi angka selanjutnya adalah 3.', ''),
(3673, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'A â€“ S â€“ D â€“ P â€“ G - ... - ...', 49, 'A. K - L', 'B. N - M', 'C. M - J', 'D. O - P', 'E. L â€“ Z', 0, 0, 5, 0, 0, NULL, 'Deret huruf tersebut memiliki pola jarak 3 huruf.\nDeret pertama: A, D, G, berjarak 3 huruf dari huruf sebelumnya, maka huruf selanjutnya adalah J.\nDeret kedua: S, P, berjarak 3 huruf dari huruf sebelumnya, namun urutannya mundur, jadi huruf selanjutnya adalah M.', ''),
(3674, 'TryoutUSMSTAN-0828122737', 'Soal 1', '16Â² - 15Â² = â€¦', 50, 'A. 30', 'B. 31', 'C. 32', 'D. 33', 'E. 34', 0, 5, 0, 0, 0, NULL, '', ''),
(3675, 'TryoutUSMSTAN-0828122737', 'Soal 1', '37 x 36 + 35 x 34 = â€¦.', 51, 'A. 2679', 'B. 2695', 'C. 2522', 'D. 3176', 'E. 3075', 0, 0, 5, 0, 0, NULL, 'TRIK CEPAT:\nDihitung satuan nya saja\n(7 x 6) + (5 x 4) = 42 + 20 = 62\nCari satuannya yang memiliki angka 2', ''),
(3676, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'âˆš(1-0,36) - âˆš(1-0,64) = â€¦.', 52, 'A. 0.30', 'B. 0.60', 'C. 0.35', 'D. 0.20', 'E. 0.25', 0, 0, 0, 5, 0, NULL, 'âˆš(1-0,36) - âˆš(1-0,64) =  0,8 - 0,6 = 0,2', ''),
(3677, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Adis membeli baju dengan harga diskon 15% dari Rp80.000,00. Karena ia sedang berulang tahun, ia mendapat diskon tambahan sebesar 25% dari harga awal setelah dikurangi diskon 15% di awal. Berapakah harga yang harus dibayarkan Adis kepada kasir?', 53, 'A. Rp60,000.00', 'B. Rp55,000.00', 'C. Rp51,000.00', 'D. Rp63,000.00', 'E. Rp73,000.00', 0, 0, 5, 0, 0, NULL, '1) 80.000 - (15% x 80.000) = 68.000\n2) 68.000 - (25% x 68.000) = 51.000', ''),
(3678, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Ajeng sedang membuat kerajinan papan catur. Dalam 5 menit, ia mampu mengecat 25% dari papan berwarna putih. Berapa lamakah ia mengecat sampai selesai keseluruhan papan catur?', 54, 'A. 50 menit', 'B. 30 menit', 'C. 20 menit', 'D. 60 menit', 'E. 40 menit', 0, 0, 0, 0, 5, NULL, 'Papan warna putih\n25% = 5 menit\nx4\n100% = 20 menit\nagar bisa 100% selesai maka dikali 4, jadi waktu yang dibutuhkan untuk mengecat papan warna putih 100% adalah 20 menit.\n\nJumlah warna putih dan warna hitam pada papan catur adalah sama, jadi tinggal dikali 2.\n20 menit x 2 = 40 menit.', ''),
(3679, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Volume ember jika penuh adalah 42,5 liter. Namun, saat ini hanya terisi 3/5 saja dan itu pun masih diambil lagi oleh Adrian, sehingga kini hanya terisi 1/5 saja. Berapa literkah yang diambil oleh Adrian?', 55, 'A. 17 liter', 'B. 8,5 liter', 'C. 17,5 liter', 'D. 8 liter', 'E. 34 liter', 5, 0, 0, 0, 0, NULL, '(3/5 - 1/5) x 42,5 = 17', ''),
(3680, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Peluang muncul mata dadu berangka prima dalam satu kali pelemparan sebuah dadu adalah â€¦', 56, 'A. 1/6', 'B. 2/6', 'C. 1/2', 'D. 2/3', 'E. 5/6', 0, 0, 5, 0, 0, NULL, 'bilangan prima dalam sebuah dadu 2 , 3 , 5 --&gt; 3\nruang sampel sebuah dadu 1 , 2 , 3 , 4 , 5 , 6 --&gt; 6\n\nJadi, peluangnya adalah 3/6 = 1/2', ''),
(3681, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Nilai Y pada bilangan berpangkat di bawah ini adalah â€¦\n\n3Â²x3Â²x3Â²x3Â²x3Â² = 3y', 57, 'A. 8', 'B. 9', 'C. 10', 'D. 11', 'E. 12', 0, 0, 5, 0, 0, NULL, '32+2+2+2+2 = 310\nJadi Y adalah 10', ''),
(3682, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Kota A dan kota B berjarak 3,5 cm dalam peta yang skalanya 1 : 5000. Berapa jarak sebenarnya?', 58, 'A. 1,55 hm', 'B. 1,65 hm', 'C. 1,75 hm', 'D. 1,85 hm', 'E. 1,95 hm', 0, 0, 5, 0, 0, NULL, '3,5 x 5.000 cm = 17.500 cm\n1 hm = 10.000 cm', ''),
(3683, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Teks  untuk soal nomor 63-65\n\nDalam sebuah pertemuan Fadjri, Antad, Bian, James, Oris dan Gafrio duduk di meja bulat dengan urutan sebagai berikut:\n\nFadjri selalu berada di antara Gafrio dan Oris.\n\nGafrio tidak mau bersebelahan dengan Bian maupun Oris Antad berada di sebelah James dan Bian.\n\n63. Siapakah yang berada di sebelah James?', 59, 'A. Gafrio dan Fadjri', 'B. Antad dan Gafrio', 'C. Bian dan Oris', 'D. Fadjri dan Antad', 'E.  Bian dan Fadjri', 0, 5, 0, 0, 0, NULL, 'Urutan tempat duduk:\nFadjri - Oris - Bian - Antad - James â€“ Gafrio', ''),
(3684, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Dalam sebuah pertemuan Fadjri, Antad, Bian, James, Oris dan Gafrio duduk di meja bulat dengan urutan sebagai berikut:\n\nFadjri selalu berada di antara Gafrio dan Oris.\n\nGafrio tidak mau bersebelahan dengan Bian maupun Oris Antad berada di sebelah James dan Bian.\n\n64. Urutan mereka duduk yang paling benar adalah â€¦', 60, 'A. Fadjri, Gafrio, Bian, Antad, James, Oris', 'B. Oris, Fadjri, Bian, Antad, James, Gafrio', 'C. Fadjri, Oris, Bian, Antad, James, Gafrio', 'D. James, Antad, Bian, Gafrio, Fadjri, Oris', 'James, Fadjri, Bian, Gafrio, Antad, Oris', 0, 0, 5, 0, 0, NULL, 'Urutan tempat duduk:\nFadjri - Oris - Bian - Antad - James â€“ Gafrio', ''),
(3685, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Dalam sebuah pertemuan Fadjri, Antad, Bian, James, Oris dan Gafrio duduk di meja bulat dengan urutan sebagai berikut:\n\nFadjri selalu berada di antara Gafrio dan Oris.\n\nGafrio tidak mau bersebelahan dengan Bian maupun Oris Antad berada di sebelah James dan Bian.\n\n65. Siapakah yang berada di sebelah Fadjri dan Bian?', 61, 'A. Antad', 'B. Oris', 'C. Gafrio', 'D. James', 'E.  Bian', 0, 5, 0, 0, 0, NULL, 'Urutan tempat duduk:\nFadjri - Oris - Bian - Antad - James â€“ Gafrio', ''),
(3686, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Saya diterima kuliah di salah satu perguruan tinggi negeri sesuai dengan harapan saya. Namun kondisi keuangan saya saat ini tidak mendukung untuk saya melanjutkan kuliah. Saya akan â€¦', 62, 'A. mengundurkan diri dan membatalkan untuk kuliah', 'B. mencari beasiswa dari negara atau lembaga lainnya', 'C. mencari pinjaman uang untuk biaya kuliah', 'D. tetap melanjutkan kuliah, sambil mencari pekerjaan untuk membiayai kuliah', 'E.  menunda kuliah sampai memiliki dana yang cukup', 1, 4, 2, 5, 3, NULL, 'A = 1\nB = 4\nC = 2\nD = 5\nE = 3', ''),
(3687, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Dalam rangka memperingati hari pelanggan, tempat anda bekerja berencana memberikan reward pada pelanggan. Konsep yang akan anda berikan sebagai tim kreatif adalah â€¦', 63, 'A. memberikan souvenir tanda terima kasih pada setiap pengunjung', 'B. buy one get one free untuk produk tertentu', 'C. potongan diskon 50% untuk produk tertentu', 'D. memberikan voucher untuk pembelanjaan berikutnya', 'E. memberi potongan tertentu dengan syarat dan ketentuan berlaku', 5, 4, 3, 1, 2, NULL, 'A = 5\nB = 4\nC = 3\nD = 1\nE = 2', ''),
(3688, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Terdapat pelanggan terlibat pertengkaran dengan pelanggan lain. Melihat hal tersebut anda akan â€¦', 64, 'A. mengusir mereka', 'B. meminta satpam melerai', 'C. melaporkan pada pihak berwajib', 'D. mengejak menyelesaikan masalah di ruang tertentu', 'E.  meminta ganti rugi karena telah membuat kegaduhan', 1, 4, 3, 5, 2, NULL, 'A = 1\nB = 4\nC = 3\nD = 5\nE = 2', ''),
(3689, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Teman saya melakukan tindakan yang sangat tidak saya sukai. Saya akan melakukan â€¦', 65, 'A. membiarkannya saja sampai ia berubah sendiri', 'B. memberitahukan tindakannya tersebut kepada teman yang lain', 'C. membicarakannya baik-baik dan menjelaskan bahwa saya tidak suka dengan tindakannya', 'D. menegur dan memarahinya agar dia tidak mengulanginya', 'E.  memutuskan pertemanan dengannya', 3, 2, 5, 4, 1, NULL, 'A = 3\nB = 2\nC = 5\nD = 4\nE = 1', ''),
(3690, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Masa kontrak kerja anda sudah habis, maka anda akan â€¦', 66, 'A. malas-malasan', 'B. bekerja seperti biasa', 'C. bekerja dengan lebih giat agar meninggalkan kesan yang baik', 'D. bekerja dengan giat agar dilirik atasan', 'E.  bekerja semampunya', 1, 4, 5, 2, 3, NULL, 'A = 1\nB = 4\nC = 5\nD = 2\nE = 3', ''),
(3691, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Suatu ketika anda menyapa teman anda, tetapi ternyataanda salah orang, maka anda akan â€¦', 67, 'A. pura-pura tidak terjadi apapun', 'B. meminta maaf sembari berlalu', 'C. meminta maaf dan sedikit basa-basi', 'D. malu dan mood rusak seharian', 'E.  biasa aja', 4, 2, 3, 1, 5, NULL, 'A = 4\nB = 2\nC = 3\nD = 1\nE = 5', ''),
(3692, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Dalam menghadapi suatu masalah biasanya saya akan â€¦', 68, 'A. tidak semangat dalam bekerja', 'B. merenung dan introspeksi diri', 'C. stres dan mudah marah', 'D. mencari hiburan untuk menenangkan diri', 'E.  mengomunikasikan masalah saya dengan teman dekat', 2, 5, 1, 3, 4, NULL, 'A = 2\nB = 5\nC = 1\nD = 3\nE = 4', ''),
(3693, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Saat sedang dikejar deadline tugas yang penting, datang seorang tamu yang meminta informasi suatu tempat di kantor keada saya, sikap saya adalah â€¦', 69, 'A. mengantarkan tamu tersebut sampai ke tujuannya', 'B. menelepon tempat tujuan tamu, dan memintanya menjemput tamu tersebut di ruangan saya', 'C. memberi petunjuk arah ke tempat tujuan tamu tersebut dan kemudian melanjutkan pekerjaan', 'D. mengacuhkannya sampai tamu tersebut dengan sendirinya keluar dari ruangan saya', 'E.  tetap fokus pada pekerjaan saya, dan meminta orang lain untuk mengantarkan tamu tersebut ke tempat tujuan', 5, 3, 4, 1, 2, NULL, 'A = 5\nB = 3\nC = 4\nD = 1\nE = 2', ''),
(3694, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Saya menjadi sasaran kemarahan atasan atas kesalahan yang dilakukan oleh rekan setim saya. Yang saya lakukan adalah â€¦', 70, 'A. menganggap itu sebagai pelajaran buat saya agar lebih berhati-hati dalam bekerja', 'B. menjelaskan pada atasan bahwa itu bukan karena kesalahan saya', 'C. menerima kemarahan atasan meskipun itu bukan kesalahan saya', 'D. tidak terima dan mengadukan teman yang membuat masalah tersebut', 'E.  menegur teman saya dan memintanya menjelaskan masalah yang sebenarnya kepada atasan', 5, 4, 1, 2, 3, NULL, 'A = 5\nB = 4\nC = 1\nD = 2\nE = 3', ''),
(3695, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Anda sedang berada dalam kendaraan umum yang penuh sesak dengan penumpang, anda juga sedang terburu-buru karena ada tugas yang harus segera diselesaikan, namun sopir masih berhenti dan menunggupenumpang lain, sikap anda adalah â€¦', 71, 'A. marah pada sopir', 'B. menggerutu', 'C. biasa saja', 'D. turun dari kendaraan umum', 'E.  bersabar', 1, 2, 4, 3, 5, NULL, 'A = 1\nB = 2\nC = 4\nD = 3\nE = 5', ''),
(3696, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Kerabat dekat saya menawarkan saya posisi strategis di perusahaannya tanpa harus melewati proses perekrutan, sedangkan saya kebetulan sedang mecari pekerjaan. Maka yang akan saya lakukan adalah â€¦', 72, 'A. Menerima tawaran tersebut karena dia adalah kerabat saya', 'B. Meminta pendapat dari orang tua terlebih dahulu', 'C. Menolaknya karena saya ingin diterima melalui proses resmi', 'D. Mencoba proses resmi terlebih dahulu sebelum menerima tawaran tersebut', 'E. Mempertimbangkan segala sesuatu terlebih dahulu', 1, 3, 5, 2, 4, NULL, 'A = 1\nB = 3\nC = 5\nD = 2\nE = 4', ''),
(3697, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Dalam perjalanan hidup, sifat utama yang harus dimiliki oleh seseorang adalahâ€¦', 73, 'A. Ulet', 'B. Disiplin', 'C. Berani', 'D. Rajin', 'E.  Jujur', 3, 4, 1, 2, 5, NULL, 'A = 3\nB = 4\nC = 1\nD = 2\nE = 5', ''),
(3698, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Rekan kerja saya tidak menyukai kinerja yang saya lakukan, saya menyikapinya denganâ€¦', 74, 'A. Meningkatkan kinerja saya untuk kedepannya', 'B. Cuek dan tetap fokus berkerja', 'C. Orang lain boleh menilai saya tapi saya yang tahu kualitas diri saya', 'D. Introspeksi diri', 'E. Mencari tahu siapa yang tidak menyukai kinerja saya', 5, 2, 3, 4, 1, NULL, 'A = 5\nB = 2\nC = 3\nD = 4\nE = 1', ''),
(3699, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Dalam mengikuti suatu kompetisi, saya mengalami kekalahan. Perasaan yang sayaâ€¦', 75, 'A. Biasa saja, menang atau kalah itu biasa saja', 'B. Tetap bersemangat agar memenangkan kompetensi selanjutnya', 'C. Sedih sehingga tidak mau ikut kompetensi lagi', 'D. Kecewa dan tidak terima', 'E.  Malu dan menyesal telah ikut kompetensi', 4, 5, 2, 3, 1, NULL, 'A = 4\nB = 5\nC = 2\nD = 3\nE = 1', ''),
(3700, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Bekerja merupakan upaya meraih kesuksesan, maka upaya saya adalahâ€¦', 76, 'A. Bekerja berdasarkan kontrak kerja', 'B. Bekerja sampai larut malam', 'C. Bekerja keras', 'D. Berusaha mengatasi orang yang menghalangi saya', 'E.  Bekerja dengan disiplin dan mengusahakan yang terbaik', 2, 1, 4, 3, 5, NULL, 'A = 2\nB = 1\nC = 4\nD = 3\nE = 5', ''),
(3701, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Ketika saya diminta melakukan pekerjaan berat, sayaâ€¦', 77, 'A. Menolaknya', 'B. Mempertimbangkan dulu untuk menerimanya', 'C. Merasa tertantang melaksanakan pekerjaan itu', 'D. Tetap menerimanya meskipun tidak suka dengan pekerjaan itu', 'E.  Menyerahkan pekerjaan tersebut pada orang lain', 2, 3, 5, 4, 1, NULL, 'A = 2\nB = 3\nC = 5\nD = 4\nE = 1', ''),
(3702, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Ketika usulan yang saya ajukan dianggap kurang tepat oleh atasan, maka sikap sayaâ€¦', 78, 'A. Mencoba mencari alternatif usulan lain yang lebih tepat untuk diajukan lagi', 'B. Merasa kecewa tetapi tetap berusaha melupakan penolakan tersebut', 'C. Sangat kecewa', 'D. Bersikeras memberikan alasan dan pembenaran atas usulan tersebut', 'E.  Membiarkan saja', 5, 4, 3, 2, 1, NULL, 'A = 5\nB = 4\nC = 3\nD = 2\nE = 1', ''),
(3703, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Yang akan saya lakukan saat hari pertama ditempatkan di sebuah tempat tugas yang baru adalahâ€¦', 79, 'A. Menyapa rekan kerja baru dan bertanya tentang sistem kerja di tempat tersebut', 'B. Mempelajari sistem kerja di tempat tersebut dari peraturan dan data yang ada', 'C. Mencari tahu apa yang harus saya kerjakan', 'D. Diam saja sambil mengamati sistem kerja pegawai di tempat tersebut', 'E.  Menunggu Perintah dari atasan', 5, 4, 3, 2, 1, NULL, 'A = 5\nB = 4\nC = 3\nD = 2\nE = 1', ''),
(3704, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Pertama kali yang anda lakukan saat datang ke kantor di pagi hari adalahâ€¦', 80, 'A. Menyapa rekan kerja baru dan bertanya tentang sistem kerja di tempat tersebut', 'B. Mempelajari sistem kerja di tempat tersebut dari peraturan dan data yang ada', 'C. Mencari tahu apa yang harus saya kerjakan', 'D. Diam saja sambil mengamati sistem kerja pegawai di tempat tersebut', 'E.  Menunggu Perintah dari atasan', 2, 1, 3, 5, 4, NULL, 'A = 2\nB = 1\nC = 3\nD = 5\nE = 4', ''),
(3705, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Ketika Anda pindah rumah, Anda akanâ€¦', 81, 'A. Biasa-biasa saja', 'B. Membagikan makanan pada tetangga', 'C. Mengundang para tetangga ke ruman Anda', 'D. Membawa serta keluarga Anda kesana', 'E.  Mengundang rekan kerja ke rumah Anda', 1, 4, 5, 3, 1, NULL, 'A = 1\nB = 4\nC = 5\nD = 3\nE = 1', ''),
(3706, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Saya diutus untuk menghadiri seminar menggantikan atasan saya. Pada saat yang bersamaan saya sedang mengerjakan laporan yang tidak terlalu mendesak â€¦', 82, 'A. Saya akan selesaikan terlebih dahulu laporan tersebut, sebab bisa saja diminta oleh atasan sewaktu-waktu', 'B. Laporan tersebut akan menjadi merepotkan kalau tertunda.', 'C. Saya akan menghadiri seminar tersebut agar dapat menghindar dari tugas laporan.', 'D. Saya akan menghadiri seminar tersebut karena laporan belum harus segera diserahkan kepada atasan.', 'E.  Saya bisa menghadiri seminar dan mengerjakan laporannya nanti saja.', 5, 3, 4, 1, 2, NULL, 'A = 5\nB = 3\nC = 4\nD = 1\nE = 2', ''),
(3707, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Saya ditugaskan untuk memimpin suatu proyek di kantor dengan deadline yang sangat singkat. Rekan kerja saya menunjukkan sikap tidak peduli terhadap tugas dalam proyek tersebut. Sikap saya adalah ....', 83, 'A. Bekerja sendiri menyelesaikan tugas tersebut.', 'B. Memberi peringatan pada rekan kerja saya dan mengancam akan mengeluarkan mereka yang tidak serius dalam proyek.', 'C. Melaporkan pada atasan agar mereka mendapat sanksi.', 'D. Membagi tugas sesuai dengan porsi masing-masing secara adil dan tetap memotovasi mereka untuk menyelesaikan tugasnya.', 'E.  Memberikan nasihat pada mereka agar mau menyelesaikan tugasnya.', 2, 3, 1, 5, 4, NULL, 'A = 2\nB = 3\nC = 1\nD = 5\nE = 4', ''),
(3708, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Saya diminta menyelesaikan laporan program kreativitas mahasiswa dalam rangka memonitor dan mengevaluasi dengan waktu yang sangat terbatas dan mendadak. Anggota kelompok saya justru menunjukkan sikap tidak peduli terhadap tugas-tugasnya. Sikap saya adalah ....', 84, 'A. Bekerja sendiri yang penting laporan selesai.', 'B. Mengancam mengeluarkan teman yang tidak serius mengerjakan tugas.', 'C. Melaporkan mereka pada pembimbing program krativitas mahasiswa.', 'D. Membagi tugas secara adil dan memotivasi anggota agar menyelesaikannya.', 'E. Menasihati agar mereka sadar dengan penyelesaian tugas yang diembannya', 2, 3, 1, 5, 4, NULL, 'A = 2\nB = 3\nC = 1\nD = 5\nE = 4', ''),
(3709, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Saya akan meminta tanda tangan salah satu dosen untuk pengesahan KTTA saya. Kebetulan sudah satu minggu dosen tersebut tidak ke kampus, pihak kampus memyarankan saya untuk pergi ke rumah beliau. Saat pergi ke rumah dosen tersebut, ternyata keluarganya memberitahu bahwa tangan dosen tersebut sedang terkena stroke dan tidak bisa memberikan tanda tangan. Sikap saya.....', 85, 'A. Menunggu sampai dosen tersebut sembuh dari stroke', 'B. Menjelaskan kepada pihak kampus tentang keadaan dosen tersebut dan meminta pertimbangan dari kampus jika tanda tangan pengesaham bisa diwakilkan oleh dosen lain', 'C. Tidak memaksa dosen tersebut untuk tanda tangan', 'D. Marah marah karena merasa dipersulit', 'E.  Protes pada pihak kampus', 4, 5, 3, 2, 1, NULL, 'A = 4\nB = 5\nC = 3\nD = 2\nE = 1', ''),
(3710, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Sebagai seorang bidan sudah menjadi tanggung jawab saya untuk membantu orang yang akan melahirkan. Tengah malam seorang warga datang ke rumah karena istrinya akan melahirkan padahal saat itu saya baru saja pulang dari kota dan masih dalam keadaan lelah. Sikap saya.....', 86, 'A. Menolak membantu karena masih lelah', 'B. Membantu sebagai bentuk tanggung kawab dan kepedulian', 'C. Menyarankan untuk mendatangi bidan lain', 'D. Mengusir karena sangat menganggu', 'E.  Membantu semampunya', 2, 5, 3, 1, 4, NULL, 'A = 2\nB = 5\nC = 3\nD = 1\nE = 4', ''),
(3711, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Prediksi pengamat ekonomi bahwa bulan depan akan terjadi inflasi besar di Indonesia membuat sayaâ€¦', 87, 'A. Susah tidur', 'B. Depresi berat, karena inflasi berarti harga barang naik', 'C. Berhati-hati dan berhemat dalam membelanjakan uang', 'D. Yang akan terjadi, biarlah terjadi', 'E.  Prediksi yang menyusahkan seperti itu tak perlu saya percayai', 4, 1, 5, 3, 2, NULL, 'A = 4\nB = 1\nC = 5\nD = 3\nE = 2', ''),
(3712, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Bila ada rekan kerja yang salah memanggil nama saya, maka sayaâ€¦', 88, 'A. Saya tersinggung, karena nama adalah kehormatan seseorang', 'B. Saya tidak tersinggung', 'C. Saya mengingatkan kekeliruannya dengan baik baik', 'D. Saya mengingatkannya dengan tegas agar dia jera', 'E.  Hal itu tak menjadi masalah bagi saya', 1, 5, 3, 2, 4, NULL, 'A = 1\nB = 5\nC = 3\nD = 2\nE = 4', ''),
(3713, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Jika hal-hal kecil merusak rencana besar saya, maka...', 89, 'A. Saya sangat sedih dan marah kenapa hal kecil mampu merusak rencana besar tersebut', 'B. Tentu saja saya marah', 'C. Saya melakukan evaluasi menyeluruh', 'D. Saya butuh waktu menenangkan diri', 'E.  Saya marah kepada pihak lain yang juga ikut bertanggung jawab akan hal ini.', 3, 2, 5, 4, 1, NULL, 'A = 3\nB = 2\nC = 5\nD = 4\nE = 1', ''),
(3714, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Jika dalam suatu rapat, rekan kantor memiliki pendapat yang berbeda, padahal Anda-lah yang menjadi pemimpin rapat, maka: â€¦', 90, 'A. Saya teguh mempertahankan pendapat saya', 'B. Beda pendapat bukanlah masalah serius', 'C. Saya pertimbangkan pendapat tersebut', 'D. Saya lihat dulu siapa dia', 'E. Menanyakannya mengapa dia berani berbeda pendapat dengan pemimpin rapat', 3, 4, 5, 2, 1, NULL, 'A = 3\nB = 4\nC = 5\nD = 2\nE = 1', ''),
(3715, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Anda akan bekerja secara maksimal ketika ...', 91, 'A. Diawasi atasan', 'B. Diawasi maupun tidak diawasi atasan', 'C. Dibawah tekanan', 'D. Dalam mood yang baik', 'E. Berada di tempat yang nyaman', 2, 5, 1, 4, 3, NULL, 'A = 2\nB = 5\nC = 1\nD = 4\nE = 3', ''),
(3716, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Ketika Anda dipercaya melakukan tugas baru dan berisiko besar, maka Anda akan ...', 92, 'A. Mundur', 'B. Menolaknya secara tegas', 'C. Meminta Pertimbangan ulang', 'D. Antusias', 'E. Menyanggupinya dengan sedikit ragu', 1, 2, 3, 5, 4, NULL, 'A = 1\nB = 2\nC = 3\nD = 5\nE = 4', ''),
(3717, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Apabila Anda mendapati rekan kerja yang suka menunda pekerjaan, sikap Anda adalah â€¦', 93, 'A. Membiarkannya karena itu biasa terjadi', 'B. Menasihatinya', 'C. Melaporkannya pada atasan', 'D. Menegur dan mengingatkannya', 'E. Menggunjingnya dengan rekan yang lain', 1, 4, 3, 5, 2, NULL, 'A = 1\nB = 4\nC = 3\nD = 5\nE = 2', ''),
(3718, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Anda senang jika datang ke sebuah restoran yang ...', 94, 'A. Pelayanannya ramah dan cekatan', 'B. Cepat membuat pesanan Anda', 'C. Makanannya enak walau lama', 'D. Murah', 'E. Mahal', 5, 4, 3, 2, 1, NULL, 'A = 5\nB = 4\nC = 3\nD = 2\nE = 1', ''),
(3719, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Jika bekerja dibawah tekanan, maka Anda akan â€¦', 95, 'A. Baper', 'B. Biasa saja', 'C. Selalu tersenyum', 'D. Marah', 'E. Butuh waktu sendiri', 2, 5, 4, 1, 3, NULL, 'A = 2\nB = 5\nC = 4\nD = 1\nE = 3', ''),
(3720, 'TryoutUSMSTAN-0828122737', 'Soal 1', 'Saya mengharapkan kondisi kerja yang â€¦', 96, 'A. Menghasilkan pendapatan tambahan', 'B. Menyediakan stabilitas Pekerjaan', 'C. Memungkinkan promosi', 'D. Ada kesempatan aktualisasi diri', 'E. Memotivasi untuk lebih giat bekerja', 1, 2, 3, 4, 5, NULL, 'A = 1\nB = 2\nC = 3\nD = 4\nE = 5', ''),
(3721, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Raja pertama kerajaan Sriwijaya adalahâ€¦', 1, 'A. Balaputeradewa', 'B. Sri Jayanasa', 'C. Samaratungga', 'D. Jayasingawarman', 'E. Sanggrama Wijayatungga', 0, 5, 0, 0, 0, NULL, '683 = Sri Jayanasa\n702 = Sri Indrawarman\n775 = Dharanindra\n792 = Samaratungga\n835 = Balaputradewa\n988 = Sri Cudamani Warmadewa\n1008 = Sri Mara-Vijayotunggawarman\n1025 = Sangrama-Vijayotunggawarman', ''),
(3722, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Kerajaan Janggala yang merupakan kerajaan hasil pembelahan dari Medang Kamulan dipipmpin olehâ€¦', 2, 'A. Airlangga', 'B. Jayabaya', 'C. Mapanji Garasakan', 'D. Samarawijaya', 'E. Kertajaya', 0, 0, 5, 0, 0, NULL, 'Airlangga = Kerjaan Kahuripan\nJayabaya = Kerajaan Kediri (Raja ke 3)\nSamarawijaya = Kerajaan Kediri (Raja Pertama)\nKertajaya = Kerjaan Kediri (Raja ke 8)', ''),
(3723, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Penyebab utama pecahnya Perang Dipenogoro adalahâ€¦', 3, 'A. Rakyat Mataram dihasut oleh para Bupati untuk memihak penjajah Belanda', 'B. Belanda mengusik makam leluhur Diponegoro di Tegal Rejo', 'C. Pangeran Diponegoro tidak menyukai tingkah laku Belanda', 'D. Pangeran Diponegoro bertikai dengan Sentot Prawirodirjo', 'E. Campur tangan Belanda dalam urusan Keraton Surakarta', 0, 5, 0, 0, 0, NULL, 'Belanda secara paksa mengambil tanah leluhur Diponegoro untuk proyek pembangunan jalan.', ''),
(3724, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Salah satu teori penyebaran agama Hindu-Budha di Indonesia yaitu teori Brahmana dikemukakan olehâ€¦', 4, 'A. Krom', 'B. Berg', 'C. Van Faber', 'D. Van Leur', 'E. Bosch', 0, 0, 0, 5, 0, NULL, 'Van Leur menyatakan bahwa agama dan kebudayaan Hindu-Buddha yang datang ke Indonesia dibawa oleh golongan Brahmana (golongan agama) yang sengaja diundang oleh penguasa Indonesia dalam rangka melegitimasi kekuasaan mereka sehingga setara dengan raja-raja di India.', ''),
(3725, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Perjanjian Salatiga di tanda tangani pada tanggalâ€¦', 5, 'A. 13 Maret 1757', 'B. 17 Maret 1757', 'C. 13 Februari 1755', 'D. 17 Maret 1755', 'E. 17 Februari 1755', 0, 5, 0, 0, 0, NULL, 'Perjanjian Salatiga ditandatangi pada tanggal 17 Maret 1757 untuk mengakhiri peperangan di jawa antara Hamengku Buwono I dan Paku Buwono III dengan Pangeran Sambernyawa.', ''),
(3726, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Peninggalan Suku Teotihuaca pada masa Peradaban di Amereika Tengah adalahâ€¦', 6, 'A. Templo Major', 'B. Chicen Itza', 'C. Mayan Calendar', 'D. Pyramid of the Sun', 'E. Machu Picchu', 0, 0, 0, 5, 0, NULL, 'Templo Major = Suku Aztec\nChicen Itza = Suku Maya\nMayan Calendar = Suku Maya\nPyramid of The Sun = Suku Teotihuaca\nMachu Picchu = Suku Inca', ''),
(3727, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Ilmu bantu sejarah yang mempelajari tentang uang logam kuno adalahâ€¦', 7, 'A. Ikonografi', 'B. Etnografi', 'C. Numimastik', 'D. Paleontologi', 'E. Paleantropologi', 0, 0, 5, 0, 0, NULL, 'Ikonografi = Patung\nEtnografi = suku bangsa\nNumimastik = uang logam kuno\nPaleontologi = makhluk purba (fosil)\nPaleantropologi = manusia purba', ''),
(3728, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Pithecantropus Erectus ditemukan olehâ€¦', 8, 'A. Ter Haar', 'B. Von Koenigswald', 'C. Eugene Dubois', 'D. Van Rietschoten', 'E. Oppenoorth', 0, 0, 5, 0, 0, NULL, 'Ter Haar = Homo Soloensis\nVon Koenigswald = Meganthropus Paleojavanicus\nEugene Dubois = Pithecantropus Erectus\nVan Rietschoten = Homo Wajakensis\nOppenoorth = Homo Soloensis', ''),
(3729, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Yang merupakan suku bangsa asli India adalah â€¦', 9, 'A. Arya', 'B. Dravida', 'C. Sakia', 'D. Mongol', 'E. Benggala', 0, 5, 0, 0, 0, NULL, 'Bangsa Dravida merupakan bangsa India Asli, memiliki ciri berbadan pendek dan gempal, hidung pesek, rambut keriting, serta berkulit Gelap.', ''),
(3730, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Syarif Hidayatullah merupakan nama asli dari ...', 10, 'A. Sunan Muria', 'B. Sunan Kalijaga', 'C. Sunan Gunung Jati', 'D. Sunan Giri', 'E. Sunan Gresik', 0, 0, 5, 0, 0, NULL, 'Syarif Hidayatullah atau Sunan Gunung Jati merupakan salah seorang dari Walisongo', ''),
(3731, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Berikut ini yang bukan merupakan prasasti peninggalan dari Kerajaan Sriwijaya adalah â€¦', 11, 'A. Prasasti Karang Berahi', 'B. Prasasti Talang Tuo', 'C. Prasasti Kota Kapur', 'D. Prasasti Kebun Kopi', 'E. Prasasti Telaga Batu', 0, 0, 0, 5, 0, NULL, 'Prasasti Kebun Kopi merupakan prasasti peninggalan Kerajaan Tarumanegara', ''),
(3732, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Tokoh yang melahirkan konsep Trias Politika adalah ...', 12, 'A. Montesquieu', 'B. J.J Rosseau', 'C. Voltaire', 'D. Aristoteles', 'E. Immanuel Kant', 5, 0, 0, 0, 0, NULL, 'Trias Politika yang diungkapkan Montesquieu yakni Eksekutif, Yudikatif, dan Legislative', '');
INSERT INTO `data_jawaban` (`id`, `kode_soal`, `jenis_soal`, `soal`, `nomor`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`, `pilihan_e`, `nilai_a`, `nilai_b`, `nilai_c`, `nilai_d`, `nilai_e`, `gambar`, `pembahasan`, `video`) VALUES
(3733, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Konferensi Asia Afrika diselenggarakan di Bandung pada tanggal 18-24 April 1955. Berikut ini tokoh pencetus KAA, kecuali â€¦', 13, 'A. Adam Malik', 'B. Jawaharal Nehru', 'C. Sir John Kotelawala', 'D. U Nu', 'E. Moh. Ali', 5, 0, 0, 0, 0, NULL, 'Pencetus KAA :\n- Indonesia (Alisastro Amijoyo),\n- Burma ( U Nu),\n- Paskitan ( Moh. Ali ),\n- India (Jawaharal Nehru),\n- Sri Lanka ( Sir John Kotelawala)', ''),
(3734, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Sebelum KAA dilaksanakan pada tahun 1955, konferensi tersebut didahului dengan adanya konferensi yang diselenggarakan di Kota Bogor. Konferensi Bogor tersebut dilaksanakan pada tanggal ...', 14, 'A. 18-24 April 1955', 'B. 28-29 Desember 1954', 'C. 28 April-2 Mei 1954', 'D. 28 Maret-2 April 1954', 'E. 18-24 April 1954', 0, 5, 0, 0, 0, NULL, 'Konferensi Bogor atau Konferensi Pancanegara II merupakan konferensi pendahuluan sebelum KAA dilaksanakan. Konferensi Bogor dilaksanakan tanggal 28-29 Desember 1954', ''),
(3735, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Rancangan lambang negara Indonesia yang ditolak untuk disahkan merupakan usulan dari ...', 15, 'A. Moh. Hatta', 'B. Ahmad Soebarjo', 'C. Moh. Yamin', 'D. A.A. Maramis', 'E. Ir. Soekarno', 0, 0, 5, 0, 0, NULL, 'Rancangan yang diusulkan Moh. Yamin ditolak karena mengandung unsur-unsur matahari. Hal tersebut dianggap melambangkan Jepang', ''),
(3736, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Dalam UUD 1945 disebutkan bahwa Negara menghormati dan memelihara bahasa daerah sebagai kekayaan budaya nasional. Hal tersebut dinyatakan dalam Pasal â€¦', 16, 'A. Pasal 31 ayat (1)', 'B. Pasal 32 ayat (1)', 'C. Pasal 31 ayat (2)', 'D. Pasal 32 ayat (2)', 'E. Pasal 29 ayat (1)', 0, 0, 0, 5, 0, NULL, 'Menurut UUD 1945 Pasal 32 yaitu : (1) Negara memajukan kebudayaan nasional Indonesia di tengah peradaban dunia dengan menjamin kebebasan masyarakat dalam memelihara dan mengembangkan nilai-nilai budayanya. (2) Negara menghormati dan memelihara bahasa daerah sebagai kekayaan budaya nasional.', ''),
(3737, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Berikut ini pasal dalam UUD 1945 yang tidak pernah mengalami amandemen â€¦', 17, 'A. Pasal 29', 'B. Pasal 30', 'C. Pasal 31', 'D. Pasal 32', 'E. Pasal 33', 5, 0, 0, 0, 0, NULL, 'Pasal-pasal yang tidak mengalami amandemen adalah Pasal 4, 10, 12, 29, dan 35', ''),
(3738, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'MPR paling lambat dibentuk pada tanggal â€¦', 18, 'A. 17 Agustus 2000', 'B. 17 Agustus 2001', 'C. 17 Agustus 2002', 'D. 17 Agustus 2003', 'E. 17 Agustus 2004', 0, 0, 0, 5, 0, NULL, 'Sesuai dengan aturan peralihan pasal III', ''),
(3739, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Fakir miskin dan anak-anak terlantar dipelihara oleh â€¦', 19, 'A. Pemerintah', 'B. Presiden', 'C. Negara', 'D. DPR', 'E. Pemerintah Daerah', 0, 0, 5, 0, 0, NULL, 'Sesuai Pasal 34 ayat (1) UUD 1945', ''),
(3740, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Calon Hakim Agung diusulkan oleh ...', 20, 'A. MA', 'B. MK', 'C. MPR', 'D. DPR', 'E. KY', 0, 0, 0, 0, 5, NULL, 'Pasal 24A ayat (3) UUD 1945 amandemen ketiga: Calon hakim agung diusulkan Komisi Yudisial kepada Dewan Perwakilan Rakyat untuk mendapatkan persetujuan dan selanjutnya ditetapkan sebagai hakim agung oleh Presiden.', ''),
(3741, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Belanda mendirikan kongsi dagang yang bernama &lt;i&gt;Vereenigde Oost-Indische Compagnie&lt;/i&gt; (VOC) pada tanggalâ€¦', 21, 'A. 12 Maret 1596', 'B. 12 April 1596', 'C. 12 Mei 1596', 'D. 20 Maret 1602', 'E. 20 Mei 1602', 0, 0, 0, 5, 0, NULL, 'Kongsi Dagang atau Perusahaan Hindia Timur Belanda atau VOC didirikan pada 20 Maret 1602', ''),
(3742, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Sebelum munculnya Daendels, para petinggi VOC menjalankan kebijakan yang merugikan bangsa Indonesia seperti berikut, kecualiâ€¦', 22, 'A. sistem tanam paksa (cultuurstelsel)', 'B. wajib kerja (verplichte diensten)', 'C. penyerahan paksa hasil bumi (verplichte leveranties)', 'D. penarikan pajak hasil bumi (contingenten)', 'E. kerja paksa (rodi)', 5, 0, 0, 0, 0, NULL, 'sistem tanam paksa (cultuurstelsel) dilakukan pada masa kepemimpinan Johanes van den Bosch sebagai Gubernur Jenderal Hindia-Belanda. Ia menjalankankan tugas setelah kepemimpinan Daendels dan Thomas Stamford Raffles', ''),
(3743, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Yang merupakan pencetus Sumpah Pemuda adalahâ€¦', 23, 'A. Perhimpunan Indonesia Nederland, Partai Nasional Indonesia, dan PPPI', 'B. Perhimpunan Indonesia Nederland, Partai Nasional Indonesia, dan Pemuda Indonesia', 'C. Partai Nasional Indonesia, Pemuda Indonesia, Partai Indonesia Raya', 'D. Partai Nasional Indonesia, Pemuda Indonesia, dan Gabungan Politik Indonesia', 'E. Perhimpunan Indonesia Nederland, Partai Indonesia Raya, dan Pemuda Indonesia', 0, 5, 0, 0, 0, NULL, 'Pencetus Sumpah Pemuda adalah Perhimpunan Indonesia Nederland, Partai Nasional Indonesia, dan Pemuda Indonesia. Peristiwa ini dihadiri oleh organisasi PPPI, Jong Java, Jong Islamiten Bond, Jong Sumatranen Bond, Pemuda Indonesia, Jong Celebes, Jong Ambon, Jong Batak, dan Pemuda Kaum Betawi.', ''),
(3744, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Pembebasan Irian Barat pada masa demokrasi liberal dilakukan melalui jalur diplomasi dan jalur konfrontasi. Jalur diplomasi pembebasan Irian Barat dilakukan sejak kabinetâ€¦', 24, 'A. Kabinet Natsir', 'B. Kabiner Sukiman-Suwiryo', 'C. Kabinet Wilopo', 'D. Kabinet Ali Sastroamidjojo I', 'E. Kabinet Burhanuddin Harahap', 5, 0, 0, 0, 0, NULL, 'Jalur diplomasi pembebasan Irian Barat dilakukan sejak Kabinet Natsir (6 Oktober 1950 s.d. 21 Maret 1951). Berbagai perundingan bilateral dilakukan, namun masih belum berhasil.', ''),
(3745, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Hari Infranteri merupakan hari peringatan terjadinya peristiwa Ambarawa. Peristiwa ini adalah perlawanan TKR yang dipimpin oleh Kolonel Sudirman melawan tentara sekutu di Ambarawa. Peristiwa ini terjadi pada tanggalâ€¦', 25, 'A. 23 Maret 1945', 'B. 10 Desember 1945', 'C. 15 Desember 1945', 'D. 7 Desember 1946', 'E. 21 Juli 1947', 0, 0, 5, 0, 0, NULL, '23 Maret 1945 peristiwa Bandung Lautan Api,\n10 Desember 1945 peristiwa Medan Area,\n7 Desember 1946 peristiwa Westerling,\n21 Juli 1947 peristiwa Agresi Militer I', ''),
(3746, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Sejak Jepang kalah dari pihak sekutu dalam pertempuran di Laut Karang pada 7 Mei 1942, Jepang berupaya menarik simpati bangsa Indonesia. Jepang juga memanfaatkan para pemuda Indonesia dengan membentuk organisasi semi militer, yaituâ€¦', 26, 'A. Peta, Heiho, Seinendan, Fujinkai', 'B. Kaigun, Seinendan, Fujinkai, Keibodan', 'C. Fujinkai, Keibodan, Kaigun, Rikugun', 'D. Peta, Kaigun, Keibodan, Fujinkai', 'E. Seinendan, Fujinkai, Keibodan, Syusintai', 0, 0, 0, 0, 5, NULL, 'Organisasi semi militer yang dibentuk Jepang adalah Seinendan (barisan pemuda), Fujinkai (barisan wanita), Keibodan (barisan pembantu polisi), dan Syusintai (barisan pelopor). Selain itu, Jepang membentuk organisasi militer yakni Peta (pembela tanah air) dan Heiho (barisan pembantu prajurit Jepang). Sedangkan Kaigun adalah sebutan untuk angkatan laut dan Rikugun adalah sebutan untuk angkatan darat.', ''),
(3747, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Perang Paderi adalah perang melawan kolonial pada tahun 1821 s.d. 1837 di Minangkabau yang dipimpin olehâ€¦', 27, 'A. Pangeran Diponegoro', 'B. Tuanku Imam Bonjol', 'C. Teuku Umar', 'D. Pattimura', 'E. Sultan Ageng Tirtayasa', 0, 5, 0, 0, 0, NULL, 'Perang Paderi yang terjadi di Sumatera Barat berlangsung antara tahun 1803 hingga 1838 dipimpin oleh Tuanku Imam Bonjol', ''),
(3748, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Dewan Perwakilan Daerah (DPD) merupakan lembaga perwakilan daerah yang anggotanya merupakan wakil-wakli daerah provinsi yang dipilih melalui pemilihan umum. Anggota Dewan Perwakilan Daerah (DPD) dari setiap provinsi sebanyak â€¦ orang.', 28, 'A. empat orang', 'B. lima orang', 'C. enam orang', 'D. tujuh orang', 'E. delapan orang', 5, 0, 0, 0, 0, NULL, 'Anggota DPD dari setiap provinsi adalah 4 orang. Dengan demikian jumlah anggota DPD saat ini adalah seharusnya 136 orang. Masa jabatan anggota DPD adalah 5 tahun, dan berakhir bersamaan pada saat anggota DPD yang baru mengucapkan sumpah/janji.', ''),
(3749, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'MPR dapat memilih presiden dan wakil presiden apabila keduanya berhalangan tetap secara bersamaan dalam masa jabatannya selambat-lambatnya dalam waktu â€¦ hari.', 29, 'A.15 hari', 'B. 20 hari', 'C. 25 hari', 'D. 30 hari', 'E. 60 hari', 0, 0, 0, 5, 0, NULL, 'Sesuai dengan UUD 1945 Pasal 8 ayat (3), yaitu Jika Presiden dan Wakil Presiden mangkat, berhenti, diberhentikan, atau tidak dapat melakukan\nkewajibannya dalam masa jabatannya secara bersamaan, pelaksanaan tugas Kepresidenan adalah\nMenteri Luar Negeri, Menteri Dalam Negeri dan Menteri Pertahanan secara bersama-sama. Selambat-lambatnya tiga puluh hari setelah itu, Majelis Permusyawaratan Rakyat menyelenggarakan sidang untuk memilih Presiden dan Wakil Presiden dari dua pasangan calon Presiden dan wakil Presiden\nyang diusulkan oleh partai politik atau gabungan partai politik yang pasangan calon Presiden dan\nWakil Presidennya meraih suara terbanyak pertama dan kedua dalam pemilihan umum sebelumnya,\nsampai berakhir masa jabatannya.****)', ''),
(3750, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'DPR memiliki 11 komisi. Komisi XI memiliki ruang lingkup tugasâ€¦', 30, 'A. membidangi pertahanan, intelijen, luar negeri, dan komunikasi &amp; informasi', 'B. membidangi pemerintahan dalam negeri, otonomi daerah, aparatur negara, dan agraria', 'C. membidangi energi, sumber daya mineral, riset dan teknologi, dan lingkungan', 'D. membidangi agama, sosial, dan pemberdayaan perempuan', 'E. membidangi keuangan, perencanaan pembangunan nasional, perbankan, dan lembaga keuangan bukan bank', 0, 0, 0, 0, 5, NULL, 'Komisi I = membidangi pertahanan, intelijen, luar negeri, dan komunikasi &amp; informasi\nKomisi II = membidangi pemerintahan dalam negeri, otonomi daerah, pemilu, aparatur negara, dan agraria\nKomisi VII = membidangi energi, sumber daya mineral, riset dan teknologi, dan lingkungan\nKomisi VIII = membidangi agama, sosial, dan pemberdayaan perempuan\nKomisi XI = membidangi keuangan, perencanaan pembangunan nasional, perbankan, dan lembaga keuangan bukan bank', ''),
(3751, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Siapakah Tokoh Pendiri ASEAN yang berasal dari Singapura?', 31, 'A. Adam Malik', 'B. Tun Abdul Razak', 'C. Thanat Koman', 'D. Narciso Ramos', 'E. S. Rajaratnam', 0, 0, 0, 0, 5, NULL, 'Adam Malik berasal dari Indonesia\nTun Abdul Razak berasal dari Malaysia\nThanat Koman berasal dari Thailand\nNarciso Ramos berasal dari Filipina\nS. Rajaratnam berasal dari Singapura', ''),
(3752, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Revolusi Industri bermula di Inggris dan terjadi antara tahun 1750-1850. Faktor-faktor yang menyebabkan terjadinya Revolusi Industri adalah sebagai berikut, kecuali.....', 32, 'A. Situasi politik yang stabil. Adanya Revolusi Glorius/Agung tahun 1688 yang mengharuskan Raja bersumpah setia kepada Bill of Right sehingga raja tunduk tunduk kepada undang-undang dan hanya menarik pajak berdasarkan atas persetujuan parlemen', 'B. Adanya penemuan baru di bidang teknologi yang dapat mempermudah cara kerja dan meningkatkan hasil produksi, misalnya alat-alat pemintal, mesin tenun, mesin uap, dan sebagainya', 'C. Munculnya pemahaman baru, yaitu memperjuangkan kebebasan dan pemenuhan hak-hak asasi manusia', 'D. Pemerintah memberikan perlindungan hukum terhadap hasil-hasil penemuan baru (hak paten) sehingga mendorong kegiatan penelitian ilmiah', 'E. Kemakmuran Inggris akibat majunya pelayaran dan perdagangan sehingga dapat menyediakan modal yang besar untuk bidang usaha', 0, 0, 5, 0, 0, NULL, 'Revolusi Industri untuk kali pertamanya muncul di Inggris. Adapun faktor-faktor yang menyebabkannya adalah sebagai berikut:\n\n1. Situasi politik yang stabil. Adanya Revolusi Agung tahun 1688 yang mengharuskan raja bersumpah setia kepada Bill of Right sehingga raja tunduk kepada undang-undang dan hanya menarik pajak berdasarkan atas persejutuan parlemen.\n2. Inggris kaya bahan tambang, seperti batu bara, biji besi, timah, dan kaolin. Di samping itu, wol juga yang sangat menunjang industri tekstil.\n3. Adanya penemuan baru di bidang teknologi yang dapat mempermudah cara kerja dan meningkatkan hasil produksi, misalnya alat-alat pemintal, mesin tenun, mesin uap, dan sebagainya.\n4. Kemakmuran Inggris akibat majunya pelayaran dan perdagangan sehingga dapat menyediakan modal yang besar untuk bidang usaha. Di samping itu, di Inggris juga tersedia bahan mentah yang cukup karena Inggris mempunyai banyak daerah jajahan yang menghasilkan bahan mentah tersebut.\n5. Pemerintah memberikan perlindungan hukum terhadap hasil-hasil penemuan baru (hak paten) sehingga mendorong kegiatan penelitian ilmiah. Lebih-lebih setelah dibentuknya lembaga ilmiah Royal Society for Improving Natural Knowledge maka perkembangan teknologi dan industri bertambah maju.\n6. Arus urbanisasi yang besar akibat Revolusi Agraria di pedesaan mendorong pemerintah Inggris untuk membuka industri yang lebih banyak agar dapat menampung mereka.', ''),
(3753, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Berdasarkan sensus BPS tahun 2010, jumlah suku bangsa di Indonesia berjumlah.....', 33, 'A. 1340', 'B. 1328', 'C. 1350', 'D. 1335', 'E. 1300', 5, 0, 0, 0, 0, NULL, 'Terdapat lebih dari 300 kelompok etnik atau suku bangsa di Indonesia atau tepatnya 1.340 suku bangsa menurut sensus BPS tahun 2010.', ''),
(3754, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Senjata tradisional yang dipakai oleh pejuang Aceh untuk melawan penjajah adalah.....', 34, 'A. Keris', 'B. Pisau Belati', 'C. Bambu Runcing', 'D. Rencong', 'E. Panah', 0, 0, 0, 5, 0, NULL, 'Rencong dipakai oleh para pejuang Aceh dalam melawan penjajahan bangsa asing dulu, tidak hanya pejuang saja yang memakai rencong tapi juga raja-raja dan kaum bangsawan di Aceh', ''),
(3755, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Gunung yang terletak di perbatasan antara Jawa Tengah dan Jawa Timur adalah.....', 35, 'A. Gunung Semeru', 'B. Gunung Lawu', 'C. Gunung Slamet', 'D. Gunung Merapi', 'E. Gunung Kerinci', 0, 5, 0, 0, 0, NULL, 'Gunung Lawu terletak di Kabupaten Karanganyar, Jawa Tengah dan Kabupaten Magetan, Jawa Timur', ''),
(3756, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Agitator = ....', 36, 'A. Motivator', 'B. Penghasut', 'C. Pendukung', 'D. Pencetus', 'E. Orator', 0, 5, 0, 0, 0, NULL, 'Agitator adalah penghasut (KBBI)', ''),
(3757, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Pemugaran = ....', 37, 'A. Pengusiran', 'B. Penghancuran', 'C. Perbaikan', 'D. Pembaharuan', 'E. Pembongkaran', 0, 0, 0, 5, 0, NULL, 'Pemugaran adalah pembaharuan kembali (KBBI)', ''),
(3758, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Somasi = ....', 38, 'A. Isolasi', 'B. Revisi', 'C. Siomay', 'D. Teguran untu membayar', 'E. Usulan pembayaran', 0, 0, 0, 5, 0, NULL, 'Somasi adalah teguran untuk membayar (KBBI)', ''),
(3759, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Bergaul =', 39, 'A.Berteman', 'B. Bermain', 'C. Berkelakar', 'D. Bercanda', 'E. Berdendang', 5, 0, 0, 0, 0, NULL, 'Bergaul adalah berteman, bersahabat (KBBI)', ''),
(3760, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Mandiri &gt;&lt; â€¦..', 40, 'A. Swasembada', 'B. Mengikuti', 'C. Bergantung', 'D. Roboh', 'E. Berdikari', 0, 0, 5, 0, 0, NULL, 'Mandiri adalah dalam keadaan dapat berdiri sendiri, tidak bergantung pada orang lain.', ''),
(3761, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Ekuivalen &gt;&lt; â€¦...', 41, 'A. Berlawanan', 'B. Sama', 'C. Seimbang', 'D. Sepadan', 'E. Setingkat', 5, 0, 0, 0, 0, NULL, 'Ekuivalen adalah mempunyai nilai (ukuran, arti, atau efek) yang sama; seharga; sebanding; sepadan.', ''),
(3762, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Sapi : Rumput = .....', 42, 'A. Kambing : Gulai', 'B. Badak : Cula', 'C. Kerbau : Tanduk', 'D. Pagar : Tanaman', 'E. Manusia : Nasi', 0, 0, 0, 0, 5, NULL, 'Sapi memakan Rumput; Manusia memakan Nasi', ''),
(3763, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'KAKAKTUA : MERPATI = â€¦ : â€¦', 43, 'A. Gajah : Semut', 'B. Elang : Kupu-Kupu', 'C. Gurame : Kakap', 'D. Anjing : Herder', 'E. Singa : Naga', 0, 0, 5, 0, 0, NULL, 'Hubungan antara kedua hewan yang satu jenis yaitu sama-sama burung dan sama-sama ikan', ''),
(3764, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'AIR : ES = UAP : â€¦', 44, 'A. Air', 'B. Udara', 'C. Basah', 'D. Mendidih', 'E. Awan', 5, 0, 0, 0, 0, NULL, 'Jika air didinginkan menjadi es, maka jika uap didinginkan menjadi butir-butir air', ''),
(3765, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Kalimat di bawah ini yang mengandung kata tidak bakuâ€¦.', 45, 'A. Dia memiliki karier yang cukup bagus.', 'B. Hani bekerja di sebuah apotek ternama.', 'C. Hari ini adalah jadual kelas kami untuk bertanding.', 'D. Pekerjaannya adalah menganalisis laporan keuangan satuan kerja.', 'E. Dia membawa kuitansinya pulang ke rumah.', 0, 0, 5, 0, 0, NULL, 'Kata baku dari JADUAL adalah JADWAL', ''),
(3766, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'X, U, Q, â€¦', 46, 'A. I', 'B. J', 'C. K', 'D. L', 'E. M', 0, 0, 0, 5, 0, NULL, 'Deret dengan beda 3 dan 4 maka berikutnya 5. Sehingga, 5 huruf sebelum Q yaitu L', ''),
(3767, 'TryoutUSMSTAN-0828122737', 'Soal 2', '3 , 3 , 6 , 9 , 15 , 24 , â€¦.', 47, 'A. 39', 'B. 40', 'C. 41', 'D. 42', 'E. 43', 5, 0, 0, 0, 0, NULL, 'Deret tersebut memiliki pola yaitu penjumlahan dari 2 bilangan sebelumnya.\nKita lihat mulai bilangan ketiga:\n6 = 3+3\n9 = 6+3\n15 = 9+6\n24 = 15+9\nJadi, bilangan selanjutnya adalah 24+15 = 39', ''),
(3768, 'TryoutUSMSTAN-0828122737', 'Soal 2', '1 , 11 , 3 , 7 , 5 , 5 , ... , â€¦', 48, 'A. 7 , 5', 'B. 7 , 3', 'C. 3 , 7', 'D. 5 , 7', 'E. 4 , 5', 0, 5, 0, 0, 0, NULL, 'Deret tersebut terdiri dari dua bagian.\nDeret pertama: 1, 3, 5 (beda dua) jadi angka selanjutnya adalah 7.\nDeret kedua: 11, 7, 5 (merupakan bilangan prima) jadi angka selanjutnya adalah 3.', ''),
(3769, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'A â€“ S â€“ D â€“ P â€“ G - ... - ...', 49, 'A. K - L', 'B. N - M', 'C. M - J', 'D. O - P', 'E. L â€“ Z', 0, 0, 5, 0, 0, NULL, 'Deret huruf tersebut memiliki pola jarak 3 huruf.\nDeret pertama: A, D, G, berjarak 3 huruf dari huruf sebelumnya, maka huruf selanjutnya adalah J.\nDeret kedua: S, P, berjarak 3 huruf dari huruf sebelumnya, namun urutannya mundur, jadi huruf selanjutnya adalah M.', ''),
(3770, 'TryoutUSMSTAN-0828122737', 'Soal 2', '16Â² - 15Â² = â€¦', 50, 'A. 30', 'B. 31', 'C. 32', 'D. 33', 'E. 34', 0, 5, 0, 0, 0, NULL, '', ''),
(3771, 'TryoutUSMSTAN-0828122737', 'Soal 2', '37 x 36 + 35 x 34 = â€¦.', 51, 'A. 2679', 'B. 2695', 'C. 2522', 'D. 3176', 'E. 3075', 0, 0, 5, 0, 0, NULL, 'TRIK CEPAT:\nDihitung satuan nya saja\n(7 x 6) + (5 x 4) = 42 + 20 = 62\nCari satuannya yang memiliki angka 2', ''),
(3772, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'âˆš(1-0,36) - âˆš(1-0,64) = â€¦.', 52, 'A. 0.30', 'B. 0.60', 'C. 0.35', 'D. 0.20', 'E. 0.25', 0, 0, 0, 5, 0, NULL, 'âˆš(1-0,36) - âˆš(1-0,64) =  0,8 - 0,6 = 0,2', ''),
(3773, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Adis membeli baju dengan harga diskon 15% dari Rp80.000,00. Karena ia sedang berulang tahun, ia mendapat diskon tambahan sebesar 25% dari harga awal setelah dikurangi diskon 15% di awal. Berapakah harga yang harus dibayarkan Adis kepada kasir?', 53, 'A. Rp60,000.00', 'B. Rp55,000.00', 'C. Rp51,000.00', 'D. Rp63,000.00', 'E. Rp73,000.00', 0, 0, 5, 0, 0, NULL, '1) 80.000 - (15% x 80.000) = 68.000\n2) 68.000 - (25% x 68.000) = 51.000', ''),
(3774, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Ajeng sedang membuat kerajinan papan catur. Dalam 5 menit, ia mampu mengecat 25% dari papan berwarna putih. Berapa lamakah ia mengecat sampai selesai keseluruhan papan catur?', 54, 'A. 50 menit', 'B. 30 menit', 'C. 20 menit', 'D. 60 menit', 'E. 40 menit', 0, 0, 0, 0, 5, NULL, 'Papan warna putih\n25% = 5 menit\nx4\n100% = 20 menit\nagar bisa 100% selesai maka dikali 4, jadi waktu yang dibutuhkan untuk mengecat papan warna putih 100% adalah 20 menit.\n\nJumlah warna putih dan warna hitam pada papan catur adalah sama, jadi tinggal dikali 2.\n20 menit x 2 = 40 menit.', ''),
(3775, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Volume ember jika penuh adalah 42,5 liter. Namun, saat ini hanya terisi 3/5 saja dan itu pun masih diambil lagi oleh Adrian, sehingga kini hanya terisi 1/5 saja. Berapa literkah yang diambil oleh Adrian?', 55, 'A. 17 liter', 'B. 8,5 liter', 'C. 17,5 liter', 'D. 8 liter', 'E. 34 liter', 5, 0, 0, 0, 0, NULL, '(3/5 - 1/5) x 42,5 = 17', ''),
(3776, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Peluang muncul mata dadu berangka prima dalam satu kali pelemparan sebuah dadu adalah â€¦', 56, 'A. 1/6', 'B. 2/6', 'C. 1/2', 'D. 2/3', 'E. 5/6', 0, 0, 5, 0, 0, NULL, 'bilangan prima dalam sebuah dadu 2 , 3 , 5 --&gt; 3\nruang sampel sebuah dadu 1 , 2 , 3 , 4 , 5 , 6 --&gt; 6\n\nJadi, peluangnya adalah 3/6 = 1/2', ''),
(3777, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Nilai Y pada bilangan berpangkat di bawah ini adalah â€¦\n\n3Â²x3Â²x3Â²x3Â²x3Â² = 3y', 57, 'A. 8', 'B. 9', 'C. 10', 'D. 11', 'E. 12', 0, 0, 5, 0, 0, NULL, '32+2+2+2+2 = 310\nJadi Y adalah 10', ''),
(3778, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Kota A dan kota B berjarak 3,5 cm dalam peta yang skalanya 1 : 5000. Berapa jarak sebenarnya?', 58, 'A. 1,55 hm', 'B. 1,65 hm', 'C. 1,75 hm', 'D. 1,85 hm', 'E. 1,95 hm', 0, 0, 5, 0, 0, NULL, '3,5 x 5.000 cm = 17.500 cm\n1 hm = 10.000 cm', ''),
(3779, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Teks  untuk soal nomor 63-65\n\nDalam sebuah pertemuan Fadjri, Antad, Bian, James, Oris dan Gafrio duduk di meja bulat dengan urutan sebagai berikut:\n\nFadjri selalu berada di antara Gafrio dan Oris.\n\nGafrio tidak mau bersebelahan dengan Bian maupun Oris Antad berada di sebelah James dan Bian.\n\n63. Siapakah yang berada di sebelah James?', 59, 'A. Gafrio dan Fadjri', 'B. Antad dan Gafrio', 'C. Bian dan Oris', 'D. Fadjri dan Antad', 'E.  Bian dan Fadjri', 0, 5, 0, 0, 0, NULL, 'Urutan tempat duduk:\nFadjri - Oris - Bian - Antad - James â€“ Gafrio', ''),
(3780, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Dalam sebuah pertemuan Fadjri, Antad, Bian, James, Oris dan Gafrio duduk di meja bulat dengan urutan sebagai berikut:\n\nFadjri selalu berada di antara Gafrio dan Oris.\n\nGafrio tidak mau bersebelahan dengan Bian maupun Oris Antad berada di sebelah James dan Bian.\n\n64. Urutan mereka duduk yang paling benar adalah â€¦', 60, 'A. Fadjri, Gafrio, Bian, Antad, James, Oris', 'B. Oris, Fadjri, Bian, Antad, James, Gafrio', 'C. Fadjri, Oris, Bian, Antad, James, Gafrio', 'D. James, Antad, Bian, Gafrio, Fadjri, Oris', 'James, Fadjri, Bian, Gafrio, Antad, Oris', 0, 0, 5, 0, 0, NULL, 'Urutan tempat duduk:\nFadjri - Oris - Bian - Antad - James â€“ Gafrio', ''),
(3781, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Dalam sebuah pertemuan Fadjri, Antad, Bian, James, Oris dan Gafrio duduk di meja bulat dengan urutan sebagai berikut:\n\nFadjri selalu berada di antara Gafrio dan Oris.\n\nGafrio tidak mau bersebelahan dengan Bian maupun Oris Antad berada di sebelah James dan Bian.\n\n65. Siapakah yang berada di sebelah Fadjri dan Bian?', 61, 'A. Antad', 'B. Oris', 'C. Gafrio', 'D. James', 'E.  Bian', 0, 5, 0, 0, 0, NULL, 'Urutan tempat duduk:\nFadjri - Oris - Bian - Antad - James â€“ Gafrio', ''),
(3782, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Saya diterima kuliah di salah satu perguruan tinggi negeri sesuai dengan harapan saya. Namun kondisi keuangan saya saat ini tidak mendukung untuk saya melanjutkan kuliah. Saya akan â€¦', 62, 'A. mengundurkan diri dan membatalkan untuk kuliah', 'B. mencari beasiswa dari negara atau lembaga lainnya', 'C. mencari pinjaman uang untuk biaya kuliah', 'D. tetap melanjutkan kuliah, sambil mencari pekerjaan untuk membiayai kuliah', 'E.  menunda kuliah sampai memiliki dana yang cukup', 1, 4, 2, 5, 3, NULL, 'A = 1\nB = 4\nC = 2\nD = 5\nE = 3', ''),
(3783, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Dalam rangka memperingati hari pelanggan, tempat anda bekerja berencana memberikan reward pada pelanggan. Konsep yang akan anda berikan sebagai tim kreatif adalah â€¦', 63, 'A. memberikan souvenir tanda terima kasih pada setiap pengunjung', 'B. buy one get one free untuk produk tertentu', 'C. potongan diskon 50% untuk produk tertentu', 'D. memberikan voucher untuk pembelanjaan berikutnya', 'E. memberi potongan tertentu dengan syarat dan ketentuan berlaku', 5, 4, 3, 1, 2, NULL, 'A = 5\nB = 4\nC = 3\nD = 1\nE = 2', ''),
(3784, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Terdapat pelanggan terlibat pertengkaran dengan pelanggan lain. Melihat hal tersebut anda akan â€¦', 64, 'A. mengusir mereka', 'B. meminta satpam melerai', 'C. melaporkan pada pihak berwajib', 'D. mengejak menyelesaikan masalah di ruang tertentu', 'E.  meminta ganti rugi karena telah membuat kegaduhan', 1, 4, 3, 5, 2, NULL, 'A = 1\nB = 4\nC = 3\nD = 5\nE = 2', ''),
(3785, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Teman saya melakukan tindakan yang sangat tidak saya sukai. Saya akan melakukan â€¦', 65, 'A. membiarkannya saja sampai ia berubah sendiri', 'B. memberitahukan tindakannya tersebut kepada teman yang lain', 'C. membicarakannya baik-baik dan menjelaskan bahwa saya tidak suka dengan tindakannya', 'D. menegur dan memarahinya agar dia tidak mengulanginya', 'E.  memutuskan pertemanan dengannya', 3, 2, 5, 4, 1, NULL, 'A = 3\nB = 2\nC = 5\nD = 4\nE = 1', ''),
(3786, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Masa kontrak kerja anda sudah habis, maka anda akan â€¦', 66, 'A. malas-malasan', 'B. bekerja seperti biasa', 'C. bekerja dengan lebih giat agar meninggalkan kesan yang baik', 'D. bekerja dengan giat agar dilirik atasan', 'E.  bekerja semampunya', 1, 4, 5, 2, 3, NULL, 'A = 1\nB = 4\nC = 5\nD = 2\nE = 3', ''),
(3787, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Suatu ketika anda menyapa teman anda, tetapi ternyataanda salah orang, maka anda akan â€¦', 67, 'A. pura-pura tidak terjadi apapun', 'B. meminta maaf sembari berlalu', 'C. meminta maaf dan sedikit basa-basi', 'D. malu dan mood rusak seharian', 'E.  biasa aja', 4, 2, 3, 1, 5, NULL, 'A = 4\nB = 2\nC = 3\nD = 1\nE = 5', ''),
(3788, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Dalam menghadapi suatu masalah biasanya saya akan â€¦', 68, 'A. tidak semangat dalam bekerja', 'B. merenung dan introspeksi diri', 'C. stres dan mudah marah', 'D. mencari hiburan untuk menenangkan diri', 'E.  mengomunikasikan masalah saya dengan teman dekat', 2, 5, 1, 3, 4, NULL, 'A = 2\nB = 5\nC = 1\nD = 3\nE = 4', ''),
(3789, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Saat sedang dikejar deadline tugas yang penting, datang seorang tamu yang meminta informasi suatu tempat di kantor keada saya, sikap saya adalah â€¦', 69, 'A. mengantarkan tamu tersebut sampai ke tujuannya', 'B. menelepon tempat tujuan tamu, dan memintanya menjemput tamu tersebut di ruangan saya', 'C. memberi petunjuk arah ke tempat tujuan tamu tersebut dan kemudian melanjutkan pekerjaan', 'D. mengacuhkannya sampai tamu tersebut dengan sendirinya keluar dari ruangan saya', 'E.  tetap fokus pada pekerjaan saya, dan meminta orang lain untuk mengantarkan tamu tersebut ke tempat tujuan', 5, 3, 4, 1, 2, NULL, 'A = 5\nB = 3\nC = 4\nD = 1\nE = 2', ''),
(3790, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Saya menjadi sasaran kemarahan atasan atas kesalahan yang dilakukan oleh rekan setim saya. Yang saya lakukan adalah â€¦', 70, 'A. menganggap itu sebagai pelajaran buat saya agar lebih berhati-hati dalam bekerja', 'B. menjelaskan pada atasan bahwa itu bukan karena kesalahan saya', 'C. menerima kemarahan atasan meskipun itu bukan kesalahan saya', 'D. tidak terima dan mengadukan teman yang membuat masalah tersebut', 'E.  menegur teman saya dan memintanya menjelaskan masalah yang sebenarnya kepada atasan', 5, 4, 1, 2, 3, NULL, 'A = 5\nB = 4\nC = 1\nD = 2\nE = 3', ''),
(3791, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Anda sedang berada dalam kendaraan umum yang penuh sesak dengan penumpang, anda juga sedang terburu-buru karena ada tugas yang harus segera diselesaikan, namun sopir masih berhenti dan menunggupenumpang lain, sikap anda adalah â€¦', 71, 'A. marah pada sopir', 'B. menggerutu', 'C. biasa saja', 'D. turun dari kendaraan umum', 'E.  bersabar', 1, 2, 4, 3, 5, NULL, 'A = 1\nB = 2\nC = 4\nD = 3\nE = 5', ''),
(3792, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Kerabat dekat saya menawarkan saya posisi strategis di perusahaannya tanpa harus melewati proses perekrutan, sedangkan saya kebetulan sedang mecari pekerjaan. Maka yang akan saya lakukan adalah â€¦', 72, 'A. Menerima tawaran tersebut karena dia adalah kerabat saya', 'B. Meminta pendapat dari orang tua terlebih dahulu', 'C. Menolaknya karena saya ingin diterima melalui proses resmi', 'D. Mencoba proses resmi terlebih dahulu sebelum menerima tawaran tersebut', 'E. Mempertimbangkan segala sesuatu terlebih dahulu', 1, 3, 5, 2, 4, NULL, 'A = 1\nB = 3\nC = 5\nD = 2\nE = 4', ''),
(3793, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Dalam perjalanan hidup, sifat utama yang harus dimiliki oleh seseorang adalahâ€¦', 73, 'A. Ulet', 'B. Disiplin', 'C. Berani', 'D. Rajin', 'E.  Jujur', 3, 4, 1, 2, 5, NULL, 'A = 3\nB = 4\nC = 1\nD = 2\nE = 5', ''),
(3794, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Rekan kerja saya tidak menyukai kinerja yang saya lakukan, saya menyikapinya denganâ€¦', 74, 'A. Meningkatkan kinerja saya untuk kedepannya', 'B. Cuek dan tetap fokus berkerja', 'C. Orang lain boleh menilai saya tapi saya yang tahu kualitas diri saya', 'D. Introspeksi diri', 'E. Mencari tahu siapa yang tidak menyukai kinerja saya', 5, 2, 3, 4, 1, NULL, 'A = 5\nB = 2\nC = 3\nD = 4\nE = 1', ''),
(3795, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Dalam mengikuti suatu kompetisi, saya mengalami kekalahan. Perasaan yang sayaâ€¦', 75, 'A. Biasa saja, menang atau kalah itu biasa saja', 'B. Tetap bersemangat agar memenangkan kompetensi selanjutnya', 'C. Sedih sehingga tidak mau ikut kompetensi lagi', 'D. Kecewa dan tidak terima', 'E.  Malu dan menyesal telah ikut kompetensi', 4, 5, 2, 3, 1, NULL, 'A = 4\nB = 5\nC = 2\nD = 3\nE = 1', ''),
(3796, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Bekerja merupakan upaya meraih kesuksesan, maka upaya saya adalahâ€¦', 76, 'A. Bekerja berdasarkan kontrak kerja', 'B. Bekerja sampai larut malam', 'C. Bekerja keras', 'D. Berusaha mengatasi orang yang menghalangi saya', 'E.  Bekerja dengan disiplin dan mengusahakan yang terbaik', 2, 1, 4, 3, 5, NULL, 'A = 2\nB = 1\nC = 4\nD = 3\nE = 5', ''),
(3797, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Ketika saya diminta melakukan pekerjaan berat, sayaâ€¦', 77, 'A. Menolaknya', 'B. Mempertimbangkan dulu untuk menerimanya', 'C. Merasa tertantang melaksanakan pekerjaan itu', 'D. Tetap menerimanya meskipun tidak suka dengan pekerjaan itu', 'E.  Menyerahkan pekerjaan tersebut pada orang lain', 2, 3, 5, 4, 1, NULL, 'A = 2\nB = 3\nC = 5\nD = 4\nE = 1', ''),
(3798, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Ketika usulan yang saya ajukan dianggap kurang tepat oleh atasan, maka sikap sayaâ€¦', 78, 'A. Mencoba mencari alternatif usulan lain yang lebih tepat untuk diajukan lagi', 'B. Merasa kecewa tetapi tetap berusaha melupakan penolakan tersebut', 'C. Sangat kecewa', 'D. Bersikeras memberikan alasan dan pembenaran atas usulan tersebut', 'E.  Membiarkan saja', 5, 4, 3, 2, 1, NULL, 'A = 5\nB = 4\nC = 3\nD = 2\nE = 1', ''),
(3799, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Yang akan saya lakukan saat hari pertama ditempatkan di sebuah tempat tugas yang baru adalahâ€¦', 79, 'A. Menyapa rekan kerja baru dan bertanya tentang sistem kerja di tempat tersebut', 'B. Mempelajari sistem kerja di tempat tersebut dari peraturan dan data yang ada', 'C. Mencari tahu apa yang harus saya kerjakan', 'D. Diam saja sambil mengamati sistem kerja pegawai di tempat tersebut', 'E.  Menunggu Perintah dari atasan', 5, 4, 3, 2, 1, NULL, 'A = 5\nB = 4\nC = 3\nD = 2\nE = 1', ''),
(3800, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Pertama kali yang anda lakukan saat datang ke kantor di pagi hari adalahâ€¦', 80, 'A. Menyapa rekan kerja baru dan bertanya tentang sistem kerja di tempat tersebut', 'B. Mempelajari sistem kerja di tempat tersebut dari peraturan dan data yang ada', 'C. Mencari tahu apa yang harus saya kerjakan', 'D. Diam saja sambil mengamati sistem kerja pegawai di tempat tersebut', 'E.  Menunggu Perintah dari atasan', 2, 1, 3, 5, 4, NULL, 'A = 2\nB = 1\nC = 3\nD = 5\nE = 4', ''),
(3801, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Ketika Anda pindah rumah, Anda akanâ€¦', 81, 'A. Biasa-biasa saja', 'B. Membagikan makanan pada tetangga', 'C. Mengundang para tetangga ke ruman Anda', 'D. Membawa serta keluarga Anda kesana', 'E.  Mengundang rekan kerja ke rumah Anda', 1, 4, 5, 3, 1, NULL, 'A = 1\nB = 4\nC = 5\nD = 3\nE = 1', ''),
(3802, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Saya diutus untuk menghadiri seminar menggantikan atasan saya. Pada saat yang bersamaan saya sedang mengerjakan laporan yang tidak terlalu mendesak â€¦', 82, 'A. Saya akan selesaikan terlebih dahulu laporan tersebut, sebab bisa saja diminta oleh atasan sewaktu-waktu', 'B. Laporan tersebut akan menjadi merepotkan kalau tertunda.', 'C. Saya akan menghadiri seminar tersebut agar dapat menghindar dari tugas laporan.', 'D. Saya akan menghadiri seminar tersebut karena laporan belum harus segera diserahkan kepada atasan.', 'E.  Saya bisa menghadiri seminar dan mengerjakan laporannya nanti saja.', 5, 3, 4, 1, 2, NULL, 'A = 5\nB = 3\nC = 4\nD = 1\nE = 2', ''),
(3803, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Saya ditugaskan untuk memimpin suatu proyek di kantor dengan deadline yang sangat singkat. Rekan kerja saya menunjukkan sikap tidak peduli terhadap tugas dalam proyek tersebut. Sikap saya adalah ....', 83, 'A. Bekerja sendiri menyelesaikan tugas tersebut.', 'B. Memberi peringatan pada rekan kerja saya dan mengancam akan mengeluarkan mereka yang tidak serius dalam proyek.', 'C. Melaporkan pada atasan agar mereka mendapat sanksi.', 'D. Membagi tugas sesuai dengan porsi masing-masing secara adil dan tetap memotovasi mereka untuk menyelesaikan tugasnya.', 'E.  Memberikan nasihat pada mereka agar mau menyelesaikan tugasnya.', 2, 3, 1, 5, 4, NULL, 'A = 2\nB = 3\nC = 1\nD = 5\nE = 4', ''),
(3804, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Saya diminta menyelesaikan laporan program kreativitas mahasiswa dalam rangka memonitor dan mengevaluasi dengan waktu yang sangat terbatas dan mendadak. Anggota kelompok saya justru menunjukkan sikap tidak peduli terhadap tugas-tugasnya. Sikap saya adalah ....', 84, 'A. Bekerja sendiri yang penting laporan selesai.', 'B. Mengancam mengeluarkan teman yang tidak serius mengerjakan tugas.', 'C. Melaporkan mereka pada pembimbing program krativitas mahasiswa.', 'D. Membagi tugas secara adil dan memotivasi anggota agar menyelesaikannya.', 'E. Menasihati agar mereka sadar dengan penyelesaian tugas yang diembannya', 2, 3, 1, 5, 4, NULL, 'A = 2\nB = 3\nC = 1\nD = 5\nE = 4', ''),
(3805, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Saya akan meminta tanda tangan salah satu dosen untuk pengesahan KTTA saya. Kebetulan sudah satu minggu dosen tersebut tidak ke kampus, pihak kampus memyarankan saya untuk pergi ke rumah beliau. Saat pergi ke rumah dosen tersebut, ternyata keluarganya memberitahu bahwa tangan dosen tersebut sedang terkena stroke dan tidak bisa memberikan tanda tangan. Sikap saya.....', 85, 'A. Menunggu sampai dosen tersebut sembuh dari stroke', 'B. Menjelaskan kepada pihak kampus tentang keadaan dosen tersebut dan meminta pertimbangan dari kampus jika tanda tangan pengesaham bisa diwakilkan oleh dosen lain', 'C. Tidak memaksa dosen tersebut untuk tanda tangan', 'D. Marah marah karena merasa dipersulit', 'E.  Protes pada pihak kampus', 4, 5, 3, 2, 1, NULL, 'A = 4\nB = 5\nC = 3\nD = 2\nE = 1', ''),
(3806, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Sebagai seorang bidan sudah menjadi tanggung jawab saya untuk membantu orang yang akan melahirkan. Tengah malam seorang warga datang ke rumah karena istrinya akan melahirkan padahal saat itu saya baru saja pulang dari kota dan masih dalam keadaan lelah. Sikap saya.....', 86, 'A. Menolak membantu karena masih lelah', 'B. Membantu sebagai bentuk tanggung kawab dan kepedulian', 'C. Menyarankan untuk mendatangi bidan lain', 'D. Mengusir karena sangat menganggu', 'E.  Membantu semampunya', 2, 5, 3, 1, 4, NULL, 'A = 2\nB = 5\nC = 3\nD = 1\nE = 4', ''),
(3807, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Prediksi pengamat ekonomi bahwa bulan depan akan terjadi inflasi besar di Indonesia membuat sayaâ€¦', 87, 'A. Susah tidur', 'B. Depresi berat, karena inflasi berarti harga barang naik', 'C. Berhati-hati dan berhemat dalam membelanjakan uang', 'D. Yang akan terjadi, biarlah terjadi', 'E.  Prediksi yang menyusahkan seperti itu tak perlu saya percayai', 4, 1, 5, 3, 2, NULL, 'A = 4\nB = 1\nC = 5\nD = 3\nE = 2', ''),
(3808, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Bila ada rekan kerja yang salah memanggil nama saya, maka sayaâ€¦', 88, 'A. Saya tersinggung, karena nama adalah kehormatan seseorang', 'B. Saya tidak tersinggung', 'C. Saya mengingatkan kekeliruannya dengan baik baik', 'D. Saya mengingatkannya dengan tegas agar dia jera', 'E.  Hal itu tak menjadi masalah bagi saya', 1, 5, 3, 2, 4, NULL, 'A = 1\nB = 5\nC = 3\nD = 2\nE = 4', ''),
(3809, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Jika hal-hal kecil merusak rencana besar saya, maka...', 89, 'A. Saya sangat sedih dan marah kenapa hal kecil mampu merusak rencana besar tersebut', 'B. Tentu saja saya marah', 'C. Saya melakukan evaluasi menyeluruh', 'D. Saya butuh waktu menenangkan diri', 'E.  Saya marah kepada pihak lain yang juga ikut bertanggung jawab akan hal ini.', 3, 2, 5, 4, 1, NULL, 'A = 3\nB = 2\nC = 5\nD = 4\nE = 1', ''),
(3810, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Jika dalam suatu rapat, rekan kantor memiliki pendapat yang berbeda, padahal Anda-lah yang menjadi pemimpin rapat, maka: â€¦', 90, 'A. Saya teguh mempertahankan pendapat saya', 'B. Beda pendapat bukanlah masalah serius', 'C. Saya pertimbangkan pendapat tersebut', 'D. Saya lihat dulu siapa dia', 'E. Menanyakannya mengapa dia berani berbeda pendapat dengan pemimpin rapat', 3, 4, 5, 2, 1, NULL, 'A = 3\nB = 4\nC = 5\nD = 2\nE = 1', ''),
(3811, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Anda akan bekerja secara maksimal ketika ...', 91, 'A. Diawasi atasan', 'B. Diawasi maupun tidak diawasi atasan', 'C. Dibawah tekanan', 'D. Dalam mood yang baik', 'E. Berada di tempat yang nyaman', 2, 5, 1, 4, 3, NULL, 'A = 2\nB = 5\nC = 1\nD = 4\nE = 3', ''),
(3812, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Ketika Anda dipercaya melakukan tugas baru dan berisiko besar, maka Anda akan ...', 92, 'A. Mundur', 'B. Menolaknya secara tegas', 'C. Meminta Pertimbangan ulang', 'D. Antusias', 'E. Menyanggupinya dengan sedikit ragu', 1, 2, 3, 5, 4, NULL, 'A = 1\nB = 2\nC = 3\nD = 5\nE = 4', ''),
(3813, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Apabila Anda mendapati rekan kerja yang suka menunda pekerjaan, sikap Anda adalah â€¦', 93, 'A. Membiarkannya karena itu biasa terjadi', 'B. Menasihatinya', 'C. Melaporkannya pada atasan', 'D. Menegur dan mengingatkannya', 'E. Menggunjingnya dengan rekan yang lain', 1, 4, 3, 5, 2, NULL, 'A = 1\nB = 4\nC = 3\nD = 5\nE = 2', ''),
(3814, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Anda senang jika datang ke sebuah restoran yang ...', 94, 'A. Pelayanannya ramah dan cekatan', 'B. Cepat membuat pesanan Anda', 'C. Makanannya enak walau lama', 'D. Murah', 'E. Mahal', 5, 4, 3, 2, 1, NULL, 'A = 5\nB = 4\nC = 3\nD = 2\nE = 1', ''),
(3815, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Jika bekerja dibawah tekanan, maka Anda akan â€¦', 95, 'A. Baper', 'B. Biasa saja', 'C. Selalu tersenyum', 'D. Marah', 'E. Butuh waktu sendiri', 2, 5, 4, 1, 3, NULL, 'A = 2\nB = 5\nC = 4\nD = 1\nE = 3', ''),
(3816, 'TryoutUSMSTAN-0828122737', 'Soal 2', 'Saya mengharapkan kondisi kerja yang â€¦', 96, 'A. Menghasilkan pendapatan tambahan', 'B. Menyediakan stabilitas Pekerjaan', 'C. Memungkinkan promosi', 'D. Ada kesempatan aktualisasi diri', 'E. Memotivasi untuk lebih giat bekerja', 1, 2, 3, 4, 5, NULL, 'A = 1\nB = 2\nC = 3\nD = 4\nE = 5', ''),
(3817, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Raja pertama kerajaan Sriwijaya adalah2', 1, 'A. Balaputeradewa', 'B. Sri Jayanasa', 'C. Samaratungga', 'D. Jayasingawarman', 'E. Sanggrama Wijayatungga', 0, 5, 0, 0, 0, NULL, '683 = Sri Jayanasa\n702 = Sri Indrawarman\n775 = Dharanindra\n792 = Samaratungga\n835 = Balaputradewa\n988 = Sri Cudamani Warmadewa\n1008 = Sri Mara-Vijayotunggawarman\n1025 = Sangrama-Vijayotunggawarman', ''),
(3818, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Kerajaan Janggala yang merupakan kerajaan hasil pembelahan dari Medang Kamulan dipipmpin olehâ€¦', 2, 'A. Airlangga', 'B. Jayabaya', 'C. Mapanji Garasakan', 'D. Samarawijaya', 'E. Kertajaya', 0, 0, 5, 0, 0, NULL, 'Airlangga = Kerjaan Kahuripan\nJayabaya = Kerajaan Kediri (Raja ke 3)\nSamarawijaya = Kerajaan Kediri (Raja Pertama)\nKertajaya = Kerjaan Kediri (Raja ke 8)', ''),
(3819, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Penyebab utama pecahnya Perang Dipenogoro adalahâ€¦', 3, 'A. Rakyat Mataram dihasut oleh para Bupati untuk memihak penjajah Belanda', 'B. Belanda mengusik makam leluhur Diponegoro di Tegal Rejo', 'C. Pangeran Diponegoro tidak menyukai tingkah laku Belanda', 'D. Pangeran Diponegoro bertikai dengan Sentot Prawirodirjo', 'E. Campur tangan Belanda dalam urusan Keraton Surakarta', 0, 5, 0, 0, 0, NULL, 'Belanda secara paksa mengambil tanah leluhur Diponegoro untuk proyek pembangunan jalan.', ''),
(3820, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Salah satu teori penyebaran agama Hindu-Budha di Indonesia yaitu teori Brahmana dikemukakan olehâ€¦', 4, 'A. Krom	', 'B. Berg', 'C. Van Faber', 'D. Van Leur', 'E. Bosch', 0, 0, 0, 5, 0, NULL, 'Van Leur menyatakan bahwa agama dan kebudayaan Hindu-Buddha yang datang ke Indonesia dibawa oleh golongan Brahmana (golongan agama) yang sengaja diundang oleh penguasa Indonesia dalam rangka melegitimasi kekuasaan mereka sehingga setara dengan raja-raja di India.', ''),
(3821, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Perjanjian Salatiga di tanda tangani pada tanggalâ€¦', 5, 'A. 13 Maret 1757', 'B. 17 Maret 1757', 'C. 13 Februari 1755', 'D. 17 Maret 1755', 'E. 17 Februari 1755', 0, 5, 0, 0, 0, NULL, 'Perjanjian Salatiga ditandatangi pada tanggal 17 Maret 1757 untuk mengakhiri peperangan di jawa antara Hamengku Buwono I dan Paku Buwono III dengan Pangeran Sambernyawa.', ''),
(3822, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Peninggalan Suku Teotihuaca pada masa Peradaban di Amereika Tengah adalahâ€¦', 6, 'A. Templo Major	', 'B. Chicen Itza', 'C. Mayan Calendar', 'D. Pyramid of the Sun', 'E. Machu Picchu', 0, 0, 0, 5, 0, NULL, 'Templo Major = Suku Aztec\nChicen Itza = Suku Maya\nMayan Calendar = Suku Maya\nPyramid of The Sun = Suku Teotihuaca\nMachu Picchu = Suku Inca', ''),
(3823, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Ilmu bantu sejarah yang mempelajari tentang uang logam kuno adalahâ€¦', 7, 'A. Ikonografi', 'B. Etnografi', 'C. Numimastik', 'D. Paleontologi', 'E. Paleantropologi', 0, 0, 5, 0, 0, NULL, 'Ikonografi = Patung\nEtnografi = suku bangsa\nNumimastik = uang logam kuno\nPaleontologi = makhluk purba (fosil)\nPaleantropologi = manusia purba', ''),
(3824, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Pithecantropus Erectus ditemukan olehâ€¦', 8, 'A. Ter Haar', 'B. Von Koenigswald', 'C. Eugene Dubois', 'D. Van Rietschoten', 'E. Oppenoorth', 0, 0, 5, 0, 0, NULL, 'Ter Haar = Homo Soloensis\nVon Koenigswald = Meganthropus Paleojavanicus\nEugene Dubois = Pithecantropus Erectus\nVan Rietschoten = Homo Wajakensis\nOppenoorth = Homo Soloensis', ''),
(3825, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Yang merupakan suku bangsa asli India adalah â€¦', 9, 'A. Arya', 'B. Dravida', 'C. Sakia', 'D. Mongol', 'E. Benggala', 0, 5, 0, 0, 0, NULL, 'Bangsa Dravida merupakan bangsa India Asli, memiliki ciri berbadan pendek dan gempal, hidung pesek, rambut keriting, serta berkulit Gelap.', ''),
(3826, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Syarif Hidayatullah merupakan nama asli dari ...', 10, 'A. Sunan Muria', 'B. Sunan Kalijaga', 'C. Sunan Gunung Jati', 'D. Sunan Giri', 'E. Sunan Gresik', 0, 0, 5, 0, 0, NULL, 'Syarif Hidayatullah atau Sunan Gunung Jati merupakan salah seorang dari Walisongo', ''),
(3827, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Berikut ini yang bukan merupakan prasasti peninggalan dari Kerajaan Sriwijaya adalah â€¦', 11, 'A. Prasasti Karang Berahi', 'B. Prasasti Talang Tuo', 'C. Prasasti Kota Kapur', 'D. Prasasti Kebun Kopi', 'E. Prasasti Telaga Batu', 0, 0, 0, 5, 0, NULL, 'Prasasti Kebun Kopi merupakan prasasti peninggalan Kerajaan Tarumanegara', ''),
(3828, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Tokoh yang melahirkan konsep Trias Politika adalah ...', 12, 'A. Montesquieu', 'B. J.J Rosseau', 'C. Voltaire', 'D. Aristoteles', 'E. Immanuel Kant', 5, 0, 0, 0, 0, NULL, '\nTrias Politika yang diungkapkan Montesquieu yakni Eksekutif, Yudikatif, dan Legislative', ''),
(3829, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Konferensi Asia Afrika diselenggarakan di Bandung pada tanggal 18-24 April 1955. Berikut ini tokoh pencetus KAA, kecuali â€¦', 13, 'A. Adam Malik', 'B. Jawaharal Nehru', 'C. Sir John Kotelawala', 'D. U Nu', 'E. Moh. Ali', 5, 0, 0, 0, 0, NULL, 'Pencetus KAA :\n- Indonesia (Alisastro Amijoyo),\n- Burma ( U Nu),\n- Paskitan ( Moh. Ali ),\n- India (Jawaharal Nehru),\n- Sri Lanka ( Sir John Kotelawala)', ''),
(3830, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Sebelum KAA dilaksanakan pada tahun 1955, konferensi tersebut didahului dengan adanya konferensi yang diselenggarakan di Kota Bogor. Konferensi Bogor tersebut dilaksanakan pada tanggal ...', 14, 'A. 18-24 April 1955', 'B. 28-29 Desember 1954', 'C. 28 April-2 Mei 1954', 'D. 28 Maret-2 April 1954', 'E. 18-24 April 1954', 0, 5, 0, 0, 0, NULL, 'Konferensi Bogor atau Konferensi Pancanegara II merupakan konferensi pendahuluan sebelum KAA dilaksanakan. Konferensi Bogor dilaksanakan tanggal 28-29 Desember 1954', ''),
(3831, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Rancangan lambang negara Indonesia yang ditolak untuk disahkan merupakan usulan dari ... ', 15, 'A. Moh. Hatta', 'B. Ahmad Soebarjo', 'C. Moh. Yamin', 'D. A.A. Maramis', 'E. Ir. Soekarno', 0, 0, 5, 0, 0, NULL, 'Rancangan yang diusulkan Moh. Yamin ditolak karena mengandung unsur-unsur matahari. Hal tersebut dianggap melambangkan Jepang', ''),
(3832, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Dalam UUD 1945 disebutkan bahwa Negara menghormati dan memelihara bahasa daerah sebagai kekayaan budaya nasional. Hal tersebut dinyatakan dalam Pasal â€¦', 16, 'A. Pasal 31 ayat (1)', 'B. Pasal 32 ayat (1)', 'C. Pasal 31 ayat (2)', 'D. Pasal 32 ayat (2)', 'E. Pasal 29 ayat (1)', 0, 0, 0, 5, 0, NULL, 'Menurut UUD 1945 Pasal 32 yaitu : (1) Negara memajukan kebudayaan nasional Indonesia di tengah peradaban dunia dengan menjamin kebebasan masyarakat dalam memelihara dan mengembangkan nilai-nilai budayanya. (2) Negara menghormati dan memelihara bahasa daerah sebagai kekayaan budaya nasional.', ''),
(3833, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Berikut ini pasal dalam UUD 1945 yang tidak pernah mengalami amandemen â€¦', 17, 'A. Pasal 29', 'B. Pasal 30', 'C. Pasal 31', 'D. Pasal 32', 'E. Pasal 33', 5, 0, 0, 0, 0, NULL, 'Pasal-pasal yang tidak mengalami amandemen adalah Pasal 4, 10, 12, 29, dan 35', ''),
(3834, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'MPR paling lambat dibentuk pada tanggal â€¦', 18, 'A. 17 Agustus 2000', 'B. 17 Agustus 2001', 'C. 17 Agustus 2002', 'D. 17 Agustus 2003', 'E. 17 Agustus 2004', 0, 0, 0, 5, 0, NULL, 'Sesuai dengan aturan peralihan pasal III', ''),
(3835, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Fakir miskin dan anak-anak terlantar dipelihara oleh â€¦', 19, 'A. Pemerintah', 'B. Presiden', 'C. Negara', 'D. DPR', 'E. Pemerintah Daerah', 0, 0, 5, 0, 0, NULL, 'Sesuai Pasal 34 ayat (1) UUD 1945', ''),
(3836, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Calon Hakim Agung diusulkan oleh ... ', 20, 'A. MA', 'B. MK', 'C. MPR', 'D. DPR', 'E. KY', 0, 0, 0, 0, 5, NULL, 'Pasal 24A ayat (3) UUD 1945 amandemen ketiga: Calon hakim agung diusulkan Komisi Yudisial kepada Dewan Perwakilan Rakyat untuk mendapatkan persetujuan dan selanjutnya ditetapkan sebagai hakim agung oleh Presiden.', ''),
(3837, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Belanda mendirikan kongsi dagang yang bernama <i>Vereenigde Oost-Indische Compagnie</i> (VOC) pada tanggalâ€¦ ', 21, 'A. 12 Maret 1596', 'B. 12 April 1596', 'C. 12 Mei 1596', 'D. 20 Maret 1602', 'E. 20 Mei 1602', 0, 0, 0, 5, 0, NULL, 'Kongsi Dagang atau Perusahaan Hindia Timur Belanda atau VOC didirikan pada 20 Maret 1602', ''),
(3838, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Sebelum munculnya Daendels, para petinggi VOC menjalankan kebijakan yang merugikan bangsa Indonesia seperti berikut, kecualiâ€¦ ', 22, 'A. sistem tanam paksa (cultuurstelsel)', 'B. wajib kerja (verplichte diensten)', 'C. penyerahan paksa hasil bumi (verplichte leveranties)', 'D. penarikan pajak hasil bumi (contingenten)', 'E. kerja paksa (rodi)', 5, 0, 0, 0, 0, NULL, 'sistem tanam paksa (cultuurstelsel) dilakukan pada masa kepemimpinan Johanes van den Bosch sebagai Gubernur Jenderal Hindia-Belanda. Ia menjalankankan tugas setelah kepemimpinan Daendels dan Thomas Stamford Raffles', ''),
(3839, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Yang merupakan pencetus Sumpah Pemuda adalahâ€¦ ', 23, 'A. Perhimpunan Indonesia Nederland, Partai Nasional Indonesia, dan PPPI', 'B. Perhimpunan Indonesia Nederland, Partai Nasional Indonesia, dan Pemuda Indonesia', 'C. Partai Nasional Indonesia, Pemuda Indonesia, Partai Indonesia Raya', 'D. Partai Nasional Indonesia, Pemuda Indonesia, dan Gabungan Politik Indonesia', 'E. Perhimpunan Indonesia Nederland, Partai Indonesia Raya, dan Pemuda Indonesia', 0, 5, 0, 0, 0, NULL, 'Pencetus Sumpah Pemuda adalah Perhimpunan Indonesia Nederland, Partai Nasional Indonesia, dan Pemuda Indonesia. Peristiwa ini dihadiri oleh organisasi PPPI, Jong Java, Jong Islamiten Bond, Jong Sumatranen Bond, Pemuda Indonesia, Jong Celebes, Jong Ambon, Jong Batak, dan Pemuda Kaum Betawi.', '');
INSERT INTO `data_jawaban` (`id`, `kode_soal`, `jenis_soal`, `soal`, `nomor`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`, `pilihan_e`, `nilai_a`, `nilai_b`, `nilai_c`, `nilai_d`, `nilai_e`, `gambar`, `pembahasan`, `video`) VALUES
(3840, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Pembebasan Irian Barat pada masa demokrasi liberal dilakukan melalui jalur diplomasi dan jalur konfrontasi. Jalur diplomasi pembebasan Irian Barat dilakukan sejak kabinetâ€¦', 24, 'A. Kabinet Natsir', 'B. Kabiner Sukiman-Suwiryo', 'C. Kabinet Wilopo', 'D. Kabinet Ali Sastroamidjojo I', 'E. Kabinet Burhanuddin Harahap', 5, 0, 0, 0, 0, NULL, '\nJalur diplomasi pembebasan Irian Barat dilakukan sejak Kabinet Natsir (6 Oktober 1950 s.d. 21 Maret 1951). Berbagai perundingan bilateral dilakukan, namun masih belum berhasil.', ''),
(3841, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Hari Infranteri merupakan hari peringatan terjadinya peristiwa Ambarawa. Peristiwa ini adalah perlawanan TKR yang dipimpin oleh Kolonel Sudirman melawan tentara sekutu di Ambarawa. Peristiwa ini terjadi pada tanggalâ€¦ ', 25, 'A. 23 Maret 1945', 'B. 10 Desember 1945', 'C. 15 Desember 1945', 'D. 7 Desember 1946', 'E. 21 Juli 1947', 0, 0, 5, 0, 0, NULL, '\n23 Maret 1945 peristiwa Bandung Lautan Api,\n10 Desember 1945 peristiwa Medan Area,\n7 Desember 1946 peristiwa Westerling,\n21 Juli 1947 peristiwa Agresi Militer I', ''),
(3842, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Sejak Jepang kalah dari pihak sekutu dalam pertempuran di Laut Karang pada 7 Mei 1942, Jepang berupaya menarik simpati bangsa Indonesia. Jepang juga memanfaatkan para pemuda Indonesia dengan membentuk organisasi semi militer, yaituâ€¦ ', 26, 'A. Peta, Heiho, Seinendan, Fujinkai', 'B. Kaigun, Seinendan, Fujinkai, Keibodan', 'C. Fujinkai, Keibodan, Kaigun, Rikugun', 'D. Peta, Kaigun, Keibodan, Fujinkai', 'E. Seinendan, Fujinkai, Keibodan, Syusintai', 0, 0, 0, 0, 5, NULL, '\nOrganisasi semi militer yang dibentuk Jepang adalah Seinendan (barisan pemuda), Fujinkai (barisan wanita), Keibodan (barisan pembantu polisi), dan Syusintai (barisan pelopor). Selain itu, Jepang membentuk organisasi militer yakni Peta (pembela tanah air) dan Heiho (barisan pembantu prajurit Jepang). Sedangkan Kaigun adalah sebutan untuk angkatan laut dan Rikugun adalah sebutan untuk angkatan darat.', ''),
(3843, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Perang Paderi adalah perang melawan kolonial pada tahun 1821 s.d. 1837 di Minangkabau yang dipimpin olehâ€¦ ', 27, 'A. Pangeran Diponegoro', 'B. Tuanku Imam Bonjol', 'C. Teuku Umar', 'D. Pattimura', 'E. Sultan Ageng Tirtayasa', 0, 5, 0, 0, 0, NULL, 'Perang Paderi yang terjadi di Sumatera Barat berlangsung antara tahun 1803 hingga 1838 dipimpin oleh Tuanku Imam Bonjol', ''),
(3844, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Dewan Perwakilan Daerah (DPD) merupakan lembaga perwakilan daerah yang anggotanya merupakan wakil-wakli daerah provinsi yang dipilih melalui pemilihan umum. Anggota Dewan Perwakilan Daerah (DPD) dari setiap provinsi sebanyak â€¦ orang. ', 28, 'A. empat orang', 'B. lima orang', 'C. enam orang', 'D. tujuh orang', 'E. delapan orang', 5, 0, 0, 0, 0, NULL, ' Anggota DPD dari setiap provinsi adalah 4 orang. Dengan demikian jumlah anggota DPD saat ini adalah seharusnya 136 orang. Masa jabatan anggota DPD adalah 5 tahun, dan berakhir bersamaan pada saat anggota DPD yang baru mengucapkan sumpah/janji.', ''),
(3845, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'MPR dapat memilih presiden dan wakil presiden apabila keduanya berhalangan tetap secara bersamaan dalam masa jabatannya selambat-lambatnya dalam waktu â€¦ hari.', 29, 'A.15 hari', 'B. 20 hari', 'C. 25 hari', 'D. 30 hari', 'E. 60 hari', 0, 0, 0, 5, 0, NULL, 'Sesuai dengan UUD 1945 Pasal 8 ayat (3), yaitu Jika Presiden dan Wakil Presiden mangkat, berhenti, diberhentikan, atau tidak dapat melakukan\nkewajibannya dalam masa jabatannya secara bersamaan, pelaksanaan tugas Kepresidenan adalah\nMenteri Luar Negeri, Menteri Dalam Negeri dan Menteri Pertahanan secara bersama-sama. Selambat-lambatnya tiga puluh hari setelah itu, Majelis Permusyawaratan Rakyat menyelenggarakan sidang untuk memilih Presiden dan Wakil Presiden dari dua pasangan calon Presiden dan wakil Presiden\nyang diusulkan oleh partai politik atau gabungan partai politik yang pasangan calon Presiden dan\nWakil Presidennya meraih suara terbanyak pertama dan kedua dalam pemilihan umum sebelumnya,\nsampai berakhir masa jabatannya.****)', ''),
(3846, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'DPR memiliki 11 komisi. Komisi XI memiliki ruang lingkup tugasâ€¦', 30, 'A. membidangi pertahanan, intelijen, luar negeri, dan komunikasi & informasi', 'B. membidangi pemerintahan dalam negeri, otonomi daerah, aparatur negara, dan agraria', 'C. membidangi energi, sumber daya mineral, riset dan teknologi, dan lingkungan', 'D. membidangi agama, sosial, dan pemberdayaan perempuan', 'E. membidangi keuangan, perencanaan pembangunan nasional, perbankan, dan lembaga keuangan bukan bank', 0, 0, 0, 0, 5, NULL, 'Komisi I = membidangi pertahanan, intelijen, luar negeri, dan komunikasi & informasi\nKomisi II = membidangi pemerintahan dalam negeri, otonomi daerah, pemilu, aparatur negara, dan agraria\nKomisi VII = membidangi energi, sumber daya mineral, riset dan teknologi, dan lingkungan\nKomisi VIII = membidangi agama, sosial, dan pemberdayaan perempuan\nKomisi XI = membidangi keuangan, perencanaan pembangunan nasional, perbankan, dan lembaga keuangan bukan bank', ''),
(3847, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Siapakah Tokoh Pendiri ASEAN yang berasal dari Singapura? ', 31, 'A. Adam Malik', 'B. Tun Abdul Razak', 'C. Thanat Koman', 'D. Narciso Ramos', 'E. S. Rajaratnam', 0, 0, 0, 0, 5, NULL, '\nAdam Malik berasal dari Indonesia\nTun Abdul Razak berasal dari Malaysia\nThanat Koman berasal dari Thailand\nNarciso Ramos berasal dari Filipina\nS. Rajaratnam berasal dari Singapura', ''),
(3848, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Revolusi Industri bermula di Inggris dan terjadi antara tahun 1750-1850. Faktor-faktor yang menyebabkan terjadinya Revolusi Industri adalah sebagai berikut, kecuali..... ', 32, 'A. Situasi politik yang stabil. Adanya Revolusi Glorius/Agung tahun 1688 yang mengharuskan Raja bersumpah setia kepada Bill of Right sehingga raja tunduk tunduk kepada undang-undang dan hanya menarik pajak berdasarkan atas persetujuan parlemen', 'B. Adanya penemuan baru di bidang teknologi yang dapat mempermudah cara kerja dan meningkatkan hasil produksi, misalnya alat-alat pemintal, mesin tenun, mesin uap, dan sebagainya', 'C. Munculnya pemahaman baru, yaitu memperjuangkan kebebasan dan pemenuhan hak-hak asasi manusia', 'D. Pemerintah memberikan perlindungan hukum terhadap hasil-hasil penemuan baru (hak paten) sehingga mendorong kegiatan penelitian ilmiah', 'E. Kemakmuran Inggris akibat majunya pelayaran dan perdagangan sehingga dapat menyediakan modal yang besar untuk bidang usaha', 0, 0, 5, 0, 0, NULL, 'Revolusi Industri untuk kali pertamanya muncul di Inggris. Adapun faktor-faktor yang menyebabkannya adalah sebagai berikut:\n\n1. Situasi politik yang stabil. Adanya Revolusi Agung tahun 1688 yang mengharuskan raja bersumpah setia kepada Bill of Right sehingga raja tunduk kepada undang-undang dan hanya menarik pajak berdasarkan atas persejutuan parlemen.\n2. Inggris kaya bahan tambang, seperti batu bara, biji besi, timah, dan kaolin. Di samping itu, wol juga yang sangat menunjang industri tekstil.\n3. Adanya penemuan baru di bidang teknologi yang dapat mempermudah cara kerja dan meningkatkan hasil produksi, misalnya alat-alat pemintal, mesin tenun, mesin uap, dan sebagainya.\n4. Kemakmuran Inggris akibat majunya pelayaran dan perdagangan sehingga dapat menyediakan modal yang besar untuk bidang usaha. Di samping itu, di Inggris juga tersedia bahan mentah yang cukup karena Inggris mempunyai banyak daerah jajahan yang menghasilkan bahan mentah tersebut.\n5. Pemerintah memberikan perlindungan hukum terhadap hasil-hasil penemuan baru (hak paten) sehingga mendorong kegiatan penelitian ilmiah. Lebih-lebih setelah dibentuknya lembaga ilmiah Royal Society for Improving Natural Knowledge maka perkembangan teknologi dan industri bertambah maju.\n6. Arus urbanisasi yang besar akibat Revolusi Agraria di pedesaan mendorong pemerintah Inggris untuk membuka industri yang lebih banyak agar dapat menampung mereka.\n', ''),
(3849, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Berdasarkan sensus BPS tahun 2010, jumlah suku bangsa di Indonesia berjumlah..... ', 33, 'A. 1340', 'B. 1328', 'C. 1350', 'D. 1335', 'E. 1300', 5, 0, 0, 0, 0, NULL, '\nTerdapat lebih dari 300 kelompok etnik atau suku bangsa di Indonesia atau tepatnya 1.340 suku bangsa menurut sensus BPS tahun 2010.', ''),
(3850, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Senjata tradisional yang dipakai oleh pejuang Aceh untuk melawan penjajah adalah..... ', 34, 'A. Keris', 'B. Pisau Belati', 'C. Bambu Runcing', 'D. Rencong', 'E. Panah', 0, 0, 0, 5, 0, NULL, '\nRencong dipakai oleh para pejuang Aceh dalam melawan penjajahan bangsa asing dulu, tidak hanya pejuang saja yang memakai rencong tapi juga raja-raja dan kaum bangsawan di Aceh', ''),
(3851, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Gunung yang terletak di perbatasan antara Jawa Tengah dan Jawa Timur adalah.....', 35, 'A. Gunung Semeru', 'B. Gunung Lawu', 'C. Gunung Slamet', 'D. Gunung Merapi', 'E. Gunung Kerinci', 0, 5, 0, 0, 0, NULL, '\nGunung Lawu terletak di Kabupaten Karanganyar, Jawa Tengah dan Kabupaten Magetan, Jawa Timur', ''),
(3852, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Agitator = ....', 36, 'A. Motivator', 'B. Penghasut', 'C. Pendukung', 'D. Pencetus', 'E. Orator', 0, 5, 0, 0, 0, NULL, 'Agitator adalah penghasut (KBBI)', ''),
(3853, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Pemugaran = ....', 37, 'A. Pengusiran', 'B. Penghancuran', 'C. Perbaikan', 'D. Pembaharuan', 'E. Pembongkaran', 0, 0, 0, 5, 0, NULL, 'Pemugaran adalah pembaharuan kembali (KBBI)', ''),
(3854, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Somasi = ....', 38, 'A. Isolasi', 'B. Revisi', 'C. Siomay', 'D. Teguran untu membayar', 'E. Usulan pembayaran', 0, 0, 0, 5, 0, NULL, 'Somasi adalah teguran untuk membayar (KBBI)', ''),
(3855, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Bergaul =', 39, 'A.Berteman', 'B. Bermain', 'C. Berkelakar', 'D. Bercanda', 'E. Berdendang', 5, 0, 0, 0, 0, NULL, 'Bergaul adalah berteman, bersahabat (KBBI)', ''),
(3856, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Mandiri >< â€¦..', 40, 'A. Swasembada', 'B. Mengikuti', 'C. Bergantung', 'D. Roboh', 'E. Berdikari', 0, 0, 5, 0, 0, NULL, 'Mandiri adalah dalam keadaan dapat berdiri sendiri, tidak bergantung pada orang lain.', ''),
(3857, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Ekuivalen >< â€¦...', 41, 'A. Berlawanan', 'B. Sama', 'C. Seimbang', 'D. Sepadan ', 'E. Setingkat', 5, 0, 0, 0, 0, NULL, 'Ekuivalen adalah mempunyai nilai (ukuran, arti, atau efek) yang sama; seharga; sebanding; sepadan.', ''),
(3858, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Sapi : Rumput = ..... ', 42, 'A. Kambing : Gulai', 'B. Badak : Cula', 'C. Kerbau : Tanduk', 'D. Pagar : Tanaman', 'E. Manusia : Nasi', 0, 0, 0, 0, 5, NULL, 'Sapi memakan Rumput; Manusia memakan Nasi', ''),
(3859, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'KAKAKTUA : MERPATI = â€¦ : â€¦ ', 43, 'A. Gajah : Semut', 'B. Elang : Kupu-Kupu', 'C. Gurame : Kakap', 'D. Anjing : Herder', 'E. Singa : Naga', 0, 0, 5, 0, 0, NULL, 'Hubungan antara kedua hewan yang satu jenis yaitu sama-sama burung dan sama-sama ikan', ''),
(3860, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'AIR : ES = UAP : â€¦ ', 44, 'A. Air', 'B. Udara', 'C. Basah', 'D. Mendidih', 'E. Awan', 5, 0, 0, 0, 0, NULL, 'Jika air didinginkan menjadi es, maka jika uap didinginkan menjadi butir-butir air ', ''),
(3861, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Kalimat di bawah ini yang mengandung kata tidak bakuâ€¦. ', 45, 'A. Dia memiliki karier yang cukup bagus.', 'B. Hani bekerja di sebuah apotek ternama.', 'C. Hari ini adalah jadual kelas kami untuk bertanding.', 'D. Pekerjaannya adalah menganalisis laporan keuangan satuan kerja.', 'E. Dia membawa kuitansinya pulang ke rumah.', 0, 0, 5, 0, 0, NULL, 'Kata baku dari JADUAL adalah JADWAL', ''),
(3862, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'X, U, Q, â€¦ ', 46, 'A. I', 'B. J', 'C. K', 'D. L', 'E. M', 0, 0, 0, 5, 0, NULL, 'Deret dengan beda 3 dan 4 maka berikutnya 5. Sehingga, 5 huruf sebelum Q yaitu L', ''),
(3863, 'TryoutUSMSTAN-0828124647', 'Soal 1', '3 , 3 , 6 , 9 , 15 , 24 , â€¦.', 47, 'A. 39', 'B. 40', 'C. 41', 'D. 42', 'E. 43', 5, 0, 0, 0, 0, NULL, 'Deret tersebut memiliki pola yaitu penjumlahan dari 2 bilangan sebelumnya.\nKita lihat mulai bilangan ketiga:\n6 = 3+3\n9 = 6+3\n15 = 9+6\n24 = 15+9\nJadi, bilangan selanjutnya adalah 24+15 = 39', ''),
(3864, 'TryoutUSMSTAN-0828124647', 'Soal 1', '1 , 11 , 3 , 7 , 5 , 5 , ... , â€¦', 48, 'A. 7 , 5', 'B. 7 , 3', 'C. 3 , 7', 'D. 5 , 7', 'E. 4 , 5', 0, 5, 0, 0, 0, NULL, 'Deret tersebut terdiri dari dua bagian.\nDeret pertama: 1, 3, 5 (beda dua) jadi angka selanjutnya adalah 7.\nDeret kedua: 11, 7, 5 (merupakan bilangan prima) jadi angka selanjutnya adalah 3.', ''),
(3865, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'A â€“ S â€“ D â€“ P â€“ G - ... - ... ', 49, 'A. K - L', 'B. N - M', 'C. M - J ', 'D. O - P', 'E. L â€“ Z', 0, 0, 5, 0, 0, NULL, 'Deret huruf tersebut memiliki pola jarak 3 huruf.\nDeret pertama: A, D, G, berjarak 3 huruf dari huruf sebelumnya, maka huruf selanjutnya adalah J.\nDeret kedua: S, P, berjarak 3 huruf dari huruf sebelumnya, namun urutannya mundur, jadi huruf selanjutnya adalah M.', ''),
(3866, 'TryoutUSMSTAN-0828124647', 'Soal 1', '16Â² - 15Â² = â€¦', 50, 'A. 30', 'B. 31', 'C. 32', 'D. 33', 'E. 34', 0, 5, 0, 0, 0, NULL, 'TRIK CEPAT: \nTidak perlu untuk mencari kuadratnya terlebih dahulu.\nGunakan rumus ini:\nAÂ² - BÂ² = (A+B)(A-B)\njadi,\n16Â² - 15Â² = (16+15)(16-15) = 31 x 1 = 31', ''),
(3867, 'TryoutUSMSTAN-0828124647', 'Soal 1', '37 x 36 + 35 x 34 = â€¦.', 51, 'A. 2679', 'B. 2695', 'C. 2522', 'D. 3176', 'E. 3075', 0, 0, 5, 0, 0, NULL, 'TRIK CEPAT:\nDihitung satuan nya saja\n(7 x 6) + (5 x 4) = 42 + 20 = 62\nCari satuannya yang memiliki angka 2', ''),
(3868, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'âˆš(1-0,36) - âˆš(1-0,64) = â€¦.', 52, 'A. 0.30', 'B. 0.60', 'C. 0.35', 'D. 0.20', 'E. 0.25', 0, 0, 0, 5, 0, NULL, 'âˆš(1-0,36) - âˆš(1-0,64) =  0,8 - 0,6 = 0,2\n', ''),
(3869, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Pak Badrun mempunyai sebidang tanah, 1/4 bagian dari luas tanahnya dibuat kolam ikan, 2/5 bagian ditanami rumput dan sisanya 210 mÂ², maka luas kolam ikan adalah â€¦ ', 53, 'A. 160 mÂ²', 'B. 170 mÂ²', 'C. 155 mÂ²', 'D. 150 mÂ²', 'E. 172 mÂ²', 0, 0, 0, 5, 0, NULL, 'Luas tanah sisa = 1 - 1/4x - 2/5x\n\n210 = 1 - 1/4x - 2/5x\n\n210 = 7/20 x\n\nx = 600 mÂ² => luas tanah\n\nluas kolam ikan = 1/4 x 600 = 150 mÂ²', ''),
(3870, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Adis membeli baju dengan harga diskon 15% dari Rp80.000,00. Karena ia sedang berulang tahun, ia mendapat diskon tambahan sebesar 25% dari harga awal setelah dikurangi diskon 15% di awal. Berapakah harga yang harus dibayarkan Adis kepada kasir? ', 54, 'A. Rp60,000.00', 'B. Rp55,000.00', 'C. Rp51,000.00', 'D. Rp63,000.00', 'E. Rp73,000.00', 0, 0, 5, 0, 0, NULL, '\n1) 80.000 - (15% x 80.000) = 68.000\n2) 68.000 - (25% x 68.000) = 51.000', ''),
(3871, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Ajeng sedang membuat kerajinan papan catur. Dalam 5 menit, ia mampu mengecat 25% dari papan berwarna putih. Berapa lamakah ia mengecat sampai selesai keseluruhan papan catur?', 55, 'A. 50 menit', 'B. 30 menit', 'C. 20 menit', 'D. 60 menit', 'E. 40 menit', 0, 0, 0, 0, 5, NULL, '\nPapan warna putih\n25% = 5 menit\nx4\n100% = 20 menit\nagar bisa 100% selesai maka dikali 4, jadi waktu yang dibutuhkan untuk mengecat papan warna putih 100% adalah 20 menit.\n\nJumlah warna putih dan warna hitam pada papan catur adalah sama, jadi tinggal dikali 2.\n20 menit x 2 = 40 menit.', ''),
(3872, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Volume ember jika penuh adalah 42,5 liter. Namun, saat ini hanya terisi 3/5 saja dan itu pun masih diambil lagi oleh Adrian, sehingga kini hanya terisi 1/5 saja. Berapa literkah yang diambil oleh Adrian?', 56, 'A. 17 liter', 'B. 8,5 liter', 'C. 17,5 liter ', 'D. 8 liter', 'E. 34 liter', 5, 0, 0, 0, 0, NULL, '\n(3/5 - 1/5) x 42,5 = 17', ''),
(3873, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Peluang muncul mata dadu berangka prima dalam satu kali pelemparan sebuah dadu adalah â€¦', 57, 'A. 1/6', 'B. 2/6', 'C. 1/2', 'D. 2/3', 'E. 5/6', 0, 0, 5, 0, 0, NULL, 'bilangan prima dalam sebuah dadu 2 , 3 , 5 --> 3\nruang sampel sebuah dadu 1 , 2 , 3 , 4 , 5 , 6 --> 6\n\nJadi, peluangnya adalah 3/6 = 1/2', ''),
(3874, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Nilai Y pada bilangan berpangkat di bawah ini adalah â€¦\n\n3Â²x3Â²x3Â²x3Â²x3Â² = 3y', 58, 'A. 8', 'B. 9', 'C. 10', 'D. 11', 'E. 12', 0, 0, 5, 0, 0, NULL, '32+2+2+2+2 = 310\nJadi Y adalah 10', ''),
(3875, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Kota A dan kota B berjarak 3,5 cm dalam peta yang skalanya 1 : 5000. Berapa jarak sebenarnya?', 59, 'A. 1,55 hm', 'B. 1,65 hm', 'C. 1,75 hm', 'D. 1,85 hm', 'E. 1,95 hm', 0, 0, 5, 0, 0, NULL, '3,5 x 5.000 cm = 17.500 cm\n1 hm = 10.000 cm', ''),
(3876, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Teks  untuk soal nomor 63-65\n\nDalam sebuah pertemuan Fadjri, Antad, Bian, James, Oris dan Gafrio duduk di meja bulat dengan urutan sebagai berikut:\n\nFadjri selalu berada di antara Gafrio dan Oris.\n\nGafrio tidak mau bersebelahan dengan Bian maupun Oris Antad berada di sebelah James dan Bian.\n\n63. Siapakah yang berada di sebelah James? ', 60, 'A. Gafrio dan Fadjri', 'B. Antad dan Gafrio', 'C. Bian dan Oris', 'D. Fadjri dan Antad', 'E.  Bian dan Fadjri', 0, 5, 0, 0, 0, NULL, 'Urutan tempat duduk:\nFadjri - Oris - Bian - Antad - James â€“ Gafrio\n', ''),
(3877, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Dalam sebuah pertemuan Fadjri, Antad, Bian, James, Oris dan Gafrio duduk di meja bulat dengan urutan sebagai berikut:\n\nFadjri selalu berada di antara Gafrio dan Oris.\n\nGafrio tidak mau bersebelahan dengan Bian maupun Oris Antad berada di sebelah James dan Bian.\n\n64. Urutan mereka duduk yang paling benar adalah â€¦', 61, 'A. Fadjri, Gafrio, Bian, Antad, James, Oris', 'B. Oris, Fadjri, Bian, Antad, James, Gafrio', 'C. Fadjri, Oris, Bian, Antad, James, Gafrio', 'D. James, Antad, Bian, Gafrio, Fadjri, Oris', 'James, Fadjri, Bian, Gafrio, Antad, Oris', 0, 0, 5, 0, 0, NULL, 'Urutan tempat duduk:\nFadjri - Oris - Bian - Antad - James â€“ Gafrio', ''),
(3878, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Dalam sebuah pertemuan Fadjri, Antad, Bian, James, Oris dan Gafrio duduk di meja bulat dengan urutan sebagai berikut:\n\nFadjri selalu berada di antara Gafrio dan Oris.\n\nGafrio tidak mau bersebelahan dengan Bian maupun Oris Antad berada di sebelah James dan Bian.\n\n65. Siapakah yang berada di sebelah Fadjri dan Bian? ', 62, 'A. Antad', 'B. Oris', 'C. Gafrio', 'D. James', 'E.  Bian', 0, 5, 0, 0, 0, NULL, 'Urutan tempat duduk:\nFadjri - Oris - Bian - Antad - James â€“ Gafrio', ''),
(3879, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Saya diterima kuliah di salah satu perguruan tinggi negeri sesuai dengan harapan saya. Namun kondisi keuangan saya saat ini tidak mendukung untuk saya melanjutkan kuliah. Saya akan â€¦', 63, 'A. mengundurkan diri dan membatalkan untuk kuliah', 'B. mencari beasiswa dari negara atau lembaga lainnya', 'C. mencari pinjaman uang untuk biaya kuliah', 'D. tetap melanjutkan kuliah, sambil mencari pekerjaan untuk membiayai kuliah', 'E.  menunda kuliah sampai memiliki dana yang cukup', 1, 4, 2, 5, 3, NULL, 'A = 1\nB = 4\nC = 2\nD = 5\nE = 3', ''),
(3880, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Dalam rangka memperingati hari pelanggan, tempat anda bekerja berencana memberikan reward pada pelanggan. Konsep yang akan anda berikan sebagai tim kreatif adalah â€¦', 64, 'A. memberikan souvenir tanda terima kasih pada setiap pengunjung', 'B. buy one get one free untuk produk tertentu', 'C. potongan diskon 50% untuk produk tertentu', 'D. memberikan voucher untuk pembelanjaan berikutnya', 'E. memberi potongan tertentu dengan syarat dan ketentuan berlaku', 5, 4, 3, 1, 2, NULL, 'A = 5\nB = 4\nC = 3\nD = 1\nE = 2', ''),
(3881, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Terdapat pelanggan terlibat pertengkaran dengan pelanggan lain. Melihat hal tersebut anda akan â€¦', 65, 'A. mengusir mereka', 'B. meminta satpam melerai', 'C. melaporkan pada pihak berwajib', 'D. mengejak menyelesaikan masalah di ruang tertentu', 'E.  meminta ganti rugi karena telah membuat kegaduhan', 1, 4, 3, 5, 2, NULL, 'A = 1\nB = 4\nC = 3\nD = 5\nE = 2', ''),
(3882, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Teman saya melakukan tindakan yang sangat tidak saya sukai. Saya akan melakukan â€¦', 66, 'A. membiarkannya saja sampai ia berubah sendiri', 'B. memberitahukan tindakannya tersebut kepada teman yang lain', 'C. membicarakannya baik-baik dan menjelaskan bahwa saya tidak suka dengan tindakannya', 'D. menegur dan memarahinya agar dia tidak mengulanginya', 'E.  memutuskan pertemanan dengannya', 3, 2, 5, 4, 1, NULL, 'A = 3\nB = 2\nC = 5\nD = 4\nE = 1', ''),
(3883, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Masa kontrak kerja anda sudah habis, maka anda akan â€¦', 67, 'A. malas-malasan', 'B. bekerja seperti biasa', 'C. bekerja dengan lebih giat agar meninggalkan kesan yang baik', 'D. bekerja dengan giat agar dilirik atasan', 'E.  bekerja semampunya', 1, 4, 5, 2, 3, NULL, 'A = 1\nB = 4\nC = 5\nD = 2\nE = 3', ''),
(3884, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Suatu ketika anda menyapa teman anda, tetapi ternyataanda salah orang, maka anda akan â€¦', 68, 'A. pura-pura tidak terjadi apapun', 'B. meminta maaf sembari berlalu', 'C. meminta maaf dan sedikit basa-basi', 'D. malu dan mood rusak seharian', 'E.  biasa aja', 4, 2, 3, 1, 5, NULL, 'A = 4\nB = 2\nC = 3\nD = 1\nE = 5', ''),
(3885, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Dalam menghadapi suatu masalah biasanya saya akan â€¦', 69, 'A. tidak semangat dalam bekerja', 'B. merenung dan introspeksi diri', 'C. stres dan mudah marah', 'D. mencari hiburan untuk menenangkan diri', 'E.  mengomunikasikan masalah saya dengan teman dekat', 2, 5, 1, 3, 4, NULL, 'A = 2\nB = 5\nC = 1\nD = 3\nE = 4', ''),
(3886, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Saat sedang dikejar deadline tugas yang penting, datang seorang tamu yang meminta informasi suatu tempat di kantor keada saya, sikap saya adalah â€¦', 70, 'A. mengantarkan tamu tersebut sampai ke tujuannya', 'B. menelepon tempat tujuan tamu, dan memintanya menjemput tamu tersebut di ruangan saya', 'C. memberi petunjuk arah ke tempat tujuan tamu tersebut dan kemudian melanjutkan pekerjaan', 'D. mengacuhkannya sampai tamu tersebut dengan sendirinya keluar dari ruangan saya', 'E.  tetap fokus pada pekerjaan saya, dan meminta orang lain untuk mengantarkan tamu tersebut ke tempat tujuan', 5, 3, 4, 1, 2, NULL, 'A = 5\nB = 3\nC = 4\nD = 1\nE = 2', ''),
(3887, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Saya menjadi sasaran kemarahan atasan atas kesalahan yang dilakukan oleh rekan setim saya. Yang saya lakukan adalah â€¦', 71, 'A. menganggap itu sebagai pelajaran buat saya agar lebih berhati-hati dalam bekerja', 'B. menjelaskan pada atasan bahwa itu bukan karena kesalahan saya', 'C. menerima kemarahan atasan meskipun itu bukan kesalahan saya', 'D. tidak terima dan mengadukan teman yang membuat masalah tersebut', 'E.  menegur teman saya dan memintanya menjelaskan masalah yang sebenarnya kepada atasan', 5, 4, 1, 2, 3, NULL, 'A = 5\nB = 4\nC = 1\nD = 2\nE = 3', ''),
(3888, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Anda sedang berada dalam kendaraan umum yang penuh sesak dengan penumpang, anda juga sedang terburu-buru karena ada tugas yang harus segera diselesaikan, namun sopir masih berhenti dan menunggupenumpang lain, sikap anda adalah â€¦', 72, 'A. marah pada sopir', 'B. menggerutu', 'C. biasa saja', 'D. turun dari kendaraan umum', 'E.  bersabar', 1, 2, 4, 3, 5, NULL, 'A = 1\nB = 2\nC = 4\nD = 3\nE = 5', ''),
(3889, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Kerabat dekat saya menawarkan saya posisi strategis di perusahaannya tanpa harus melewati proses perekrutan, sedangkan saya kebetulan sedang mecari pekerjaan. Maka yang akan saya lakukan adalah â€¦', 73, 'A. Menerima tawaran tersebut karena dia adalah kerabat saya', 'B. Meminta pendapat dari orang tua terlebih dahulu', 'C. Menolaknya karena saya ingin diterima melalui proses resmi', 'D. Mencoba proses resmi terlebih dahulu sebelum menerima tawaran tersebut', 'E. Mempertimbangkan segala sesuatu terlebih dahulu', 1, 3, 5, 2, 4, NULL, 'A = 1\nB = 3\nC = 5\nD = 2\nE = 4', ''),
(3890, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Dalam perjalanan hidup, sifat utama yang harus dimiliki oleh seseorang adalahâ€¦', 74, 'A. Ulet', 'B. Disiplin', 'C. Berani', 'D. Rajin', 'E.  Jujur', 3, 4, 1, 2, 5, NULL, 'A = 3\nB = 4\nC = 1\nD = 2\nE = 5', ''),
(3891, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Rekan kerja saya tidak menyukai kinerja yang saya lakukan, saya menyikapinya denganâ€¦ ', 75, 'A. Meningkatkan kinerja saya untuk kedepannya', 'B. Cuek dan tetap fokus berkerja', 'C. Orang lain boleh menilai saya tapi saya yang tahu kualitas diri saya', 'D. Introspeksi diri', 'E. Mencari tahu siapa yang tidak menyukai kinerja saya', 5, 2, 3, 4, 1, NULL, 'A = 5\nB = 2\nC = 3\nD = 4\nE = 1', ''),
(3892, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Dalam mengikuti suatu kompetisi, saya mengalami kekalahan. Perasaan yang sayaâ€¦', 76, 'A. Biasa saja, menang atau kalah itu biasa saja', 'B. Tetap bersemangat agar memenangkan kompetensi selanjutnya', 'C. Sedih sehingga tidak mau ikut kompetensi lagi', 'D. Kecewa dan tidak terima', 'E.  Malu dan menyesal telah ikut kompetensi', 4, 5, 2, 3, 1, NULL, 'A = 4\nB = 5\nC = 2\nD = 3\nE = 1', ''),
(3893, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Bekerja merupakan upaya meraih kesuksesan, maka upaya saya adalahâ€¦ ', 77, 'A. Bekerja berdasarkan kontrak kerja', 'B. Bekerja sampai larut malam', 'C. Bekerja keras', 'D. Berusaha mengatasi orang yang menghalangi saya', 'E.  Bekerja dengan disiplin dan mengusahakan yang terbaik', 2, 1, 4, 3, 5, NULL, 'A = 2\nB = 1\nC = 4\nD = 3\nE = 5', ''),
(3894, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Ketika saya diminta melakukan pekerjaan berat, sayaâ€¦ ', 78, 'A. Menolaknya', 'B. Mempertimbangkan dulu untuk menerimanya', 'C. Merasa tertantang melaksanakan pekerjaan itu', 'D. Tetap menerimanya meskipun tidak suka dengan pekerjaan itu', 'E.  Menyerahkan pekerjaan tersebut pada orang lain', 2, 3, 5, 4, 1, NULL, 'A = 2\nB = 3\nC = 5\nD = 4\nE = 1', ''),
(3895, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Ketika usulan yang saya ajukan dianggap kurang tepat oleh atasan, maka sikap sayaâ€¦', 79, 'A. Mencoba mencari alternatif usulan lain yang lebih tepat untuk diajukan lagi', 'B. Merasa kecewa tetapi tetap berusaha melupakan penolakan tersebut', 'C. Sangat kecewa', 'D. Bersikeras memberikan alasan dan pembenaran atas usulan tersebut', 'E.  Membiarkan saja', 5, 4, 3, 2, 1, NULL, 'A = 5\nB = 4\nC = 3\nD = 2\nE = 1', ''),
(3896, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Yang akan saya lakukan saat hari pertama ditempatkan di sebuah tempat tugas yang baru adalahâ€¦ ', 80, 'A. Menyapa rekan kerja baru dan bertanya tentang sistem kerja di tempat tersebut', 'B. Mempelajari sistem kerja di tempat tersebut dari peraturan dan data yang ada', 'C. Mencari tahu apa yang harus saya kerjakan', 'D. Diam saja sambil mengamati sistem kerja pegawai di tempat tersebut', 'E.  Menunggu Perintah dari atasan', 5, 4, 3, 2, 1, NULL, 'A = 5\nB = 4\nC = 3\nD = 2\nE = 1', ''),
(3897, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Pertama kali yang anda lakukan saat datang ke kantor di pagi hari adalahâ€¦ ', 81, 'A. Menyapa rekan kerja baru dan bertanya tentang sistem kerja di tempat tersebut', 'B. Mempelajari sistem kerja di tempat tersebut dari peraturan dan data yang ada', 'C. Mencari tahu apa yang harus saya kerjakan', 'D. Diam saja sambil mengamati sistem kerja pegawai di tempat tersebut', 'E.  Menunggu Perintah dari atasan', 2, 1, 3, 5, 4, NULL, 'A = 2\nB = 1\nC = 3\nD = 5\nE = 4', ''),
(3898, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Ketika Anda pindah rumah, Anda akanâ€¦', 82, 'A. Biasa-biasa saja', 'B. Membagikan makanan pada tetangga', 'C. Mengundang para tetangga ke ruman Anda', 'D. Membawa serta keluarga Anda kesana', 'E.  Mengundang rekan kerja ke rumah Anda', 1, 4, 5, 3, 1, NULL, 'A = 1\nB = 4\nC = 5\nD = 3\nE = 1', ''),
(3899, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Saya diutus untuk menghadiri seminar menggantikan atasan saya. Pada saat yang bersamaan saya sedang mengerjakan laporan yang tidak terlalu mendesak â€¦', 83, 'A. Saya akan selesaikan terlebih dahulu laporan tersebut, sebab bisa saja diminta oleh atasan sewaktu-waktu', 'B. Laporan tersebut akan menjadi merepotkan kalau tertunda.', 'C. Saya akan menghadiri seminar tersebut agar dapat menghindar dari tugas laporan.', 'D. Saya akan menghadiri seminar tersebut karena laporan belum harus segera diserahkan kepada atasan.', 'E.  Saya bisa menghadiri seminar dan mengerjakan laporannya nanti saja.', 5, 3, 4, 1, 2, NULL, 'A = 5\nB = 3\nC = 4\nD = 1\nE = 2', ''),
(3900, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Saya ditugaskan untuk memimpin suatu proyek di kantor dengan deadline yang sangat singkat. Rekan kerja saya menunjukkan sikap tidak peduli terhadap tugas dalam proyek tersebut. Sikap saya adalah ....', 84, 'A. Bekerja sendiri menyelesaikan tugas tersebut.', 'B. Memberi peringatan pada rekan kerja saya dan mengancam akan mengeluarkan mereka yang tidak serius dalam proyek.', 'C. Melaporkan pada atasan agar mereka mendapat sanksi.', 'D. Membagi tugas sesuai dengan porsi masing-masing secara adil dan tetap memotovasi mereka untuk menyelesaikan tugasnya.', 'E.  Memberikan nasihat pada mereka agar mau menyelesaikan tugasnya.', 2, 3, 1, 5, 4, NULL, 'A = 2\nB = 3\nC = 1\nD = 5\nE = 4', ''),
(3901, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Saya diminta menyelesaikan laporan program kreativitas mahasiswa dalam rangka memonitor dan mengevaluasi dengan waktu yang sangat terbatas dan mendadak. Anggota kelompok saya justru menunjukkan sikap tidak peduli terhadap tugas-tugasnya. Sikap saya adalah .... ', 85, 'A. Bekerja sendiri yang penting laporan selesai.', 'B. Mengancam mengeluarkan teman yang tidak serius mengerjakan tugas.', 'C. Melaporkan mereka pada pembimbing program krativitas mahasiswa.', 'D. Membagi tugas secara adil dan memotivasi anggota agar menyelesaikannya.', 'E. Menasihati agar mereka sadar dengan penyelesaian tugas yang diembannya', 2, 3, 1, 5, 4, NULL, 'A = 2\nB = 3\nC = 1\nD = 5\nE = 4', ''),
(3902, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Saya akan meminta tanda tangan salah satu dosen untuk pengesahan KTTA saya. Kebetulan sudah satu minggu dosen tersebut tidak ke kampus, pihak kampus memyarankan saya untuk pergi ke rumah beliau. Saat pergi ke rumah dosen tersebut, ternyata keluarganya memberitahu bahwa tangan dosen tersebut sedang terkena stroke dan tidak bisa memberikan tanda tangan. Sikap saya.....', 86, 'A. Menunggu sampai dosen tersebut sembuh dari stroke', 'B. Menjelaskan kepada pihak kampus tentang keadaan dosen tersebut dan meminta pertimbangan dari kampus jika tanda tangan pengesaham bisa diwakilkan oleh dosen lain', 'C. Tidak memaksa dosen tersebut untuk tanda tangan', 'D. Marah marah karena merasa dipersulit', 'E.  Protes pada pihak kampus', 4, 5, 3, 2, 1, NULL, 'A = 4\nB = 5\nC = 3\nD = 2\nE = 1', ''),
(3903, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Sebagai seorang bidan sudah menjadi tanggung jawab saya untuk membantu orang yang akan melahirkan. Tengah malam seorang warga datang ke rumah karena istrinya akan melahirkan padahal saat itu saya baru saja pulang dari kota dan masih dalam keadaan lelah. Sikap saya.....', 87, 'A. Menolak membantu karena masih lelah', 'B. Membantu sebagai bentuk tanggung kawab dan kepedulian', 'C. Menyarankan untuk mendatangi bidan lain', 'D. Mengusir karena sangat menganggu', 'E.  Membantu semampunya', 2, 5, 3, 1, 4, NULL, 'A = 2\nB = 5\nC = 3\nD = 1\nE = 4', ''),
(3904, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Prediksi pengamat ekonomi bahwa bulan depan akan terjadi inflasi besar di Indonesia membuat sayaâ€¦', 88, 'A. Susah tidur', 'B. Depresi berat, karena inflasi berarti harga barang naik', 'C. Berhati-hati dan berhemat dalam membelanjakan uang', 'D. Yang akan terjadi, biarlah terjadi', 'E.  Prediksi yang menyusahkan seperti itu tak perlu saya percayai', 4, 1, 5, 3, 2, NULL, 'A = 4\nB = 1\nC = 5\nD = 3\nE = 2', ''),
(3905, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Bila ada rekan kerja yang salah memanggil nama saya, maka sayaâ€¦', 89, 'A. Saya tersinggung, karena nama adalah kehormatan seseorang', 'B. Saya tidak tersinggung', 'C. Saya mengingatkan kekeliruannya dengan baik baik', 'D. Saya mengingatkannya dengan tegas agar dia jera', 'E.  Hal itu tak menjadi masalah bagi saya', 1, 5, 3, 2, 4, NULL, 'A = 1\nB = 5\nC = 3\nD = 2\nE = 4', ''),
(3906, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Jika hal-hal kecil merusak rencana besar saya, maka... ', 90, 'A. Saya sangat sedih dan marah kenapa hal kecil mampu merusak rencana besar tersebut', 'B. Tentu saja saya marah', 'C. Saya melakukan evaluasi menyeluruh', 'D. Saya butuh waktu menenangkan diri', 'E.  Saya marah kepada pihak lain yang juga ikut bertanggung jawab akan hal ini.', 3, 2, 5, 4, 1, NULL, 'A = 3\nB = 2\nC = 5\nD = 4\nE = 1', ''),
(3907, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Jika dalam suatu rapat, rekan kantor memiliki pendapat yang berbeda, padahal Anda-lah yang menjadi pemimpin rapat, maka: â€¦', 91, 'A. Saya teguh mempertahankan pendapat saya', 'B. Beda pendapat bukanlah masalah serius', 'C. Saya pertimbangkan pendapat tersebut', 'D. Saya lihat dulu siapa dia', 'E. Menanyakannya mengapa dia berani berbeda pendapat dengan pemimpin rapat', 3, 4, 5, 2, 1, NULL, 'A = 3\nB = 4\nC = 5\nD = 2\nE = 1', ''),
(3908, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Anda akan bekerja secara maksimal ketika ... ', 92, 'A. Diawasi atasan', 'B. Diawasi maupun tidak diawasi atasan', 'C. Dibawah tekanan', 'D. Dalam mood yang baik', 'E. Berada di tempat yang nyaman', 2, 5, 1, 4, 3, NULL, 'A = 2\nB = 5\nC = 1\nD = 4\nE = 3', ''),
(3909, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Ketika Anda dipercaya melakukan tugas baru dan berisiko besar, maka Anda akan ... ', 93, 'A. Mundur', 'B. Menolaknya secara tegas', 'C. Meminta Pertimbangan ulang', 'D. Antusias', 'E. Menyanggupinya dengan sedikit ragu', 1, 2, 3, 5, 4, NULL, 'A = 1\nB = 2\nC = 3\nD = 5\nE = 4', ''),
(3910, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Apabila Anda mendapati rekan kerja yang suka menunda pekerjaan, sikap Anda adalah â€¦', 94, 'A. Membiarkannya karena itu biasa terjadi', 'B. Menasihatinya', 'C. Melaporkannya pada atasan', 'D. Menegur dan mengingatkannya', 'E. Menggunjingnya dengan rekan yang lain', 1, 4, 3, 5, 2, NULL, 'A = 1\nB = 4\nC = 3\nD = 5\nE = 2', ''),
(3911, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Anda senang jika datang ke sebuah restoran yang ... ', 95, 'A. Pelayanannya ramah dan cekatan', 'B. Cepat membuat pesanan Anda', 'C. Makanannya enak walau lama', 'D. Murah', 'E. Mahal', 5, 4, 3, 2, 1, NULL, 'A = 5\nB = 4\nC = 3\nD = 2\nE = 1', ''),
(3912, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Jika bekerja dibawah tekanan, maka Anda akan â€¦', 96, 'A. Baper', 'B. Biasa saja', 'C. Selalu tersenyum', 'D. Marah', 'E. Butuh waktu sendiri', 2, 5, 4, 1, 3, NULL, 'A = 2\nB = 5\nC = 4\nD = 1\nE = 3', ''),
(3913, 'TryoutUSMSTAN-0828124647', 'Soal 1', 'Saya mengharapkan kondisi kerja yang â€¦', 97, 'A. Menghasilkan pendapatan tambahan', 'B. Menyediakan stabilitas Pekerjaan', 'C. Memungkinkan promosi', 'D. Ada kesempatan aktualisasi diri', 'E. Memotivasi untuk lebih giat bekerja', 1, 2, 3, 4, 5, NULL, 'A = 1\nB = 2\nC = 3\nD = 4\nE = 5', ''),
(3914, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Raja pertama kerajaan Sriwijaya adalah2', 1, 'A. Balaputeradewa', 'B. Sri Jayanasa', 'C. Samaratungga', 'D. Jayasingawarman', 'E. Sanggrama Wijayatungga', 0, 5, 0, 0, 0, NULL, '683 = Sri Jayanasa\n702 = Sri Indrawarman\n775 = Dharanindra\n792 = Samaratungga\n835 = Balaputradewa\n988 = Sri Cudamani Warmadewa\n1008 = Sri Mara-Vijayotunggawarman\n1025 = Sangrama-Vijayotunggawarman', ''),
(3915, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Kerajaan Janggala yang merupakan kerajaan hasil pembelahan dari Medang Kamulan dipipmpin olehâ€¦', 2, 'A. Airlangga', 'B. Jayabaya', 'C. Mapanji Garasakan', 'D. Samarawijaya', 'E. Kertajaya', 0, 0, 5, 0, 0, NULL, 'Airlangga = Kerjaan Kahuripan\nJayabaya = Kerajaan Kediri (Raja ke 3)\nSamarawijaya = Kerajaan Kediri (Raja Pertama)\nKertajaya = Kerjaan Kediri (Raja ke 8)', ''),
(3916, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Penyebab utama pecahnya Perang Dipenogoro adalahâ€¦', 3, 'A. Rakyat Mataram dihasut oleh para Bupati untuk memihak penjajah Belanda', 'B. Belanda mengusik makam leluhur Diponegoro di Tegal Rejo', 'C. Pangeran Diponegoro tidak menyukai tingkah laku Belanda', 'D. Pangeran Diponegoro bertikai dengan Sentot Prawirodirjo', 'E. Campur tangan Belanda dalam urusan Keraton Surakarta', 0, 5, 0, 0, 0, NULL, 'Belanda secara paksa mengambil tanah leluhur Diponegoro untuk proyek pembangunan jalan.', ''),
(3917, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Salah satu teori penyebaran agama Hindu-Budha di Indonesia yaitu teori Brahmana dikemukakan olehâ€¦', 4, 'A. Krom	', 'B. Berg', 'C. Van Faber', 'D. Van Leur', 'E. Bosch', 0, 0, 0, 5, 0, NULL, 'Van Leur menyatakan bahwa agama dan kebudayaan Hindu-Buddha yang datang ke Indonesia dibawa oleh golongan Brahmana (golongan agama) yang sengaja diundang oleh penguasa Indonesia dalam rangka melegitimasi kekuasaan mereka sehingga setara dengan raja-raja di India.', ''),
(3918, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Perjanjian Salatiga di tanda tangani pada tanggalâ€¦', 5, 'A. 13 Maret 1757', 'B. 17 Maret 1757', 'C. 13 Februari 1755', 'D. 17 Maret 1755', 'E. 17 Februari 1755', 0, 5, 0, 0, 0, NULL, 'Perjanjian Salatiga ditandatangi pada tanggal 17 Maret 1757 untuk mengakhiri peperangan di jawa antara Hamengku Buwono I dan Paku Buwono III dengan Pangeran Sambernyawa.', ''),
(3919, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Peninggalan Suku Teotihuaca pada masa Peradaban di Amereika Tengah adalahâ€¦', 6, 'A. Templo Major	', 'B. Chicen Itza', 'C. Mayan Calendar', 'D. Pyramid of the Sun', 'E. Machu Picchu', 0, 0, 0, 5, 0, NULL, 'Templo Major = Suku Aztec\nChicen Itza = Suku Maya\nMayan Calendar = Suku Maya\nPyramid of The Sun = Suku Teotihuaca\nMachu Picchu = Suku Inca', ''),
(3920, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Ilmu bantu sejarah yang mempelajari tentang uang logam kuno adalahâ€¦', 7, 'A. Ikonografi', 'B. Etnografi', 'C. Numimastik', 'D. Paleontologi', 'E. Paleantropologi', 0, 0, 5, 0, 0, NULL, 'Ikonografi = Patung\nEtnografi = suku bangsa\nNumimastik = uang logam kuno\nPaleontologi = makhluk purba (fosil)\nPaleantropologi = manusia purba', ''),
(3921, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Pithecantropus Erectus ditemukan olehâ€¦', 8, 'A. Ter Haar', 'B. Von Koenigswald', 'C. Eugene Dubois', 'D. Van Rietschoten', 'E. Oppenoorth', 0, 0, 5, 0, 0, NULL, 'Ter Haar = Homo Soloensis\nVon Koenigswald = Meganthropus Paleojavanicus\nEugene Dubois = Pithecantropus Erectus\nVan Rietschoten = Homo Wajakensis\nOppenoorth = Homo Soloensis', ''),
(3922, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Yang merupakan suku bangsa asli India adalah â€¦', 9, 'A. Arya', 'B. Dravida', 'C. Sakia', 'D. Mongol', 'E. Benggala', 0, 5, 0, 0, 0, NULL, 'Bangsa Dravida merupakan bangsa India Asli, memiliki ciri berbadan pendek dan gempal, hidung pesek, rambut keriting, serta berkulit Gelap.', ''),
(3923, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Syarif Hidayatullah merupakan nama asli dari ...', 10, 'A. Sunan Muria', 'B. Sunan Kalijaga', 'C. Sunan Gunung Jati', 'D. Sunan Giri', 'E. Sunan Gresik', 0, 0, 5, 0, 0, NULL, 'Syarif Hidayatullah atau Sunan Gunung Jati merupakan salah seorang dari Walisongo', ''),
(3924, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Berikut ini yang bukan merupakan prasasti peninggalan dari Kerajaan Sriwijaya adalah â€¦', 11, 'A. Prasasti Karang Berahi', 'B. Prasasti Talang Tuo', 'C. Prasasti Kota Kapur', 'D. Prasasti Kebun Kopi', 'E. Prasasti Telaga Batu', 0, 0, 0, 5, 0, NULL, 'Prasasti Kebun Kopi merupakan prasasti peninggalan Kerajaan Tarumanegara', ''),
(3925, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Tokoh yang melahirkan konsep Trias Politika adalah ...', 12, 'A. Montesquieu', 'B. J.J Rosseau', 'C. Voltaire', 'D. Aristoteles', 'E. Immanuel Kant', 5, 0, 0, 0, 0, NULL, '\nTrias Politika yang diungkapkan Montesquieu yakni Eksekutif, Yudikatif, dan Legislative', ''),
(3926, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Konferensi Asia Afrika diselenggarakan di Bandung pada tanggal 18-24 April 1955. Berikut ini tokoh pencetus KAA, kecuali â€¦', 13, 'A. Adam Malik', 'B. Jawaharal Nehru', 'C. Sir John Kotelawala', 'D. U Nu', 'E. Moh. Ali', 5, 0, 0, 0, 0, NULL, 'Pencetus KAA :\n- Indonesia (Alisastro Amijoyo),\n- Burma ( U Nu),\n- Paskitan ( Moh. Ali ),\n- India (Jawaharal Nehru),\n- Sri Lanka ( Sir John Kotelawala)', ''),
(3927, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Sebelum KAA dilaksanakan pada tahun 1955, konferensi tersebut didahului dengan adanya konferensi yang diselenggarakan di Kota Bogor. Konferensi Bogor tersebut dilaksanakan pada tanggal ...', 14, 'A. 18-24 April 1955', 'B. 28-29 Desember 1954', 'C. 28 April-2 Mei 1954', 'D. 28 Maret-2 April 1954', 'E. 18-24 April 1954', 0, 5, 0, 0, 0, NULL, 'Konferensi Bogor atau Konferensi Pancanegara II merupakan konferensi pendahuluan sebelum KAA dilaksanakan. Konferensi Bogor dilaksanakan tanggal 28-29 Desember 1954', ''),
(3928, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Rancangan lambang negara Indonesia yang ditolak untuk disahkan merupakan usulan dari ... ', 15, 'A. Moh. Hatta', 'B. Ahmad Soebarjo', 'C. Moh. Yamin', 'D. A.A. Maramis', 'E. Ir. Soekarno', 0, 0, 5, 0, 0, NULL, 'Rancangan yang diusulkan Moh. Yamin ditolak karena mengandung unsur-unsur matahari. Hal tersebut dianggap melambangkan Jepang', ''),
(3929, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Dalam UUD 1945 disebutkan bahwa Negara menghormati dan memelihara bahasa daerah sebagai kekayaan budaya nasional. Hal tersebut dinyatakan dalam Pasal â€¦', 16, 'A. Pasal 31 ayat (1)', 'B. Pasal 32 ayat (1)', 'C. Pasal 31 ayat (2)', 'D. Pasal 32 ayat (2)', 'E. Pasal 29 ayat (1)', 0, 0, 0, 5, 0, NULL, 'Menurut UUD 1945 Pasal 32 yaitu : (1) Negara memajukan kebudayaan nasional Indonesia di tengah peradaban dunia dengan menjamin kebebasan masyarakat dalam memelihara dan mengembangkan nilai-nilai budayanya. (2) Negara menghormati dan memelihara bahasa daerah sebagai kekayaan budaya nasional.', ''),
(3930, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Berikut ini pasal dalam UUD 1945 yang tidak pernah mengalami amandemen â€¦', 17, 'A. Pasal 29', 'B. Pasal 30', 'C. Pasal 31', 'D. Pasal 32', 'E. Pasal 33', 5, 0, 0, 0, 0, NULL, 'Pasal-pasal yang tidak mengalami amandemen adalah Pasal 4, 10, 12, 29, dan 35', ''),
(3931, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'MPR paling lambat dibentuk pada tanggal â€¦', 18, 'A. 17 Agustus 2000', 'B. 17 Agustus 2001', 'C. 17 Agustus 2002', 'D. 17 Agustus 2003', 'E. 17 Agustus 2004', 0, 0, 0, 5, 0, NULL, 'Sesuai dengan aturan peralihan pasal III', ''),
(3932, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Fakir miskin dan anak-anak terlantar dipelihara oleh â€¦', 19, 'A. Pemerintah', 'B. Presiden', 'C. Negara', 'D. DPR', 'E. Pemerintah Daerah', 0, 0, 5, 0, 0, NULL, 'Sesuai Pasal 34 ayat (1) UUD 1945', ''),
(3933, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Calon Hakim Agung diusulkan oleh ... ', 20, 'A. MA', 'B. MK', 'C. MPR', 'D. DPR', 'E. KY', 0, 0, 0, 0, 5, NULL, 'Pasal 24A ayat (3) UUD 1945 amandemen ketiga: Calon hakim agung diusulkan Komisi Yudisial kepada Dewan Perwakilan Rakyat untuk mendapatkan persetujuan dan selanjutnya ditetapkan sebagai hakim agung oleh Presiden.', ''),
(3934, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Belanda mendirikan kongsi dagang yang bernama <i>Vereenigde Oost-Indische Compagnie</i> (VOC) pada tanggalâ€¦ ', 21, 'A. 12 Maret 1596', 'B. 12 April 1596', 'C. 12 Mei 1596', 'D. 20 Maret 1602', 'E. 20 Mei 1602', 0, 0, 0, 5, 0, NULL, 'Kongsi Dagang atau Perusahaan Hindia Timur Belanda atau VOC didirikan pada 20 Maret 1602', ''),
(3935, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Sebelum munculnya Daendels, para petinggi VOC menjalankan kebijakan yang merugikan bangsa Indonesia seperti berikut, kecualiâ€¦ ', 22, 'A. sistem tanam paksa (cultuurstelsel)', 'B. wajib kerja (verplichte diensten)', 'C. penyerahan paksa hasil bumi (verplichte leveranties)', 'D. penarikan pajak hasil bumi (contingenten)', 'E. kerja paksa (rodi)', 5, 0, 0, 0, 0, NULL, 'sistem tanam paksa (cultuurstelsel) dilakukan pada masa kepemimpinan Johanes van den Bosch sebagai Gubernur Jenderal Hindia-Belanda. Ia menjalankankan tugas setelah kepemimpinan Daendels dan Thomas Stamford Raffles', ''),
(3936, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Yang merupakan pencetus Sumpah Pemuda adalahâ€¦ ', 23, 'A. Perhimpunan Indonesia Nederland, Partai Nasional Indonesia, dan PPPI', 'B. Perhimpunan Indonesia Nederland, Partai Nasional Indonesia, dan Pemuda Indonesia', 'C. Partai Nasional Indonesia, Pemuda Indonesia, Partai Indonesia Raya', 'D. Partai Nasional Indonesia, Pemuda Indonesia, dan Gabungan Politik Indonesia', 'E. Perhimpunan Indonesia Nederland, Partai Indonesia Raya, dan Pemuda Indonesia', 0, 5, 0, 0, 0, NULL, 'Pencetus Sumpah Pemuda adalah Perhimpunan Indonesia Nederland, Partai Nasional Indonesia, dan Pemuda Indonesia. Peristiwa ini dihadiri oleh organisasi PPPI, Jong Java, Jong Islamiten Bond, Jong Sumatranen Bond, Pemuda Indonesia, Jong Celebes, Jong Ambon, Jong Batak, dan Pemuda Kaum Betawi.', ''),
(3937, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Pembebasan Irian Barat pada masa demokrasi liberal dilakukan melalui jalur diplomasi dan jalur konfrontasi. Jalur diplomasi pembebasan Irian Barat dilakukan sejak kabinetâ€¦', 24, 'A. Kabinet Natsir', 'B. Kabiner Sukiman-Suwiryo', 'C. Kabinet Wilopo', 'D. Kabinet Ali Sastroamidjojo I', 'E. Kabinet Burhanuddin Harahap', 5, 0, 0, 0, 0, NULL, '\nJalur diplomasi pembebasan Irian Barat dilakukan sejak Kabinet Natsir (6 Oktober 1950 s.d. 21 Maret 1951). Berbagai perundingan bilateral dilakukan, namun masih belum berhasil.', ''),
(3938, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Hari Infranteri merupakan hari peringatan terjadinya peristiwa Ambarawa. Peristiwa ini adalah perlawanan TKR yang dipimpin oleh Kolonel Sudirman melawan tentara sekutu di Ambarawa. Peristiwa ini terjadi pada tanggalâ€¦ ', 25, 'A. 23 Maret 1945', 'B. 10 Desember 1945', 'C. 15 Desember 1945', 'D. 7 Desember 1946', 'E. 21 Juli 1947', 0, 0, 5, 0, 0, NULL, '\n23 Maret 1945 peristiwa Bandung Lautan Api,\n10 Desember 1945 peristiwa Medan Area,\n7 Desember 1946 peristiwa Westerling,\n21 Juli 1947 peristiwa Agresi Militer I', ''),
(3939, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Sejak Jepang kalah dari pihak sekutu dalam pertempuran di Laut Karang pada 7 Mei 1942, Jepang berupaya menarik simpati bangsa Indonesia. Jepang juga memanfaatkan para pemuda Indonesia dengan membentuk organisasi semi militer, yaituâ€¦ ', 26, 'A. Peta, Heiho, Seinendan, Fujinkai', 'B. Kaigun, Seinendan, Fujinkai, Keibodan', 'C. Fujinkai, Keibodan, Kaigun, Rikugun', 'D. Peta, Kaigun, Keibodan, Fujinkai', 'E. Seinendan, Fujinkai, Keibodan, Syusintai', 0, 0, 0, 0, 5, NULL, '\nOrganisasi semi militer yang dibentuk Jepang adalah Seinendan (barisan pemuda), Fujinkai (barisan wanita), Keibodan (barisan pembantu polisi), dan Syusintai (barisan pelopor). Selain itu, Jepang membentuk organisasi militer yakni Peta (pembela tanah air) dan Heiho (barisan pembantu prajurit Jepang). Sedangkan Kaigun adalah sebutan untuk angkatan laut dan Rikugun adalah sebutan untuk angkatan darat.', ''),
(3940, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Perang Paderi adalah perang melawan kolonial pada tahun 1821 s.d. 1837 di Minangkabau yang dipimpin olehâ€¦ ', 27, 'A. Pangeran Diponegoro', 'B. Tuanku Imam Bonjol', 'C. Teuku Umar', 'D. Pattimura', 'E. Sultan Ageng Tirtayasa', 0, 5, 0, 0, 0, NULL, 'Perang Paderi yang terjadi di Sumatera Barat berlangsung antara tahun 1803 hingga 1838 dipimpin oleh Tuanku Imam Bonjol', ''),
(3941, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Dewan Perwakilan Daerah (DPD) merupakan lembaga perwakilan daerah yang anggotanya merupakan wakil-wakli daerah provinsi yang dipilih melalui pemilihan umum. Anggota Dewan Perwakilan Daerah (DPD) dari setiap provinsi sebanyak â€¦ orang. ', 28, 'A. empat orang', 'B. lima orang', 'C. enam orang', 'D. tujuh orang', 'E. delapan orang', 5, 0, 0, 0, 0, NULL, ' Anggota DPD dari setiap provinsi adalah 4 orang. Dengan demikian jumlah anggota DPD saat ini adalah seharusnya 136 orang. Masa jabatan anggota DPD adalah 5 tahun, dan berakhir bersamaan pada saat anggota DPD yang baru mengucapkan sumpah/janji.', ''),
(3942, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'MPR dapat memilih presiden dan wakil presiden apabila keduanya berhalangan tetap secara bersamaan dalam masa jabatannya selambat-lambatnya dalam waktu â€¦ hari.', 29, 'A.15 hari', 'B. 20 hari', 'C. 25 hari', 'D. 30 hari', 'E. 60 hari', 0, 0, 0, 5, 0, NULL, 'Sesuai dengan UUD 1945 Pasal 8 ayat (3), yaitu Jika Presiden dan Wakil Presiden mangkat, berhenti, diberhentikan, atau tidak dapat melakukan\nkewajibannya dalam masa jabatannya secara bersamaan, pelaksanaan tugas Kepresidenan adalah\nMenteri Luar Negeri, Menteri Dalam Negeri dan Menteri Pertahanan secara bersama-sama. Selambat-lambatnya tiga puluh hari setelah itu, Majelis Permusyawaratan Rakyat menyelenggarakan sidang untuk memilih Presiden dan Wakil Presiden dari dua pasangan calon Presiden dan wakil Presiden\nyang diusulkan oleh partai politik atau gabungan partai politik yang pasangan calon Presiden dan\nWakil Presidennya meraih suara terbanyak pertama dan kedua dalam pemilihan umum sebelumnya,\nsampai berakhir masa jabatannya.****)', '');
INSERT INTO `data_jawaban` (`id`, `kode_soal`, `jenis_soal`, `soal`, `nomor`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`, `pilihan_e`, `nilai_a`, `nilai_b`, `nilai_c`, `nilai_d`, `nilai_e`, `gambar`, `pembahasan`, `video`) VALUES
(3943, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'DPR memiliki 11 komisi. Komisi XI memiliki ruang lingkup tugasâ€¦', 30, 'A. membidangi pertahanan, intelijen, luar negeri, dan komunikasi & informasi', 'B. membidangi pemerintahan dalam negeri, otonomi daerah, aparatur negara, dan agraria', 'C. membidangi energi, sumber daya mineral, riset dan teknologi, dan lingkungan', 'D. membidangi agama, sosial, dan pemberdayaan perempuan', 'E. membidangi keuangan, perencanaan pembangunan nasional, perbankan, dan lembaga keuangan bukan bank', 0, 0, 0, 0, 5, NULL, 'Komisi I = membidangi pertahanan, intelijen, luar negeri, dan komunikasi & informasi\nKomisi II = membidangi pemerintahan dalam negeri, otonomi daerah, pemilu, aparatur negara, dan agraria\nKomisi VII = membidangi energi, sumber daya mineral, riset dan teknologi, dan lingkungan\nKomisi VIII = membidangi agama, sosial, dan pemberdayaan perempuan\nKomisi XI = membidangi keuangan, perencanaan pembangunan nasional, perbankan, dan lembaga keuangan bukan bank', ''),
(3944, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Siapakah Tokoh Pendiri ASEAN yang berasal dari Singapura? ', 31, 'A. Adam Malik', 'B. Tun Abdul Razak', 'C. Thanat Koman', 'D. Narciso Ramos', 'E. S. Rajaratnam', 0, 0, 0, 0, 5, NULL, '\nAdam Malik berasal dari Indonesia\nTun Abdul Razak berasal dari Malaysia\nThanat Koman berasal dari Thailand\nNarciso Ramos berasal dari Filipina\nS. Rajaratnam berasal dari Singapura', ''),
(3945, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Revolusi Industri bermula di Inggris dan terjadi antara tahun 1750-1850. Faktor-faktor yang menyebabkan terjadinya Revolusi Industri adalah sebagai berikut, kecuali..... ', 32, 'A. Situasi politik yang stabil. Adanya Revolusi Glorius/Agung tahun 1688 yang mengharuskan Raja bersumpah setia kepada Bill of Right sehingga raja tunduk tunduk kepada undang-undang dan hanya menarik pajak berdasarkan atas persetujuan parlemen', 'B. Adanya penemuan baru di bidang teknologi yang dapat mempermudah cara kerja dan meningkatkan hasil produksi, misalnya alat-alat pemintal, mesin tenun, mesin uap, dan sebagainya', 'C. Munculnya pemahaman baru, yaitu memperjuangkan kebebasan dan pemenuhan hak-hak asasi manusia', 'D. Pemerintah memberikan perlindungan hukum terhadap hasil-hasil penemuan baru (hak paten) sehingga mendorong kegiatan penelitian ilmiah', 'E. Kemakmuran Inggris akibat majunya pelayaran dan perdagangan sehingga dapat menyediakan modal yang besar untuk bidang usaha', 0, 0, 5, 0, 0, NULL, 'Revolusi Industri untuk kali pertamanya muncul di Inggris. Adapun faktor-faktor yang menyebabkannya adalah sebagai berikut:\n\n1. Situasi politik yang stabil. Adanya Revolusi Agung tahun 1688 yang mengharuskan raja bersumpah setia kepada Bill of Right sehingga raja tunduk kepada undang-undang dan hanya menarik pajak berdasarkan atas persejutuan parlemen.\n2. Inggris kaya bahan tambang, seperti batu bara, biji besi, timah, dan kaolin. Di samping itu, wol juga yang sangat menunjang industri tekstil.\n3. Adanya penemuan baru di bidang teknologi yang dapat mempermudah cara kerja dan meningkatkan hasil produksi, misalnya alat-alat pemintal, mesin tenun, mesin uap, dan sebagainya.\n4. Kemakmuran Inggris akibat majunya pelayaran dan perdagangan sehingga dapat menyediakan modal yang besar untuk bidang usaha. Di samping itu, di Inggris juga tersedia bahan mentah yang cukup karena Inggris mempunyai banyak daerah jajahan yang menghasilkan bahan mentah tersebut.\n5. Pemerintah memberikan perlindungan hukum terhadap hasil-hasil penemuan baru (hak paten) sehingga mendorong kegiatan penelitian ilmiah. Lebih-lebih setelah dibentuknya lembaga ilmiah Royal Society for Improving Natural Knowledge maka perkembangan teknologi dan industri bertambah maju.\n6. Arus urbanisasi yang besar akibat Revolusi Agraria di pedesaan mendorong pemerintah Inggris untuk membuka industri yang lebih banyak agar dapat menampung mereka.\n', ''),
(3946, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Berdasarkan sensus BPS tahun 2010, jumlah suku bangsa di Indonesia berjumlah..... ', 33, 'A. 1340', 'B. 1328', 'C. 1350', 'D. 1335', 'E. 1300', 5, 0, 0, 0, 0, NULL, '\nTerdapat lebih dari 300 kelompok etnik atau suku bangsa di Indonesia atau tepatnya 1.340 suku bangsa menurut sensus BPS tahun 2010.', ''),
(3947, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Senjata tradisional yang dipakai oleh pejuang Aceh untuk melawan penjajah adalah..... ', 34, 'A. Keris', 'B. Pisau Belati', 'C. Bambu Runcing', 'D. Rencong', 'E. Panah', 0, 0, 0, 5, 0, NULL, '\nRencong dipakai oleh para pejuang Aceh dalam melawan penjajahan bangsa asing dulu, tidak hanya pejuang saja yang memakai rencong tapi juga raja-raja dan kaum bangsawan di Aceh', ''),
(3948, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Gunung yang terletak di perbatasan antara Jawa Tengah dan Jawa Timur adalah.....', 35, 'A. Gunung Semeru', 'B. Gunung Lawu', 'C. Gunung Slamet', 'D. Gunung Merapi', 'E. Gunung Kerinci', 0, 5, 0, 0, 0, NULL, '\nGunung Lawu terletak di Kabupaten Karanganyar, Jawa Tengah dan Kabupaten Magetan, Jawa Timur', ''),
(3949, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Agitator = ....', 36, 'A. Motivator', 'B. Penghasut', 'C. Pendukung', 'D. Pencetus', 'E. Orator', 0, 5, 0, 0, 0, NULL, 'Agitator adalah penghasut (KBBI)', ''),
(3950, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Pemugaran = ....', 37, 'A. Pengusiran', 'B. Penghancuran', 'C. Perbaikan', 'D. Pembaharuan', 'E. Pembongkaran', 0, 0, 0, 5, 0, NULL, 'Pemugaran adalah pembaharuan kembali (KBBI)', ''),
(3951, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Somasi = ....', 38, 'A. Isolasi', 'B. Revisi', 'C. Siomay', 'D. Teguran untu membayar', 'E. Usulan pembayaran', 0, 0, 0, 5, 0, NULL, 'Somasi adalah teguran untuk membayar (KBBI)', ''),
(3952, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Bergaul =', 39, 'A.Berteman', 'B. Bermain', 'C. Berkelakar', 'D. Bercanda', 'E. Berdendang', 5, 0, 0, 0, 0, NULL, 'Bergaul adalah berteman, bersahabat (KBBI)', ''),
(3953, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Mandiri >< â€¦..', 40, 'A. Swasembada', 'B. Mengikuti', 'C. Bergantung', 'D. Roboh', 'E. Berdikari', 0, 0, 5, 0, 0, NULL, 'Mandiri adalah dalam keadaan dapat berdiri sendiri, tidak bergantung pada orang lain.', ''),
(3954, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Ekuivalen >< â€¦...', 41, 'A. Berlawanan', 'B. Sama', 'C. Seimbang', 'D. Sepadan ', 'E. Setingkat', 5, 0, 0, 0, 0, NULL, 'Ekuivalen adalah mempunyai nilai (ukuran, arti, atau efek) yang sama; seharga; sebanding; sepadan.', ''),
(3955, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Sapi : Rumput = ..... ', 42, 'A. Kambing : Gulai', 'B. Badak : Cula', 'C. Kerbau : Tanduk', 'D. Pagar : Tanaman', 'E. Manusia : Nasi', 0, 0, 0, 0, 5, NULL, 'Sapi memakan Rumput; Manusia memakan Nasi', ''),
(3956, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'KAKAKTUA : MERPATI = â€¦ : â€¦ ', 43, 'A. Gajah : Semut', 'B. Elang : Kupu-Kupu', 'C. Gurame : Kakap', 'D. Anjing : Herder', 'E. Singa : Naga', 0, 0, 5, 0, 0, NULL, 'Hubungan antara kedua hewan yang satu jenis yaitu sama-sama burung dan sama-sama ikan', ''),
(3957, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'AIR : ES = UAP : â€¦ ', 44, 'A. Air', 'B. Udara', 'C. Basah', 'D. Mendidih', 'E. Awan', 5, 0, 0, 0, 0, NULL, 'Jika air didinginkan menjadi es, maka jika uap didinginkan menjadi butir-butir air ', ''),
(3958, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Kalimat di bawah ini yang mengandung kata tidak bakuâ€¦. ', 45, 'A. Dia memiliki karier yang cukup bagus.', 'B. Hani bekerja di sebuah apotek ternama.', 'C. Hari ini adalah jadual kelas kami untuk bertanding.', 'D. Pekerjaannya adalah menganalisis laporan keuangan satuan kerja.', 'E. Dia membawa kuitansinya pulang ke rumah.', 0, 0, 5, 0, 0, NULL, 'Kata baku dari JADUAL adalah JADWAL', ''),
(3959, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'X, U, Q, â€¦ ', 46, 'A. I', 'B. J', 'C. K', 'D. L', 'E. M', 0, 0, 0, 5, 0, NULL, 'Deret dengan beda 3 dan 4 maka berikutnya 5. Sehingga, 5 huruf sebelum Q yaitu L', ''),
(3960, 'TryoutUSMSTAN-0828124647', 'Soal 2', '3 , 3 , 6 , 9 , 15 , 24 , â€¦.', 47, 'A. 39', 'B. 40', 'C. 41', 'D. 42', 'E. 43', 5, 0, 0, 0, 0, NULL, 'Deret tersebut memiliki pola yaitu penjumlahan dari 2 bilangan sebelumnya.\nKita lihat mulai bilangan ketiga:\n6 = 3+3\n9 = 6+3\n15 = 9+6\n24 = 15+9\nJadi, bilangan selanjutnya adalah 24+15 = 39', ''),
(3961, 'TryoutUSMSTAN-0828124647', 'Soal 2', '1 , 11 , 3 , 7 , 5 , 5 , ... , â€¦', 48, 'A. 7 , 5', 'B. 7 , 3', 'C. 3 , 7', 'D. 5 , 7', 'E. 4 , 5', 0, 5, 0, 0, 0, NULL, 'Deret tersebut terdiri dari dua bagian.\nDeret pertama: 1, 3, 5 (beda dua) jadi angka selanjutnya adalah 7.\nDeret kedua: 11, 7, 5 (merupakan bilangan prima) jadi angka selanjutnya adalah 3.', ''),
(3962, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'A â€“ S â€“ D â€“ P â€“ G - ... - ... ', 49, 'A. K - L', 'B. N - M', 'C. M - J ', 'D. O - P', 'E. L â€“ Z', 0, 0, 5, 0, 0, NULL, 'Deret huruf tersebut memiliki pola jarak 3 huruf.\nDeret pertama: A, D, G, berjarak 3 huruf dari huruf sebelumnya, maka huruf selanjutnya adalah J.\nDeret kedua: S, P, berjarak 3 huruf dari huruf sebelumnya, namun urutannya mundur, jadi huruf selanjutnya adalah M.', ''),
(3963, 'TryoutUSMSTAN-0828124647', 'Soal 2', '16Â² - 15Â² = â€¦', 50, 'A. 30', 'B. 31', 'C. 32', 'D. 33', 'E. 34', 0, 5, 0, 0, 0, NULL, 'TRIK CEPAT: \nTidak perlu untuk mencari kuadratnya terlebih dahulu.\nGunakan rumus ini:\nAÂ² - BÂ² = (A+B)(A-B)\njadi,\n16Â² - 15Â² = (16+15)(16-15) = 31 x 1 = 31', ''),
(3964, 'TryoutUSMSTAN-0828124647', 'Soal 2', '37 x 36 + 35 x 34 = â€¦.', 51, 'A. 2679', 'B. 2695', 'C. 2522', 'D. 3176', 'E. 3075', 0, 0, 5, 0, 0, NULL, 'TRIK CEPAT:\nDihitung satuan nya saja\n(7 x 6) + (5 x 4) = 42 + 20 = 62\nCari satuannya yang memiliki angka 2', ''),
(3965, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'âˆš(1-0,36) - âˆš(1-0,64) = â€¦.', 52, 'A. 0.30', 'B. 0.60', 'C. 0.35', 'D. 0.20', 'E. 0.25', 0, 0, 0, 5, 0, NULL, 'âˆš(1-0,36) - âˆš(1-0,64) =  0,8 - 0,6 = 0,2\n', ''),
(3966, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Pak Badrun mempunyai sebidang tanah, 1/4 bagian dari luas tanahnya dibuat kolam ikan, 2/5 bagian ditanami rumput dan sisanya 210 mÂ², maka luas kolam ikan adalah â€¦ ', 53, 'A. 160 mÂ²', 'B. 170 mÂ²', 'C. 155 mÂ²', 'D. 150 mÂ²', 'E. 172 mÂ²', 0, 0, 0, 5, 0, NULL, 'Luas tanah sisa = 1 - 1/4x - 2/5x\n\n210 = 1 - 1/4x - 2/5x\n\n210 = 7/20 x\n\nx = 600 mÂ² => luas tanah\n\nluas kolam ikan = 1/4 x 600 = 150 mÂ²', ''),
(3967, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Adis membeli baju dengan harga diskon 15% dari Rp80.000,00. Karena ia sedang berulang tahun, ia mendapat diskon tambahan sebesar 25% dari harga awal setelah dikurangi diskon 15% di awal. Berapakah harga yang harus dibayarkan Adis kepada kasir? ', 54, 'A. Rp60,000.00', 'B. Rp55,000.00', 'C. Rp51,000.00', 'D. Rp63,000.00', 'E. Rp73,000.00', 0, 0, 5, 0, 0, NULL, '\n1) 80.000 - (15% x 80.000) = 68.000\n2) 68.000 - (25% x 68.000) = 51.000', ''),
(3968, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Ajeng sedang membuat kerajinan papan catur. Dalam 5 menit, ia mampu mengecat 25% dari papan berwarna putih. Berapa lamakah ia mengecat sampai selesai keseluruhan papan catur?', 55, 'A. 50 menit', 'B. 30 menit', 'C. 20 menit', 'D. 60 menit', 'E. 40 menit', 0, 0, 0, 0, 5, NULL, '\nPapan warna putih\n25% = 5 menit\nx4\n100% = 20 menit\nagar bisa 100% selesai maka dikali 4, jadi waktu yang dibutuhkan untuk mengecat papan warna putih 100% adalah 20 menit.\n\nJumlah warna putih dan warna hitam pada papan catur adalah sama, jadi tinggal dikali 2.\n20 menit x 2 = 40 menit.', ''),
(3969, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Volume ember jika penuh adalah 42,5 liter. Namun, saat ini hanya terisi 3/5 saja dan itu pun masih diambil lagi oleh Adrian, sehingga kini hanya terisi 1/5 saja. Berapa literkah yang diambil oleh Adrian?', 56, 'A. 17 liter', 'B. 8,5 liter', 'C. 17,5 liter ', 'D. 8 liter', 'E. 34 liter', 5, 0, 0, 0, 0, NULL, '\n(3/5 - 1/5) x 42,5 = 17', ''),
(3970, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Peluang muncul mata dadu berangka prima dalam satu kali pelemparan sebuah dadu adalah â€¦', 57, 'A. 1/6', 'B. 2/6', 'C. 1/2', 'D. 2/3', 'E. 5/6', 0, 0, 5, 0, 0, NULL, 'bilangan prima dalam sebuah dadu 2 , 3 , 5 --> 3\nruang sampel sebuah dadu 1 , 2 , 3 , 4 , 5 , 6 --> 6\n\nJadi, peluangnya adalah 3/6 = 1/2', ''),
(3971, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Nilai Y pada bilangan berpangkat di bawah ini adalah â€¦\n\n3Â²x3Â²x3Â²x3Â²x3Â² = 3y', 58, 'A. 8', 'B. 9', 'C. 10', 'D. 11', 'E. 12', 0, 0, 5, 0, 0, NULL, '32+2+2+2+2 = 310\nJadi Y adalah 10', ''),
(3972, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Kota A dan kota B berjarak 3,5 cm dalam peta yang skalanya 1 : 5000. Berapa jarak sebenarnya?', 59, 'A. 1,55 hm', 'B. 1,65 hm', 'C. 1,75 hm', 'D. 1,85 hm', 'E. 1,95 hm', 0, 0, 5, 0, 0, NULL, '3,5 x 5.000 cm = 17.500 cm\n1 hm = 10.000 cm', ''),
(3973, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Teks  untuk soal nomor 63-65\n\nDalam sebuah pertemuan Fadjri, Antad, Bian, James, Oris dan Gafrio duduk di meja bulat dengan urutan sebagai berikut:\n\nFadjri selalu berada di antara Gafrio dan Oris.\n\nGafrio tidak mau bersebelahan dengan Bian maupun Oris Antad berada di sebelah James dan Bian.\n\n63. Siapakah yang berada di sebelah James? ', 60, 'A. Gafrio dan Fadjri', 'B. Antad dan Gafrio', 'C. Bian dan Oris', 'D. Fadjri dan Antad', 'E.  Bian dan Fadjri', 0, 5, 0, 0, 0, NULL, 'Urutan tempat duduk:\nFadjri - Oris - Bian - Antad - James â€“ Gafrio\n', ''),
(3974, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Dalam sebuah pertemuan Fadjri, Antad, Bian, James, Oris dan Gafrio duduk di meja bulat dengan urutan sebagai berikut:\n\nFadjri selalu berada di antara Gafrio dan Oris.\n\nGafrio tidak mau bersebelahan dengan Bian maupun Oris Antad berada di sebelah James dan Bian.\n\n64. Urutan mereka duduk yang paling benar adalah â€¦', 61, 'A. Fadjri, Gafrio, Bian, Antad, James, Oris', 'B. Oris, Fadjri, Bian, Antad, James, Gafrio', 'C. Fadjri, Oris, Bian, Antad, James, Gafrio', 'D. James, Antad, Bian, Gafrio, Fadjri, Oris', 'James, Fadjri, Bian, Gafrio, Antad, Oris', 0, 0, 5, 0, 0, NULL, 'Urutan tempat duduk:\nFadjri - Oris - Bian - Antad - James â€“ Gafrio', ''),
(3975, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Dalam sebuah pertemuan Fadjri, Antad, Bian, James, Oris dan Gafrio duduk di meja bulat dengan urutan sebagai berikut:\n\nFadjri selalu berada di antara Gafrio dan Oris.\n\nGafrio tidak mau bersebelahan dengan Bian maupun Oris Antad berada di sebelah James dan Bian.\n\n65. Siapakah yang berada di sebelah Fadjri dan Bian? ', 62, 'A. Antad', 'B. Oris', 'C. Gafrio', 'D. James', 'E.  Bian', 0, 5, 0, 0, 0, NULL, 'Urutan tempat duduk:\nFadjri - Oris - Bian - Antad - James â€“ Gafrio', ''),
(3976, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Saya diterima kuliah di salah satu perguruan tinggi negeri sesuai dengan harapan saya. Namun kondisi keuangan saya saat ini tidak mendukung untuk saya melanjutkan kuliah. Saya akan â€¦', 63, 'A. mengundurkan diri dan membatalkan untuk kuliah', 'B. mencari beasiswa dari negara atau lembaga lainnya', 'C. mencari pinjaman uang untuk biaya kuliah', 'D. tetap melanjutkan kuliah, sambil mencari pekerjaan untuk membiayai kuliah', 'E.  menunda kuliah sampai memiliki dana yang cukup', 1, 4, 2, 5, 3, NULL, 'A = 1\nB = 4\nC = 2\nD = 5\nE = 3', ''),
(3977, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Dalam rangka memperingati hari pelanggan, tempat anda bekerja berencana memberikan reward pada pelanggan. Konsep yang akan anda berikan sebagai tim kreatif adalah â€¦', 64, 'A. memberikan souvenir tanda terima kasih pada setiap pengunjung', 'B. buy one get one free untuk produk tertentu', 'C. potongan diskon 50% untuk produk tertentu', 'D. memberikan voucher untuk pembelanjaan berikutnya', 'E. memberi potongan tertentu dengan syarat dan ketentuan berlaku', 5, 4, 3, 1, 2, NULL, 'A = 5\nB = 4\nC = 3\nD = 1\nE = 2', ''),
(3978, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Terdapat pelanggan terlibat pertengkaran dengan pelanggan lain. Melihat hal tersebut anda akan â€¦', 65, 'A. mengusir mereka', 'B. meminta satpam melerai', 'C. melaporkan pada pihak berwajib', 'D. mengejak menyelesaikan masalah di ruang tertentu', 'E.  meminta ganti rugi karena telah membuat kegaduhan', 1, 4, 3, 5, 2, NULL, 'A = 1\nB = 4\nC = 3\nD = 5\nE = 2', ''),
(3979, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Teman saya melakukan tindakan yang sangat tidak saya sukai. Saya akan melakukan â€¦', 66, 'A. membiarkannya saja sampai ia berubah sendiri', 'B. memberitahukan tindakannya tersebut kepada teman yang lain', 'C. membicarakannya baik-baik dan menjelaskan bahwa saya tidak suka dengan tindakannya', 'D. menegur dan memarahinya agar dia tidak mengulanginya', 'E.  memutuskan pertemanan dengannya', 3, 2, 5, 4, 1, NULL, 'A = 3\nB = 2\nC = 5\nD = 4\nE = 1', ''),
(3980, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Masa kontrak kerja anda sudah habis, maka anda akan â€¦', 67, 'A. malas-malasan', 'B. bekerja seperti biasa', 'C. bekerja dengan lebih giat agar meninggalkan kesan yang baik', 'D. bekerja dengan giat agar dilirik atasan', 'E.  bekerja semampunya', 1, 4, 5, 2, 3, NULL, 'A = 1\nB = 4\nC = 5\nD = 2\nE = 3', ''),
(3981, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Suatu ketika anda menyapa teman anda, tetapi ternyataanda salah orang, maka anda akan â€¦', 68, 'A. pura-pura tidak terjadi apapun', 'B. meminta maaf sembari berlalu', 'C. meminta maaf dan sedikit basa-basi', 'D. malu dan mood rusak seharian', 'E.  biasa aja', 4, 2, 3, 1, 5, NULL, 'A = 4\nB = 2\nC = 3\nD = 1\nE = 5', ''),
(3982, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Dalam menghadapi suatu masalah biasanya saya akan â€¦', 69, 'A. tidak semangat dalam bekerja', 'B. merenung dan introspeksi diri', 'C. stres dan mudah marah', 'D. mencari hiburan untuk menenangkan diri', 'E.  mengomunikasikan masalah saya dengan teman dekat', 2, 5, 1, 3, 4, NULL, 'A = 2\nB = 5\nC = 1\nD = 3\nE = 4', ''),
(3983, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Saat sedang dikejar deadline tugas yang penting, datang seorang tamu yang meminta informasi suatu tempat di kantor keada saya, sikap saya adalah â€¦', 70, 'A. mengantarkan tamu tersebut sampai ke tujuannya', 'B. menelepon tempat tujuan tamu, dan memintanya menjemput tamu tersebut di ruangan saya', 'C. memberi petunjuk arah ke tempat tujuan tamu tersebut dan kemudian melanjutkan pekerjaan', 'D. mengacuhkannya sampai tamu tersebut dengan sendirinya keluar dari ruangan saya', 'E.  tetap fokus pada pekerjaan saya, dan meminta orang lain untuk mengantarkan tamu tersebut ke tempat tujuan', 5, 3, 4, 1, 2, NULL, 'A = 5\nB = 3\nC = 4\nD = 1\nE = 2', ''),
(3984, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Saya menjadi sasaran kemarahan atasan atas kesalahan yang dilakukan oleh rekan setim saya. Yang saya lakukan adalah â€¦', 71, 'A. menganggap itu sebagai pelajaran buat saya agar lebih berhati-hati dalam bekerja', 'B. menjelaskan pada atasan bahwa itu bukan karena kesalahan saya', 'C. menerima kemarahan atasan meskipun itu bukan kesalahan saya', 'D. tidak terima dan mengadukan teman yang membuat masalah tersebut', 'E.  menegur teman saya dan memintanya menjelaskan masalah yang sebenarnya kepada atasan', 5, 4, 1, 2, 3, NULL, 'A = 5\nB = 4\nC = 1\nD = 2\nE = 3', ''),
(3985, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Anda sedang berada dalam kendaraan umum yang penuh sesak dengan penumpang, anda juga sedang terburu-buru karena ada tugas yang harus segera diselesaikan, namun sopir masih berhenti dan menunggupenumpang lain, sikap anda adalah â€¦', 72, 'A. marah pada sopir', 'B. menggerutu', 'C. biasa saja', 'D. turun dari kendaraan umum', 'E.  bersabar', 1, 2, 4, 3, 5, NULL, 'A = 1\nB = 2\nC = 4\nD = 3\nE = 5', ''),
(3986, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Kerabat dekat saya menawarkan saya posisi strategis di perusahaannya tanpa harus melewati proses perekrutan, sedangkan saya kebetulan sedang mecari pekerjaan. Maka yang akan saya lakukan adalah â€¦', 73, 'A. Menerima tawaran tersebut karena dia adalah kerabat saya', 'B. Meminta pendapat dari orang tua terlebih dahulu', 'C. Menolaknya karena saya ingin diterima melalui proses resmi', 'D. Mencoba proses resmi terlebih dahulu sebelum menerima tawaran tersebut', 'E. Mempertimbangkan segala sesuatu terlebih dahulu', 1, 3, 5, 2, 4, NULL, 'A = 1\nB = 3\nC = 5\nD = 2\nE = 4', ''),
(3987, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Dalam perjalanan hidup, sifat utama yang harus dimiliki oleh seseorang adalahâ€¦', 74, 'A. Ulet', 'B. Disiplin', 'C. Berani', 'D. Rajin', 'E.  Jujur', 3, 4, 1, 2, 5, NULL, 'A = 3\nB = 4\nC = 1\nD = 2\nE = 5', ''),
(3988, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Rekan kerja saya tidak menyukai kinerja yang saya lakukan, saya menyikapinya denganâ€¦ ', 75, 'A. Meningkatkan kinerja saya untuk kedepannya', 'B. Cuek dan tetap fokus berkerja', 'C. Orang lain boleh menilai saya tapi saya yang tahu kualitas diri saya', 'D. Introspeksi diri', 'E. Mencari tahu siapa yang tidak menyukai kinerja saya', 5, 2, 3, 4, 1, NULL, 'A = 5\nB = 2\nC = 3\nD = 4\nE = 1', ''),
(3989, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Dalam mengikuti suatu kompetisi, saya mengalami kekalahan. Perasaan yang sayaâ€¦', 76, 'A. Biasa saja, menang atau kalah itu biasa saja', 'B. Tetap bersemangat agar memenangkan kompetensi selanjutnya', 'C. Sedih sehingga tidak mau ikut kompetensi lagi', 'D. Kecewa dan tidak terima', 'E.  Malu dan menyesal telah ikut kompetensi', 4, 5, 2, 3, 1, NULL, 'A = 4\nB = 5\nC = 2\nD = 3\nE = 1', ''),
(3990, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Bekerja merupakan upaya meraih kesuksesan, maka upaya saya adalahâ€¦ ', 77, 'A. Bekerja berdasarkan kontrak kerja', 'B. Bekerja sampai larut malam', 'C. Bekerja keras', 'D. Berusaha mengatasi orang yang menghalangi saya', 'E.  Bekerja dengan disiplin dan mengusahakan yang terbaik', 2, 1, 4, 3, 5, NULL, 'A = 2\nB = 1\nC = 4\nD = 3\nE = 5', ''),
(3991, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Ketika saya diminta melakukan pekerjaan berat, sayaâ€¦ ', 78, 'A. Menolaknya', 'B. Mempertimbangkan dulu untuk menerimanya', 'C. Merasa tertantang melaksanakan pekerjaan itu', 'D. Tetap menerimanya meskipun tidak suka dengan pekerjaan itu', 'E.  Menyerahkan pekerjaan tersebut pada orang lain', 2, 3, 5, 4, 1, NULL, 'A = 2\nB = 3\nC = 5\nD = 4\nE = 1', ''),
(3992, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Ketika usulan yang saya ajukan dianggap kurang tepat oleh atasan, maka sikap sayaâ€¦', 79, 'A. Mencoba mencari alternatif usulan lain yang lebih tepat untuk diajukan lagi', 'B. Merasa kecewa tetapi tetap berusaha melupakan penolakan tersebut', 'C. Sangat kecewa', 'D. Bersikeras memberikan alasan dan pembenaran atas usulan tersebut', 'E.  Membiarkan saja', 5, 4, 3, 2, 1, NULL, 'A = 5\nB = 4\nC = 3\nD = 2\nE = 1', ''),
(3993, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Yang akan saya lakukan saat hari pertama ditempatkan di sebuah tempat tugas yang baru adalahâ€¦ ', 80, 'A. Menyapa rekan kerja baru dan bertanya tentang sistem kerja di tempat tersebut', 'B. Mempelajari sistem kerja di tempat tersebut dari peraturan dan data yang ada', 'C. Mencari tahu apa yang harus saya kerjakan', 'D. Diam saja sambil mengamati sistem kerja pegawai di tempat tersebut', 'E.  Menunggu Perintah dari atasan', 5, 4, 3, 2, 1, NULL, 'A = 5\nB = 4\nC = 3\nD = 2\nE = 1', ''),
(3994, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Pertama kali yang anda lakukan saat datang ke kantor di pagi hari adalahâ€¦ ', 81, 'A. Menyapa rekan kerja baru dan bertanya tentang sistem kerja di tempat tersebut', 'B. Mempelajari sistem kerja di tempat tersebut dari peraturan dan data yang ada', 'C. Mencari tahu apa yang harus saya kerjakan', 'D. Diam saja sambil mengamati sistem kerja pegawai di tempat tersebut', 'E.  Menunggu Perintah dari atasan', 2, 1, 3, 5, 4, NULL, 'A = 2\nB = 1\nC = 3\nD = 5\nE = 4', ''),
(3995, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Ketika Anda pindah rumah, Anda akanâ€¦', 82, 'A. Biasa-biasa saja', 'B. Membagikan makanan pada tetangga', 'C. Mengundang para tetangga ke ruman Anda', 'D. Membawa serta keluarga Anda kesana', 'E.  Mengundang rekan kerja ke rumah Anda', 1, 4, 5, 3, 1, NULL, 'A = 1\nB = 4\nC = 5\nD = 3\nE = 1', ''),
(3996, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Saya diutus untuk menghadiri seminar menggantikan atasan saya. Pada saat yang bersamaan saya sedang mengerjakan laporan yang tidak terlalu mendesak â€¦', 83, 'A. Saya akan selesaikan terlebih dahulu laporan tersebut, sebab bisa saja diminta oleh atasan sewaktu-waktu', 'B. Laporan tersebut akan menjadi merepotkan kalau tertunda.', 'C. Saya akan menghadiri seminar tersebut agar dapat menghindar dari tugas laporan.', 'D. Saya akan menghadiri seminar tersebut karena laporan belum harus segera diserahkan kepada atasan.', 'E.  Saya bisa menghadiri seminar dan mengerjakan laporannya nanti saja.', 5, 3, 4, 1, 2, NULL, 'A = 5\nB = 3\nC = 4\nD = 1\nE = 2', ''),
(3997, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Saya ditugaskan untuk memimpin suatu proyek di kantor dengan deadline yang sangat singkat. Rekan kerja saya menunjukkan sikap tidak peduli terhadap tugas dalam proyek tersebut. Sikap saya adalah ....', 84, 'A. Bekerja sendiri menyelesaikan tugas tersebut.', 'B. Memberi peringatan pada rekan kerja saya dan mengancam akan mengeluarkan mereka yang tidak serius dalam proyek.', 'C. Melaporkan pada atasan agar mereka mendapat sanksi.', 'D. Membagi tugas sesuai dengan porsi masing-masing secara adil dan tetap memotovasi mereka untuk menyelesaikan tugasnya.', 'E.  Memberikan nasihat pada mereka agar mau menyelesaikan tugasnya.', 2, 3, 1, 5, 4, NULL, 'A = 2\nB = 3\nC = 1\nD = 5\nE = 4', ''),
(3998, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Saya diminta menyelesaikan laporan program kreativitas mahasiswa dalam rangka memonitor dan mengevaluasi dengan waktu yang sangat terbatas dan mendadak. Anggota kelompok saya justru menunjukkan sikap tidak peduli terhadap tugas-tugasnya. Sikap saya adalah .... ', 85, 'A. Bekerja sendiri yang penting laporan selesai.', 'B. Mengancam mengeluarkan teman yang tidak serius mengerjakan tugas.', 'C. Melaporkan mereka pada pembimbing program krativitas mahasiswa.', 'D. Membagi tugas secara adil dan memotivasi anggota agar menyelesaikannya.', 'E. Menasihati agar mereka sadar dengan penyelesaian tugas yang diembannya', 2, 3, 1, 5, 4, NULL, 'A = 2\nB = 3\nC = 1\nD = 5\nE = 4', ''),
(3999, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Saya akan meminta tanda tangan salah satu dosen untuk pengesahan KTTA saya. Kebetulan sudah satu minggu dosen tersebut tidak ke kampus, pihak kampus memyarankan saya untuk pergi ke rumah beliau. Saat pergi ke rumah dosen tersebut, ternyata keluarganya memberitahu bahwa tangan dosen tersebut sedang terkena stroke dan tidak bisa memberikan tanda tangan. Sikap saya.....', 86, 'A. Menunggu sampai dosen tersebut sembuh dari stroke', 'B. Menjelaskan kepada pihak kampus tentang keadaan dosen tersebut dan meminta pertimbangan dari kampus jika tanda tangan pengesaham bisa diwakilkan oleh dosen lain', 'C. Tidak memaksa dosen tersebut untuk tanda tangan', 'D. Marah marah karena merasa dipersulit', 'E.  Protes pada pihak kampus', 4, 5, 3, 2, 1, NULL, 'A = 4\nB = 5\nC = 3\nD = 2\nE = 1', ''),
(4000, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Sebagai seorang bidan sudah menjadi tanggung jawab saya untuk membantu orang yang akan melahirkan. Tengah malam seorang warga datang ke rumah karena istrinya akan melahirkan padahal saat itu saya baru saja pulang dari kota dan masih dalam keadaan lelah. Sikap saya.....', 87, 'A. Menolak membantu karena masih lelah', 'B. Membantu sebagai bentuk tanggung kawab dan kepedulian', 'C. Menyarankan untuk mendatangi bidan lain', 'D. Mengusir karena sangat menganggu', 'E.  Membantu semampunya', 2, 5, 3, 1, 4, NULL, 'A = 2\nB = 5\nC = 3\nD = 1\nE = 4', ''),
(4001, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Prediksi pengamat ekonomi bahwa bulan depan akan terjadi inflasi besar di Indonesia membuat sayaâ€¦', 88, 'A. Susah tidur', 'B. Depresi berat, karena inflasi berarti harga barang naik', 'C. Berhati-hati dan berhemat dalam membelanjakan uang', 'D. Yang akan terjadi, biarlah terjadi', 'E.  Prediksi yang menyusahkan seperti itu tak perlu saya percayai', 4, 1, 5, 3, 2, NULL, 'A = 4\nB = 1\nC = 5\nD = 3\nE = 2', ''),
(4002, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Bila ada rekan kerja yang salah memanggil nama saya, maka sayaâ€¦', 89, 'A. Saya tersinggung, karena nama adalah kehormatan seseorang', 'B. Saya tidak tersinggung', 'C. Saya mengingatkan kekeliruannya dengan baik baik', 'D. Saya mengingatkannya dengan tegas agar dia jera', 'E.  Hal itu tak menjadi masalah bagi saya', 1, 5, 3, 2, 4, NULL, 'A = 1\nB = 5\nC = 3\nD = 2\nE = 4', ''),
(4003, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Jika hal-hal kecil merusak rencana besar saya, maka... ', 90, 'A. Saya sangat sedih dan marah kenapa hal kecil mampu merusak rencana besar tersebut', 'B. Tentu saja saya marah', 'C. Saya melakukan evaluasi menyeluruh', 'D. Saya butuh waktu menenangkan diri', 'E.  Saya marah kepada pihak lain yang juga ikut bertanggung jawab akan hal ini.', 3, 2, 5, 4, 1, NULL, 'A = 3\nB = 2\nC = 5\nD = 4\nE = 1', ''),
(4004, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Jika dalam suatu rapat, rekan kantor memiliki pendapat yang berbeda, padahal Anda-lah yang menjadi pemimpin rapat, maka: â€¦', 91, 'A. Saya teguh mempertahankan pendapat saya', 'B. Beda pendapat bukanlah masalah serius', 'C. Saya pertimbangkan pendapat tersebut', 'D. Saya lihat dulu siapa dia', 'E. Menanyakannya mengapa dia berani berbeda pendapat dengan pemimpin rapat', 3, 4, 5, 2, 1, NULL, 'A = 3\nB = 4\nC = 5\nD = 2\nE = 1', ''),
(4005, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Anda akan bekerja secara maksimal ketika ... ', 92, 'A. Diawasi atasan', 'B. Diawasi maupun tidak diawasi atasan', 'C. Dibawah tekanan', 'D. Dalam mood yang baik', 'E. Berada di tempat yang nyaman', 2, 5, 1, 4, 3, NULL, 'A = 2\nB = 5\nC = 1\nD = 4\nE = 3', ''),
(4006, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Ketika Anda dipercaya melakukan tugas baru dan berisiko besar, maka Anda akan ... ', 93, 'A. Mundur', 'B. Menolaknya secara tegas', 'C. Meminta Pertimbangan ulang', 'D. Antusias', 'E. Menyanggupinya dengan sedikit ragu', 1, 2, 3, 5, 4, NULL, 'A = 1\nB = 2\nC = 3\nD = 5\nE = 4', ''),
(4007, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Apabila Anda mendapati rekan kerja yang suka menunda pekerjaan, sikap Anda adalah â€¦', 94, 'A. Membiarkannya karena itu biasa terjadi', 'B. Menasihatinya', 'C. Melaporkannya pada atasan', 'D. Menegur dan mengingatkannya', 'E. Menggunjingnya dengan rekan yang lain', 1, 4, 3, 5, 2, NULL, 'A = 1\nB = 4\nC = 3\nD = 5\nE = 2', ''),
(4008, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Anda senang jika datang ke sebuah restoran yang ... ', 95, 'A. Pelayanannya ramah dan cekatan', 'B. Cepat membuat pesanan Anda', 'C. Makanannya enak walau lama', 'D. Murah', 'E. Mahal', 5, 4, 3, 2, 1, NULL, 'A = 5\nB = 4\nC = 3\nD = 2\nE = 1', ''),
(4009, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Jika bekerja dibawah tekanan, maka Anda akan â€¦', 96, 'A. Baper', 'B. Biasa saja', 'C. Selalu tersenyum', 'D. Marah', 'E. Butuh waktu sendiri', 2, 5, 4, 1, 3, NULL, 'A = 2\nB = 5\nC = 4\nD = 1\nE = 3', ''),
(4010, 'TryoutUSMSTAN-0828124647', 'Soal 2', 'Saya mengharapkan kondisi kerja yang â€¦', 97, 'A. Menghasilkan pendapatan tambahan', 'B. Menyediakan stabilitas Pekerjaan', 'C. Memungkinkan promosi', 'D. Ada kesempatan aktualisasi diri', 'E. Memotivasi untuk lebih giat bekerja', 1, 2, 3, 4, 5, NULL, 'A = 1\nB = 2\nC = 3\nD = 4\nE = 5', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_jawaban_quipper`
--

CREATE TABLE `data_jawaban_quipper` (
  `id` int(11) NOT NULL,
  `kode_soal` varchar(200) DEFAULT NULL,
  `jenis_soal` varchar(200) NOT NULL,
  `soal` text,
  `nomor` int(11) DEFAULT NULL,
  `pilihan_a` text,
  `pilihan_b` text,
  `pilihan_c` text,
  `pilihan_d` text,
  `pilihan_e` varchar(200) DEFAULT NULL,
  `nilai_a` int(11) DEFAULT NULL,
  `nilai_b` int(11) DEFAULT NULL,
  `nilai_c` int(11) DEFAULT NULL,
  `nilai_d` int(11) DEFAULT NULL,
  `nilai_e` int(11) DEFAULT '0',
  `gambar` varchar(200) DEFAULT NULL,
  `pembahasan` text,
  `video` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_jawaban_quipper`
--

INSERT INTO `data_jawaban_quipper` (`id`, `kode_soal`, `jenis_soal`, `soal`, `nomor`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`, `pilihan_e`, `nilai_a`, `nilai_b`, `nilai_c`, `nilai_d`, `nilai_e`, `gambar`, `pembahasan`, `video`) VALUES
(109, 'MateriVideo-20181123084939', 'Soal', 'Contoh Soal Menggunakan Image\n \n<img src=" //localhost/codester/cpns/image/181116014841Untitled - 1.png">\n', 1, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(110, 'MateriVideo-20181123084939', 'Soal', 'Contoh Soal Menggunakan Video \n\n<video controls> \n  <source src="//localhost/codester/cpns/video/videoplayback.mp4" type="video/mp4">\n</video>  ', 2, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(111, 'MateriVideo-20181123084939', 'Soal', 'Contoh Soal Menggunakan Embed Video Dari Youtube \n\n<iframe width="642" height="361" src="https://www.youtube.com/embed/iHughV05gj4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>', 3, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(112, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 4, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(113, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 5, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(114, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 6, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(115, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 7, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(116, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 8, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(117, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 9, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(118, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 10, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(119, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 11, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(120, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 12, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(121, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 13, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(122, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 14, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(123, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 15, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(124, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 16, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(125, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 17, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(126, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 18, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(127, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 19, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(128, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 20, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(129, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 21, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(130, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 22, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(131, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 23, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(132, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 24, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(133, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 25, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(134, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 26, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(135, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 27, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(136, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 28, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(137, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 29, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(138, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 30, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(139, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 31, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(140, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 32, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(141, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 33, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(142, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 34, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(143, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 35, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(144, 'MateriVideo-20181123084939', 'Soal', 'Ini Hanya Contoh Soal', 36, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(145, 'MateriVideo-20181125052215', 'Soal', 'Siapakah Nama saya', 1, 'Indra', 'Rani', 'Dwi', 'Putra', 'Indra Rani Dwi Putra', 0, 0, 0, 0, 1, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(146, 'MateriVideo-20181125052215', 'Soal', 'Siapakah Nama Nenek Saya', 2, 'Ani', 'Anto', 'Rambo', 'Alex', 'Kanto', 1, 0, 0, 0, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(147, 'MateriVideo-20181125052215', 'Soal', 'Contoh Soal Menggunakan Embed Video Dari Youtube \n\n<iframe width="642" height="361" src="https://www.youtube.com/embed/iHughV05gj4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>', 3, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(148, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 4, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(149, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 5, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(150, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 6, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(151, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 7, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(152, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 8, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(153, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 9, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(154, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 10, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(155, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 11, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(156, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 12, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(157, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 13, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(158, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 14, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(159, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 15, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(160, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 16, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(161, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 17, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(162, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 18, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(163, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 19, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(164, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 20, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(165, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 21, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(166, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 22, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(167, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 23, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(168, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 24, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(169, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 25, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(170, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 26, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(171, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 27, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(172, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 28, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(173, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 29, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(174, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 30, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(175, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 31, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(176, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 32, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(177, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 33, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(178, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 34, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(179, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 35, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', ''),
(180, 'MateriVideo-20181125052215', 'Soal', 'Ini Hanya Contoh Soal', 36, 'A. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'B. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'C. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'D. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 'E. Contoh Jawaban <b> BOLD </b> <i> ITALIC </i> <u>  UNDERLINE  </u>', 0, 0, 0, 1, 0, NULL, 'Ini Hanya Contoh Text Pembahasan . ', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_saran`
--

CREATE TABLE `data_saran` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) DEFAULT NULL,
  `text` text,
  `date` date DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `dibaca` varchar(200) DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_saran`
--

INSERT INTO `data_saran` (`id`, `judul`, `text`, `date`, `user_id`, `dibaca`) VALUES
(2, NULL, 'askdjhak jhdkj ahkdhask hdaksdh aksjdh aksdh akshd kas hkahsdkahsd kjahsdk ahdkahsd askdjhak jhdkj ahkdhask hdaksdh aksjdh aksdh akshd kas hkahsdkahsd kjahsdk ahdkahsd askdjhak jhdkj ahkdhask hdaksdh aksjdh aksdh akshd kas hkahsdkahsd kjahsdk ahdkahsd askdjhak jhdkj ahkdhask hdaksdh aksjdh aksdh akshd kas hkahsdkahsd kjahsdk ahdkahsd', '2018-07-05', 'indra21', 'No'),
(3, NULL, 'Testing', '2018-11-17', 'indra21', 'No'),
(4, NULL, 'Saya Komplain .', '2018-11-25', 'indra21', 'No');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_soal`
--

CREATE TABLE `data_soal` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `harga_premium` varchar(200) DEFAULT NULL,
  `kode_soal` varchar(200) DEFAULT NULL,
  `waktu_1` int(11) DEFAULT NULL,
  `waktu_2` int(11) DEFAULT NULL,
  `waktu_3` int(11) DEFAULT NULL,
  `lulus_1` int(11) DEFAULT NULL,
  `lulus_2` int(11) DEFAULT NULL,
  `lulus_3` int(11) DEFAULT NULL,
  `soal_1` int(11) DEFAULT NULL,
  `soal_2` int(11) DEFAULT NULL,
  `soal_3` int(11) DEFAULT NULL,
  `kategori` varchar(200) DEFAULT NULL,
  `nama_soal_1` varchar(200) NOT NULL,
  `nama_soal_2` varchar(200) NOT NULL,
  `nama_soal_3` varchar(200) NOT NULL,
  `mypoin` int(11) NOT NULL DEFAULT '0',
  `dibeli` int(11) DEFAULT '0',
  `using_password` varchar(200) DEFAULT 'No',
  `password` varchar(200) DEFAULT NULL,
  `masa_aktif` date DEFAULT NULL,
  `jenis_soal` varchar(20) DEFAULT NULL,
  `bonus_referral` int(11) DEFAULT '1',
  `mini` varchar(20) NOT NULL DEFAULT 'No',
  `kategori_soal` varchar(200) NOT NULL,
  `pisah` varchar(20) NOT NULL DEFAULT 'No',
  `active` varchar(20) NOT NULL DEFAULT 'Yes'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_soal`
--

INSERT INTO `data_soal` (`id`, `judul`, `tanggal`, `harga`, `harga_premium`, `kode_soal`, `waktu_1`, `waktu_2`, `waktu_3`, `lulus_1`, `lulus_2`, `lulus_3`, `soal_1`, `soal_2`, `soal_3`, `kategori`, `nama_soal_1`, `nama_soal_2`, `nama_soal_3`, `mypoin`, `dibeli`, `using_password`, `password`, `masa_aktif`, `jenis_soal`, `bonus_referral`, `mini`, `kategori_soal`, `pisah`, `active`) VALUES
(29, 'Testing Soal', '2019-08-28', 1, NULL, 'TryoutUSMSTAN-0828122737', 60, 60, 0, 70, 70, 0, 96, 96, 0, 'Tryout USM STAN', 'TPA', 'TBI', '', 0, 0, 'No', '3313231', NULL, NULL, 1, 'No', 'PKN STAN REGULER', 'Yes', 'Yes'),
(30, 'Testing Soal', '2019-08-28', 1, NULL, 'TryoutUSMSTAN-0828124647', 60, 60, 0, 70, 70, 0, 97, 97, 0, 'Tryout USM STAN', 'TPA', 'TBI', '', 0, 0, 'No', '3313231', NULL, NULL, 1, 'No', 'PKN STAN REGULER', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_tutorial_soal`
--

CREATE TABLE `data_tutorial_soal` (
  `id` int(11) NOT NULL,
  `kode_soal` varchar(200) DEFAULT NULL,
  `file` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `email_settings`
--

CREATE TABLE `email_settings` (
  `id` int(11) NOT NULL,
  `register` text,
  `pembayaran_diterima` text,
  `pembayaran_ditolak` text NOT NULL,
  `forgot` text,
  `withdrawal_selesai` text,
  `suspend` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `email_settings`
--

INSERT INTO `email_settings` (`id`, `register`, `pembayaran_diterima`, `pembayaran_ditolak`, `forgot`, `withdrawal_selesai`, `suspend`) VALUES
(1, 'Welcome to the Master Ship Member Website\n<br>\n<br> Please Always Remember Your User ID and Password.', 'Your Payment We Have Received. Enjoy Our Premium Services. thank you', 'Sorry. Payment Proof We Decline Because the Proof you entered is invalid / unclear. Please enter it again. thank you', 'We See You Forgot Your Account Password. Our Hope You Never Forgot Again With Your Password. to avoid sending error messages. thank you\n<br>', 'We have processed your withdrawal request.', 'Sorry. Our account is suspended for a while. due to things that might violate the rules of use. if you want to activate your account again please contact us below\n<br>\n<br> Contact Admin: 085244351343. Thank you');

-- --------------------------------------------------------

--
-- Struktur dari tabel `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) DEFAULT NULL,
  `text` text,
  `kategori` varchar(200) NOT NULL DEFAULT 'Tentang Tryout'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `faq`
--

INSERT INTO `faq` (`id`, `judul`, `text`, `kategori`) VALUES
(1, 'Contoh Faq 1', 'Ini Adalah Contoh Faq 1 \r<br> Bisa Saja Berisikan Beberapa Kalimat', 'Tentang Tryout'),
(2, 'Contoh Faq 2', 'Ini Adalah Contoh Faq 1 <br> Bisa Saja Berisikan Beberapa Kalimat', 'Tentang Tryout'),
(3, 'Contoh Faq 3', 'Ini Adalah Contoh Faq 1 <br> Bisa Saja Berisikan Beberapa Kalimat', 'Tentang Tryout'),
(4, 'Contoh Faq 4', 'Ini Adalah Contoh Faq 1 <br> Bisa Saja Berisikan Beberapa Kalimat', 'Tentang Tryout'),
(5, 'Contoh Faq 5', 'Ini Adalah Contoh Faq 1 <br> Bisa Saja Berisikan Beberapa Kalimat', 'Tentang Tryout'),
(6, 'Contoh Faq 6', 'Ini Adalah Contoh Faq 1 <br> Bisa Saja Berisikan Beberapa Kalimat', 'Tentang Tryout'),
(7, 'Testing Apa Saja', 'Hello Guys', 'Tentang Tryout'),
(8, 'Apa Itu Faq', 'Ini Adalah Testing Faq\r<br>', 'Testing Faq'),
(9, 'APa Itu Faq 2', 'Ini Adalah Testing Faq', 'Testing Faq');

-- --------------------------------------------------------

--
-- Struktur dari tabel `faq_category`
--

CREATE TABLE `faq_category` (
  `id` int(11) NOT NULL,
  `kategori` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `faq_category`
--

INSERT INTO `faq_category` (`id`, `kategori`) VALUES
(1, 'Tentang Tryout'),
(2, 'Testing Faq');

-- --------------------------------------------------------

--
-- Struktur dari tabel `faq_panduan`
--

CREATE TABLE `faq_panduan` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) DEFAULT NULL,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `faq_panduan`
--

INSERT INTO `faq_panduan` (`id`, `judul`, `text`) VALUES
(1, 'Contoh Panduan 1', 'Ini Adalah Contoh Faq 1 <br> Bisa Saja Berisikan Beberapa Kalimat'),
(2, 'Contoh Panduan 2', 'Ini Adalah Contoh Faq 1 <br> Bisa Saja Berisikan Beberapa Kalimat'),
(3, 'Contoh Panduan 3', 'Ini Adalah Contoh Faq 1 <br> Bisa Saja Berisikan Beberapa Kalimat'),
(4, 'Contoh Panduan 4', 'Ini Adalah Contoh Faq 1 <br> Bisa Saja Berisikan Beberapa Kalimat'),
(5, 'Contoh Panduan 5', 'Ini Adalah Contoh Faq 1 <br> Bisa Saja Berisikan Beberapa Kalimat'),
(6, 'Contoh Panduan 6', 'Ini Adalah Contoh Faq 1 <br> Bisa Saja Berisikan Beberapa Kalimat'),
(7, 'Contoh Panduan 7', 'Ini Adalah Contoh Faq 1 <br> Bisa Saja Berisikan Beberapa Kalimat'),
(8, 'Hello', 'Apa Ini');

-- --------------------------------------------------------

--
-- Struktur dari tabel `footer`
--

CREATE TABLE `footer` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  `column` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `footer`
--

INSERT INTO `footer` (`id`, `title`, `content`, `column`) VALUES
(1, 'Term &amp; Service', '&lt;div&gt;\r\n&lt;h2&gt;What is Lorem Ipsum?&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Lorem Ipsum&lt;/strong&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;div&gt;\r\n&lt;h2&gt;Why do we use it?&lt;/h2&gt;\r\n&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using `Content here, content here`, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for `lorem ipsum` will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div&gt;\r\n&lt;h2&gt;Where does it come from?&lt;/h2&gt;\r\n&lt;p&gt;Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.&lt;/p&gt;\r\n&lt;p&gt;The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.&lt;/p&gt;\r\n&lt;/div&gt;', 'Column 1'),
(2, 'Privacy Police', '&lt;div&gt;\r\n&lt;h2&gt;What is Lorem Ipsum?&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Lorem Ipsum&lt;/strong&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;div&gt;\r\n&lt;h2&gt;Why do we use it?&lt;/h2&gt;\r\n&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using `Content here, content here`, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for `lorem ipsum` will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div&gt;\r\n&lt;h2&gt;Where does it come from?&lt;/h2&gt;\r\n&lt;p&gt;Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.&lt;/p&gt;\r\n&lt;p&gt;The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.&lt;/p&gt;\r\n&lt;/div&gt;', 'Column 1'),
(3, 'About', '&lt;div&gt;\r\n&lt;h2&gt;What is Lorem Ipsum?&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Lorem Ipsum&lt;/strong&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;div&gt;\r\n&lt;h2&gt;Why do we use it?&lt;/h2&gt;\r\n&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using `Content here, content here`, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for `lorem ipsum` will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div&gt;\r\n&lt;h2&gt;Where does it come from?&lt;/h2&gt;\r\n&lt;p&gt;Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.&lt;/p&gt;\r\n&lt;p&gt;The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.&lt;/p&gt;\r\n&lt;/div&gt;', 'Column 1'),
(4, 'Contact', '&lt;div&gt;\r\n&lt;h2&gt;What is Lorem Ipsum?&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Lorem Ipsum&lt;/strong&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;div&gt;\r\n&lt;h2&gt;Why do we use it?&lt;/h2&gt;\r\n&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using `Content here, content here`, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for `lorem ipsum` will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div&gt;\r\n&lt;h2&gt;Where does it come from?&lt;/h2&gt;\r\n&lt;p&gt;Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.&lt;/p&gt;\r\n&lt;p&gt;The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.&lt;/p&gt;\r\n&lt;/div&gt;', 'Column 2'),
(5, 'Help', '&lt;div&gt;\r\n&lt;h2&gt;What is Lorem Ipsum?&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Lorem Ipsum&lt;/strong&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;div&gt;\r\n&lt;h2&gt;Why do we use it?&lt;/h2&gt;\r\n&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using `Content here, content here`, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for `lorem ipsum` will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div&gt;\r\n&lt;h2&gt;Where does it come from?&lt;/h2&gt;\r\n&lt;p&gt;Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.&lt;/p&gt;\r\n&lt;p&gt;The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.&lt;/p&gt;\r\n&lt;/div&gt;', 'Column 1'),
(6, 'Answer', '&lt;div&gt;\r\n&lt;h2&gt;What is Lorem Ipsum?&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Lorem Ipsum&lt;/strong&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;div&gt;\r\n&lt;h2&gt;Why do we use it?&lt;/h2&gt;\r\n&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using `Content here, content here`, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for `lorem ipsum` will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div&gt;\r\n&lt;h2&gt;Where does it come from?&lt;/h2&gt;\r\n&lt;p&gt;Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.&lt;/p&gt;\r\n&lt;p&gt;The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.&lt;/p&gt;\r\n&lt;/div&gt;', 'Column 2'),
(7, 'Worker', '&lt;div&gt;\r\n&lt;h2&gt;What is Lorem Ipsum?&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Lorem Ipsum&lt;/strong&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;div&gt;\r\n&lt;h2&gt;Why do we use it?&lt;/h2&gt;\r\n&lt;p&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using `Content here, content here`, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for `lorem ipsum` will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div&gt;\r\n&lt;h2&gt;Where does it come from?&lt;/h2&gt;\r\n&lt;p&gt;Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.&lt;/p&gt;\r\n&lt;p&gt;The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.&lt;/p&gt;\r\n&lt;/div&gt;', 'Column 2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `total` int(11) NOT NULL,
  `kode_unik` int(11) NOT NULL,
  `total_pembayaran` int(11) NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT 'Menunggu Pembayaran',
  `user_id` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `expired` date NOT NULL,
  `invoice` varchar(200) NOT NULL,
  `bukti` text,
  `status_bukti` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `invoice`
--

INSERT INTO `invoice` (`id`, `judul`, `total`, `kode_unik`, `total_pembayaran`, `status`, `user_id`, `date`, `expired`, `invoice`, `bukti`, `status_bukti`) VALUES
(8, 'Pendaftaran Member Entrance-Learning.com', 150000, 1, 150001, 'Menunggu Pembayaran', 'indra21', '2019-08-27', '0000-00-00', 'INV-201908270346491', '190827040846253.jpg', 'Diterima');

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice_buku`
--

CREATE TABLE `invoice_buku` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `provinsi` varchar(200) NOT NULL,
  `kota` varchar(200) DEFAULT NULL,
  `alamat` text,
  `nama_penerima` varchar(200) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `kode_unik` int(11) NOT NULL,
  `total_pembayaran` int(11) NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT 'Unpaid',
  `user_id` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(200) NOT NULL,
  `bukti` text,
  `status_bukti` varchar(200) DEFAULT NULL,
  `kurir` varchar(200) NOT NULL,
  `nama_buku` varchar(200) NOT NULL,
  `resi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `invoice_buku`
--

INSERT INTO `invoice_buku` (`id`, `judul`, `provinsi`, `kota`, `alamat`, `nama_penerima`, `total`, `kode_unik`, `total_pembayaran`, `status`, `user_id`, `date`, `invoice`, `bukti`, `status_bukti`, `kurir`, `nama_buku`, `resi`) VALUES
(1, 'Pembelian Buku Buku Jualan 1', 'Kalimantan Barat', 'Melawi', 'Perumnas Wekke`e Blok E No 53', 'Indra Rani', 100000, 0, 168001, 'Terkirim', 'indra21', '2019-08-27', 'INVB-1908270954226', '19082709582142.png', 'Diterima', 'POS Paket Kilat Khusus - Rp. 68000', 'Buku Jualan 1', '129381238'),
(2, 'Pembelian Buku Buku Jualan 1', 'Maluku Utara', 'Halmahera Tengah', 'Perumnas', 'Indra', 100000, 0, 158001, 'Menunggu Pembayaran', 'indra21', '2019-08-27', 'INVB-1908271021376', NULL, NULL, 'JNE OKE - Rp. 58000', 'Buku Jualan 1', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(2, 'Tutorial TIU 2018'),
(3, 'Tutorial TPA 2018'),
(4, 'Tutorial TWK 2018');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_soal`
--

CREATE TABLE `kategori_soal` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `total_soal` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori_soal`
--

INSERT INTO `kategori_soal` (`id`, `nama`, `total_soal`) VALUES
(6, 'Tryout USM STAN', 2),
(7, 'Tryout TPA-TBI', 2),
(8, 'Tryout SKD', 3),
(9, 'Tryout SPMB PKN STAN', 2),
(10, 'Tryout SKD 3 soal', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_image`
--

CREATE TABLE `list_image` (
  `id` int(11) NOT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `list_image`
--

INSERT INTO `list_image` (`id`, `image`) VALUES
(5, '181125053116181123101343314.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_video`
--

CREATE TABLE `list_video` (
  `id` int(11) NOT NULL,
  `video` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `list_video`
--

INSERT INTO `list_video` (`id`, `video`) VALUES
(1, 'videoplayback.mp4'),
(2, '181125052215181123084104videoplayback.mp4');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master`
--

CREATE TABLE `master` (
  `id` int(11) NOT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` text NOT NULL,
  `harga_poin` int(11) NOT NULL DEFAULT '15000',
  `bukalapak` text,
  `shopee` text,
  `tokopedia` text,
  `lazada` text,
  `telepon` varchar(200) NOT NULL,
  `whatsapp` varchar(200) NOT NULL,
  `telegram` text,
  `poin_uji` int(11) NOT NULL DEFAULT '1',
  `poin_uji_lulus` int(11) NOT NULL DEFAULT '1',
  `harga_premium` int(11) NOT NULL DEFAULT '100000',
  `aktif_video` varchar(20) NOT NULL DEFAULT 'No',
  `hubungi_kami` text NOT NULL,
  `id_kota` int(11) NOT NULL DEFAULT '336',
  `logo` varchar(200) NOT NULL DEFAULT 'logo.png',
  `background` varchar(200) NOT NULL DEFAULT '#2e9403'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `master`
--

INSERT INTO `master` (`id`, `user_id`, `password`, `name`, `description`, `harga_poin`, `bukalapak`, `shopee`, `tokopedia`, `lazada`, `telepon`, `whatsapp`, `telegram`, `poin_uji`, `poin_uji_lulus`, `harga_premium`, `aktif_video`, `hubungi_kami`, `id_kota`, `logo`, `background`) VALUES
(1, 'master', 'master', 'Entrance-Learning.com', 'Platform Tryout Online Spesialis CPNS, STAN dan Perguruan Tinggi Kedinasan', 150000, 'http://bukalapak.com', 'http://shopee.com', 'http://tokopedia.com', 'http://lazada.com', '085244351343', '085244351343', 'web.telegram.com', 1, 1, 100000, 'No', '&lt;p&gt;Ini Adalah Form Hubungi Kami&lt;/p&gt;', 336, 'logo.png', '#2e9403');

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi`
--

CREATE TABLE `materi` (
  `id` int(11) NOT NULL,
  `text` text,
  `judul` text NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `materi`
--

INSERT INTO `materi` (`id`, `text`, `judul`, `file`) VALUES
(10, '&lt;p&gt;Testing Materi&lt;/p&gt;', 'Contoh Materi', '190827testing.zip');

-- --------------------------------------------------------

--
-- Struktur dari tabel `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `user_to` varchar(200) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(200) DEFAULT NULL,
  `text` text,
  `read` varchar(20) DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `text` text,
  `user_id` varchar(200) DEFAULT NULL,
  `debet` double DEFAULT NULL,
  `kredit` double DEFAULT NULL,
  `read` varchar(20) DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `notifikasi`
--

INSERT INTO `notifikasi` (`id`, `date`, `text`, `user_id`, `debet`, `kredit`, `read`) VALUES
(156, '2018-07-02', 'Anda Mendapatkan Tambahan Poin Sebesari 100', 'indra21', NULL, 100, 'Yes'),
(157, '2018-07-03', 'Pembelian Soal Materi dan soal-soal tes CPNS - TIU ', 'Indra21', 10, NULL, 'Yes'),
(158, '2018-07-03', 'Pembelian Soal Soal Tryout TPA ', 'Indra21', 20, NULL, 'Yes'),
(159, '2018-07-03', 'Pembelian Materi Tutorial TPA ', 'Indra21', 20, NULL, 'Yes'),
(160, '2018-07-03', 'Pembelian Materi Tutorial TPA ', 'Indra21', 20, NULL, 'Yes'),
(161, '2018-07-03', 'Pembelian Soal Materi dan soal-soal tes CPNS 2017 ', 'indra21', 10, NULL, 'Yes'),
(162, '2018-07-04', 'Pembelian Materi Tutorial TIU ', 'indra21', 20, NULL, 'Yes'),
(163, '2018-07-04', 'Pembelian Soal Testing CPNS ', 'indra21', 10, NULL, 'Yes'),
(164, '2018-07-04', 'Pembelian Soal Biasa Soal Tryout Bahasa Inggris ', 'indra21', 10, NULL, 'Yes'),
(165, '2018-07-04', 'Pembelian Soal Biasa Soal Tryout Bahasa Inggris ', 'indra21', 10, NULL, 'Yes'),
(166, '2018-07-04', 'Pembelian Soal Materi dan soal-soal tes CPNS - TIU ', 'indra21', 10, NULL, 'Yes'),
(167, '2018-07-04', 'Pembelian Soal testing ', 'indra21', 10, NULL, 'Yes'),
(168, '2018-07-05', 'Pembelian Soal Biasa Contoh Enter ', 'indra21', 10, NULL, 'Yes'),
(169, '2018-07-05', 'Pembelian Soal Biasa Testing Image ', 'indra21', 10, NULL, 'Yes'),
(170, '2018-07-05', 'Pembelian Soal Biasa Testing Image ', 'indra21', 10, NULL, 'Yes'),
(171, '2018-10-23', 'Anda Mendapatkan Tambahan Poin Sebesari 100', 'indra21', NULL, 100, 'Yes'),
(172, '2018-10-23', 'Pembelian Soal Testing Apa Saja ', 'indra21', 10, NULL, 'Yes'),
(173, '2018-10-23', 'Pembelian Soal Soal Testing Lagi ', 'indra21', 10, NULL, 'Yes'),
(174, '2018-10-23', 'Pembelian Soal Soal Testing Lagi ', 'indra21', 10, NULL, 'Yes'),
(175, '2018-11-11', 'Pembelian Soal Soal Testing Lagi ', 'indra21', 10, NULL, 'Yes'),
(176, '2018-11-11', 'Pembelian Soal Soal Testing Lagi ', 'indra21', 10, NULL, 'Yes'),
(177, '2018-11-15', 'Pembelian Soal Soal Testing Lagi ', 'indra21', 20, NULL, 'Yes'),
(178, '2018-11-15', 'Pembelian Soal Soal Testing Lagi ', 'indra21', 10, NULL, 'Yes'),
(179, '2018-11-16', 'Pembelian Soal Contoh Soal Terakhir ', 'indra21', 1, NULL, 'No'),
(180, '2018-11-24', 'Anda Mendapatkan Tambahan Poin Sebesari 30', 'indra21', NULL, 30, 'No'),
(181, '2018-11-24', 'Anda Mendapatkan Tambahan Poin Sebesari 10', 'indra21', NULL, 10, 'No'),
(182, '2018-11-25', 'Anda Mendapatkan Tambahan Poin Sebesari 10', 'indra21', NULL, 10, 'No'),
(183, '2018-11-25', 'Pembelian Soal Judul Soal ', 'indra21', 0, NULL, 'No'),
(184, '2018-11-25', 'Pembelian Soal Soal Testing Lagi ', 'indra21', 20, NULL, 'No'),
(185, '2018-11-25', 'Pembelian Soal Soal Untuk Ngetest ', 'indra21', 0, NULL, 'No'),
(186, '2018-11-25', 'Pembelian Soal Contoh Soal Terakhir ', 'indra21', 1, NULL, 'No'),
(187, '2018-11-25', 'Pembelian Soal Soal Testing Lagi ', 'indra21', 20, NULL, 'No'),
(188, '2018-11-25', 'Pembelian Soal Soal Testing Lagi ', 'indra21', 20, NULL, 'No'),
(189, '2018-11-25', 'Pembelian Soal Soal Testing Lagi ', 'indra21', 20, NULL, 'No'),
(190, '2018-11-25', 'Pembelian Soal Soal Testing Lagi ', 'indra21', 20, NULL, 'No'),
(191, '2018-11-25', 'Pembelian Soal Soal Testing Lagi ', 'indra21', 20, NULL, 'No'),
(192, '2018-11-25', 'Anda Mendapatkan Tambahan Poin Sebesari 100', 'indra21', NULL, 100, 'No');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket_poin`
--

CREATE TABLE `paket_poin` (
  `id` int(11) NOT NULL,
  `nama_paket` varchar(200) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `kode_soal` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `paket_poin`
--

INSERT INTO `paket_poin` (`id`, `nama_paket`, `harga`, `kode_soal`) VALUES
(2, 'Paket Lengkap', 100, 'TIUmdhis,TPAmdhis,MT02125650,KT02125650'),
(3, 'Paket Biasa', 50, 'MT02125650,KT02125650');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permintaan_konfirmasi`
--

CREATE TABLE `permintaan_konfirmasi` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `bank_tujuan` varchar(200) DEFAULT NULL,
  `jenis_paket` varchar(200) DEFAULT NULL,
  `poin` int(11) DEFAULT NULL,
  `bukti` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT 'Menunggu Konfirmasi'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `permintaan_konfirmasi`
--

INSERT INTO `permintaan_konfirmasi` (`id`, `tanggal`, `user_id`, `bank_tujuan`, `jenis_paket`, `poin`, `bukti`, `status`) VALUES
(1, '2018-07-02', 'Indra21', 'BRI', 'Paket Hemat', 100, '180702110744Untitled - 1.png', 'Diterima');

-- --------------------------------------------------------

--
-- Struktur dari tabel `quipper_materi`
--

CREATE TABLE `quipper_materi` (
  `id` int(11) NOT NULL,
  `materi` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `quipper_materi`
--

INSERT INTO `quipper_materi` (`id`, `materi`) VALUES
(2, 'Kelas 10 Kurikulum 2016'),
(3, 'Kelas 11 Kurikulum 2016'),
(4, 'Kelas 12 Kurikulum 2016'),
(5, 'Kelas 10 Kurikulum 2017'),
(6, 'Kelas 11 Kurikulum 2017'),
(7, 'Kelas 12 Kurikulum 2017'),
(8, 'Materi Test');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ranking`
--

CREATE TABLE `ranking` (
  `id` int(11) NOT NULL,
  `judul_soal` varchar(200) DEFAULT NULL,
  `kode_soal` varchar(200) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `jurusan` varchar(200) NOT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `total_poin` int(11) DEFAULT NULL,
  `total_soal` int(11) DEFAULT NULL,
  `kategori` varchar(200) DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  `lulus` varchar(200) DEFAULT 'Tidak Lulus',
  `keterangan_poin` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ranking`
--

INSERT INTO `ranking` (`id`, `judul_soal`, `kode_soal`, `nama`, `jurusan`, `user_id`, `total_poin`, `total_soal`, `kategori`, `ranking`, `lulus`, `keterangan_poin`) VALUES
(1, NULL, NULL, 'Indra Rani', 'Diploma I Pajak', 'indra21', 89, 2, 'Tryout USM STAN', 1, 'Tidak Lulus', ''),
(2, NULL, NULL, 'Indra Rani', 'Diploma I Pajak', 'indra21', 31, 1, 'Soal Gratis', 1, 'Tidak Lulus', ''),
(3, 'Judul Soal', 'TryoutUSMSTAN-1125050410', 'Indra Rani', 'Reguler - Diploma I Pajak', 'indra21', 4, NULL, 'Tryout USM STAN', 1, 'Tidak Lulus ', ''),
(4, 'Contoh Soal Terakhir', 'TryoutUSMSTAN-1116023315', 'Indra Rani', 'Reguler - Diploma I Pajak', 'indra21', 3, NULL, 'Tryout USM STAN', 1, 'Tidak Lulus ', ''),
(5, 'Soal Testing Lagi', 'TryoutUSMSTAN-1023040912', 'Indra Rani', 'Reguler - Diploma I Pajak', 'indra21', 0, NULL, 'Tryout USM STAN', 1, 'Tidak Lulus ', ''),
(6, 'Testing Apa Saja', 'TryoutUSMSTAN-1023034429', 'Indra Rani', 'Reguler - Diploma I Pajak', 'indra21', 0, NULL, 'Tryout USM STAN', 1, 'Tidak Lulus ', ' TIU = 0 (Tidak Lulus) <br> TKP = 0 (Tidak Lulus) '),
(7, 'Testing Apa Saja', 'TryoutUSMSTAN-1023034429', 'Iksan', 'Diploma I Pajak', 'iksan', 0, NULL, 'Tryout USM STAN', 2, 'Tidak Lulus ', ' TIU = 0 (Tidak Lulus) <br> TKP = 0 (Tidak Lulus) '),
(8, 'Soal Testing Lagi', 'TryoutUSMSTAN-1023040912', 'Iksan', 'PKN STAN REGULER', 'iksan', 0, NULL, 'Tryout USM STAN', 2, 'Tidak Lulus ', 'keterangan_poin'),
(9, 'Testing Soal x', 'TryoutUSMSTAN-0827044037', 'indra', 'PKN STAN REGULER', 'indra21', 0, NULL, 'Tryout USM STAN', 1, 'Tidak Lulus ', 'keterangan_poin'),
(10, 'Testing Soal x', 'TryoutUSMSTAN-0827044037', 'indra', 'PKN STAN REGULER', 'indra21', 0, NULL, 'Tryout USM STAN', 2, 'Tidak Lulus ', 'keterangan_poin'),
(11, 'Testing Soal x', 'TryoutUSMSTAN-0827044037', 'indra', 'PKN STAN REGULER', 'indra21', 0, NULL, 'Tryout USM STAN', 3, 'Tidak Lulus ', 'keterangan_poin'),
(12, 'Judul Soal', 'TryoutUSMSTAN-1125050410', 'indra', 'PKN STAN REGULER', 'indra21', 0, NULL, 'Tryout USM STAN', 2, 'Tidak Lulus ', 'keterangan_poin'),
(13, 'Soal Testing Lagi', 'TryoutUSMSTAN-1023040912', 'indra', 'PKN STAN REGULER', 'indra21', 0, NULL, 'Tryout USM STAN', 3, 'Tidak Lulus ', 'keterangan_poin'),
(14, 'Testing No Mini', 'TryoutUSMSTAN-0827045029', 'indra', '', 'indra21', 0, NULL, 'Tryout USM STAN', 1, 'Tidak Lulus ', ' TPA = 0 (Tidak Lulus)  TPA = 0 (Tidak Lulus) ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_bonus`
--

CREATE TABLE `riwayat_bonus` (
  `id` int(11) NOT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `from` varchar(200) DEFAULT NULL,
  `keterangan` text,
  `bonus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `riwayat_bonus`
--

INSERT INTO `riwayat_bonus` (`id`, `user_id`, `date`, `from`, `keterangan`, `bonus`) VALUES
(1, 'aksj231823akj', '2018-11-15', 'Indra Rani', 'Bonus Dari Pembelian Soal Testing Lagi', 1),
(2, 'aksj231823akj', '2018-11-16', 'Indra Rani', 'Bonus Dari Pembelian Contoh Soal Terakhir', 1),
(3, 'aksj231823akj', '2018-11-25', 'Indra Rani', 'Bonus Dari Pembelian Soal Testing Lagi', 1),
(4, 'aksj231823akj', '2018-11-25', 'Indra Rani', 'Bonus Dari Pembelian Contoh Soal Terakhir', 1),
(5, 'aksj231823akj', '2018-11-25', 'Indra Rani', 'Bonus Dari Pembelian Soal Testing Lagi', 1),
(6, 'aksj231823akj', '2018-11-25', 'Indra Rani', 'Bonus Dari Pembelian Soal Testing Lagi', 1),
(7, 'aksj231823akj', '2018-11-25', 'Indra Rani', 'Bonus Dari Pembelian Soal Testing Lagi', 1),
(8, 'aksj231823akj', '2018-11-25', 'Indra Rani', 'Bonus Dari Pembelian Soal Testing Lagi', 1),
(9, 'aksj231823akj', '2018-11-25', 'Indra Rani', 'Bonus Dari Pembelian Soal Testing Lagi', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `statistik_soal`
--

CREATE TABLE `statistik_soal` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `nama_soal` varchar(200) DEFAULT NULL,
  `jenis_soal` varchar(200) DEFAULT NULL,
  `total_poin` int(11) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `kode` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `statistik_soal`
--

INSERT INTO `statistik_soal` (`id`, `date`, `nama_soal`, `jenis_soal`, `total_poin`, `user_id`, `kode`) VALUES
(1, '2018-11-06', 'Soal 1', 'TIU', 10, 'indra21', '123'),
(2, '2018-11-15', 'Soal 2', 'TIU', 30, 'indra21', '123'),
(3, '2018-11-06', 'Soal 1', 'TPA', 20, 'indra21', '123'),
(4, '2018-11-15', 'Soal 2', 'TPA', 60, 'indra21', '123'),
(5, '2018-11-06', 'Soal 1', 'TWK', 15, 'indra21', '123'),
(6, '2018-11-15', 'Soal 2', 'TWK', 20, 'indra21', '123'),
(7, '2018-11-06', 'Soal 1', 'TKP', 30, 'indra21', '123'),
(8, '2018-11-15', 'Soal 2', 'TKP', 80, 'indra21', '123'),
(9, '2018-11-06', 'Soal 1', 'TBI', 10, 'indra21', '123'),
(10, '2018-11-15', 'Soal 2', 'TBI', 30, 'indra21', '123'),
(11, '2018-11-06', 'Soal 1', 'TIU', 20, 'iksan21', '123'),
(12, '2018-11-15', 'Soal 2', 'TIU', 40, 'iksan21', '123'),
(13, '2018-11-06', 'Soal 1', 'TPA', 30, 'iksan21', '123'),
(14, '2018-11-15', 'Soal 2', 'TPA', 70, 'iksan21', '123'),
(15, '2018-11-06', 'Soal 1', 'TWK', 20, 'iksan21', '123'),
(16, '2018-11-15', 'Soal 2', 'TWK', 30, 'iksan21', '123'),
(17, '2018-11-06', 'Soal 1', 'TKP', 30, 'iksan21', '123'),
(18, '2018-11-15', 'Soal 2', 'TKP', 90, 'iksan21', '123'),
(19, '2018-11-06', 'Soal 1', 'TBI', 70, 'iksan21', '123'),
(20, '2018-11-15', 'Soal 2', 'TBI', 40, 'iksan21', '123'),
(21, '2019-08-27', 'Testing Apa Saja', 'TKP', 0, 'indra21', '19082701294526'),
(22, '2019-08-27', 'Soal Testing Lagi', 'TKP', 0, 'iksan', '19082703083458'),
(23, '2019-08-27', 'Judul Soal', 'TPA', 0, 'indra21', '19082711442764'),
(24, '2019-08-27', 'Soal Testing Lagi', 'TKP', 0, 'indra21', '19082711460855'),
(25, '2019-08-28', 'Testing No Mini', 'TPA', 0, 'indra21', '19082812015367'),
(26, '2019-08-28', 'Testing No Mini', 'TPA', 0, 'indra21', '19082812020131');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `telepon` varchar(200) DEFAULT NULL,
  `wa` varchar(200) DEFAULT NULL,
  `gelar` varchar(200) DEFAULT NULL,
  `sekolah` varchar(200) DEFAULT NULL,
  `foto` varchar(200) DEFAULT 'img.png',
  `poin` int(11) DEFAULT '0',
  `total_lulus` int(11) NOT NULL DEFAULT '0',
  `mypoin` int(11) NOT NULL DEFAULT '0',
  `jurusan` varchar(200) DEFAULT NULL,
  `group` varchar(200) DEFAULT NULL,
  `kemenkeu` varchar(20) NOT NULL DEFAULT 'No',
  `tgl_lahir` date DEFAULT NULL,
  `tempat_lahir` varchar(200) DEFAULT NULL,
  `tau` text,
  `referral` varchar(200) DEFAULT 'Admin',
  `kode_referral` varchar(200) DEFAULT NULL,
  `active` varchar(20) DEFAULT 'No',
  `premium` varchar(20) NOT NULL DEFAULT 'No',
  `sisa_free` int(11) NOT NULL DEFAULT '2',
  `kategori_tryout` varchar(200) NOT NULL,
  `batas_login` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `user_id`, `password`, `email`, `nama`, `telepon`, `wa`, `gelar`, `sekolah`, `foto`, `poin`, `total_lulus`, `mypoin`, `jurusan`, `group`, `kemenkeu`, `tgl_lahir`, `tempat_lahir`, `tau`, `referral`, `kode_referral`, `active`, `premium`, `sisa_free`, `kategori_tryout`, `batas_login`) VALUES
(6, 'indra21', '3313231', 'indra.novhyta@gmail.com', 'indra', '085244351343', '085244351343', NULL, NULL, 'img.png', 0, 0, 5, NULL, NULL, 'No', NULL, NULL, NULL, 'Admin', 'TwLKFaZObdtnHVyDpkVE', 'No', 'Yes', 2, 'PKN STAN REGULER', '2029-02-14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_jawab`
--

CREATE TABLE `user_jawab` (
  `id` int(11) NOT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `judul` varchar(200) DEFAULT NULL,
  `kode_soal` varchar(200) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `stop` datetime DEFAULT NULL,
  `date` date DEFAULT NULL,
  `poin_1` varchar(11) DEFAULT '0',
  `poin_2` varchar(11) DEFAULT '0',
  `poin_3` varchar(11) DEFAULT '0',
  `lulus_1` varchar(11) DEFAULT '-',
  `lulus_2` varchar(11) DEFAULT '-',
  `lulus_3` varchar(11) DEFAULT '-',
  `posisi` varchar(200) DEFAULT 'twk',
  `total_poin` int(11) DEFAULT '0',
  `kelulusan` varchar(20) DEFAULT 'Tidak Lulus',
  `selesai` varchar(200) DEFAULT 'Belum',
  `benar_1` varchar(11) NOT NULL DEFAULT '0',
  `kosong_1` varchar(11) NOT NULL DEFAULT '0',
  `salah_1` varchar(11) NOT NULL DEFAULT '0',
  `benar_2` varchar(11) NOT NULL DEFAULT '0',
  `salah_2` varchar(11) NOT NULL DEFAULT '0',
  `kosong_2` varchar(11) NOT NULL DEFAULT '0',
  `salah_3` varchar(11) NOT NULL DEFAULT '0',
  `benar_3` varchar(11) NOT NULL DEFAULT '0',
  `kosong_3` varchar(11) NOT NULL DEFAULT '0',
  `keterangan` text,
  `kategori` varchar(200) DEFAULT NULL,
  `judul_soal` varchar(200) DEFAULT NULL,
  `mini` varchar(20) NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_jawab`
--

INSERT INTO `user_jawab` (`id`, `user_id`, `nama`, `judul`, `kode_soal`, `start`, `stop`, `date`, `poin_1`, `poin_2`, `poin_3`, `lulus_1`, `lulus_2`, `lulus_3`, `posisi`, `total_poin`, `kelulusan`, `selesai`, `benar_1`, `kosong_1`, `salah_1`, `benar_2`, `salah_2`, `kosong_2`, `salah_3`, `benar_3`, `kosong_3`, `keterangan`, `kategori`, `judul_soal`, `mini`) VALUES
(15, 'indra21', 'indra21', 'Testing Soal Pangkat', 'TryoutUSMSTAN-0828120431', '2019-08-28 00:08:58', '2019-08-28 01:08:58', '2019-08-28', '0', '0', '0', '-', '-', '-', '1', 0, 'Tidak Lulus', 'Belum', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, NULL, 'No'),
(16, 'indra21', 'indra21', 'Testing Soal', 'TryoutUSMSTAN-0828121940', '2019-08-28 00:20:44', '2019-08-28 01:20:44', '2019-08-28', '0', '0', '0', '-', '-', '-', '1', 0, 'Tidak Lulus', 'Belum', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, NULL, 'No'),
(17, 'indra21', 'indra21', 'Testing Soal', 'TryoutUSMSTAN-0828122603', '2019-08-28 00:26:15', '2019-08-28 01:26:15', '2019-08-28', '0', '0', '0', '-', '-', '-', '1', 0, 'Tidak Lulus', 'Belum', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, NULL, 'No'),
(18, 'indra21', 'indra21', 'Testing Soal', 'TryoutUSMSTAN-0828122737', '2019-08-28 00:27:45', '2019-08-28 01:27:45', '2019-08-28', '0', '0', '0', '-', '-', '-', '1', 0, 'Tidak Lulus', 'Belum', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, NULL, 'No');

-- --------------------------------------------------------

--
-- Struktur dari tabel `voucher`
--

CREATE TABLE `voucher` (
  `id` int(11) NOT NULL,
  `kode` varchar(200) DEFAULT NULL,
  `poin` int(11) DEFAULT NULL,
  `using` varchar(200) DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `voucher`
--

INSERT INTO `voucher` (`id`, `kode`, `poin`, `using`) VALUES
(1, '23981auqoiweu12893123', 20, 'User Indra Rani'),
(2, 'qsPEXRjWwcVrhOMkzIpx', 100, 'No'),
(3, 'WBtjCcbqoxghfdkUyQPY', 100, 'No'),
(4, 'sFCDBAkhvPNdGmfwjgIX', 100, 'No'),
(5, 'fOaGiTLKuwZtmQRjFdvn', 100, 'No'),
(6, 'OZQjnVymfzBpsAUHCKLR', 100, 'No'),
(7, 'ZibCengOPASxuNoklGIP', 100, 'No'),
(8, 'lVTYZdCPOlpKeEwyugFB', 100, 'No'),
(9, 'vJecNZSVOQaDrdJEATfY', 100, 'No'),
(10, 'THgrdcwPIRjYsFSineTW', 100, 'No'),
(11, 'JWifRctlEVFVqPsOfCdS', 100, 'No'),
(12, 'oZxUcpdvOxbyrnAUImez', 10, 'No'),
(13, 'DbgvHYRnpiANOCcTtaAU', 10, 'No'),
(14, 'QmTjVFxOykudGqlUSWMC', 10, 'No'),
(15, 'fAwdGkBtrHXnmxUIKWis', 10, 'No'),
(16, 'leOkCwcLJnxavGUPZQVt', 10, 'No'),
(17, 'vdWTIFaYGOzJcKungiiU', 10, 'No'),
(18, 'qHgvEQaBLfhYFWRPbfdt', 10, 'No'),
(19, 'IdOrbTCcZGqixlJRLevu', 10, 'No'),
(20, 'IPOZawTHFhyEKrsjcMmr', 10, 'No'),
(21, 'zFvkmHybVMWikTfUASNl', 10, 'No'),
(22, 'AzobOuBKxqZqryAtfSNa', 10, 'No'),
(23, 'xZnJkwovufZsCcmAiWNQ', 10, 'No'),
(24, 'sHuibRJvnZDfwuCOaBxc', 10, 'No'),
(25, 'zESymdxWnNpHVlZGRfPB', 10, 'No'),
(26, 'GSjhWLDBfMisewglzKiE', 10, 'No'),
(27, 'nwLajUlfbzkZuWEuVDMm', 10, 'No'),
(28, 'utZWyNLSPCzTBqQhfroz', 10, 'No'),
(29, 'VMHmZPRMqdixOCeXofyp', 10, 'No'),
(30, 'HpZYRhmBbpoFSClvIeRs', 10, 'No'),
(31, 'maFAayqHwzxoORJbgDcC', 10, 'No'),
(32, 'gBpvfuqLaKvzQbDThNOY', 10, 'No'),
(33, 'wOLqAhDprZvysSUvjxBW', 10, 'No'),
(34, 'GMpSlmWYFqBrJimjvPko', 10, 'No'),
(35, 'XgNCjydkxbQRWaqhDJio', 10, 'No'),
(36, 'BYWqbjzugXETcCYDALGO', 10, 'No'),
(37, 'IslUPyeXtNBxYGECjhdR', 10, 'No'),
(38, 'wOAZvuWpRkiEXwmUjaEq', 10, 'No'),
(39, 'dTjpNkOazAigZyMhBRob', 10, 'No'),
(40, 'DwuEoNXnKGtvWsyAdKZR', 10, 'No'),
(41, 'QBKMYLAdjrvlCePawkvF', 10, 'No'),
(42, 'yElcsndGQtPxHSKdjEOU', 10, 'No'),
(43, 'xKwReJGdQNpbLjvatzZH', 10, 'No'),
(44, 'EvgIXAwyTfxijMSRZxKA', 10, 'No'),
(45, 'CLGfaEiIrXSHKqLpJBjb', 10, 'No'),
(46, 'NqlFBgXSoEYjaxjAivsU', 10, 'No'),
(47, 'RkyalAEGgVPKpvjzhnBd', 10, 'No'),
(48, 'aHUOMNuofIyPRXiPLpKt', 10, 'No'),
(49, 'MEGWaAuTlmgwHYcspUkS', 10, 'No'),
(50, 'qFojfjPAbpudvzBkTSQO', 10, 'No'),
(51, 'wQBIyNDSroEGfjkhMvca', 10, 'No'),
(52, 'RQNevnMnmFuWgKDbZBdY', 10, 'No'),
(53, 'DeLFPQWzrZdEITyZvidn', 10, 'No'),
(54, 'XlPbGsOJSvLNNwKRQikl', 10, 'No'),
(55, 'AFnkHDEwjxQbmJgeTGLh', 10, 'No'),
(56, 'euqOgrcPSKsfFRJVoFdy', 10, 'No'),
(57, 'KFtsyoqUZJoHKGxrBdQD', 10, 'No'),
(58, 'TftnfWKVhlgoXvJApsPY', 10, 'No'),
(59, 'YdTczNuZQKgXHRhfVySa', 10, 'No'),
(60, 'kxNVzfOFGyspSgpmMiju', 10, 'No'),
(61, 'ndTUxpKOeystfIEHFIcS', 10, 'No'),
(62, 'QEyXVjTCqrXhdvSHzitB', 10, 'No'),
(63, 'yeVXRLnpVQcZmrkoSaME', 10, 'No'),
(64, 'xkwQiDTrWAZMlIXndQcU', 10, 'No'),
(65, 'abdTfErlGXHtycAARuPO', 10, 'User Indra Rani'),
(66, 'wmNbVWcejEuFYPwAIgiJ', 10, 'No'),
(67, 'ngdKXszPBxThnZecIkYO', 10, 'No'),
(68, 'CQZcLywBcIzSWaoHdgie', 10, 'No'),
(69, 'yMCRiQBDkGVctzFSZTGa', 10, 'No'),
(70, 'ZPDCpYfgiOMKjwleRDyN', 10, 'No'),
(71, 'GRrYhwSBKPUiudJnsADc', 10, 'No'),
(72, 'wBpFjGKVOgdmUlSbCDqz', 10, 'No'),
(73, 'rHDmtLCvYHrgaewyJWph', 10, 'No'),
(74, 'zEzXLrfSNcBuDbYOxJVq', 10, 'No'),
(75, 'kivWOhqzXaMleNKDSpFU', 10, 'No'),
(76, 'apHyhDMbVJIwmZXbDUSs', 10, 'No'),
(77, 'eTUPMhaSDJAeymzNZciv', 10, 'No'),
(78, 'CqgaFWfplrTZAhPBIdCh', 10, 'No'),
(79, 'fQqMxLayFegoGPvcAsYw', 10, 'No'),
(80, 'zGiOHThrlAZUjrdRpnPv', 10, 'No'),
(81, 'UlIBhlkNmRCuJqErvYQD', 10, 'No'),
(82, 'OkZNGvyMtSRpBriTPsro', 10, 'No'),
(83, 'ZMwdOfVTjaYbogLvLyBN', 10, 'No'),
(84, 'bhvBfMjEEQdyPmciGNKA', 10, 'No'),
(85, 'AvuxnsLFcJUyCOmspTEW', 10, 'No'),
(86, 'NPkmzXITXwYovhHxcFBw', 10, 'No'),
(87, 'HnDeycEfpVHuTzsrJcZG', 10, 'No'),
(88, 'SOvLvwKNoxtnNFZzCjab', 10, 'No'),
(89, 'KCENqsznDlohIVbUoMyj', 10, 'No'),
(90, 'LqukDErNVPAgSoyewWIR', 10, 'No'),
(91, 'CbuqONDZRxXFWmgfMJzA', 10, 'No'),
(92, 'YuSInEjHwTlQPGLldcAJ', 10, 'No'),
(93, 'nZaMUDJCGRIoxfoImljh', 10, 'No'),
(94, 'qprQEIvdmSjTWVGhPjBs', 10, 'No'),
(95, 'jaAOzRYNdmctFeiELgZX', 10, 'No'),
(96, 'znwvRajFkfONYXeZAQmG', 10, 'No'),
(97, 'hgsLfanQDTKINSUzMFyk', 10, 'No'),
(98, 'eXrbYMkjIJMvzNRKqsOW', 10, 'No'),
(99, 'IUBQaPWepdTMjciSgZrv', 10, 'No'),
(100, 'LDsHXTWEwfAmjwtUucqg', 10, 'No'),
(101, 'KQPYmIjvbgkBnpChxfMD', 10, 'No'),
(102, 'OBlHiHsaYEPFirjWINtC', 10, 'No'),
(103, 'WBincEEQmZbdihoCkSMA', 10, 'No'),
(104, 'frkjYWVeNTozCgJfDQlZ', 10, 'No'),
(105, 'FvkYEMGKjwdptqDeTAcH', 10, 'No'),
(106, 'JdeOXjFkmUybhnZuxFsW', 10, 'No'),
(107, 'ZbfwBWNhOkHGDmILxceS', 10, 'No'),
(108, 'ZJckOSoNIzjdGmCnVTgL', 10, 'No'),
(109, 'eSMfEtYeCGailTIrxZcq', 10, 'No'),
(110, 'wAWnQxWpqumqOzIdZrRi', 10, 'No'),
(111, 'ZDKqFNujffNArxtPpdhG', 10, 'No'),
(112, 'QKojeZBRVfxFaipzOaUJ', 10, 'No'),
(113, 'iLVSnmtxFtHbwjKgFEBG', 10, 'No'),
(114, 'PwanulLUVJXDWHKxwpQc', 10, 'No'),
(115, 'ldfcCBMvLFOmUeuhaRXa', 10, 'No'),
(116, 'QvlbaMtHMUTofdANCuYe', 10, 'No'),
(117, 'zCCqANHnepbLPKmQBhVw', 10, 'No'),
(118, 'zHcFglAeUTmxIiEyqQrC', 10, 'No'),
(119, 'TGrjtHQuWJfFYCmqSQgM', 10, 'No'),
(120, 'WpSpdUCXqQHnxkMKmiIt', 10, 'No'),
(121, 'zmrCviKJBoGrUyZPqeER', 10, 'No'),
(122, 'vTmLQIudbKBnqwtPlhXH', 10, 'No'),
(123, 'SyHkPzrFRaxdtAVXqJpY', 10, 'No'),
(124, 'rEQaFAHoqHbTgKukmWIX', 10, 'No'),
(125, 'OzDPvBImQuSgJnVAQlMt', 10, 'No'),
(126, 'dCLKWlCDbTIjBeyVzahZ', 10, 'No'),
(127, 'kPNxlDgvsOdtqshLuQMC', 10, 'No'),
(128, 'jOkUJAtyMocCiWuVLmeP', 10, 'No'),
(129, 'soctNeSEaxDJhPmkMjTr', 10, 'No'),
(130, 'pBHOIszeHMdWVErTSLjw', 10, 'No'),
(131, 'SeuqaBtheDAxzgWwPcmX', 10, 'No'),
(132, 'ZmvPxaTjUfBCicOdlhIJ', 10, 'No'),
(133, 'CGDRdBUoMuLpTfFnbxKj', 10, 'No'),
(134, 'JklNIDbpYKPyvMdBZjgR', 10, 'No'),
(135, 'JpVIZrwNRMrtduqQgeAx', 10, 'No'),
(136, 'PnONpTUglWhzKwrAZEIc', 10, 'No'),
(137, 'KbYdEhwMafixIuGsFzgi', 10, 'No'),
(138, 'TUhrOVPNslXjAldyRKaO', 10, 'No'),
(139, 'LtNBMbXZRVloDFcwsWIK', 10, 'No'),
(140, 'xIhexYdwubZrBJOlasHA', 10, 'No'),
(141, 'hOBCNYfAJjyEjuzQxZLd', 10, 'No'),
(142, 'ONxKxBEDjeucVzvshFEQ', 10, 'No'),
(143, 'gDQTKYlihRLJErwkyGba', 10, 'No'),
(144, 'PDlFSVCRsEXkxudzeUTi', 10, 'No'),
(145, 'aiBscQfkCLmIJeOiyhVG', 10, 'No'),
(146, 'GKwlTjUvcfPqiQyxMFOx', 10, 'No'),
(147, 'tEGcNdsvVQLEAgZIpKHr', 10, 'No'),
(148, 'DlAFYPEKyxWIfHHtvdXu', 10, 'No'),
(149, 'kSltMYGyAtrJeHBERIVa', 10, 'No'),
(150, 'ZRpJDUgcCLvzHtyihSFy', 10, 'No'),
(151, 'oqBgfvDbKdyLezclWWGO', 10, 'No'),
(152, 'JbUlmVnjwfPLqDeLyiBS', 10, 'No'),
(153, 'qtDbuHAIBDQwjMRZvjxe', 10, 'No'),
(154, 'wAmSWEHfCVntdTOGoMyh', 10, 'No'),
(155, 'DqzAIQObowRhjPgQutWk', 10, 'No'),
(156, 'oZHibWnqQtVmPNKZwavJ', 10, 'No'),
(157, 'SUQhjNzZXDplRHsfmwrA', 10, 'No'),
(158, 'GXYzjosLhtgeDowPJdUW', 10, 'No'),
(159, 'OQwmInPskPHrXTvMBlto', 10, 'No'),
(160, 'icDxYXZFokwurKbtIpNg', 10, 'No'),
(161, 'insoMtkxgyLNTWIaONCH', 10, 'No'),
(162, 'QAwSgpSmqVrvIXtDsaBe', 10, 'No'),
(163, 'cRxslXHqgwadiLePrCYM', 10, 'No'),
(164, 'OmOqNYJuAXeiUhMxtSkC', 10, 'No'),
(165, 'sCEGPGaLqWAxVZohdunc', 10, 'No'),
(166, 'mSdYqGduhpQWSnkbVoyJ', 10, 'No'),
(167, 'LYMNwtXQfIoxjGeqHfTE', 10, 'No'),
(168, 'ZAPbPwmdwoVJKTcFCtDW', 10, 'No'),
(169, 'BntqxrowmuDbOCIOJVTX', 10, 'No'),
(170, 'tAMWzafGbyuRIBqUOnXV', 10, 'No'),
(171, 'WpExQhofUUIDPVJTKvye', 10, 'No'),
(172, 'CGTuNmnMfUqCfFsilcPd', 10, 'No'),
(173, 'XdtSfWoeRLEgTsYGqgNa', 10, 'No'),
(174, 'weQNRfUeFmzJIGdUEcls', 10, 'No'),
(175, 'AFBtAwYkKEzmiQzSWjGq', 10, 'No'),
(176, 'rkVJQEUpMZPKqUvweWsh', 10, 'No'),
(177, 'tnFqIvPumlfXSegpRABO', 10, 'No'),
(178, 'VsEeGhfLavrnktZFIxED', 10, 'No'),
(179, 'uFkBrLpfMKzqboOACNVQ', 10, 'No'),
(180, 'xiozsNFvPnyZdDTHbkgI', 10, 'No'),
(181, 'fWJwyGUTlAurZhCaDmFs', 10, 'No'),
(182, 'ukZTCNgUEwOGGrtfioBv', 10, 'No'),
(183, 'ANRBSOsrTdAonQgzatEL', 10, 'No'),
(184, 'JMTsnhfXUximgvXKbWQl', 10, 'No'),
(185, 'bCJpuondJWmOALsHrTVR', 10, 'No'),
(186, 'JWnVitzvNrGdlKUZobfQ', 10, 'No'),
(187, 'IHCEDjUumgkbRXUycWiO', 10, 'No'),
(188, 'YShaOkQqFXzvtBRvNdEc', 10, 'No'),
(189, 'CAmdvaiWeFXqnDPTjZGA', 10, 'No'),
(190, 'GMGJSTEkfdlqreABhLbC', 10, 'No'),
(191, 'RWpsqzwfdvEhRUhGuMQD', 10, 'No'),
(192, 'JanEBZlUMXGcnhzIbFoP', 10, 'No'),
(193, 'mJIdWRBzCjfpQNXQFhvj', 10, 'No'),
(194, 'LSLlwsUbBgAyWMnExdTv', 10, 'No'),
(195, 'NrfwmhkwGIKYTyzLPGpj', 10, 'No'),
(196, 'uYmpaEKdwPnGZSrqRzVU', 10, 'No'),
(197, 'VfyXynTeWYCGPIczvksS', 10, 'No'),
(198, 'CtoMDpbdsPZIrUcHOmzw', 10, 'No'),
(199, 'eTDCTspMWmHZqRjmydwJ', 10, 'No'),
(200, 'SBrLegTuIjqzcGaVCnhy', 10, 'No'),
(201, 'XKoYzvFCzpGxlNwJMHjI', 10, 'No'),
(202, 'GfEXxTyWJmrkFOeNMpwE', 10, 'No'),
(203, 'uBwvrczXwTDjnMlZEfGi', 10, 'No'),
(204, 'DxtVzOazrGLUREJwgKCT', 10, 'No'),
(205, 'vpCMToxsiVOwjZJZiRIk', 10, 'No'),
(206, 'BCoGhNWciqxiRSlzFrkw', 10, 'No'),
(207, 'CBDamlVMjTOPELGcpkre', 10, 'No'),
(208, 'rVMUyPfnkeIWpjOmHlGB', 10, 'No'),
(209, 'EKRHOFhsGNwCqirulMCV', 10, 'No'),
(210, 'HfaCNxwFizpBOEUDMQkJ', 10, 'No'),
(211, 'YSCSGywsceEnVqBPXtRQ', 10, 'No'),
(212, 'mfyqxtXrZuDOAqFdbJFR', 10, 'No'),
(213, 'KunbrvUcESjLeXVIJAFB', 10, 'No'),
(214, 'nDmHLtgWdEGIYvufcjAC', 10, 'No'),
(215, 'YQcdvPEkCzlRypUdYuAq', 10, 'No'),
(216, 'CzJTWIvURAPcLfezywkZ', 10, 'No'),
(217, 'rDmCLgQzjZbSloYofWBh', 10, 'No'),
(218, 'cdoLOeSovYUAiVXazCkn', 10, 'No'),
(219, 'OjerLEzSBSAmPzoGnQYu', 10, 'No'),
(220, 'LbyRcXsGQgJziEkpLrPV', 10, 'No'),
(221, 'fKaCAFtYQIxdToiRgpDM', 10, 'No'),
(222, 'xtURJQOLfyaqEcnCgsBe', 10, 'No'),
(223, 'SkXKGrCZtUvhXWYwazTc', 10, 'No'),
(224, 'gvCJPhlirRtxbMNYUsVc', 10, 'No'),
(225, 'HRvIOxnJCRlPXyTSQUfs', 10, 'No'),
(226, 'nDtwZjURIBJNYGAWcvRc', 10, 'No'),
(227, 'vfDYgizFoSMXsHwRKcAc', 10, 'No'),
(228, 'RCqmiYxfwgaKTzDPZenE', 10, 'No'),
(229, 'CShdieJVulAmpzZQGOpH', 10, 'No'),
(230, 'hjqgZIEJCRGdrznTAOoo', 10, 'No'),
(231, 'BMAGdNmEELHxaJqwVfke', 10, 'No'),
(232, 'UIVXlscJGjxtRyfLzKbP', 10, 'No'),
(233, 'JDsgVYloNqBaZdpGtWuS', 10, 'No'),
(234, 'mbIaEMkDeXtGnwUVFWmL', 10, 'No'),
(235, 'jqmJirxmPQRYoBNyJeus', 10, 'No'),
(236, 'PFAimGhrecMTOaWbNfjn', 10, 'No'),
(237, 'oGYKVBNVDjbXcPvFzdnm', 10, 'No'),
(238, 'AinRQxJSqTNyvcoUseMp', 10, 'No'),
(239, 'qhTEzRlLVOHDWpjexgoC', 10, 'No'),
(240, 'XTPorhZBIbfzNdWgmqHD', 10, 'No'),
(241, 'vLKcjnEiCtxWZDxTTShQ', 10, 'No'),
(242, 'txvHBOjLiQAnCzUTgIcH', 10, 'No'),
(243, 'EVknJxLrXtGtdmwsKbUG', 10, 'No'),
(244, 'saZlVXzZYDBKUnHLgwIf', 10, 'No'),
(245, 'KAUeJHmHNXeflkiRsVLT', 10, 'No'),
(246, 'NkCIobCpwiuSctPZTRjX', 10, 'No'),
(247, 'CKOFZsaBrSxNlyQogdhY', 10, 'No'),
(248, 'frRQqtZThInYBoGEvXcH', 10, 'No'),
(249, 'EDNjZgJsReaVZzkYgIHG', 10, 'No'),
(250, 'JVLRgGSiIDCqbawEZsmR', 10, 'No'),
(251, 'MZQVNXOVrRqGhtxUgndT', 10, 'No'),
(252, 'wMiUPdaSeAXtWRconTXp', 10, 'No'),
(253, 'ckVfIsJmrQbHMCOBivwU', 10, 'No'),
(254, 'jRUMQeuzwhLIEDVlOaPv', 10, 'No'),
(255, 'jGNJDYyLZxmgjrCFVbBR', 10, 'No'),
(256, 'XixqnOXNpIfeyZkWKBDr', 10, 'No'),
(257, 'cVmUwevbKZXATNDkcqRQ', 10, 'No'),
(258, 'YHdPQPAdfXlaGibqsRKy', 10, 'No'),
(259, 'wQgVIPGRmpdheREvgyJx', 10, 'No'),
(260, 'axUCQzjkvcFPlESdLhIZ', 10, 'No'),
(261, 'GpftaeYvzoZSaKHIOCTL', 10, 'No'),
(262, 'SfdrGhPvFznZAZlOgbRo', 10, 'No'),
(263, 'vQBHPqGbgxYtKdfsCzTJ', 10, 'No'),
(264, 'JCsMoaXifNbPdyQLhEYn', 10, 'No'),
(265, 'lEadpnOjAwZGvfuNoCxN', 10, 'No'),
(266, 'DoaWDpRPEmnAkNbgxoIQ', 10, 'No'),
(267, 'DMbheFgKtWJcwXOpCQzU', 10, 'No'),
(268, 'AoCDaHTFhkdiIrWwmxqO', 10, 'No'),
(269, 'gDMyrPwumsBBSlkooONV', 10, 'No'),
(270, 'KVGtFOJufXMaCqYyeRas', 10, 'No'),
(271, 'AxcbzjgLyQDCfSprBKXi', 10, 'No'),
(272, 'YEJlFMrrdhmjpsAgZABy', 10, 'No'),
(273, 'fLlvMHhcPGRHuwdlJQYj', 10, 'No'),
(274, 'bunrtlmkOAYIKTTqSeDR', 10, 'No'),
(275, 'CgsTfiSFmeDAfXEvPRcK', 10, 'No'),
(276, 'qzCbBSYscKfsIpLOAelJ', 10, 'No'),
(277, 'mOeqwLnXfYSTrkxhQPMY', 10, 'No'),
(278, 'BrmevjCxMFMHgNkIiGDi', 10, 'No'),
(279, 'CctgIanlkZvSZutLjeGN', 10, 'No'),
(280, 'xTHKRlbjNZkHvPpnzoAt', 10, 'No'),
(281, 'OXpFfxJhoPbBUdrKgWCA', 10, 'No'),
(282, 'UgJaVtZqhoSNdKDnXjmu', 10, 'No'),
(283, 'hPdNTTaueZRsEFyHwXcJ', 10, 'No'),
(284, 'kutnztDfPrSETBYCSavh', 10, 'No'),
(285, 'CAjyxLVDeUGtPvfinsZI', 10, 'No'),
(286, 'iMuDnOCKoHDxWqgUakeS', 10, 'No'),
(287, 'VxsjKEhLWFmvYBkElaeJ', 10, 'No'),
(288, 'NcrnAePyFzVoGQROOLxZ', 10, 'No'),
(289, 'tNrsOqjQmFLRuzpEOJfw', 10, 'No'),
(290, 'tlGpiEyUTSKxqLruYond', 10, 'No'),
(291, 'pXSmqOnuYaVsTMUGjxEH', 10, 'No'),
(292, 'AisYBeRJqoPVayMXWmxt', 10, 'No'),
(293, 'EZpOmMvViRONHGxrcLuc', 10, 'No'),
(294, 'dqHyiZGVZQNLMlslFITb', 10, 'No'),
(295, 'MrUxtoThZptICVMlLOiY', 10, 'No'),
(296, 'IKSToipFEayPLlcLuzRC', 10, 'No'),
(297, 'NDcvLfHBetcrGpmgQEyM', 10, 'No'),
(298, 'ELnKxHYPGNDbIMXqilvt', 10, 'No'),
(299, 'NrWZGByKjHJOMAdbfcip', 10, 'No'),
(300, 'EcDCTchQzOxwvmUjqJAI', 10, 'No'),
(301, 'VefykIzBDjGcpoRUdXHe', 10, 'No'),
(302, 'HXCJhAYmDFegbpqsEQxs', 10, 'No'),
(303, 'XrfJGPOWqBuecNcLbsRE', 10, 'No'),
(304, 'rTCcwAyKNyMxFpYlahoS', 10, 'No'),
(305, 'qZJSWuLcryvYPYEoexkR', 10, 'No'),
(306, 'FEcIbkWaHsGCgJyABFzm', 10, 'No'),
(307, 'ivthcmXRQowLUJdwGeBX', 10, 'No'),
(308, 'svPhUEjFrYLoZnBdgDNk', 10, 'No'),
(309, 'ENaBvhiXckpwFMfZznKY', 10, 'No'),
(310, 'WfkIRcXmobdfjNgMJuQh', 10, 'No'),
(311, 'mqrotDWOjeUwpbdIcyBZ', 10, 'No'),
(312, 'lpCwAQHKtMKTbtSPacOi', 10, 'No'),
(313, 'UWtgXoCFmYEfJuwOlbnN', 10, 'No'),
(314, 'gjDxXTzZEraUnhpQNBoV', 10, 'No'),
(315, 'hHEvgkdDbehFXLYcPqLI', 10, 'No'),
(316, 'zTqfmMaIYgHQmlGPOYiJ', 10, 'No'),
(317, 'fyuiPqIAXFEajhLBQTNz', 10, 'No'),
(318, 'AGygHZBfMYTHiCLsShbl', 10, 'No'),
(319, 'FhhctdLmBvxTUzqYoaZB', 10, 'No'),
(320, 'YolCRyMfdQMSutagWkwc', 10, 'No'),
(321, 'yQRmPbrLjMkNwHcJoEsh', 10, 'No'),
(322, 'hipFJOrjugUdZcNRoYQL', 10, 'No'),
(323, 'ezSiUCmOfxXbgELsownM', 10, 'No'),
(324, 'oDuvycepCYPGxJKEqbVf', 10, 'No'),
(325, 'WKDOrkoEaLLAnjGilogH', 10, 'No'),
(326, 'EKfmtHRSQoVuekCcbpXg', 10, 'No'),
(327, 'HGjYOxAEGgtcvRuTorXz', 10, 'No'),
(328, 'RIJAjKJLHBZyYGzuxaVt', 10, 'No'),
(329, 'hpDrmIfvtcAWibkNSXJE', 10, 'No'),
(330, 'TQHWqXxkXUVRAsZzoone', 10, 'No'),
(331, 'DIQnAMZRIuCFYcHzwhyq', 10, 'No'),
(332, 'AKlgCtnGyZuqDPxNEIci', 10, 'No'),
(333, 'FxvUXozSJLuEChcjZang', 10, 'No'),
(334, 'QQYVxhgUSzGcXLHFaimj', 10, 'No'),
(335, 'AZadcUPnqBDOAeXvKxpl', 10, 'No'),
(336, 'WiCNheqMKypwrvfVlUFG', 10, 'No'),
(337, 'bwYxaTXEjHZqmOvLIryd', 10, 'No'),
(338, 'wXZyCIozpdySsFjOBbfe', 10, 'No'),
(339, 'sxgiVkYeOQSbWaMvKcPA', 10, 'No'),
(340, 'jphsPGmIzAUmMBreFHqQ', 10, 'No'),
(341, 'FdzRPXjONbeQSivQeaCq', 10, 'No'),
(342, 'odYgRZCcNkLvznVpSbWq', 10, 'No'),
(343, 'yDVaGIglBpFeUfhBOJHK', 10, 'No'),
(344, 'HsiJknUMISDTprgCtxmV', 10, 'No'),
(345, 'vZtBhhaLFoYPwyqdUSMn', 10, 'No'),
(346, 'tFDebKsfgKwEZTXxSpQV', 10, 'No'),
(347, 'RUywiVQeDkbtIYLcWOhT', 10, 'No'),
(348, 'wNKTdsVgmsHeGtuRvqac', 10, 'No'),
(349, 'EzwfEmGNAbshCxULMwju', 10, 'No'),
(350, 'rUTVhKdmZEwjPqkfJAwO', 10, 'No'),
(351, 'VbBicHgatJgADLNnTdFZ', 10, 'No'),
(352, 'bjgHBmZVNEXLQiqfuDsn', 10, 'No'),
(353, 'StfKEPEpijasZOAWJnbM', 10, 'No'),
(354, 'RnyTkkJgzPaILVmWFbMj', 10, 'No'),
(355, 'JqkslNXnvRmkfMYSFtAF', 10, 'No'),
(356, 'bMeTIORasTLrGCqPKNqn', 10, 'No'),
(357, 'VEldSNAGIeFfaZgqHzsx', 10, 'No'),
(358, 'AkhMEjlwBYvFzNJNPxTp', 10, 'No'),
(359, 'TFjaQyEdRZoLixXmuGul', 10, 'No'),
(360, 'TygqWULEMGpSpoRdDicn', 10, 'No'),
(361, 'VTmnBFypMuUzaQPLJioU', 10, 'No'),
(362, 'omWQqRDCZMtLnBvjTxXF', 10, 'No'),
(363, 'JchztbNhdVmCIksyOqFT', 10, 'No'),
(364, 'DJyKzxCkAadvCGfujQqe', 10, 'No'),
(365, 'DZhdytGDmkXluzJRjbrS', 10, 'No'),
(366, 'WAoCBYOcXUfZSjpptLgF', 10, 'No'),
(367, 'dRNHEyAwaBnjhorWPbqz', 10, 'No'),
(368, 'pUmMBvzPJWDsZwcyFpCh', 10, 'No'),
(369, 'aYQXrEmupHjgDVTPdYBf', 10, 'No'),
(370, 'NAIKLlIqumCwaEHzZxDg', 10, 'No'),
(371, 'JWGDncYlBdPWRofiyFlX', 10, 'No'),
(372, 'ShwajRcdJymwCEKYGKrx', 10, 'No'),
(373, 'QDcRpiaykvmhWHTJWFgM', 10, 'No'),
(374, 'YvwOJyplLnGYxFHAbcwT', 10, 'No'),
(375, 'niXZvgFEckqELBKQyVCo', 10, 'No'),
(376, 'uCDdAnbIfVNmiqPkoBSg', 10, 'No'),
(377, 'QWhNfTIXFORqBlzfVaKJ', 10, 'No'),
(378, 'fcDlFlEhwxPbXSTquIdn', 10, 'No'),
(379, 'LpuCHjyMyWdVFaczGVfw', 10, 'No'),
(380, 'DuQcgbsaFqWONARnspzi', 10, 'No'),
(381, 'mRYPSiBlHCFJogWqpvdI', 10, 'No'),
(382, 'wYdzVgvsCByhWQUInNYi', 10, 'No'),
(383, 'tOajWfPhUqHswMILrToN', 10, 'No'),
(384, 'SyvPiegWyxUJkdjMQnDq', 10, 'No'),
(385, 'btrxPLnHWaxyvDsScQJQ', 10, 'No'),
(386, 'GiBIVCcgxZuXDzamSgvK', 10, 'No'),
(387, 'KilMJpiCrAEPHnHboBcV', 10, 'No'),
(388, 'cvWjPpTOvHrmFICQVJHs', 10, 'No'),
(389, 'EdzRnAwFiNIpsblMBrVG', 10, 'No'),
(390, 'PFIlZTpLSowahqRNzOsk', 10, 'No'),
(391, 'wQDTouqeTGlsipBZIWsk', 10, 'No'),
(392, 'GLtRHivVMgjUBzwzblWE', 10, 'No'),
(393, 'SHgszFOYoAejBJVXUbGL', 10, 'No'),
(394, 'fPfaiqkbXXBRZSLIlOhD', 10, 'No'),
(395, 'LXhSuFPRyptZwdlcAHmo', 10, 'No'),
(396, 'pdnybxlwEkKVHPoAtkCL', 10, 'No'),
(397, 'ltfPJznjNbydAoVKHLgZ', 10, 'No'),
(398, 'DCoxGCNubLKedyBbjXlf', 10, 'No'),
(399, 'SMTxcZzLVTeqvFHwgBns', 10, 'No'),
(400, 'vcsmZOKsyJgzaStNTMXG', 10, 'No'),
(401, 'cqgkXKOJUoaQzBrupIFC', 10, 'No'),
(402, 'zKeQasbIEpgyGWMUuBTk', 10, 'No'),
(403, 'QLMchjRvzpZJypDXUABS', 10, 'No'),
(404, 'YVFDcgkXBQrfUcIZMyLq', 10, 'No'),
(405, 'YKXQEPLiuCZBjNrqGAzd', 10, 'No'),
(406, 'HpxMraMSDQTeJyuYroUk', 10, 'No'),
(407, 'egrvbVpzWQxEjjoBCGDN', 10, 'No'),
(408, 'cvjHiBDYTaqrpGXFAUdM', 10, 'No'),
(409, 'AYbZVfxEIKPwqGjWaJsm', 10, 'No'),
(410, 'tlfvBdnrBSCfYsJpIqDO', 10, 'No'),
(411, 'zqlrdGdZVOMxPfNvKSNj', 10, 'No'),
(412, 'DNdzKykeiWoUPtVaFqUO', 10, 'No'),
(413, 'oYvyarZFLTMENbWkfWsB', 10, 'No'),
(414, 'SOlkqwSfGCUTIjRdEAha', 10, 'No'),
(415, 'rpQCkxmazTXbKEFZvWdL', 10, 'No'),
(416, 'EoqlyrDeOPiwpQJmgfNU', 10, 'No'),
(417, 'JnKYCFXwtZgrLUmuQILo', 10, 'No'),
(418, 'CVsuUdiaLfJlIxYPGumA', 10, 'No'),
(419, 'TxfgWJpcOGDyHvtzaSnF', 10, 'No'),
(420, 'jlywCIRVBpaGLJfBxvTM', 10, 'No'),
(421, 'QGnDVpULqvdiPJxIbpuw', 10, 'No'),
(422, 'vmhKQJHdYkbzNaIZnWcR', 10, 'No'),
(423, 'mCgTceXftDzPpFNrsQIy', 10, 'No'),
(424, 'djgEewfsukfxCpAYviJO', 10, 'No'),
(425, 'SajuZvARoilOYWgMwmfq', 10, 'No'),
(426, 'SYktdLccVXflwhyvpNHT', 10, 'No'),
(427, 'UPjlsVqUiovAfHkgYZfB', 10, 'No'),
(428, 'KmPRUjvQoiguVfGyDsOn', 10, 'No'),
(429, 'VgfiuhkyxAZMQTJsrEPJ', 10, 'No'),
(430, 'dcbmGFxluqqUATzMOiWM', 10, 'No'),
(431, 'HrIlqROJSVQjkwUgPdfG', 10, 'No'),
(432, 'TiNkwdMGvaRKrUDODijI', 10, 'No'),
(433, 'yGDUYEeMUtxQHZgKcrbT', 10, 'No'),
(434, 'zIqrLmPfAuTnZzRySJjM', 10, 'No'),
(435, 'wCzAYfeTUGLVgluEpbtW', 10, 'No'),
(436, 'jPSbyzunLboSZpTHmaXk', 10, 'No'),
(437, 'tSachMuIAQdZNwETBiwX', 10, 'No'),
(438, 'eQkkydmiVAOSnuJovCjc', 10, 'No'),
(439, 'gXtBdnaajmTJrZvkFOYR', 10, 'No'),
(440, 'nYalWuaefbWNRLVmDygX', 10, 'No'),
(441, 'QIUVjbXPFWrZSmnhviJb', 10, 'No'),
(442, 'VZzFjSTOaMycLGQlNukb', 10, 'No'),
(443, 'ILbTzDCyIxEPNBjpUewt', 10, 'No'),
(444, 'pcntHmuzuOAjMGkXTPwB', 10, 'No'),
(445, 'ZazszwhqFdPcieLxRuIO', 10, 'No'),
(446, 'KpLxrLEliUPRIcZjHJgz', 10, 'No'),
(447, 'RnCcJVmIihxayIBXhEbf', 10, 'No'),
(448, 'gOLVrNsCdWoqPPutGsci', 10, 'No'),
(449, 'HFPCzNqrneklUDChLVAY', 10, 'No'),
(450, 'XbSweIQkpvNxglKELGzC', 10, 'No'),
(451, 'BdzNNhmKlYDfSZzCjgRa', 10, 'No'),
(452, 'dPXhHMbJlytwAOQxofsK', 10, 'No'),
(453, 'AbNsUuWtLwIYtydhTflG', 10, 'User Indra Rani'),
(454, 'JdmxNLHrGjgROUwSoMJQ', 10, 'No'),
(455, 'isJLAqozmDXULBStVgRv', 10, 'No'),
(456, 'MDIsmlSXdecBLRWkODQT', 10, 'No'),
(457, 'bKVulRDdfGyVoTxzPEnX', 10, 'No'),
(458, 'FjttSNPoXVkGpmdIzBDI', 10, 'No'),
(459, 'ECrJSkplKdVtPWLQwHZT', 10, 'No'),
(460, 'gNOFTsTtfowejmDJBuIL', 10, 'No'),
(461, 'LjPxtnCUlwSmEKOTMiEd', 10, 'No'),
(462, 'JDFAgRZXTWQtnrchtpBf', 10, 'No'),
(463, 'ICgQibmcGYOAoTvVEcXa', 10, 'No'),
(464, 'jifOJIPyueSRGHCdWhQo', 10, 'No'),
(465, 'wCiakajTcLSGZnYIWmRb', 10, 'No'),
(466, 'dYEFynMPxcCUWSVamNso', 10, 'No'),
(467, 'QnqhHEGgRdctwZVCFQUJ', 10, 'No'),
(468, 'NlXAwiSEyTuxIQYdhpnR', 10, 'No'),
(469, 'PzuNgoiEUpLtXdCDvRKQ', 10, 'No'),
(470, 'dFZXhBcmUrtIDMEsHHCn', 10, 'No'),
(471, 'mhFEzDyxTCgBjhJEtYLu', 10, 'No'),
(472, 'mSGfUFKxeXCywpxstViv', 10, 'No'),
(473, 'iHcaxlNyoYrvBGKTebEF', 10, 'No'),
(474, 'MxQjxHkNYNqtRIpCuKby', 10, 'No'),
(475, 'nyAJxWTSNwtbQEvthZUK', 10, 'No'),
(476, 'gpqjCRKkGMbYiIoHGfQN', 10, 'No'),
(477, 'EOojIPaiBShqmxHkuVBd', 10, 'No'),
(478, 'btTXfCiveFIqSNlsZlLQ', 10, 'No'),
(479, 'WmXXwsqCBtZFVzOaGYgJ', 10, 'No'),
(480, 'enkBUKcjMtCAPeFSgVLX', 10, 'No'),
(481, 'QGMwuYPZlPcydxFBmCHJ', 10, 'No'),
(482, 'yAeukpGBilViHjRImRqd', 10, 'No'),
(483, 'hhDwQpsmXjoWxnkRCGFO', 10, 'No'),
(484, 'LhNPlTnObtMXpvAufGwe', 10, 'No'),
(485, 'AEkqNAKqxpMjDJHRvPeW', 10, 'No'),
(486, 'aSIjrhZpRsMVAJwfkDYG', 10, 'No'),
(487, 'FIQupXjhdFnBvwEUsZSJ', 10, 'No'),
(488, 'dCnnPosTlWpKVyhxOtFI', 10, 'No'),
(489, 'QwEMNJAJvDpRXaOfYtzh', 10, 'No'),
(490, 'qfXPyUQNiojPELSavrHK', 10, 'No'),
(491, 'lmLosrIsVuaLRJQXUPwF', 10, 'No'),
(492, 'pyVDCwtSDzoFtvOqegHP', 10, 'No'),
(493, 'TKysuAIrULJtbvnhlmoq', 10, 'No'),
(494, 'cavuIHQGrSSfhpZtejxR', 10, 'No'),
(495, 'uxnsJgGaQYObNBSZnZly', 10, 'No'),
(496, 'rCQTNfLoWzibaAprGlBK', 10, 'No'),
(497, 'UeEWGVcRiInkBlymOaOJ', 10, 'No'),
(498, 'SJBtrVLhKXdjagmPvFEc', 10, 'No'),
(499, 'FAaGVDIldzjMkwTrXbNr', 10, 'No'),
(500, 'OuaxUNhDwFPvqSNKpeAy', 10, 'No'),
(501, 'YxelQJzppIBLCAvKdiXr', 10, 'No'),
(502, 'cCeHNtnVDXWZtBFxEHfA', 10, 'No'),
(503, 'UhRcMskVjnpeCWPBTwEv', 10, 'No'),
(504, 'urXAtmKZQVqolSTxUaIf', 10, 'No'),
(505, 'AXdjrSsBuGNIfPdktnRS', 10, 'No'),
(506, 'jIgFJNQiuCaMGBzPyKoW', 10, 'No'),
(507, 'JYKTPkWcaQtxjwnAPeDy', 10, 'No'),
(508, 'EiHEqBsLYDRkhcQerNxr', 10, 'No'),
(509, 'JZdAHmyNevgctRztBMWw', 10, 'No'),
(510, 'vHbUtNGAqskMizDFLrja', 10, 'No'),
(511, 'NSbKkVkCmzqiIJJhcglB', 10, 'No'),
(512, 'ZmYbsBJgMexLQPqSHtzd', 10, 'No'),
(513, 'qbVRevjLDprFxIEcQAok', 10, 'No'),
(514, 'vIykEDhuiPmrdTBOzzwZ', 10, 'No'),
(515, 'qWAVsJRzKxIrDGauldha', 10, 'No'),
(516, 'KbSDuWsEloYaLBjqcxeC', 10, 'No'),
(517, 'sRCmxOySVOkbGgDLJowF', 10, 'No'),
(518, 'JHOyrhEAzYBXpliJVTRN', 10, 'No'),
(519, 'rOmEbcwFPnkzfBYuqQIU', 10, 'No'),
(520, 'BGEoReWmHQMxfDpbNwtD', 10, 'No'),
(521, 'ogxWCRhXpTnSqeQJbQcO', 10, 'No'),
(522, 'brltspwGDjrqAIJYEunV', 10, 'No'),
(523, 'xMRokuCHspiNGZyBEtym', 10, 'No'),
(524, 'IFocNBjVHybzexIchYsU', 10, 'No'),
(525, 'WzJZOhicQjbQkNnTIVoE', 10, 'No'),
(526, 'RZeMVvQzcBFYvmhftsgL', 10, 'No'),
(527, 'iEcxmqGkHpWvSILAMRuB', 10, 'No'),
(528, 'txSJiTqAXgxDmkFpsZlQ', 10, 'No'),
(529, 'aOZrVeTrWKTbFkAMGYwm', 10, 'No'),
(530, 'dcDLtZmlsHunRaFGLVIt', 10, 'No'),
(531, 'aScibfLrgEsfqIPYBhxp', 10, 'No'),
(532, 'UzYcajPYgkWyllRQhJNm', 10, 'No'),
(533, 'SttiAMrTReqwoXfNvCQl', 10, 'No'),
(534, 'IeTkcsBwUrDiPwjJxHWh', 10, 'No'),
(535, 'WxbJZtoernmwTuCYFEda', 10, 'No'),
(536, 'QrZdgBTOjBKWaGVmJmPN', 10, 'No'),
(537, 'VKuUkqLBboytgSZnaAhk', 10, 'No'),
(538, 'eEZKihVMCMmcyXHuRtTu', 10, 'No'),
(539, 'lXIGDnsFuKJPxRZUYiYr', 10, 'No'),
(540, 'RFhzrBgGDltQwTjkPPXC', 10, 'No'),
(541, 'bwPzCRcAFyDTzqjeYXxR', 10, 'No'),
(542, 'cAuhNGezRjOrXZwrUdLm', 10, 'No'),
(543, 'AHuBEXcPVfHdICJYobhs', 10, 'No'),
(544, 'tUnvCKpSQXCgJzxsBHuj', 10, 'No'),
(545, 'cxRZnPqrAkOWmujtfzVJ', 10, 'No'),
(546, 'ZxAjFGXIQWbPiOfThzKj', 10, 'No'),
(547, 'lvVITOAhcHndajGMCIwS', 10, 'No'),
(548, 'OMDoIBuGJrQhdVaziTyt', 10, 'No'),
(549, 'obzYgjUDhTyuOfkGPQSi', 10, 'No'),
(550, 'SXBZusieYrynwcFhOEvp', 10, 'No'),
(551, 'dKqFDzOPzBSltHZeGwrm', 10, 'No'),
(552, 'lfZPtjnuCEwBXksvmHUV', 10, 'No'),
(553, 'dgnMeNSxrufROjGVPfOI', 10, 'No'),
(554, 'KjxdyhBcSijJCItmZeFM', 10, 'No'),
(555, 'zrxquZmhGsJiwlYMSWTd', 10, 'No'),
(556, 'HzNrvkuXqmlLRAZlGNDt', 10, 'No'),
(557, 'RVnryduUHpqBtDfuTcCF', 10, 'No'),
(558, 'CJpxIEbLNCWuqZTBOwlt', 10, 'No'),
(559, 'OFVgHZviYuHlWQBeXaod', 10, 'No'),
(560, 'JGWVGlkehBRDjFtSHbQd', 10, 'No'),
(561, 'eqRZPpBzStJuLbHEFgMk', 10, 'No'),
(562, 'mSArQDoliyjaTupISzyB', 10, 'No'),
(563, 'kFngGqfXVMiRqTJOYclp', 10, 'No'),
(564, 'cCOgtKhiALXmVieNxFjs', 10, 'No'),
(565, 'goIqiBbpuwLSGQjkOZFM', 10, 'No'),
(566, 'XXSjeZNotdmeRpgMbvBU', 10, 'No'),
(567, 'UYhdNRCjWHOxyoBSgQli', 10, 'No'),
(568, 'rmrjcsVPwXKJoShFNWTC', 10, 'No'),
(569, 'HBedJPrXEznObvKQZkYg', 10, 'No'),
(570, 'IEywHdZnjKGkxczMIXaQ', 10, 'No'),
(571, 'DWjKNgHnEYaCpeydzstR', 10, 'No'),
(572, 'RQOOdGpUjlxXpAToWcNS', 10, 'No'),
(573, 'OzHBRVTJSKUqrIKxwbFf', 10, 'No'),
(574, 'UqeDiGBcYzawvHKMnOFV', 10, 'No'),
(575, 'XmFfeYUNBDLtkucSlglA', 10, 'No'),
(576, 'TFkmKXDbkqAjpZinzsRU', 10, 'No'),
(577, 'mDTQvRUnavlZhkBjKWgJ', 10, 'No'),
(578, 'HaoETdpmDRuwQyrkKVUS', 10, 'No'),
(579, 'rpdRwhPUtKHNViCfpJCT', 10, 'No'),
(580, 'UMYQmozplGWUDtSrgsHV', 10, 'No'),
(581, 'tcnqfQzUFWkIgobDMjXC', 10, 'No'),
(582, 'nkvYOtTphKsCTulwjXae', 10, 'No'),
(583, 'HXCedsVRrqvHmNYoMLKt', 10, 'No'),
(584, 'zECnOgldLRZWbTtuJrIi', 10, 'No'),
(585, 'fQRkaDwPEgTvlLGdSqvK', 10, 'No'),
(586, 'EXfTeikNAOsZMVyMHnkj', 10, 'No'),
(587, 'KIxLQRaqmBcfFDymEUuN', 10, 'No'),
(588, 'jzdWLZYXHKATQbSnReED', 10, 'No'),
(589, 'lgYspowTKQyBfHIrMOCP', 10, 'No'),
(590, 'kUVZREVWPKwuJxOBGwCt', 10, 'No'),
(591, 'ZHbtpwulYUvaNImaMknW', 10, 'No'),
(592, 'zFOdQVJnNRvkSbIjYwWe', 10, 'No'),
(593, 'JkebdyxtGVKuhtlLqOWs', 10, 'No'),
(594, 'RiBIatsjDpcwQMryNcbG', 10, 'No'),
(595, 'hVweNpfjDdovESlQUXiG', 10, 'No'),
(596, 'KRbbGZYsnhSLaWJmFoMx', 10, 'No'),
(597, 'PeKZLuFwvxjQTXnszpcq', 10, 'No'),
(598, 'nqKFBmdMYjDuJPZhgKLf', 10, 'No'),
(599, 'VUXIQbFoHRpmaNkHywov', 10, 'No'),
(600, 'RdhwNJOgDzFMmfTBpePc', 10, 'No'),
(601, 'uLEBvlGOkqhQYNjXnbDs', 10, 'No'),
(602, 'dLUlSnHRkTZfBtWYxawC', 10, 'No'),
(603, 'GkHbAqfliBFAejTyuqSN', 10, 'No'),
(604, 'zKtYsFSSTgCXfvHymklx', 10, 'No'),
(605, 'OKnACJrgXPHuaMpqYFRk', 10, 'No'),
(606, 'yvNCdNvwTknlIbuDtAEG', 10, 'No'),
(607, 'aDXfPWoovFCmsLEeNbtn', 10, 'No'),
(608, 'HBcCnlFtqQksbaOezGxR', 10, 'No'),
(609, 'ufaMDcWzJGAlnHKygpUQ', 10, 'No'),
(610, 'IcufgCPakqjNzRyeLMpU', 10, 'No'),
(611, 'vAeFrwTNyqDsQCZelMjV', 10, 'No'),
(612, 'uktPNdFwXnRrNomckSgZ', 10, 'No'),
(613, 'oBuRCTxtHGOhYiErlkSz', 10, 'No'),
(614, 'RtKVvjWMzfrDfnQXYxmg', 10, 'No'),
(615, 'FQNLLleXxCPjkZEAsmhg', 10, 'No'),
(616, 'qmdWfnZIcRWzQhpJXATE', 10, 'No'),
(617, 'TckOemVgbXGqMjRIPyNO', 10, 'No'),
(618, 'kZAMxHMruFheSjplRTjV', 10, 'No'),
(619, 'QbrvsMgxYLiERdjHPjfe', 10, 'No'),
(620, 'UyzGVkWtuHMSBaeoqsrh', 10, 'No'),
(621, 'keNElWDczLrVlYPUEGAB', 10, 'No'),
(622, 'SHJKvEMqQecBIOHfmDyl', 10, 'No'),
(623, 'ZNOxmiFdhTVKeVbRzwMy', 10, 'No'),
(624, 'TGgibDzhwAFiKplcyOCV', 10, 'No'),
(625, 'szWwBxDeYcgRhHkrdMcG', 10, 'No'),
(626, 'IBeELffRhHnNztoguqiW', 10, 'No'),
(627, 'dnnYLwphsyNBXUrSKimo', 10, 'No'),
(628, 'SwCFqjGaNoxfQIHRnDMS', 10, 'No'),
(629, 'iqpDSvXJsdJPuNgQVCAB', 10, 'No'),
(630, 'VKdeAOCEpdTtGDqaLuoU', 10, 'No'),
(631, 'XdboZjdGLOagrxsQyVEJ', 10, 'No'),
(632, 'qmRGYeSjucJLkUrWQxYg', 10, 'No'),
(633, 'zZgYUjBilVrSKdAJDeMt', 10, 'No'),
(634, 'KbjlupyOHoaEYrFBUTmg', 10, 'No'),
(635, 'CIoOGMBWXVGScsmhuvRY', 10, 'No'),
(636, 'iDaMmUVrLgtdDvpAhIRs', 10, 'No'),
(637, 'CJjlwXyRabiqUMJnWSzK', 10, 'No'),
(638, 'SyUtlwZsXzgbOIiIeNYW', 10, 'No'),
(639, 'beXFRdukCWSajYUEyStI', 10, 'No'),
(640, 'oWCbuJqjVdiYTILnwAzP', 10, 'No'),
(641, 'CPbpaKjfYZqRLuDJdYeO', 10, 'No'),
(642, 'kJKWbucPLnmnoOpiIKNt', 10, 'No'),
(643, 'WwJxMYdVKlDfYHARPsyi', 10, 'No'),
(644, 'ZbJRCqeQCwSPbGhvozHs', 10, 'No'),
(645, 'tefNLuvRAACdUnucYGaV', 10, 'No'),
(646, 'AvLSkhzPybmpMHTCYogy', 10, 'No'),
(647, 'VjqhWFTwfLSSOeafgKlC', 10, 'No'),
(648, 'rKepGPEoDrmJLxhaqwlY', 10, 'No'),
(649, 'WxHnfjXSOzLkcNIZhHAc', 10, 'No'),
(650, 'plkQtMueSfFDUgnZwQPi', 10, 'No'),
(651, 'BDydHqvjnNzJhSXUZpct', 10, 'No'),
(652, 'gMzWynImRZPhjrYNBaDt', 10, 'No'),
(653, 'OGKExaFNacTztICofXgC', 10, 'No'),
(654, 'DcowfQjGLTWrvgNRnJFc', 10, 'No'),
(655, 'MrLwbuPsyXMacvpJgxKy', 10, 'No'),
(656, 'THKhdclfqPSfGFQykXLj', 10, 'No'),
(657, 'lEULcZqtNfiZydwiFozP', 10, 'No'),
(658, 'oSblgcqMPfFyYtsJMwHE', 10, 'No'),
(659, 'xmSEVtILIRJKyeljzpfH', 10, 'No'),
(660, 'cumIPzSoDIdJsEwMkQVW', 10, 'No'),
(661, 'czYZJVfeFgbuqhIQnsMd', 10, 'No'),
(662, 'zPpgutiuLXJNewTcOmCr', 10, 'No'),
(663, 'VfvxMkQOAKbNULmJSywh', 10, 'No'),
(664, 'PmOfoULHgRkNdcljyuQA', 10, 'No'),
(665, 'vQWlZGbXBcYoDgawhISt', 10, 'No'),
(666, 'zLNfuiFoAAKgpmdylrDE', 10, 'No'),
(667, 'zDlIgPCocxtjuprUNFJk', 10, 'No'),
(668, 'mavFKsGeVJYTEgPonZKq', 10, 'No'),
(669, 'tOxjLEsPyomKYiuVkWLQ', 10, 'No'),
(670, 'itmqfjSIBHVZRlTaOUPZ', 10, 'No'),
(671, 'PDFHnMoNakdhtWObpcAX', 10, 'No'),
(672, 'MWefTRUSiOEJBqCbqLGy', 10, 'No'),
(673, 'rpezVacKUYGqHbAorCFP', 10, 'No'),
(674, 'PqGrwCpLsTOgVEbWXMTm', 10, 'No'),
(675, 'JFgiOduVfZhWQPHeMfvm', 10, 'No'),
(676, 'GQoVgzsUIXfnueTvMYWt', 10, 'No'),
(677, 'UaKkSWORYJlquyrIVhUt', 10, 'No'),
(678, 'bfNiImEvJkTgQbBYHzKU', 10, 'No'),
(679, 'OWOBXSPkqmEYxQfiycaD', 10, 'No'),
(680, 'IWuLaHyJFPQqEawKpbDx', 10, 'No'),
(681, 'KNSrfzPseFovkhBxWsHV', 10, 'No'),
(682, 'fSLFDwPCcEdvyUlHMUpJ', 10, 'No'),
(683, 'mEWlfJQZsyeBKECbkLTn', 10, 'No'),
(684, 'WIezlpevwrQhKPdxELgF', 10, 'No'),
(685, 'AUXVCGgojSblDdjhQfqY', 10, 'No'),
(686, 'hrupGLGAkWTJXoRMDwlv', 10, 'No'),
(687, 'mifJjVrEpFugQKHSIcMB', 10, 'No'),
(688, 'ksCjVGhRzcveIiTwqvod', 10, 'No'),
(689, 'UKrVrsJWCncFjvzaSOIA', 10, 'No'),
(690, 'WBRGvhFrwsMmPQcUASal', 10, 'No'),
(691, 'wYeLKbWoVshAOITgnddG', 10, 'No'),
(692, 'KvSzAxPabvuwKJtOFDHE', 10, 'No'),
(693, 'gaiNIcsHZWXTquzfKdpY', 10, 'No'),
(694, 'OMmNEURIxXFqbhBlSpLy', 10, 'No'),
(695, 'thrqTsLFpDafPYSJvmwy', 10, 'No'),
(696, 'abhLMJADyqdnjHgbSXZM', 10, 'No'),
(697, 'AjYKRYtjSLbqFHdJpgvy', 10, 'No'),
(698, 'smXqSLKeGynvTWeJiagB', 10, 'No'),
(699, 'jXJeDwyYonGNcubvQcSQ', 10, 'No'),
(700, 'MWgFslIGNZkimQwzEtMx', 10, 'No'),
(701, 'YcziMoJhXvQSoxjutyLA', 10, 'No'),
(702, 'cQFJqdNvSBLWswVTxYRG', 10, 'No'),
(703, 'zQMkQsGSPRaAgoXnEfwC', 10, 'No'),
(704, 'krlXCyiDRdITnJVxmZAW', 10, 'No'),
(705, 'LqcjXaOQWognPINGmjhx', 10, 'No'),
(706, 'OWTbPFMiJNmvHjlBqDsw', 10, 'No'),
(707, 'zTfHaJLcqoBsFDPgIhpY', 10, 'No'),
(708, 'LHQMSqeDVmXuVtrrOzRj', 10, 'No'),
(709, 'yYMKRitoMLZgnqQlrPJb', 10, 'No'),
(710, 'TQPilpYjWMqsANhnzcLe', 10, 'No'),
(711, 'IvzjZdYXgypnuFktSGCO', 10, 'No'),
(712, 'TEoCOPqtDzjhZecniLdw', 10, 'No'),
(713, 'cDbYWwlYdPfRLukvqKQS', 10, 'No'),
(714, 'cmsPzjCLJlwqtMKaTEZp', 10, 'No'),
(715, 'BdorMJEqubtnhyKaSOUH', 10, 'No'),
(716, 'TbndRpKwMGfOtlFsiEUx', 10, 'No'),
(717, 'joLMYVHFobuFsEGlQcaR', 10, 'No'),
(718, 'ctWHGhiSZDmCrjIJTuvb', 10, 'No'),
(719, 'iioFQVsHWOPhtCyEarXL', 10, 'No'),
(720, 'HiYzeygPMLEdbZvGagsI', 10, 'No'),
(721, 'rXgWVnqyLUuhMejEvTQx', 10, 'No'),
(722, 'nXabHulZiCGRRqsQgLdN', 10, 'No'),
(723, 'pCmQnAbPTzgBrFIRnYUO', 10, 'No'),
(724, 'aGNruKdocDbiGnZgxyTz', 10, 'No'),
(725, 'xWfiKHVjGLuFvMCrqnMl', 10, 'No'),
(726, 'DvVGrUNMquLlopFeZXEp', 10, 'No'),
(727, 'BMpNzrWPZGqtOkcCFWki', 10, 'No'),
(728, 'VHeWoOTgdkESGnljwatL', 10, 'No'),
(729, 'EiaLzwmdjtiQyPVDOhTG', 10, 'No'),
(730, 'UwHGaYquSvziEMyemhXC', 10, 'No'),
(731, 'rAPQJzulZCyCgScVvRGi', 10, 'No'),
(732, 'bIMEFmDdViwYaWHrQjUo', 10, 'No'),
(733, 'ImxHSwTvNcuUIqEoQGVD', 10, 'No'),
(734, 'NKgxyfyHBlkZLvzRTFiq', 10, 'No'),
(735, 'BsOmqOKicPgVGFXjTbSZ', 10, 'No'),
(736, 'lvDHURPybqzKIzuLEpUg', 10, 'No'),
(737, 'BNUOdIxRyXgOqPfwrzHn', 10, 'No'),
(738, 'IZsqgsnFIuhMDxBUzRbT', 10, 'No'),
(739, 'feIHbvShiDGdnJEsjzkF', 10, 'No'),
(740, 'ktZgyvODFMBjIWsjKXnx', 10, 'No'),
(741, 'cikBahvIwmMjDWyHTmQA', 10, 'No'),
(742, 'GQcIGHjNuftcFPnWvYUD', 10, 'No'),
(743, 'XLFQJCYxPidNGhmArpye', 10, 'No'),
(744, 'tcVMjIkkwBAvdlyoxPUF', 10, 'No'),
(745, 'yJIYeDEPAwMbaAvhpBeX', 10, 'No'),
(746, 'iYfUmZhPCAoEwXekRqsz', 10, 'No'),
(747, 'bEPufHDHsZpGplNBcmFa', 10, 'No'),
(748, 'evTFbwMXjBcZLYJngazq', 10, 'No'),
(749, 'uafJQMqrLvwXkSYdEfDs', 10, 'No'),
(750, 'eimDLWJFIKVtBAGuzmdA', 10, 'No'),
(751, 'gDzBWtCGXVHqKulpxiow', 10, 'No'),
(752, 'NEtOGXyjDfpOiVduPMRo', 10, 'No'),
(753, 'cWwTEsiPKdfukLlEqYBQ', 10, 'No'),
(754, 'LAUWsqVCJyMgaxUFplbR', 10, 'No'),
(755, 'bigDEMxHKLCtrsKFUuPX', 10, 'No'),
(756, 'OODsTiPkXwgfyhLEnAeR', 10, 'No'),
(757, 'WEBtXyFDaNOpkrYIfynv', 10, 'No'),
(758, 'YyXdRcQbGNJpUoVkZfLW', 10, 'No'),
(759, 'alfHGBNXMVzoYCWrnjTA', 10, 'No'),
(760, 'kOcvqYraKHXMlgssIefV', 10, 'No'),
(761, 'DcVUIhuJmwxaXQmWlOkF', 10, 'No'),
(762, 'aenjMDRRNhbJlvqoTIsL', 10, 'No'),
(763, 'hlFWOHavyAjebpMCQKJS', 10, 'No'),
(764, 'rijECwMNcfLDKaHoAGyR', 10, 'No'),
(765, 'nKqgXFJlNSgGBoBvLwQA', 10, 'No'),
(766, 'JpRdxHiaPmFMoGuhyqEB', 10, 'No'),
(767, 'soqRAXviLYUfjzJBeKcM', 10, 'No'),
(768, 'YvCEFGdiOKtenqMgfCwo', 10, 'No'),
(769, 'UgDDiStoHVOqpolCIwxL', 10, 'No'),
(770, 'HeQbViONoWRgfewDMLph', 10, 'No'),
(771, 'jZBndHtTNIyVFvRYPqVK', 10, 'No'),
(772, 'fQbFZSUVRlPuFELnwaXs', 10, 'No'),
(773, 'yNfZhHwOAvgsJYePRbqk', 10, 'No'),
(774, 'VvxRecXIKSOgLzERokuC', 10, 'No'),
(775, 'xARvdSnzoqJbVPhZULGM', 10, 'No'),
(776, 'OvAioIPdzMrClYQgHjsi', 10, 'No'),
(777, 'TbDVRAZgNSMjHPankCLr', 10, 'No'),
(778, 'KtTMxBezTfbpojUVkFnn', 10, 'No'),
(779, 'uhAbdGKihxEgAPRsMXQI', 10, 'No'),
(780, 'vVxeOjXfkmySItmlHYZr', 10, 'No'),
(781, 'VEZnRJIHgjmxDiLstDvr', 10, 'No'),
(782, 'VGzDdAhLWydrKBuqEMwg', 10, 'No'),
(783, 'KZnPIMgFaYQwskDuAUrL', 10, 'No'),
(784, 'XruTKbSkzAGUXdlmcFEV', 10, 'No'),
(785, 'XUtQfgoKvmIwYGVsHNbi', 10, 'No'),
(786, 'EypqSfXNBIvTWtUGlHBn', 10, 'No'),
(787, 'gqlCQfmILviKxnADZubt', 10, 'No'),
(788, 'BAonfPEDsSzMPhTUwleX', 10, 'No'),
(789, 'crSplFfhPbqHdBCOVBjJ', 10, 'No'),
(790, 'arqpUBmZxYdbGKAWotVs', 10, 'No'),
(791, 'LFlHzudoTbQkNUeXSnjp', 10, 'No'),
(792, 'MrtfDFQawKqyBuGxXVvz', 10, 'No'),
(793, 'lPwSABqWfojkaIiAixOR', 10, 'No'),
(794, 'tKriMaTcUDYlGZwPNVnp', 10, 'No'),
(795, 'LjybunUvWDHcFMOxlfqR', 10, 'No'),
(796, 'jnHMWUsVtxBhgmlXQfPz', 10, 'No'),
(797, 'UWtIifrKFkzTQljANscH', 10, 'No'),
(798, 'gczHsbCJvzStWjVANxiG', 10, 'No'),
(799, 'IduZyNygKToGsUPJnrVq', 10, 'No'),
(800, 'CNJnGdutxYWpqSilfcSX', 10, 'No'),
(801, 'mGCXqoEwRWOzrmnKSMfp', 10, 'No'),
(802, 'bhAgydEDBQqmGBISvzvp', 10, 'No'),
(803, 'IDbgwCafnNwpXtkKlRAK', 10, 'No'),
(804, 'UoqCFyfgQuGwPXkKDwnm', 10, 'No'),
(805, 'ANeKcksprEIbSjuRdBvM', 10, 'No'),
(806, 'VFhBwjfTtAzxslarjWLy', 10, 'No'),
(807, 'DRaKtOkqihwVBZNcYCXf', 10, 'No'),
(808, 'RahKfTmbHtskMcFrQOZN', 10, 'No'),
(809, 'eHozhpuWLPAcNYFwbnlj', 10, 'No'),
(810, 'FmyJYcaIFnrjGEHAwCQd', 10, 'No'),
(811, 'VPkTMxTyZOfJgQvdtbmC', 10, 'No'),
(812, 'oySkejQTGYaLPCszitBF', 10, 'No'),
(813, 'PgWdzHBbKJegcEGAsZyq', 10, 'No'),
(814, 'IAwpQdWzjtXyLUWiuboJ', 10, 'No'),
(815, 'CRmZJrxTVigQtsFqjbpS', 10, 'No'),
(816, 'wRSsFyHwuBoXgzWhTQOU', 10, 'No'),
(817, 'eDwUGfvHumScjBJcrViZ', 10, 'No'),
(818, 'MWKVmstbJhlGFMoywnfQ', 10, 'No'),
(819, 'kcuxDOeNtUAjXWyRlqWf', 10, 'No'),
(820, 'cdxRPMTeoGLZizXUZusO', 10, 'No'),
(821, 'CmtpQTzAwakPgLRUDOVo', 10, 'No'),
(822, 'MwGArURvhQiOOylIHJSB', 10, 'No'),
(823, 'NFnKOAITQtkZGDwfqVub', 10, 'No'),
(824, 'OWbtUwPVyHXEmnnSJRsz', 10, 'No'),
(825, 'JsvyGDCFQLoijYnSPiHE', 10, 'No'),
(826, 'icAWwQGabDMuExRqdIKr', 10, 'No'),
(827, 'wBpreaShtTZDjVaQFMZd', 10, 'No'),
(828, 'oLzrmBlPEvSsbZIXgVUq', 10, 'No'),
(829, 'lrwhQaWXHqObjDoSyfnO', 10, 'No'),
(830, 'QDurjAINPtbBvoaNktEC', 10, 'No'),
(831, 'sVqGMPoTneXYluZIbdPp', 10, 'No'),
(832, 'sSiNRHeMElDBgWncFhSq', 10, 'No'),
(833, 'ZFvUIzcqVsSxGiklVCOe', 10, 'No'),
(834, 'kNiRWBaXcOjMqoUQfpug', 10, 'No'),
(835, 'vozhSGgBkEWMmlZnwFqX', 10, 'No'),
(836, 'RqlnmBZSUYVFcayIHQAn', 10, 'No'),
(837, 'QFdOyDEZaGXAGIpRrksg', 10, 'No'),
(838, 'GtAzoeYFPHpfJabOEvNU', 10, 'No'),
(839, 'LOGiDOHsmNYezblSeqwn', 10, 'No'),
(840, 'HearxQsupmHGBTKXnYyZ', 10, 'No'),
(841, 'JsHpICYLXhsZfBlNogrP', 10, 'No'),
(842, 'nzxsNwGHUbLorWYQiZCn', 10, 'No'),
(843, 'rDkBtsdNHbOfGahGJQzo', 10, 'No'),
(844, 'vStgUzmKUFkHYCwqTgVL', 10, 'No'),
(845, 'IZvSbPNuxsvGFdyMLcrD', 10, 'No'),
(846, 'WcoqCRaVNQAvjWxXThpd', 10, 'No'),
(847, 'djXUocxvBFkGLGutueIC', 10, 'No'),
(848, 'HsoLiWucMOBEjerxmUkF', 10, 'No'),
(849, 'vsvlckDAuGPwfRKmWGVB', 10, 'No'),
(850, 'eqwbQWFpTzjVmdUOVIJR', 10, 'No'),
(851, 'tKrqYxOQVcPspyWCEUbl', 10, 'No'),
(852, 'gGvGbYRXkAPUfwirundS', 10, 'No'),
(853, 'vESHlhkOeudPaFsKvoqV', 10, 'No'),
(854, 'lwRSkuKENBnGgvpxPJQc', 10, 'No'),
(855, 'XqBHEhswOkYNgbQiSWbY', 10, 'No'),
(856, 'TEcgZhpAEwYGIxBqtNCa', 10, 'No'),
(857, 'CFjQPXGxqJdmgYrOBnbo', 10, 'No'),
(858, 'PzxaVMHymYfIiZvOLDNb', 10, 'No'),
(859, 'WakBsAURKNQdcCpghQtZ', 10, 'No'),
(860, 'PsTWoAiySdsULfZbQElr', 10, 'No'),
(861, 'JeXZtqUcfVBjxnAHPvOG', 10, 'No'),
(862, 'RiEyNPlCwpexKIUROmna', 10, 'No'),
(863, 'zYXoyIWYQCTJlRBrPmfk', 10, 'No'),
(864, 'VdvGLnprhosfZhBNDPSg', 10, 'No'),
(865, 'jONVLZYgBtqoQPdwMhux', 10, 'No'),
(866, 'GsKaaZYlIcQVCMyetXAR', 10, 'No'),
(867, 'XtOxNmwzLhvsfXRlBdJA', 10, 'No'),
(868, 'GrvatobAHPLQqWmeIuyC', 10, 'No'),
(869, 'mDGudFnBVRHNwgYuaUPJ', 10, 'No'),
(870, 'kDsiOGGZneMWCLYtzudc', 10, 'No'),
(871, 'ifkophWDdoFwYynPTuBF', 10, 'No'),
(872, 'dgLNWTOYXKrxCpumaMOV', 10, 'No'),
(873, 'mIbqvEMOsdZhBNDlokPt', 10, 'No'),
(874, 'ZICgJEbqYQNpAOXmyPTs', 10, 'No'),
(875, 'HkGdUlEDxAmBZMrsgNfo', 10, 'No'),
(876, 'IspFTnKoJMOHSlyBTXdP', 10, 'No'),
(877, 'zGrMqHTOCcUVvTxRzpWJ', 10, 'No'),
(878, 'jEElyWRDwqeOaScXMAKH', 10, 'No'),
(879, 'NxHXFyamQisIlOsGPAbo', 10, 'No'),
(880, 'sfSBFykXJITtbaYChWdx', 10, 'No'),
(881, 'ElHzPoEqOrpmCfNgIUKt', 10, 'No'),
(882, 'jlxqCdFRPeVJVsQwpWhr', 10, 'No'),
(883, 'vmlToYRrQZdgWkCbPIjA', 10, 'No'),
(884, 'WgOKRYQCAsjadPtHNqkF', 10, 'No'),
(885, 'NegXbuBDQnaRcGyUYmSS', 10, 'No'),
(886, 'zuvyhWQnqtKiJeUbFoyX', 10, 'No'),
(887, 'AsLPNetViBYwhfDqTgFq', 10, 'No'),
(888, 'EMzkiDlhyVPCTEZWOwnm', 10, 'No'),
(889, 'aGSzLXHlqugCwdPvKeIQ', 10, 'No'),
(890, 'znqZguABaLVhoNWURrIx', 10, 'No'),
(891, 'ERKuYiadhrKbNIOSBQin', 10, 'No'),
(892, 'fxXNsBdDMcTwYxWvNrKS', 10, 'No'),
(893, 'ADbqVdsYNjazMIVKBpft', 10, 'No'),
(894, 'pkTCNShKouJHtsmlLgRj', 10, 'No'),
(895, 'ZWohcSepfWqrpOwHdulM', 10, 'No'),
(896, 'OiMGzSuZjxtPLfFursDn', 10, 'No'),
(897, 'JSPmIFKzkAYuAhZwtwjg', 10, 'No'),
(898, 'MwQUaQbRXYzkpFnHgyKi', 10, 'No'),
(899, 'xTLqVSeCorVBtMXWshuw', 10, 'No'),
(900, 'kcBAaTzJYtqWhtfsNTIC', 10, 'No'),
(901, 'oQKBnMUJTliRifHVhkNF', 10, 'No'),
(902, 'nWqebMsGPTgHBPaFJSRx', 10, 'No'),
(903, 'pXHQKfhDySqvjWreBNXJ', 10, 'No'),
(904, 'MbcirxZNGhTLMjdRCVkJ', 10, 'No'),
(905, 'wyoYHzOZqSIVxvUJXWpa', 10, 'No'),
(906, 'fSpqIgwCYlLRECaMojOZ', 10, 'No'),
(907, 'rqVQMsOWjhSOCimHpTyG', 10, 'No'),
(908, 'cORsYlWasBIIAHpCbhuM', 10, 'No'),
(909, 'tEbRunpwHjkBLLQMXYod', 10, 'No'),
(910, 'UXfqpwGdoIvnVTxcNSsY', 10, 'No'),
(911, 'RCtpFiBSqPagHZrjckLd', 10, 'No'),
(912, 'gcdkYChCXNzSZLFlnvTE', 10, 'No'),
(913, 'rnkQAtcGBuTimzElHSRx', 10, 'No'),
(914, 'tWgGOpiFAxbJMHzPHmok', 10, 'No'),
(915, 'LDtBmnSWGoiypqdUSIxF', 10, 'No'),
(916, 'cwiBSmCUOMlKgQzvAtdZ', 10, 'No'),
(917, 'GFpHWgevPasSDRkWdYii', 10, 'No'),
(918, 'vJoyNVjPMWOCcefnUYHl', 10, 'No'),
(919, 'EOKLnWgXrYuAdlfhoqkB', 10, 'No'),
(920, 'hkWyQUZVHauJYQpbSqDs', 10, 'No'),
(921, 'IBpcydZHzjCmDJkQNGSs', 10, 'No'),
(922, 'VbNJmkSMqzqBofQsYtdJ', 10, 'No'),
(923, 'YnAzOEtwyBkhTWjDgXHL', 10, 'No'),
(924, 'phKlkLnJgbGjOEHIMtnD', 10, 'No'),
(925, 'clSqxUMjbmWPeXtQFaNI', 10, 'No'),
(926, 'UvfkqGnzjNuFRWiXDMYS', 10, 'No'),
(927, 'KgnAPTHkthLdlNeDjQEw', 10, 'No'),
(928, 'mxOYzIHtZmGnKUcaoJBQ', 10, 'No'),
(929, 'lsYcPtmRTHcyIWHnAepL', 10, 'No'),
(930, 'NXLsayQedvhtjGKgJWwH', 10, 'No'),
(931, 'DPeCYyNLaucQsEARtfAn', 10, 'No'),
(932, 'gNIfKiaMhudbvYUHzRTr', 10, 'No'),
(933, 'GrGBdjoLEnPJsOgZfDRA', 10, 'No'),
(934, 'OGxeBAcFQqwoEbWahYui', 10, 'No'),
(935, 'QCbeyWaxFBIPUxIKZsko', 10, 'No'),
(936, 'VJNomPfdcqIgOIvhapEA', 10, 'No'),
(937, 'VYuOGSblAJmtfScrzMHo', 10, 'No'),
(938, 'ZCWsrYMHgjeniplPOzAo', 10, 'No'),
(939, 'ohOWitQAjUyuGDvnfcBI', 10, 'No'),
(940, 'zfreJpuZnCwDwOvFdVLW', 10, 'No'),
(941, 'SbQvUrescHLZRkiTxwqV', 10, 'No'),
(942, 'fRHVjheSqQOWuDXyCoZi', 10, 'No'),
(943, 'WJemCLBZvpWtOvjVonHN', 10, 'No'),
(944, 'HxMcuzYqnKGHdIwgnZSA', 10, 'No'),
(945, 'fheFkaAXMDhpbWIdHYuw', 10, 'No'),
(946, 'GyftXxYkIEjSPpMwWdCO', 10, 'No'),
(947, 'ilJBkmtGdywbFhYTdJoV', 10, 'No'),
(948, 'GFOAlHuwvUQPjAkZicMw', 10, 'No'),
(949, 'beYcmOtZSnzghgCsuiHA', 10, 'No'),
(950, 'jrHmrOCexZNOubWVMQIP', 10, 'No'),
(951, 'mdHgEnVfDTqslJkCuBKN', 10, 'No'),
(952, 'muNivfZKYJEulrOsDBTp', 10, 'No'),
(953, 'uOUoDtQGfKllJyVrPnLg', 10, 'No'),
(954, 'yhPPkKsbFplMmIbXLSJE', 10, 'No'),
(955, 'GyJNLztVAQTrOckXebdg', 10, 'No'),
(956, 'AojZNxKSPiLSuzqsUmhc', 10, 'No'),
(957, 'VGJPWcCRIbhprhMKjXaq', 10, 'No'),
(958, 'ujrfeGOFwviTxwZXMCBg', 10, 'No'),
(959, 'ZvSyUDOqeHpGmczxtPWD', 10, 'No'),
(960, 'mKVCEdlOXHcyMvGTjNSk', 10, 'No'),
(961, 'eHWRtZgSvsnuzMcTJSUG', 10, 'No'),
(962, 'kxSFpeQdrbPOyGzHhuKl', 10, 'No'),
(963, 'RzqNfjmaPQHOWSQLinJt', 10, 'No'),
(964, 'fCmgLpTxGYlBJReZBFHb', 10, 'No'),
(965, 'OeSkusNUGbHwAeLQqIdr', 10, 'No'),
(966, 'wlBNdPnfxAZpKHEbkRsV', 10, 'No'),
(967, 'dxZXrHWboapZgqDQtNFe', 10, 'No'),
(968, 'tnBBPEXHvxqpNSAwyDob', 10, 'No'),
(969, 'YvMGnFpNBiDqLjndmItU', 10, 'No'),
(970, 'ZaGijculpTwbQmVrNtxQ', 10, 'No'),
(971, 'GZaRpUCzEoiLuKVdyunv', 10, 'No'),
(972, 'wLoDuMYjqaOBpFJcbUAf', 10, 'No'),
(973, 'RNULcXQsemolgDGhFHoY', 10, 'No'),
(974, 'lMXxBkYbeNESudFUZojb', 10, 'No'),
(975, 'AEIXszQotwWuGPimbRAw', 10, 'No'),
(976, 'IgpDEiJfXeMuoEAFLCaz', 10, 'No'),
(977, 'WyVmEAQgBizNYILfOMTs', 10, 'No'),
(978, 'jwKqIkulCFuSoDiGgpPC', 10, 'No'),
(979, 'KwEDLNPdOkBbLtnJxGul', 10, 'No'),
(980, 'SbYPoMzpjHakKVvhGzmq', 10, 'No'),
(981, 'mbejEUrYAjVdplKkBJxy', 10, 'No'),
(982, 'iuifGwepvQPoXqCDBKdj', 10, 'No'),
(983, 'ytfTkrlQSRLIpCsVZzml', 10, 'No'),
(984, 'oMVCtjBwsqySqUcQpuIT', 10, 'No'),
(985, 'jRNOrXiSwWcaKeYmxgwz', 10, 'No'),
(986, 'FyGzqVqjuIvgQGmCMeBX', 10, 'No'),
(987, 'jibVvJmBlgaANeURHyMP', 10, 'No'),
(988, 'VefsRyaZWeDBSTlPdJIb', 10, 'No'),
(989, 'EwPCLzTbahViQHtuWRIj', 10, 'No'),
(990, 'jaLdZfXJYmUrRNncvhPZ', 10, 'No'),
(991, 'xbMWNFfmSlgyQVsvVKZX', 10, 'No'),
(992, 'zVZFvdqNlBDUiGwJyGbO', 10, 'No'),
(993, 'TidOCIbsytnfZEBaeHrX', 10, 'No'),
(994, 'VWAegIQrEUbBitREaGDf', 10, 'No'),
(995, 'KOULJEFJcyHniajGqpxD', 10, 'No'),
(996, 'QyZJxAckCpvVHGSmwrdY', 10, 'No'),
(997, 'MLNOvtYrQEljnuyboaeC', 10, 'No'),
(998, 'ARfhPySIDgcgdjqzvxCK', 10, 'No'),
(999, 'ZYuqFnoPgwUJpCDLIijh', 10, 'No'),
(1000, 'YKKdaDCzsfbqTRkyAGIQ', 10, 'No'),
(1001, 'oXagOJXNPmRHxSlviMtg', 10, 'No'),
(1002, 'IlcrbDVwHhXTajZqxUsC', 10, 'No'),
(1003, 'tPLvuSKwhWRVkHZYelzF', 10, 'No'),
(1004, 'DIkpjMVQJtnAlRoZWcUZ', 10, 'No'),
(1005, 'fmywhubABOlExVJtaNDj', 10, 'No'),
(1006, 'CknXFtmJodNygROzVWxU', 10, 'No'),
(1007, 'lsPFowLAWfHQIaBVFyJf', 10, 'No'),
(1008, 'DLacZOkdXWMTxstfeNiO', 10, 'No'),
(1009, 'AGTsBXQTfkrwDcJbnoUu', 10, 'No'),
(1010, 'BkFxrTNqXSiCgQpvDyMT', 10, 'No'),
(1011, 'roYkdIxFMlJjVYHvKPOq', 10, 'No'),
(1012, 'cpVZixVnoEkdQuLUAKfP', 10, 'No'),
(1013, 'qDhiBwOHXtonzMmquaVC', 10, 'No'),
(1014, 'yKBdjMkWhDrQXIftvzsH', 10, 'No'),
(1015, 'SzQKGhxWJCwRsBYrgMxC', 10, 'No'),
(1016, 'qwFyRzVtHlxhBknjTWiE', 10, 'No'),
(1017, 'gWRpCXAfaZINNenyQJtG', 10, 'No'),
(1018, 'NSfOABoybnMJOecWwnxX', 10, 'No'),
(1019, 'TQEPcsgUbMzAmBwngoXQ', 10, 'No'),
(1020, 'qCjntfIwMHTFBSkvTLod', 10, 'No'),
(1021, 'VRvgDSPWEdAjxSnuZGfu', 10, 'No'),
(1022, 'dbWtSFfnDGjRsTRuMoev', 10, 'No'),
(1023, 'eZEgoFYpQGacIPObwVJk', 10, 'No'),
(1024, 'zqzDanjVsuQhGMEYkxvC', 10, 'No'),
(1025, 'ZhMVxTNzPucAhpkjRGEm', 10, 'No'),
(1026, 'krKfCwhUjcARPOxpWZlD', 10, 'No'),
(1027, 'LyejMpdIWDTukEoHTxSU', 10, 'No'),
(1028, 'QoVjHAUirOFAbNuDIpTM', 10, 'No'),
(1029, 'CFdpEbSceyKjxROPYqTz', 10, 'No'),
(1030, 'VUCTVEHIgipamSBkkPdM', 10, 'No'),
(1031, 'pgSHvjICotGyMmQTHkFN', 10, 'No'),
(1032, 'fOYaYKxLljqJGidInrNW', 10, 'No'),
(1033, 'gHLyJjcsYlAdmESOObkr', 10, 'No'),
(1034, 'uOSnxVbfkAmBVpjgbDQe', 10, 'No'),
(1035, 'zmqdJiDlnPqcuWBVCMtZ', 10, 'No'),
(1036, 'PvOAYHXSoyEZQtfSUVNw', 10, 'No'),
(1037, 'qsPEXRjWwcVrhOMkzIpx', 10, 'No'),
(1038, 'WBtjCcbqoxghfdkUyQPY', 10, 'No'),
(1039, 'sFCDBAkhvPNdGmfwjgIX', 10, 'No'),
(1040, 'fOaGiTLKuwZtmQRjFdvn', 10, 'No'),
(1041, 'OZQjnVymfzBpsAUHCKLR', 10, 'No'),
(1042, 'ZibCengOPASxuNoklGIP', 10, 'No'),
(1043, 'lVTYZdCPOlpKeEwyugFB', 10, 'No'),
(1044, 'vJecNZSVOQaDrdJEATfY', 10, 'No'),
(1045, 'THgrdcwPIRjYsFSineTW', 10, 'No'),
(1046, 'JWifRctlEVFVqPsOfCdS', 10, 'No'),
(1047, 'gImHvGPbWJptduXJRQFU', 10, 'No'),
(1048, 'viKAwYfoWITmhqtBAdpj', 10, 'No'),
(1049, 'qfIHvERpAFlhIwsNKfyM', 10, 'No'),
(1050, 'ncOJlTUbEYgZXHFspQDj', 10, 'No'),
(1051, 'cEtDVfnUnMWBXSpLxwrN', 10, 'No'),
(1052, 'DAvdzpJsUXjyoLmiYVOP', 10, 'No'),
(1053, 'FQkoAXYCtfbLyKjVDjev', 10, 'No'),
(1054, 'QyBvjiPeOdcNTIoCnhGs', 10, 'No'),
(1055, 'csCUxdqJkHcOvINMfCKn', 10, 'No'),
(1056, 'AggOnkJBsYjiuFxCvcDh', 10, 'No'),
(1057, 'ZTEGCNXwcbIglVFSatVP', 10, 'No'),
(1058, 'AtwJVMUoODpdhvIOxlXL', 10, 'No'),
(1059, 'kgBUacIsBmtLNKzhJgwC', 10, 'No'),
(1060, 'gblVDIEdUAhZQsFnAyqC', 10, 'No'),
(1061, 'uCrzcAELYOnyHUkisJfX', 10, 'No'),
(1062, 'oNTZgBScAIuVWSdypbrP', 10, 'No'),
(1063, 'aVJtAjHFurnXDkrbcxNy', 10, 'No'),
(1064, 'NZOnJjSPpBahVopTbXvM', 10, 'No'),
(1065, 'kPzvpAIjXQqlOLZkrSct', 10, 'No'),
(1066, 'XOzebPVkeYaAfuRFEDjT', 10, 'No'),
(1067, 'ZnFbmGlyPQqAgsSIctzC', 10, 'No'),
(1068, 'cQkwxedVlYRAJCYXhuPF', 10, 'No'),
(1069, 'OHuUBhtAYcDMpcRbXSin', 10, 'No'),
(1070, 'sTrMRwklipaUpZHEcnBg', 10, 'No'),
(1071, 'wzGenbuWBKioMHLjPIEh', 10, 'No'),
(1072, 'rWGSCpAkzUpQRycYaDOn', 10, 'No'),
(1073, 'QnfEVgpowzLRMiFQdlPn', 10, 'No'),
(1074, 'nsPgIyHPWOwFUexTCEft', 10, 'No'),
(1075, 'svUcQrISmOjqxpkNyCIZ', 10, 'No'),
(1076, 'TVpjoptKnvaCWlmugINU', 10, 'No'),
(1077, 'iWWkQvCaVqJFyhcYPXHZ', 10, 'No'),
(1078, 'IGHmvWrkuatQoFgCLxRe', 10, 'No'),
(1079, 'soKEOadiChBZcevuJGMP', 10, 'No'),
(1080, 'gZPiETFqkxWwGPKlVndp', 10, 'No'),
(1081, 'yMuCoQydtpLxZNIHkJlD', 10, 'No'),
(1082, 'CqxAyqZJcDFTYbuNEifh', 10, 'No'),
(1083, 'SvUbJQEmViBgPyXOpiHa', 10, 'No'),
(1084, 'mMeyoRFHcbWOzJEHviQz', 10, 'No'),
(1085, 'BFbsLpwncIoQkMBEJWtD', 10, 'No'),
(1086, 'eRKsyipxuXTOsgqfLoJc', 10, 'No'),
(1087, 'mdzUsQpVaDBPoEXwPlZk', 10, 'No'),
(1088, 'BEgVGrpHXzUQnvgsKNwM', 10, 'No'),
(1089, 'iHjtgOAJXPqfEQKzRezo', 10, 'No'),
(1090, 'tXuKzWDiIcAGwRdyJgsS', 10, 'No'),
(1091, 'qCyPYgLOanGNrtGKtoVU', 10, 'No'),
(1092, 'PrLqMxQVBFmAeQKGCDod', 10, 'No'),
(1093, 'TmUZlbVjirXhRJAxcPIH', 10, 'No'),
(1094, 'IrvQeOGQjYKnMSszyPAX', 10, 'No'),
(1095, 'FUsMnochcYCKzbgwYGkm', 10, 'No'),
(1096, 'LYdusVNxqjDPbpJeFlAx', 10, 'No'),
(1097, 'SlGxFIgyeJRCiOMqurax', 10, 'No'),
(1098, 'ITpLhjOGHcrnsYymUQaH', 10, 'No'),
(1099, 'VaRjnJTkyeZvpEQMgXqe', 10, 'No'),
(1100, 'ciEMGFdftXYnYZWaRrSw', 10, 'No'),
(1101, 'utOzgXZuMUGhmWiwlUrK', 10, 'No'),
(1102, 'WfeAtQuzDzoTksMaBgCE', 10, 'No'),
(1103, 'SAVWabUyTMulcpiCEXNE', 10, 'No'),
(1104, 'FRWJHPkxcomTjzgypSGO', 10, 'No'),
(1105, 'DBGIOoNFcRVxeJQbKmOP', 10, 'No'),
(1106, 'mLEYyLIXPqbapdJslCRA', 10, 'No'),
(1107, 'cOUpmFATKoCJfyEVvMVn', 10, 'No'),
(1108, 'jKmDSZtIvifbdfJRVacP', 10, 'No'),
(1109, 'goaCMYABPZhdbqqOyStc', 10, 'No'),
(1110, 'FzAwgotMvmSYnPOjWEyi', 10, 'No'),
(1111, 'ibnwWEWqZFHKzdeeUycT', 10, 'No'),
(1112, 'esNOBEfXvVnwZKIPWjac', 10, 'No'),
(1113, 'oINRveAVWrjblMXHOgQq', 10, 'No'),
(1114, 'iMunaPRaZBGOsWpgDtde', 10, 'No'),
(1115, 'cuOdKnLWTfeMsCSXWgtl', 10, 'No'),
(1116, 'xNikgjYUEmtsMKVeOJzN', 10, 'No'),
(1117, 'yPQAOLGvoIZRcmJbDxbt', 10, 'No'),
(1118, 'QUnDrbAvgKyLNohJiFsY', 10, 'No'),
(1119, 'OPTEVISAJaMZyNhlPmXg', 10, 'No'),
(1120, 'ahyeioBOHsJGDTVrBLuU', 10, 'No'),
(1121, 'MNpvrHcPFlgIyawgTmbI', 10, 'No'),
(1122, 'MTALSxOBDxNHFEdlIwhi', 10, 'No'),
(1123, 'JkfneNsBqobwxjJyEMrs', 10, 'No'),
(1124, 'KOqyJeVtSpIsUCGecRMC', 10, 'No'),
(1125, 'aQqGtdfCZmNxjEpkVWom', 10, 'No'),
(1126, 'ltMDLcQdgiWxTuXBvAas', 10, 'No'),
(1127, 'ToCJIrBXxfUdluyksbRh', 10, 'No'),
(1128, 'YHpgeEjsfGRLZrNSqjuO', 10, 'No'),
(1129, 'xXjFlVYrEHRhowuMsmcs', 10, 'No'),
(1130, 'eqRoUkKJbSlLGetTBKza', 10, 'No'),
(1131, 'iDVoZUlXQxXSYzABKmyk', 10, 'No'),
(1132, 'iLsZCOnMtytEbaWFjqzD', 10, 'No'),
(1133, 'DuPeJKRFUOwRXpVsnlIu', 10, 'No'),
(1134, 'fmEMjXyHzBbTgNwPBvpR', 10, 'No'),
(1135, 'yvSFPqTIxQJxchGkOawM', 10, 'No'),
(1136, 'THafvteYIFUlgeMOWidQ', 10, 'No'),
(1137, 'qdgNbJIYPNGUhVABLeim', 10, 'No'),
(1138, 'lCKBwtENDiTnoQtdmvhB', 10, 'No'),
(1139, 'zshKyNgHRRljdkniVLPY', 10, 'No'),
(1140, 'NDsFReuqUBVqjSdKkYCl', 10, 'No'),
(1141, 'GFhPfinEAOGxlCBNdZsz', 10, 'No'),
(1142, 'NlLwtJjAIQeamPSPcKuu', 10, 'No'),
(1143, 'YxZCipwbqLFPjXaXmJuf', 10, 'No'),
(1144, 'wNcSVmvMZIaRgaBezEXk', 10, 'No'),
(1145, 'ieHqVbhnZISGLFxjKFhk', 10, 'No'),
(1146, 'ZLXxrpEMRwvAhCncUabi', 10, 'No'),
(1147, 'onbwpvpLXQMrhBOcgCjZ', 10, 'No'),
(1148, 'JtwgdyRmbAHZENzfioYO', 10, 'No'),
(1149, 'uTzbMSyVaEWguCXfnepm', 10, 'No'),
(1150, 'rVYdhxSsRiPJDMRAjUnh', 10, 'No'),
(1151, 'bFDkTbAxrWvVhPciCAGS', 10, 'No'),
(1152, 'pcRaOAWNRzvHlgqTEQkt', 10, 'No'),
(1153, 'kLJGINxwacrLUdufZXuR', 10, 'No'),
(1154, 'AcoQNWqozuXrVPFBMhWJ', 10, 'No'),
(1155, 'ixJjVTPmWcKqQXEXnqGZ', 10, 'No'),
(1156, 'QFjyzEipqcKtMPXYDOIG', 10, 'No'),
(1157, 'QkwliVqKGuBEYIgTeJIg', 10, 'No'),
(1158, 'VPzqEXdplchSHwJTZTIt', 10, 'No'),
(1159, 'fZavJzOVEAHXkncpyiFP', 10, 'No'),
(1160, 'FVsUmxEPztynBwdZMfXQ', 10, 'No'),
(1161, 'CTrGNkBUamHBXJjOelon', 10, 'No'),
(1162, 'rUnTWaLgFQAhGztGJSez', 10, 'No'),
(1163, 'vFfswMutmcRJsZCXSMkz', 10, 'No'),
(1164, 'hwIeeSbYzgklJqXVZvKG', 10, 'No'),
(1165, 'IoEmLXSHxZePCuvERhOi', 10, 'No'),
(1166, 'pDRrHfhsPAwtcWUyMYIE', 10, 'No'),
(1167, 'ekUShGqNVZCDupgBJbDL', 10, 'No'),
(1168, 'HRBDjOJZvWfkghxUPebv', 10, 'No'),
(1169, 'JutTpAeHomyXhFEuDAkY', 10, 'No'),
(1170, 'WMLNTErwZOJvtqlAxKFJ', 10, 'No'),
(1171, 'dcOsRwaBfLuzWDdbIrAK', 10, 'No'),
(1172, 'EdhmcQMfaoHBxPtUnqSl', 10, 'No'),
(1173, 'qgNPQWDyObUiVcYdstez', 10, 'No'),
(1174, 'EMjOrzUvgyHtIXieSVAZ', 10, 'No'),
(1175, 'stgdcvJaWPYxbplLzTXK', 10, 'No'),
(1176, 'kMcnHWmXYCiLgJuIwQrP', 10, 'No'),
(1177, 'ANXwojiMOjZIvlWhQYFq', 10, 'No'),
(1178, 'fWnpjZlMKNLsbBVOocyI', 10, 'No'),
(1179, 'PmoTwIsirCjaBtqEzLZJ', 10, 'No'),
(1180, 'FxdfCEGIAgWOiqRSmVvM', 10, 'No'),
(1181, 'dyPMnVcrBjILXHoYDfEs', 10, 'No'),
(1182, 'MImcJwgHPHyxNlCtLTzq', 10, 'No'),
(1183, 'hEjdVFCulALgXioHmNkp', 10, 'No'),
(1184, 'kJVCcUhWbFTjNtkSPOui', 10, 'No'),
(1185, 'nPqGwmLOKtVPgkdAUFSr', 10, 'No'),
(1186, 'EXIdLzpHZQatfeDxVjTU', 10, 'No'),
(1187, 'NzwsZYHJQdeujKhPmdLx', 10, 'No'),
(1188, 'yFRAYZwGTquMlEmpPsJh', 10, 'No'),
(1189, 'YmTJWHqbQReOVIoxkzcc', 10, 'No'),
(1190, 'WrGbNMkYHnwcuqhKUjWe', 10, 'No'),
(1191, 'TyZDZCzkABFpGajUsehw', 10, 'No'),
(1192, 'rzQpNKCGHHAYwhdbkoFD', 10, 'No'),
(1193, 'YqZSRnEiOMzWxMclTska', 10, 'No'),
(1194, 'uqkRYCcNiPXaHAfMxwDr', 10, 'No'),
(1195, 'JCbYBMdPAjfRxaCoOnTk', 10, 'No'),
(1196, 'VjeLEUPmMeiKYQuvqTJb', 10, 'No'),
(1197, 'tMeTiKxPGLmhERSFaOaz', 10, 'No'),
(1198, 'huIOnWSAeARLKlByCnJz', 10, 'No'),
(1199, 'DlAwTSCHqrfVObRWapeg', 10, 'No'),
(1200, 'xenmRrIsXzuBiKYvZCVg', 10, 'No'),
(1201, 'SCQFozEvgmifquROxXSL', 10, 'No'),
(1202, 'LxGgUjnsmlRTrbfcDRWC', 10, 'No'),
(1203, 'rgzoQOcKhjeDCIunVSfZ', 10, 'No'),
(1204, 'HGwVJghcCLpLPsRaUqbD', 10, 'No'),
(1205, 'kowkfaRAiNDJTGxCsIet', 10, 'No'),
(1206, 'BMbLAclXoqvPfmOxSnYs', 10, 'No'),
(1207, 'xPMWbypuZOCPolczhgJN', 10, 'No'),
(1208, 'mWZDRJcHqdwmMkrAxVSV', 10, 'No'),
(1209, 'WNTQMzlOJhHvGeLrMymi', 10, 'No'),
(1210, 'cMnpPOXILhGKFHflmate', 10, 'No'),
(1211, 'ahOxtdjAgZgnbkPCpQqS', 10, 'No'),
(1212, 'UBHRtarGSeKJFuDmnkgG', 10, 'No'),
(1213, 'yXnjQPKUcZUWuGrsJixg', 10, 'No'),
(1214, 'PWZRdaLlbKICiHpfnPgU', 10, 'No'),
(1215, 'eWGCTysHfvPcSOkjuLEz', 10, 'No'),
(1216, 'YOmXpEMrIBWcQHqgPxKv', 10, 'No'),
(1217, 'CVptuiofGsByDbFlIGUk', 10, 'No'),
(1218, 'qeRWNUaKBHSdtsxsuLVr', 10, 'No'),
(1219, 'paOvifMhDSXUPZLmlQUx', 10, 'No'),
(1220, 'ApzOVSMDoncdaQfLZlNI', 10, 'No'),
(1221, 'hOSUMqBtbzQeXLIcOmvR', 10, 'No'),
(1222, 'PqubhMKmfUNJdXyTVnUO', 10, 'No'),
(1223, 'siVpCjwPRzteQNFBMosq', 10, 'No'),
(1224, 'wjdVKAFcBnNUzIcYxsJb', 10, 'No'),
(1225, 'ZavqUDMSgehtXyvcQVAJ', 10, 'No'),
(1226, 'sqyTPcJEIBtSnQmejAMG', 10, 'No'),
(1227, 'dhtQbcDXjrHJAyYUxNkO', 10, 'No'),
(1228, 'ofIhTMaBicwPNklyxZpA', 10, 'No'),
(1229, 'YLCoIwnoatQKghEBdjTW', 10, 'No'),
(1230, 'wJdFoHvgYtlBkQpMBPEK', 10, 'No'),
(1231, 'sWRPBINShdUlHvaviMIk', 10, 'No'),
(1232, 'aGBvVbjUNydBLcACwmsx', 10, 'No'),
(1233, 'JOkvwZgfbLtlKaCpIHah', 10, 'No'),
(1234, 'FbHzdmTVWoKXSXpdilLs', 10, 'No'),
(1235, 'KKtQibaztYkPLslDCoEq', 10, 'No'),
(1236, 'qxcImNZvzXsLSCPfuwGA', 10, 'No'),
(1237, 'yUcZaxvuIVMmqwbSGliQ', 10, 'No'),
(1238, 'BcQovvaYVRGpIbJCBgui', 10, 'No'),
(1239, 'hEwSiyrUQbIwXfDpsATc', 10, 'No'),
(1240, 'cctTohUBDkZlEFHiUnjG', 10, 'No'),
(1241, 'orILJuebThAlSBvCHFuN', 10, 'No'),
(1242, 'iQcCBZNzzsfXlmvhZRVo', 10, 'No'),
(1243, 'JYjbGkuTEnZemOHOPLow', 10, 'No'),
(1244, 'WEyszToaOdwRvnbfYXgH', 10, 'No'),
(1245, 'CYQFEngXyNUlzfcrQine', 10, 'No'),
(1246, 'rwHfXamBJlFQnykTbSLz', 20, 'No'),
(1247, 'OHlQVRrbJiUHWgxpuXIs', 20, 'No'),
(1248, 'LelZDobYYCOuqNdQUFsB', 20, 'No'),
(1249, 'oXKNIcLJxIDEPsCFZQaf', 10, 'No'),
(1250, 'FMGcNMaxzZpIewRiKUXy', 10, 'No');

-- --------------------------------------------------------

--
-- Struktur dari tabel `z_kabupaten`
--

CREATE TABLE `z_kabupaten` (
  `id` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `id_provinsi` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `kabupaten` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kodepos` int(11) NOT NULL,
  `aktif` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `z_kabupaten`
--

INSERT INTO `z_kabupaten` (`id`, `id_provinsi`, `kabupaten`, `kodepos`, `aktif`) VALUES
('1', '21', 'Aceh Barat', 23681, 'No'),
('10', '21', 'Aceh Timur', 24454, 'No'),
('100', '19', 'Buru Selatan', 97351, 'No'),
('101', '30', 'Buton', 93754, 'No'),
('102', '30', 'Buton Utara', 93745, 'No'),
('103', '9', 'Ciamis', 46211, 'No'),
('104', '9', 'Cianjur', 43217, 'No'),
('105', '10', 'Cilacap', 53211, 'No'),
('106', '3', 'Cilegon', 42417, 'No'),
('107', '9', 'Cimahi', 40512, 'No'),
('108', '9', 'Cirebon', 45611, 'No'),
('109', '9', 'Cirebon', 45116, 'No'),
('11', '21', 'Aceh Utara', 24382, 'No'),
('110', '34', 'Dairi', 22211, 'No'),
('111', '24', 'Deiyai (Deliyai)', 98784, 'No'),
('112', '34', 'Deli Serdang', 20511, 'No'),
('113', '10', 'Demak', 59519, 'No'),
('114', '1', 'Denpasar', 80227, 'No'),
('115', '9', 'Depok', 16416, 'No'),
('116', '32', 'Dharmasraya', 27612, 'No'),
('117', '24', 'Dogiyai', 98866, 'No'),
('118', '22', 'Dompu', 84217, 'No'),
('119', '29', 'Donggala', 94341, 'No'),
('12', '32', 'Agam', 26411, 'No'),
('120', '26', 'Dumai', 28811, 'No'),
('121', '33', 'Empat Lawang', 31811, 'No'),
('122', '23', 'Ende', 86351, 'No'),
('123', '28', 'Enrekang', 91719, 'No'),
('124', '25', 'Fakfak', 98651, 'No'),
('125', '23', 'Flores Timur', 86213, 'No'),
('126', '9', 'Garut', 44126, 'No'),
('127', '21', 'Gayo Lues', 24653, 'No'),
('128', '1', 'Gianyar', 80519, 'No'),
('129', '7', 'Gorontalo', 96218, 'No'),
('13', '23', 'Alor', 85811, 'No'),
('130', '7', 'Gorontalo', 96115, 'No'),
('131', '7', 'Gorontalo Utara', 96611, 'No'),
('132', '28', 'Gowa', 92111, 'No'),
('133', '11', 'Gresik', 61115, 'No'),
('134', '10', 'Grobogan', 58111, 'No'),
('135', '5', 'Gunung Kidul', 55812, 'No'),
('136', '14', 'Gunung Mas', 74511, 'No'),
('137', '34', 'Gunungsitoli', 22813, 'No'),
('138', '20', 'Halmahera Barat', 97757, 'No'),
('139', '20', 'Halmahera Selatan', 97911, 'No'),
('14', '19', 'Ambon', 97222, 'No'),
('140', '20', 'Halmahera Tengah', 97853, 'No'),
('141', '20', 'Halmahera Timur', 97862, 'No'),
('142', '20', 'Halmahera Utara', 97762, 'No'),
('143', '13', 'Hulu Sungai Selatan', 71212, 'No'),
('144', '13', 'Hulu Sungai Tengah', 71313, 'No'),
('145', '13', 'Hulu Sungai Utara', 71419, 'No'),
('146', '34', 'Humbang Hasundutan', 22457, 'No'),
('147', '26', 'Indragiri Hilir', 29212, 'No'),
('148', '26', 'Indragiri Hulu', 29319, 'No'),
('149', '9', 'Indramayu', 45214, 'No'),
('15', '34', 'Asahan', 21214, 'No'),
('150', '24', 'Intan Jaya', 98771, 'No'),
('151', '6', 'Jakarta Barat', 11220, 'No'),
('152', '6', 'Jakarta Pusat', 10540, 'No'),
('153', '6', 'Jakarta Selatan', 12230, 'No'),
('154', '6', 'Jakarta Timur', 13330, 'No'),
('155', '6', 'Jakarta Utara', 14140, 'No'),
('156', '8', 'Jambi', 36111, 'No'),
('157', '24', 'Jayapura', 99352, 'No'),
('158', '24', 'Jayapura', 99114, 'No'),
('159', '24', 'Jayawijaya', 99511, 'No'),
('16', '24', 'Asmat', 99777, 'No'),
('160', '11', 'Jember', 68113, 'No'),
('161', '1', 'Jembrana', 82251, 'No'),
('162', '28', 'Jeneponto', 92319, 'No'),
('163', '10', 'Jepara', 59419, 'No'),
('164', '11', 'Jombang', 61415, 'No'),
('165', '25', 'Kaimana', 98671, 'No'),
('166', '26', 'Kampar', 28411, 'No'),
('167', '14', 'Kapuas', 73583, 'No'),
('168', '12', 'Kapuas Hulu', 78719, 'No'),
('169', '10', 'Karanganyar', 57718, 'No'),
('17', '1', 'Badung', 80351, 'No'),
('170', '1', 'Karangasem', 80819, 'No'),
('171', '9', 'Karawang', 41311, 'No'),
('172', '17', 'Karimun', 29611, 'No'),
('173', '34', 'Karo', 22119, 'No'),
('174', '14', 'Katingan', 74411, 'No'),
('175', '4', 'Kaur', 38911, 'No'),
('176', '12', 'Kayong Utara', 78852, 'No'),
('177', '10', 'Kebumen', 54319, 'No'),
('178', '11', 'Kediri', 64184, 'No'),
('179', '11', 'Kediri', 64125, 'No'),
('18', '13', 'Balangan', 71611, 'No'),
('180', '24', 'Keerom', 99461, 'No'),
('181', '10', 'Kendal', 51314, 'No'),
('182', '30', 'Kendari', 93126, 'No'),
('183', '4', 'Kepahiang', 39319, 'No'),
('184', '17', 'Kepulauan Anambas', 29991, 'No'),
('185', '19', 'Kepulauan Aru', 97681, 'No'),
('186', '32', 'Kepulauan Mentawai', 25771, 'No'),
('187', '26', 'Kepulauan Meranti', 28791, 'No'),
('188', '31', 'Kepulauan Sangihe', 95819, 'No'),
('189', '6', 'Kepulauan Seribu', 14550, 'No'),
('19', '15', 'Balikpapan', 76111, 'No'),
('190', '31', 'Kepulauan Siau Tagulandang Biaro (Sitaro)', 95862, 'No'),
('191', '20', 'Kepulauan Sula', 97995, 'No'),
('192', '31', 'Kepulauan Talaud', 95885, 'No'),
('193', '24', 'Kepulauan Yapen (Yapen Waropen)', 98211, 'No'),
('194', '8', 'Kerinci', 37167, 'No'),
('195', '12', 'Ketapang', 78874, 'No'),
('196', '10', 'Klaten', 57411, 'No'),
('197', '1', 'Klungkung', 80719, 'No'),
('198', '30', 'Kolaka', 93511, 'No'),
('199', '30', 'Kolaka Utara', 93911, 'No'),
('2', '21', 'Aceh Barat Daya', 23764, 'No'),
('20', '21', 'Banda Aceh', 23238, 'No'),
('200', '30', 'Konawe', 93411, 'No'),
('201', '30', 'Konawe Selatan', 93811, 'No'),
('202', '30', 'Konawe Utara', 93311, 'No'),
('203', '13', 'Kotabaru', 72119, 'No'),
('204', '31', 'Kotamobagu', 95711, 'No'),
('205', '14', 'Kotawaringin Barat', 74119, 'No'),
('206', '14', 'Kotawaringin Timur', 74364, 'No'),
('207', '26', 'Kuantan Singingi', 29519, 'No'),
('208', '12', 'Kubu Raya', 78311, 'No'),
('209', '10', 'Kudus', 59311, 'No'),
('21', '18', 'Bandar Lampung', 35139, 'No'),
('210', '5', 'Kulon Progo', 55611, 'No'),
('211', '9', 'Kuningan', 45511, 'No'),
('212', '23', 'Kupang', 85362, 'No'),
('213', '23', 'Kupang', 85119, 'No'),
('214', '15', 'Kutai Barat', 75711, 'No'),
('215', '15', 'Kutai Kartanegara', 75511, 'No'),
('216', '15', 'Kutai Timur', 75611, 'No'),
('217', '34', 'Labuhan Batu', 21412, 'No'),
('218', '34', 'Labuhan Batu Selatan', 21511, 'No'),
('219', '34', 'Labuhan Batu Utara', 21711, 'No'),
('22', '9', 'Bandung', 40311, 'No'),
('220', '33', 'Lahat', 31419, 'No'),
('221', '14', 'Lamandau', 74611, 'No'),
('222', '11', 'Lamongan', 64125, 'No'),
('223', '18', 'Lampung Barat', 34814, 'No'),
('224', '18', 'Lampung Selatan', 35511, 'No'),
('225', '18', 'Lampung Tengah', 34212, 'No'),
('226', '18', 'Lampung Timur', 34319, 'No'),
('227', '18', 'Lampung Utara', 34516, 'No'),
('228', '12', 'Landak', 78319, 'No'),
('229', '34', 'Langkat', 20811, 'No'),
('23', '9', 'Bandung', 40111, 'No'),
('230', '21', 'Langsa', 24412, 'No'),
('231', '24', 'Lanny Jaya', 99531, 'No'),
('232', '3', 'Lebak', 42319, 'No'),
('233', '4', 'Lebong', 39264, 'No'),
('234', '23', 'Lembata', 86611, 'No'),
('235', '21', 'Lhokseumawe', 24352, 'No'),
('236', '32', 'Lima Puluh Koto/Kota', 26671, 'No'),
('237', '17', 'Lingga', 29811, 'No'),
('238', '22', 'Lombok Barat', 83311, 'No'),
('239', '22', 'Lombok Tengah', 83511, 'No'),
('24', '9', 'Bandung Barat', 40721, 'No'),
('240', '22', 'Lombok Timur', 83612, 'No'),
('241', '22', 'Lombok Utara', 83711, 'No'),
('242', '33', 'Lubuk Linggau', 31614, 'No'),
('243', '11', 'Lumajang', 67319, 'No'),
('244', '28', 'Luwu', 91994, 'No'),
('245', '28', 'Luwu Timur', 92981, 'No'),
('246', '28', 'Luwu Utara', 92911, 'No'),
('247', '11', 'Madiun', 63153, 'No'),
('248', '11', 'Madiun', 63122, 'No'),
('249', '10', 'Magelang', 56519, 'No'),
('25', '29', 'Banggai', 94711, 'No'),
('250', '10', 'Magelang', 56133, 'No'),
('251', '11', 'Magetan', 63314, 'No'),
('252', '9', 'Majalengka', 45412, 'No'),
('253', '27', 'Majene', 91411, 'No'),
('254', '28', 'Makassar', 90111, 'No'),
('255', '11', 'Malang', 65163, 'No'),
('256', '11', 'Malang', 65112, 'No'),
('257', '16', 'Malinau', 77511, 'No'),
('258', '19', 'Maluku Barat Daya', 97451, 'No'),
('259', '19', 'Maluku Tengah', 97513, 'No'),
('26', '29', 'Banggai Kepulauan', 94881, 'No'),
('260', '19', 'Maluku Tenggara', 97651, 'No'),
('261', '19', 'Maluku Tenggara Barat', 97465, 'No'),
('262', '27', 'Mamasa', 91362, 'No'),
('263', '24', 'Mamberamo Raya', 99381, 'No'),
('264', '24', 'Mamberamo Tengah', 99553, 'No'),
('265', '27', 'Mamuju', 91519, 'No'),
('266', '27', 'Mamuju Utara', 91571, 'No'),
('267', '31', 'Manado', 95247, 'No'),
('268', '34', 'Mandailing Natal', 22916, 'No'),
('269', '23', 'Manggarai', 86551, 'No'),
('27', '2', 'Bangka', 33212, 'No'),
('270', '23', 'Manggarai Barat', 86711, 'No'),
('271', '23', 'Manggarai Timur', 86811, 'No'),
('272', '25', 'Manokwari', 98311, 'No'),
('273', '25', 'Manokwari Selatan', 98355, 'No'),
('274', '24', 'Mappi', 99853, 'No'),
('275', '28', 'Maros', 90511, 'No'),
('276', '22', 'Mataram', 83131, 'No'),
('277', '25', 'Maybrat', 98051, 'No'),
('278', '34', 'Medan', 20228, 'No'),
('279', '12', 'Melawi', 78619, 'No'),
('28', '2', 'Bangka Barat', 33315, 'No'),
('280', '8', 'Merangin', 37319, 'No'),
('281', '24', 'Merauke', 99613, 'No'),
('282', '18', 'Mesuji', 34911, 'No'),
('283', '18', 'Metro', 34111, 'No'),
('284', '24', 'Mimika', 99962, 'No'),
('285', '31', 'Minahasa', 95614, 'No'),
('286', '31', 'Minahasa Selatan', 95914, 'No'),
('287', '31', 'Minahasa Tenggara', 95995, 'No'),
('288', '31', 'Minahasa Utara', 95316, 'No'),
('289', '11', 'Mojokerto', 61382, 'No'),
('29', '2', 'Bangka Selatan', 33719, 'No'),
('290', '11', 'Mojokerto', 61316, 'No'),
('291', '29', 'Morowali', 94911, 'No'),
('292', '33', 'Muara Enim', 31315, 'No'),
('293', '8', 'Muaro Jambi', 36311, 'No'),
('294', '4', 'Muko Muko', 38715, 'No'),
('295', '30', 'Muna', 93611, 'No'),
('296', '14', 'Murung Raya', 73911, 'No'),
('297', '33', 'Musi Banyuasin', 30719, 'No'),
('298', '33', 'Musi Rawas', 31661, 'No'),
('299', '24', 'Nabire', 98816, 'No'),
('3', '21', 'Aceh Besar', 23951, 'No'),
('30', '2', 'Bangka Tengah', 33613, 'No'),
('300', '21', 'Nagan Raya', 23674, 'No'),
('301', '23', 'Nagekeo', 86911, 'No'),
('302', '17', 'Natuna', 29711, 'No'),
('303', '24', 'Nduga', 99541, 'No'),
('304', '23', 'Ngada', 86413, 'No'),
('305', '11', 'Nganjuk', 64414, 'No'),
('306', '11', 'Ngawi', 63219, 'No'),
('307', '34', 'Nias', 22876, 'No'),
('308', '34', 'Nias Barat', 22895, 'No'),
('309', '34', 'Nias Selatan', 22865, 'No'),
('31', '11', 'Bangkalan', 69118, 'No'),
('310', '34', 'Nias Utara', 22856, 'No'),
('311', '16', 'Nunukan', 77421, 'No'),
('312', '33', 'Ogan Ilir', 30811, 'No'),
('313', '33', 'Ogan Komering Ilir', 30618, 'No'),
('314', '33', 'Ogan Komering Ulu', 32112, 'No'),
('315', '33', 'Ogan Komering Ulu Selatan', 32211, 'No'),
('316', '33', 'Ogan Komering Ulu Timur', 32312, 'No'),
('317', '11', 'Pacitan', 63512, 'No'),
('318', '32', 'Padang', 25112, 'No'),
('319', '34', 'Padang Lawas', 22763, 'No'),
('32', '1', 'Bangli', 80619, 'No'),
('320', '34', 'Padang Lawas Utara', 22753, 'No'),
('321', '32', 'Padang Panjang', 27122, 'No'),
('322', '32', 'Padang Pariaman', 25583, 'No'),
('323', '34', 'Padang Sidempuan', 22727, 'No'),
('324', '33', 'Pagar Alam', 31512, 'No'),
('325', '34', 'Pakpak Bharat', 22272, 'No'),
('326', '14', 'Palangka Raya', 73112, 'No'),
('327', '33', 'Palembang', 31512, 'No'),
('328', '28', 'Palopo', 91911, 'No'),
('329', '29', 'Palu', 94111, 'No'),
('33', '13', 'Banjar', 70619, 'No'),
('330', '11', 'Pamekasan', 69319, 'No'),
('331', '3', 'Pandeglang', 42212, 'No'),
('332', '9', 'Pangandaran', 46511, 'No'),
('333', '28', 'Pangkajene Kepulauan', 90611, 'No'),
('334', '2', 'Pangkal Pinang', 33115, 'No'),
('335', '24', 'Paniai', 98765, 'No'),
('336', '28', 'Parepare', 91123, 'No'),
('337', '32', 'Pariaman', 25511, 'No'),
('338', '29', 'Parigi Moutong', 94411, 'No'),
('339', '32', 'Pasaman', 26318, 'No'),
('34', '9', 'Banjar', 46311, 'No'),
('340', '32', 'Pasaman Barat', 26511, 'No'),
('341', '15', 'Paser', 76211, 'No'),
('342', '11', 'Pasuruan', 67153, 'No'),
('343', '11', 'Pasuruan', 67118, 'No'),
('344', '10', 'Pati', 59114, 'No'),
('345', '32', 'Payakumbuh', 26213, 'No'),
('346', '25', 'Pegunungan Arfak', 98354, 'No'),
('347', '24', 'Pegunungan Bintang', 99573, 'No'),
('348', '10', 'Pekalongan', 51161, 'No'),
('349', '10', 'Pekalongan', 51122, 'No'),
('35', '13', 'Banjarbaru', 70712, 'No'),
('350', '26', 'Pekanbaru', 28112, 'No'),
('351', '26', 'Pelalawan', 28311, 'No'),
('352', '10', 'Pemalang', 52319, 'No'),
('353', '34', 'Pematang Siantar', 21126, 'No'),
('354', '15', 'Penajam Paser Utara', 76311, 'No'),
('355', '18', 'Pesawaran', 35312, 'No'),
('356', '18', 'Pesisir Barat', 35974, 'No'),
('357', '32', 'Pesisir Selatan', 25611, 'No'),
('358', '21', 'Pidie', 24116, 'No'),
('359', '21', 'Pidie Jaya', 24186, 'No'),
('36', '13', 'Banjarmasin', 70117, 'No'),
('360', '28', 'Pinrang', 91251, 'No'),
('361', '7', 'Pohuwato', 96419, 'No'),
('362', '27', 'Polewali Mandar', 91311, 'No'),
('363', '11', 'Ponorogo', 63411, 'No'),
('364', '12', 'Pontianak', 78971, 'No'),
('365', '12', 'Pontianak', 78112, 'No'),
('366', '29', 'Poso', 94615, 'No'),
('367', '33', 'Prabumulih', 31121, 'No'),
('368', '18', 'Pringsewu', 35719, 'No'),
('369', '11', 'Probolinggo', 67282, 'No'),
('37', '10', 'Banjarnegara', 53419, 'No'),
('370', '11', 'Probolinggo', 67215, 'No'),
('371', '14', 'Pulang Pisau', 74811, 'No'),
('372', '20', 'Pulau Morotai', 97771, 'No'),
('373', '24', 'Puncak', 98981, 'No'),
('374', '24', 'Puncak Jaya', 98979, 'No'),
('375', '10', 'Purbalingga', 53312, 'No'),
('376', '9', 'Purwakarta', 41119, 'No'),
('377', '10', 'Purworejo', 54111, 'No'),
('378', '25', 'Raja Ampat', 98489, 'No'),
('379', '4', 'Rejang Lebong', 39112, 'No'),
('38', '28', 'Bantaeng', 92411, 'No'),
('380', '10', 'Rembang', 59219, 'No'),
('381', '26', 'Rokan Hilir', 28992, 'No'),
('382', '26', 'Rokan Hulu', 28511, 'No'),
('383', '23', 'Rote Ndao', 85982, 'No'),
('384', '21', 'Sabang', 23512, 'No'),
('385', '23', 'Sabu Raijua', 85391, 'No'),
('386', '10', 'Salatiga', 50711, 'No'),
('387', '15', 'Samarinda', 75133, 'No'),
('388', '12', 'Sambas', 79453, 'No'),
('389', '34', 'Samosir', 22392, 'No'),
('39', '5', 'Bantul', 55715, 'No'),
('390', '11', 'Sampang', 69219, 'No'),
('391', '12', 'Sanggau', 78557, 'No'),
('392', '24', 'Sarmi', 99373, 'No'),
('393', '8', 'Sarolangun', 37419, 'No'),
('394', '32', 'Sawah Lunto', 27416, 'No'),
('395', '12', 'Sekadau', 79583, 'No'),
('396', '28', 'Selayar (Kepulauan Selayar)', 92812, 'No'),
('397', '4', 'Seluma', 38811, 'No'),
('398', '10', 'Semarang', 50511, 'No'),
('399', '10', 'Semarang', 50135, 'No'),
('4', '21', 'Aceh Jaya', 23654, 'No'),
('40', '33', 'Banyuasin', 30911, 'No'),
('400', '19', 'Seram Bagian Barat', 97561, 'No'),
('401', '19', 'Seram Bagian Timur', 97581, 'No'),
('402', '3', 'Serang', 42182, 'No'),
('403', '3', 'Serang', 42111, 'No'),
('404', '34', 'Serdang Bedagai', 20915, 'No'),
('405', '14', 'Seruyan', 74211, 'No'),
('406', '26', 'Siak', 28623, 'No'),
('407', '34', 'Sibolga', 22522, 'No'),
('408', '28', 'Sidenreng Rappang/Rapang', 91613, 'No'),
('409', '11', 'Sidoarjo', 61219, 'No'),
('41', '10', 'Banyumas', 53114, 'No'),
('410', '29', 'Sigi', 94364, 'No'),
('411', '32', 'Sijunjung (Sawah Lunto Sijunjung)', 27511, 'No'),
('412', '23', 'Sikka', 86121, 'No'),
('413', '34', 'Simalungun', 21162, 'No'),
('414', '21', 'Simeulue', 23891, 'No'),
('415', '12', 'Singkawang', 79117, 'No'),
('416', '28', 'Sinjai', 92615, 'No'),
('417', '12', 'Sintang', 78619, 'No'),
('418', '11', 'Situbondo', 68316, 'No'),
('419', '5', 'Sleman', 55513, 'No'),
('42', '11', 'Banyuwangi', 68416, 'Yes'),
('420', '32', 'Solok', 27365, 'No'),
('421', '32', 'Solok', 27315, 'No'),
('422', '32', 'Solok Selatan', 27779, 'No'),
('423', '28', 'Soppeng', 90812, 'No'),
('424', '25', 'Sorong', 98431, 'No'),
('425', '25', 'Sorong', 98411, 'No'),
('426', '25', 'Sorong Selatan', 98454, 'No'),
('427', '10', 'Sragen', 57211, 'No'),
('428', '9', 'Subang', 41215, 'No'),
('429', '21', 'Subulussalam', 24882, 'No'),
('43', '13', 'Barito Kuala', 70511, 'No'),
('430', '9', 'Sukabumi', 43311, 'No'),
('431', '9', 'Sukabumi', 43114, 'No'),
('432', '14', 'Sukamara', 74712, 'No'),
('433', '10', 'Sukoharjo', 57514, 'No'),
('434', '23', 'Sumba Barat', 87219, 'No'),
('435', '23', 'Sumba Barat Daya', 87453, 'No'),
('436', '23', 'Sumba Tengah', 87358, 'No'),
('437', '23', 'Sumba Timur', 87112, 'No'),
('438', '22', 'Sumbawa', 84315, 'No'),
('439', '22', 'Sumbawa Barat', 84419, 'No'),
('44', '14', 'Barito Selatan', 73711, 'No'),
('440', '9', 'Sumedang', 45326, 'No'),
('441', '11', 'Sumenep', 69413, 'No'),
('442', '8', 'Sungaipenuh', 37113, 'No'),
('443', '24', 'Supiori', 98164, 'No'),
('444', '11', 'Surabaya', 60119, 'No'),
('445', '10', 'Surakarta (Solo)', 57113, 'No'),
('446', '13', 'Tabalong', 71513, 'No'),
('447', '1', 'Tabanan', 82119, 'No'),
('448', '28', 'Takalar', 92212, 'No'),
('449', '25', 'Tambrauw', 98475, 'No'),
('45', '14', 'Barito Timur', 73671, 'No'),
('450', '16', 'Tana Tidung', 77611, 'No'),
('451', '28', 'Tana Toraja', 91819, 'No'),
('452', '13', 'Tanah Bumbu', 72211, 'No'),
('453', '32', 'Tanah Datar', 27211, 'No'),
('454', '13', 'Tanah Laut', 70811, 'No'),
('455', '3', 'Tangerang', 15914, 'No'),
('456', '3', 'Tangerang', 15111, 'No'),
('457', '3', 'Tangerang Selatan', 15332, 'No'),
('458', '18', 'Tanggamus', 35619, 'No'),
('459', '34', 'Tanjung Balai', 21321, 'No'),
('46', '14', 'Barito Utara', 73881, 'No'),
('460', '8', 'Tanjung Jabung Barat', 36513, 'No'),
('461', '8', 'Tanjung Jabung Timur', 36719, 'No'),
('462', '17', 'Tanjung Pinang', 29111, 'No'),
('463', '34', 'Tapanuli Selatan', 22742, 'No'),
('464', '34', 'Tapanuli Tengah', 22611, 'No'),
('465', '34', 'Tapanuli Utara', 22414, 'No'),
('466', '13', 'Tapin', 71119, 'No'),
('467', '16', 'Tarakan', 77114, 'No'),
('468', '9', 'Tasikmalaya', 46411, 'No'),
('469', '9', 'Tasikmalaya', 46116, 'No'),
('47', '28', 'Barru', 90719, 'No'),
('470', '34', 'Tebing Tinggi', 20632, 'No'),
('471', '8', 'Tebo', 37519, 'No'),
('472', '10', 'Tegal', 52419, 'No'),
('473', '10', 'Tegal', 52114, 'No'),
('474', '25', 'Teluk Bintuni', 98551, 'No'),
('475', '25', 'Teluk Wondama', 98591, 'No'),
('476', '10', 'Temanggung', 56212, 'No'),
('477', '20', 'Ternate', 97714, 'No'),
('478', '20', 'Tidore Kepulauan', 97815, 'No'),
('479', '23', 'Timor Tengah Selatan', 85562, 'No'),
('48', '17', 'Batam', 29413, 'No'),
('480', '23', 'Timor Tengah Utara', 85612, 'No'),
('481', '34', 'Toba Samosir', 22316, 'No'),
('482', '29', 'Tojo Una-Una', 94683, 'No'),
('483', '29', 'Toli-Toli', 94542, 'No'),
('484', '24', 'Tolikara', 99411, 'No'),
('485', '31', 'Tomohon', 95416, 'No'),
('486', '28', 'Toraja Utara', 91831, 'No'),
('487', '11', 'Trenggalek', 66312, 'No'),
('488', '19', 'Tual', 97612, 'No'),
('489', '11', 'Tuban', 62319, 'No'),
('49', '10', 'Batang', 51211, 'No'),
('490', '18', 'Tulang Bawang', 34613, 'No'),
('491', '18', 'Tulang Bawang Barat', 34419, 'No'),
('492', '11', 'Tulungagung', 66212, 'No'),
('493', '28', 'Wajo', 90911, 'No'),
('494', '30', 'Wakatobi', 93791, 'No'),
('495', '24', 'Waropen', 98269, 'No'),
('496', '18', 'Way Kanan', 34711, 'No'),
('497', '10', 'Wonogiri', 57619, 'No'),
('498', '10', 'Wonosobo', 56311, 'No'),
('499', '24', 'Yahukimo', 99041, 'No'),
('5', '21', 'Aceh Selatan', 23719, 'No'),
('50', '8', 'Batang Hari', 36613, 'No'),
('500', '24', 'Yalimo', 99481, 'No'),
('501', '5', 'Yogyakarta', 55222, 'No'),
('51', '11', 'Batu', 65311, 'No'),
('52', '34', 'Batu Bara', 21655, 'No'),
('53', '30', 'Bau-Bau', 93719, 'No'),
('54', '9', 'Bekasi', 17837, 'No'),
('55', '9', 'Bekasi', 17121, 'No'),
('56', '2', 'Belitung', 33419, 'No'),
('57', '2', 'Belitung Timur', 33519, 'No'),
('58', '23', 'Belu', 85711, 'No'),
('59', '21', 'Bener Meriah', 24581, 'No'),
('6', '21', 'Aceh Singkil', 24785, 'No'),
('60', '26', 'Bengkalis', 28719, 'No'),
('61', '12', 'Bengkayang', 79213, 'No'),
('62', '4', 'Bengkulu', 38229, 'No'),
('63', '4', 'Bengkulu Selatan', 38519, 'No'),
('64', '4', 'Bengkulu Tengah', 38319, 'No'),
('65', '4', 'Bengkulu Utara', 38619, 'No'),
('66', '15', 'Berau', 77311, 'No'),
('67', '24', 'Biak Numfor', 98119, 'No'),
('68', '22', 'Bima', 84171, 'No'),
('69', '22', 'Bima', 84139, 'No'),
('7', '21', 'Aceh Tamiang', 24476, 'No'),
('70', '34', 'Binjai', 20712, 'No'),
('71', '17', 'Bintan', 29135, 'No'),
('72', '21', 'Bireuen', 24219, 'No'),
('73', '31', 'Bitung', 95512, 'No'),
('74', '11', 'Blitar', 66171, 'No'),
('75', '11', 'Blitar', 66124, 'No'),
('76', '10', 'Blora', 58219, 'No'),
('77', '7', 'Boalemo', 96319, 'No'),
('78', '9', 'Bogor', 16911, 'No'),
('79', '9', 'Bogor', 16119, 'No'),
('8', '21', 'Aceh Tengah', 24511, 'No'),
('80', '11', 'Bojonegoro', 62119, 'No'),
('81', '31', 'Bolaang Mongondow (Bolmong)', 95755, 'No'),
('82', '31', 'Bolaang Mongondow Selatan', 95774, 'No'),
('83', '31', 'Bolaang Mongondow Timur', 95783, 'No'),
('84', '31', 'Bolaang Mongondow Utara', 95765, 'No'),
('85', '30', 'Bombana', 93771, 'No'),
('86', '11', 'Bondowoso', 68219, 'No'),
('87', '28', 'Bone', 92713, 'No'),
('88', '7', 'Bone Bolango', 96511, 'No'),
('89', '15', 'Bontang', 75313, 'No'),
('9', '21', 'Aceh Tenggara', 24611, 'No'),
('90', '24', 'Boven Digoel', 99662, 'No'),
('91', '10', 'Boyolali', 57312, 'No'),
('92', '10', 'Brebes', 52212, 'No'),
('93', '32', 'Bukittinggi', 26115, 'No'),
('94', '1', 'Buleleng', 81111, 'No'),
('95', '28', 'Bulukumba', 92511, 'No'),
('96', '16', 'Bulungan (Bulongan)', 77211, 'No'),
('97', '8', 'Bungo', 37216, 'No'),
('98', '29', 'Buol', 94564, 'No'),
('99', '19', 'Buru', 97371, 'No');

-- --------------------------------------------------------

--
-- Struktur dari tabel `z_provinsi`
--

CREATE TABLE `z_provinsi` (
  `id` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `provinsi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `aktif` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `z_provinsi`
--

INSERT INTO `z_provinsi` (`id`, `provinsi`, `aktif`) VALUES
('1', 'Bali', 'No'),
('10', 'Jawa Tengah', 'No'),
('11', 'Jawa Timur', 'Yes'),
('12', 'Kalimantan Barat', 'No'),
('13', 'Kalimantan Selatan', 'No'),
('14', 'Kalimantan Tengah', 'No'),
('15', 'Kalimantan Timur', 'No'),
('16', 'Kalimantan Utara', 'No'),
('17', 'Kepulauan Riau', 'No'),
('18', 'Lampung', 'No'),
('19', 'Maluku', 'No'),
('2', 'Bangka Belitung', 'No'),
('20', 'Maluku Utara', 'No'),
('21', 'Nanggroe Aceh Darussalam (NAD)', 'No'),
('22', 'Nusa Tenggara Barat (NTB)', 'No'),
('23', 'Nusa Tenggara Timur (NTT)', 'No'),
('24', 'Papua', 'No'),
('25', 'Papua Barat', 'No'),
('26', 'Riau', 'No'),
('27', 'Sulawesi Barat', 'No'),
('28', 'Sulawesi Selatan', 'No'),
('29', 'Sulawesi Tengah', 'No'),
('3', 'Banten', 'No'),
('30', 'Sulawesi Tenggara', 'No'),
('31', 'Sulawesi Utara', 'No'),
('32', 'Sumatera Barat', 'No'),
('33', 'Sumatera Selatan', 'No'),
('34', 'Sumatera Utara', 'No'),
('4', 'Bengkulu', 'No'),
('5', 'DI Yogyakarta', 'No'),
('6', 'DKI Jakarta', 'No'),
('7', 'Gorontalo', 'No'),
('8', 'Jambi', 'No'),
('9', 'Jawa Barat', 'No');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bimbel`
--
ALTER TABLE `bimbel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bimbel_daftar`
--
ALTER TABLE `bimbel_daftar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bimbel_lokasi`
--
ALTER TABLE `bimbel_lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buku_master`
--
ALTER TABLE `buku_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_bank`
--
ALTER TABLE `data_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_bonus`
--
ALTER TABLE `data_bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_bonus_permintaan`
--
ALTER TABLE `data_bonus_permintaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_buku`
--
ALTER TABLE `data_buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_jawaban`
--
ALTER TABLE `data_jawaban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_jawaban_quipper`
--
ALTER TABLE `data_jawaban_quipper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_saran`
--
ALTER TABLE `data_saran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_soal`
--
ALTER TABLE `data_soal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_tutorial_soal`
--
ALTER TABLE `data_tutorial_soal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_settings`
--
ALTER TABLE `email_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_category`
--
ALTER TABLE `faq_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_panduan`
--
ALTER TABLE `faq_panduan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer`
--
ALTER TABLE `footer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_buku`
--
ALTER TABLE `invoice_buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_soal`
--
ALTER TABLE `kategori_soal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `list_image`
--
ALTER TABLE `list_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `list_video`
--
ALTER TABLE `list_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master`
--
ALTER TABLE `master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paket_poin`
--
ALTER TABLE `paket_poin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permintaan_konfirmasi`
--
ALTER TABLE `permintaan_konfirmasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quipper_materi`
--
ALTER TABLE `quipper_materi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `riwayat_bonus`
--
ALTER TABLE `riwayat_bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistik_soal`
--
ALTER TABLE `statistik_soal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_jawab`
--
ALTER TABLE `user_jawab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_kabupaten`
--
ALTER TABLE `z_kabupaten`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_provinsi`
--
ALTER TABLE `z_provinsi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bimbel`
--
ALTER TABLE `bimbel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bimbel_daftar`
--
ALTER TABLE `bimbel_daftar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `bimbel_lokasi`
--
ALTER TABLE `bimbel_lokasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `buku_master`
--
ALTER TABLE `buku_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `data_bank`
--
ALTER TABLE `data_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `data_bonus`
--
ALTER TABLE `data_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `data_bonus_permintaan`
--
ALTER TABLE `data_bonus_permintaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `data_buku`
--
ALTER TABLE `data_buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `data_jawaban`
--
ALTER TABLE `data_jawaban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4011;
--
-- AUTO_INCREMENT for table `data_jawaban_quipper`
--
ALTER TABLE `data_jawaban_quipper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;
--
-- AUTO_INCREMENT for table `data_saran`
--
ALTER TABLE `data_saran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `data_soal`
--
ALTER TABLE `data_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `data_tutorial_soal`
--
ALTER TABLE `data_tutorial_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_settings`
--
ALTER TABLE `email_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `faq_category`
--
ALTER TABLE `faq_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `faq_panduan`
--
ALTER TABLE `faq_panduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `footer`
--
ALTER TABLE `footer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `invoice_buku`
--
ALTER TABLE `invoice_buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `kategori_soal`
--
ALTER TABLE `kategori_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `list_image`
--
ALTER TABLE `list_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `list_video`
--
ALTER TABLE `list_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `master`
--
ALTER TABLE `master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;
--
-- AUTO_INCREMENT for table `paket_poin`
--
ALTER TABLE `paket_poin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `permintaan_konfirmasi`
--
ALTER TABLE `permintaan_konfirmasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `quipper_materi`
--
ALTER TABLE `quipper_materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ranking`
--
ALTER TABLE `ranking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `riwayat_bonus`
--
ALTER TABLE `riwayat_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `statistik_soal`
--
ALTER TABLE `statistik_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_jawab`
--
ALTER TABLE `user_jawab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1251;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
