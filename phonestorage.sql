-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 05, 2022 lúc 08:45 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `phonestorage`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSanphamAll` ()  BEGIN
    SELECT * FROM sanpham;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSanphamByMaSP` (IN `mapd` VARCHAR(10))  BEGIN
    SELECT * FROM sanpham WHERE sanpham.masp = mapd;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chinhanh`
--

CREATE TABLE `chinhanh` (
  `MaChiNhanh` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `TenChiNhanh` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DiaChi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `SDT` varchar(11) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chinhanh`
--

INSERT INTO `chinhanh` (`MaChiNhanh`, `TenChiNhanh`, `DiaChi`, `Email`, `SDT`) VALUES
('CN001', 'Sài Gòn 01', 'TP.HCM', 'cn001@gmail.com', '01020304050'),
('CN002', 'Sài Gòn 02', 'TP.HCM', 'cn002@gmail.com', '0213456789'),
('CN003', 'Sài Gòn 03', 'TP.HCM', 'cn003@gmail.com', '09090988112'),
('CN004', 'Hà Nội 01', 'Hà Nội', 'cn004@gmail.com', '03211223344'),
('CN005', 'Hà Nội 02', 'Hà Nội', 'cn005@gmail.com', '0102223311'),
('CN006', 'Hải Phòng', 'Hải Phòng', 'cn006@gmail.com', '01012233445'),
('CN007', 'Đà Nẵng', 'Đà Nẵng', 'cn007@gmail.com', '02345678911'),
('CN008', 'Thừa Thiên', 'Huế', 'cn008@gmail.com', '0827273861'),
('CN009', 'SGU', 'TP.HCM', 'abc@gmail.com', '1234567809');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietphieunhap`
--

CREATE TABLE `chitietphieunhap` (
  `MaPhieuNhap` varchar(20) NOT NULL,
  `MaSanPham` varchar(20) NOT NULL,
  `SoLuongNhap` int(11) NOT NULL,
  `DonGiaNhap` bigint(20) NOT NULL,
  `ThanhTien` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chitietphieunhap`
--

INSERT INTO `chitietphieunhap` (`MaPhieuNhap`, `MaSanPham`, `SoLuongNhap`, `DonGiaNhap`, `ThanhTien`) VALUES
('pn020', 'sp001', 10, 7990000, 63920000),
('pn023', 'sp001', 2, 19990000, 39980000),
('pn028', 'sp001', 2, 1999000, 3998000),
('pn021', 'sp002', 3, 38990000, 116970000),
('pn022', 'sp002', 1, 38990000, 38990000),
('pn024', 'sp002', 2, 38990000, 77980000),
('pn029', 'sp002', 10, 3899000, 38990000),
('pn017', 'sp004', 7, 9490000, 66430000),
('pn016', 'sp005', 7, 18990000, 132930000),
('pn015', 'sp006', 9, 13990000, 125910000),
('pn023', 'sp006', 1, 17990000, 17990000),
('pn014', 'sp007', 12, 9490000, 113880000),
('pn023', 'sp007', 1, 15990000, 15990000),
('pn026', 'sp007', 1, 15990000, 15990000),
('pn027', 'sp007', 3, 1599000, 4797000),
('pn013', 'sp008', 10, 9490000, 94900000),
('pn012', 'sp009', 3, 24990000, 74970000),
('pn011', 'sp010', 6, 5290000, 31740000),
('pn010', 'sp011', 4, 6290000, 25160000),
('pn008', 'sp013', 2, 7990000, 15980000),
('pn026', 'sp013', 1, 10490000, 10490000),
('pn007', 'sp014', 4, 1890000, 7560000),
('pn006', 'sp015', 3, 5290000, 15870000),
('pn025', 'sp035', 1, 300000, 300000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietphieuxuat`
--

CREATE TABLE `chitietphieuxuat` (
  `masp` varchar(10) NOT NULL,
  `mapx` varchar(10) NOT NULL,
  `soluong` int(11) DEFAULT NULL,
  `dongia` bigint(20) DEFAULT NULL,
  `thanhtien` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chitietphieuxuat`
--

INSERT INTO `chitietphieuxuat` (`masp`, `mapx`, `soluong`, `dongia`, `thanhtien`) VALUES
('sp001', 'px001', 1, 19900000, 19900000),
('sp001', 'px113', 25, 1999000, 49975000),
('sp016', 'px111', 2, 8990000, 17980000),
('sp016', 'px112', 1, 8990000, 26970000),
('sp020', 'px007', 2, 1990000, 3980000),
('sp024', 'px001', 2, 6490000, 12980000),
('sp026', 'px006', 1, 4990000, 4990000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MaLoai` varchar(20) NOT NULL,
  `TenLoai` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLoai`, `TenLoai`) VALUES
('loai01', 'iPhone'),
('loai02', 'Nokia'),
('loai03', 'Samsung'),
('loai04', 'OPPO'),
('loai05', 'Xiaomi'),
('loai06', 'Vivo'),
('loai07', 'Realme'),
('loai08', 'OnePlus'),
('loai09', 'Vsmart'),
('loai10', 'OPPO'),
('loai11', 'Mobell'),
('loai12', 'Itel'),
('loai13', 'Masstel'),
('loai14', 'BlackBerry'),
('loai15', 'Energiner');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacc`
--

CREATE TABLE `nhacc` (
  `MaNCC` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `TenNCC` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DiaChi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SDT` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhacc`
--

INSERT INTO `nhacc` (`MaNCC`, `TenNCC`, `DiaChi`, `SDT`) VALUES
('ncc001', 'Công Nghệ', 'Hà Nội', '19001880'),
('ncc002', 'Điện Tử', 'TPHCM', '19001880'),
('ncc003', 'Tương Lai', 'Quảng Ngãi', '1905454'),
('ncc004', 'Thiết bị kỹ thuật cao', 'Quảng Nam', '19005558'),
('ncc005', 'Bình Minh', 'Bình Định', '19005522'),
('ncc006', 'Biển Xanh', 'Cà Mau', '19001887'),
('ncc007', 'Đồng Tiến', 'Mỹ Tho', '19001880'),
('ncc008', 'Sơn La', 'Sơn La', '19001880'),
('ncc009', 'Hữu Hảo', 'Thái Nguyên', '19001880'),
('ncc010', 'Bắc Đông', 'Hải Phòng', '19001999');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNhanVien` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `TenNhanVien` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `DiaChi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `SDT` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `MaTaiKhoan` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `Luong` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNhanVien`, `TenNhanVien`, `DiaChi`, `Email`, `SDT`, `MaTaiKhoan`, `Luong`) VALUES
('NV001', 'A Tèo', 'Hải Phòng', 'nv001@outlook.com', '0123456789', 'TK001', '666666'),
('NV002', 'Trần Minh Long', 'Hà Nội', 'nv002@gmail.com', '08080808088', 'TK002', '7000000'),
('NV003', 'Lê Lâm Bá Long', 'TP.HCM', 'nv003@gmail.com', '06969698869', 'TK003', '3000000'),
('NV004', 'Nguyễn Thành Tài', 'TP.HCM', 'nv004@gmail.com', '03334449090', 'TK004', '5000000'),
('NV005', 'Nguyễn Minh Khôi', 'Hải Phòng', 'nv005@gmail.com', '0875421369', 'TK005', '5000000'),
('NV006', 'Lý Thanh Tú', 'Hà Nội', 'nv006@gmail.com', '0987654321', 'TK006', '9000000'),
('NV007', 'Trần Bách Học', 'Hà Nội', 'nv007@gmail.com', '9876543210', 'TK007', '6000000'),
('NV008', 'Nguyễn Trạng Nguyên', 'TP.HCM', 'nv008@gmail.com', '03244466678', 'TK008', '12000000'),
('NV009', 'Nguyễn Thị Thủy', 'Đà Nẵng', 'nv009@gmail.com', '09229221182', 'TK009', '12000000'),
('NV010', 'Lê Kim Liên', 'Quảng Ninh', 'nv010@gmail.com', '01221122121', 'TK010', '4500000'),
('NV011', 'Võ Văn Toàn', 'Quảng Ninh', 'nv011@gmail.com', '45454545454', 'TK011', '15000000'),
('NV012', 'Nguyễn Lý Thiên Kim', 'Hà Nội', 'nv012@gmail.com', '06666666666', 'TK012', '6000000'),
('NV013', 'Lý Hồng Ngọc', 'TP.HCM', 'nv013@gmail.com', '09131301390', 'TK013', '6000000'),
('NV014', 'Nguyễn Thị Lan', 'Quảng Ngãi', 'nv014@gmail.com', '01401401414', 'TK014', '6000000'),
('NV015', 'Trần Bích Trâm', 'TP.HCM', 'nv015@gmail.com', '15151515151', 'TK015', '6000000'),
('NV016', 'Lê Văn Thái', 'TP.HCM', 'nv016@gmail.com', '16161616161', 'TK016', '8000000'),
('NV017', 'Lê Thu Thảo', 'Hà Nội', 'nv017@gmail.com', '07707707700', 'TK017', '8000000'),
('NV018', 'Nguyễn Đức Thiện', 'TP.HCM', 'nv018@gmail.com', '06060606060', 'TK018', '15000000'),
('NV019', 'Nguyễn Thị Xoài', 'Hà Nội', 'nv019@gmail.com', '99999999999', 'TK019', '5000000'),
('NV020', 'Lê Hồng Sơn', 'Hải Phòng', 'nv020@gmail.com', '01010101101', 'TK020', '99999999'),
('NV021', 'Nguyễn Văn A', 'Hải Phòng', 'abc@yahoo.com', '1234567890', 'TK021', '5000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieunhap`
--

CREATE TABLE `phieunhap` (
  `MaPhieuNhap` varchar(10) NOT NULL,
  `NgayNhap` datetime NOT NULL,
  `MaNCC` varchar(10) NOT NULL,
  `MaNhanVien` varchar(20) DEFAULT NULL,
  `TONGTIEN` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `phieunhap`
--

INSERT INTO `phieunhap` (`MaPhieuNhap`, `NgayNhap`, `MaNCC`, `MaNhanVien`, `TONGTIEN`) VALUES
('pn006', '2020-10-06 00:00:00', 'ncc005', 'NV004', 2934000),
('pn007', '2020-10-07 00:00:00', 'ncc004', 'NV009', 2103000),
('pn008', '2020-10-08 00:00:00', 'ncc003', 'nv008', 29450000),
('pn009', '2020-10-09 00:00:00', 'ncc002', 'nv009', 27460000),
('pn010', '2020-10-10 00:00:00', 'ncc010', 'nv010', 38630000),
('pn011', '2020-10-11 00:00:00', 'ncc010', 'nv011', 45210000),
('pn012', '2020-10-12 00:00:00', 'ncc009', 'nv012', 88440000),
('pn013', '2020-10-13 00:00:00', 'ncc008', 'NV012', 10837000),
('pn014', '2020-10-14 00:00:00', 'ncc007', 'nv014', 127350000),
('pn015', '2020-10-15 00:00:00', 'ncc006', 'nv015', 139380000),
('pn016', '2020-10-16 00:00:00', 'ncc005', 'nv016', 146400000),
('pn017', '2020-10-17 00:00:00', 'ncc004', 'nv017', 79900000),
('pn020', '2020-11-23 22:32:47', 'ncc001', 'nv020', 66666666),
('pn021', '2020-12-17 11:17:41', 'ncc008', 'NV006', 116970000),
('pn022', '2020-12-17 13:12:21', 'ncc009', 'NV004', 38990000),
('pn023', '2020-12-17 13:14:03', 'ncc009', 'NV006', 73960000),
('pn024', '2021-03-11 09:41:50', 'ncc002', 'NV020', 77980000),
('pn025', '2021-12-12 17:26:02', 'ncc009', 'NV003', 300000),
('pn026', '2021-12-12 22:23:58', 'ncc009', 'NV014', 26480000),
('pn027', '2021-12-17 14:33:59', 'ncc008', 'NV002', 4797000),
('pn028', '2021-12-17 14:34:31', 'ncc007', 'NV007', 3998000),
('pn029', '2021-12-17 14:47:01', 'ncc010', 'NV005', 38990000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieuxuat`
--

CREATE TABLE `phieuxuat` (
  `maphieuxuat` varchar(10) NOT NULL,
  `ngayxuat` datetime DEFAULT NULL,
  `machinhanh` varchar(10) DEFAULT NULL,
  `manhanvien` varchar(10) DEFAULT NULL,
  `tongtien` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `phieuxuat`
--

INSERT INTO `phieuxuat` (`maphieuxuat`, `ngayxuat`, `machinhanh`, `manhanvien`, `tongtien`) VALUES
('px001', '2020-11-01 00:00:00', 'CN001', 'NV002', 2098000),
('px002', '2020-11-01 00:00:00', 'CN001', 'NV008', 2098000),
('px003', '2020-11-01 00:00:00', 'CN005', 'NV004', 1390000),
('px004', '2020-11-02 00:00:00', 'CN003', 'NV005', 2000000),
('px005', '2020-11-02 00:00:00', 'CN008', 'NV011', 2098000),
('px006', '2021-12-12 00:00:00', 'CN003', 'NV001', 4990000),
('px007', '2021-12-12 00:00:00', 'CN006', 'NV006', 3980000),
('px111', '2021-12-17 00:00:00', 'CN003', 'NV005', 17980000),
('px112', '2021-12-17 00:00:00', 'CN003', 'NV011', 26970000),
('px113', '2021-12-17 00:00:00', 'CN001', 'NV001', 49975000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `masp` varchar(10) NOT NULL,
  `tensp` varchar(255) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `dongia` bigint(20) DEFAULT NULL,
  `maloai` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`masp`, `tensp`, `soluong`, `dongia`, `maloai`) VALUES
('sp001', 'iPhone 11 64GB', 25, 1999000, 'loai01'),
('sp002', 'iPhone 11 Pro Max 512GB', 44, 3899000, 'loai01'),
('sp003', 'iPhone 11 Pro 256GB', 25, 3199000, 'loai01'),
('sp004', 'iPhone 11 256GB\r\n', 13, 2399000, 'loai01'),
('sp005', 'iPhone 11 128GB\r\n', 11, 2199000, 'loai01'),
('sp006', 'iPhone Xs 64GB\r\n', 12, 1799000, 'loai01'),
('sp007', 'Samsung Galaxy S20 FE\r\n', 24, 1599000, 'loai03'),
('sp008', 'Samsung Galaxy A21s (6GB/64GB)\r\n', 20, 5290000, 'loai03'),
('sp009', 'Samsung Galaxy Note 20 Ultra', 16, 2499000, 'loai03'),
('sp010', 'Samsung Galaxy A11', 16, 3690000, 'loai03'),
('sp011', 'Samsung Galaxy S10 Lite', 12, 1299000, 'loai03'),
('sp013', 'Samsung Galaxy Note 10 Lite', 19, 1049000, 'loai03'),
('sp014', 'Vsmart Aris (8GB/128GB)', 13, 7490000, 'loai09'),
('sp015', 'Vsmart Joy 4 (4GB/64GB)', 10, 3590000, 'loai09'),
('sp016', 'Vsmart Aris Pro', 7, 8990000, 'loai09'),
('sp017', 'Vsmart Joy 4 (3GB/64GB)', 8, 3290000, 'loai09'),
('sp018', 'Vsmart Live 4 4GB', 12, 4390000, 'loai09'),
('sp019', 'Xiaomi Mi 10T Pro 5G', 10, 1299000, 'loai05'),
('sp020', 'Xiaomi Redmi 9A', 8, 1990000, 'loai05'),
('sp021', 'Xiaomi Redmi 9C (3GB/64GB)', 10, 2990000, 'loai05'),
('sp022', 'Xiaomi Redmi 9 (3GB/32GB)', 10, 3590000, 'loai05'),
('sp023', 'Xiaomi Redmi Note 8', 10, 3990000, 'loai05'),
('sp024', 'OPPO A92', 8, 6490000, 'loai04'),
('sp025', 'OPPO Reno3', 1, 8990000, 'loai04'),
('sp026', 'OPPO A31 (4GB/128GB)', 9, 4990000, 'loai10'),
('sp029', 'Nokia C2', 10, 1490000, 'loai02'),
('sp030', 'Nokia 2.4', 10, 2490000, 'loai02'),
('sp032', 'Pin sạc dự phòng Xmobile LA Y615N', 10, 455000, 'loai02'),
('sp035', 'Tai nghe Bluetooth Roman Q5C', 11, 300000, 'loai03'),
('sp036', 'Tai nghe Bluetooth Roman R553N', 10, 200000, 'loai06'),
('sp037', 'Tai nghe Bluetooth Awei G51BS', 10, 450000, 'loai03'),
('sp038', 'Tai nghe chụp tai Gaming MozardX DS902 7.1', 10, 792000, 'loai03'),
('sp039', 'Adapter Sạc Type C 20W dùng cho iPhone/iPad Apple MHJE3', 10, 990000, 'loai01'),
('sp040', 'Adapter Sạc Type C PD 20W Anker PowerPort III Nano A2633', 10, 400000, 'loai04'),
('sp041', 'OPPO 10X', 1, 4200000, 'loai10'),
('sp042', 'iPhone', 12, 500000, 'loai01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `MaTaiKhoan` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(5) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`MaTaiKhoan`, `Password`, `role`) VALUES
('TK001', '12345', 'admin'),
('TK002', '123', 'admin'),
('TK003', '1234', 'user'),
('TK004', 'iklmnopq', 'user'),
('TK005', '11223344', 'user'),
('TK006', '44332211', 'user'),
('TK007', '12345', 'user'),
('TK008', '88776655', 'user'),
('TK009', '11335577', 'admin'),
('TK010', '22446688', 'user'),
('TK011', '99999999', 'user'),
('TK012', '00000000', 'user'),
('TK013', '13131313', 'user'),
('TK014', '14141414', 'user'),
('TK015', 'nhanviena', 'user'),
('TK016', 'nhanvienb', 'user'),
('TK017', 'ketoan123', 'user'),
('TK018', 'thuquy69', 'user'),
('TK019', 'giamdoc0', 'user'),
('TK020', 'coder666', 'user'),
('TK021', 'iklmnopq', 'user'),
('TK022', '123', 'user');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chinhanh`
--
ALTER TABLE `chinhanh`
  ADD PRIMARY KEY (`MaChiNhanh`);

--
-- Chỉ mục cho bảng `chitietphieunhap`
--
ALTER TABLE `chitietphieunhap`
  ADD PRIMARY KEY (`MaSanPham`,`MaPhieuNhap`),
  ADD KEY `FK_masp` (`MaSanPham`),
  ADD KEY `FK_mapn` (`MaPhieuNhap`);

--
-- Chỉ mục cho bảng `chitietphieuxuat`
--
ALTER TABLE `chitietphieuxuat`
  ADD PRIMARY KEY (`masp`,`mapx`),
  ADD KEY `FK_masp` (`masp`),
  ADD KEY `FK_mapx` (`mapx`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MaLoai`);

--
-- Chỉ mục cho bảng `nhacc`
--
ALTER TABLE `nhacc`
  ADD PRIMARY KEY (`MaNCC`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNhanVien`),
  ADD KEY `FK_taikhoan` (`MaTaiKhoan`);

--
-- Chỉ mục cho bảng `phieunhap`
--
ALTER TABLE `phieunhap`
  ADD PRIMARY KEY (`MaPhieuNhap`),
  ADD KEY `FK_mancc` (`MaNCC`),
  ADD KEY `FK_manv` (`MaNhanVien`);

--
-- Chỉ mục cho bảng `phieuxuat`
--
ALTER TABLE `phieuxuat`
  ADD PRIMARY KEY (`maphieuxuat`),
  ADD KEY `FK_makh` (`machinhanh`),
  ADD KEY `FK_manv` (`manhanvien`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`masp`),
  ADD KEY `FK_maloai` (`maloai`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`MaTaiKhoan`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitietphieunhap`
--
ALTER TABLE `chitietphieunhap`
  ADD CONSTRAINT `FK_mapn` FOREIGN KEY (`MaPhieuNhap`) REFERENCES `phieunhap` (`MaPhieuNhap`),
  ADD CONSTRAINT `FK_masp` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`masp`);

--
-- Các ràng buộc cho bảng `chitietphieuxuat`
--
ALTER TABLE `chitietphieuxuat`
  ADD CONSTRAINT `FK_mapx` FOREIGN KEY (`mapx`) REFERENCES `phieuxuat` (`maphieuxuat`),
  ADD CONSTRAINT `FK_masp1` FOREIGN KEY (`masp`) REFERENCES `sanpham` (`masp`);

--
-- Các ràng buộc cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `taikhoan` (`MaTaiKhoan`);

--
-- Các ràng buộc cho bảng `phieunhap`
--
ALTER TABLE `phieunhap`
  ADD CONSTRAINT `FK_mancc` FOREIGN KEY (`MaNCC`) REFERENCES `nhacc` (`MaNCC`),
  ADD CONSTRAINT `phieunhap_ibfk_1` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`);

--
-- Các ràng buộc cho bảng `phieuxuat`
--
ALTER TABLE `phieuxuat`
  ADD CONSTRAINT `FK_makh` FOREIGN KEY (`machinhanh`) REFERENCES `chinhanh` (`MaChiNhanh`),
  ADD CONSTRAINT `FK_manv` FOREIGN KEY (`manhanvien`) REFERENCES `nhanvien` (`MaNhanVien`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_maloai` FOREIGN KEY (`maloai`) REFERENCES `loaisanpham` (`MaLoai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
