-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 08, 2022 lúc 07:35 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopingwebdb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billproducts`
--

CREATE TABLE `billproducts` (
  `id` int(11) NOT NULL,
  `billId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `coupon` varchar(255) DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `billproducts`
--

INSERT INTO `billproducts` (`id`, `billId`, `productId`, `quantity`, `coupon`, `totalPrice`, `createdAt`, `updatedAt`) VALUES
(1, 10, 1, 3, NULL, 32370000, '2022-08-08 17:19:46', '2022-08-08 17:19:46'),
(2, 10, 1, 3, NULL, 32370000, '2022-08-08 17:22:33', '2022-08-08 17:22:33'),
(3, 12, 1, 3, NULL, 32370000, '2022-08-08 17:24:40', '2022-08-08 17:24:40'),
(4, 12, 1, 3, NULL, 32370000, '2022-08-08 17:30:17', '2022-08-08 17:30:17'),
(5, 12, 1, 3, NULL, 32370000, '2022-08-08 17:31:31', '2022-08-08 17:31:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(11) NOT NULL,
  `customerId` varchar(255) DEFAULT NULL,
  `receiverName` varchar(255) DEFAULT NULL,
  `receiverAddress` varchar(255) DEFAULT NULL,
  `receiverPhone` varchar(255) DEFAULT NULL,
  `status` enum('waiting','on process','finish') DEFAULT 'waiting',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `customerId`, `receiverName`, `receiverAddress`, `receiverPhone`, `status`, `createdAt`, `updatedAt`) VALUES
(10, '0ce70fcb-bb6f-4216-9289-48bbf60bc488', 'LinhNguyen', 'CAt linh', '0912190293', 'waiting', '2022-08-08 17:19:46', '2022-08-08 17:19:46'),
(11, '0ce70fcb-bb6f-4216-9289-48bbf60bc488', 'LinhNguyen', 'CAt linh', '0912190293', 'waiting', '2022-08-08 17:22:33', '2022-08-08 17:22:33'),
(12, '0ce70fcb-bb6f-4216-9289-48bbf60bc488', 'LinhKhanh', 'CAt linh', '0912190293', 'waiting', '2022-08-08 17:24:40', '2022-08-08 17:24:40'),
(13, '0ce70fcb-bb6f-4216-9289-48bbf60bc488', 'LinhKhanh', 'CAt linh', '0912190293', 'waiting', '2022-08-08 17:30:17', '2022-08-08 17:30:17'),
(14, '0ce70fcb-bb6f-4216-9289-48bbf60bc488', 'LinhKhanh', 'CAt linh', '0912190293', 'waiting', '2022-08-08 17:31:31', '2022-08-08 17:31:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `quantity`, `createdAt`, `updatedAt`) VALUES
(1, 'ĐIỆN THOẠI NỔI BẬT NHẤT', NULL, '2022-08-06 02:32:21', '2022-08-06 02:32:21'),
(2, 'LAPTOP', NULL, '2022-08-06 02:32:21', '2022-08-06 02:32:21'),
(3, 'MÀN HÌNH, MÁY TÍNH ĐỂ BÀN', NULL, '2022-08-06 02:32:21', '2022-08-06 02:32:21'),
(4, 'MÁY TÍNH BẢNG', NULL, '2022-08-06 02:32:21', '2022-08-06 02:32:21'),
(5, 'ÂM THANH', NULL, '2022-08-06 02:32:21', '2022-08-06 02:32:21'),
(6, 'ĐỒNG HỒ THÔNG MINH', NULL, '2022-08-06 02:32:21', '2022-08-06 02:32:21'),
(7, 'NHÀ THÔNG MINH', NULL, '2022-08-06 02:32:21', '2022-08-06 02:32:21'),
(8, 'TIVI', NULL, '2022-08-06 02:32:21', '2022-08-06 02:32:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `labels`
--

CREATE TABLE `labels` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `labels`
--

INSERT INTO `labels` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Xiaomi', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(2, 'Samsung', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(3, 'Apple', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(4, 'Asus', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(5, 'HP', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(6, 'Lenovo', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(7, 'Dell', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(8, 'Sony', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(9, 'LG', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(10, 'VSmart', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(11, 'Huawei', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(12, 'Oppo', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(13, 'MSI', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(14, 'Nubia', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(15, 'Acer', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(16, 'Surface', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(17, 'JBL', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(18, 'Myalo', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(19, 'Coocaa', '2022-08-06 02:31:45', '2022-08-06 02:31:45'),
(20, 'CPS', '2022-08-06 02:31:45', '2022-08-06 02:31:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `STT` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `labelId` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `STT`, `productName`, `price`, `quantity`, `image1`, `image2`, `image3`, `categoryId`, `labelId`, `description`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'iPhone 11 64GB I Chính hãng VN/A', 10790000, 7, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, '[HOT] Thu cũ lên đời giá cao - Thủ tục nhanh - Trợ giá lên tới 1.000.000đ', '2022-08-06 02:33:42', '2022-08-08 17:31:31'),
(2, 2, 'iPhone 13 Pro Max 128GB | Chính hãng VN/A', 27390000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, 'Thu cũ lên đời - Trợ giá 1 triệu', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(3, 3, 'iPhone 12 Pro Max 128GB I Chính hãng VN/A', 25590000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, '[HOT] Thu cũ lên đời giá cao - Thủ tục nhanh - Trợ giá lên tới 1.000.000đ và 1 km khác', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(4, 6, 'Xiaomi Redmi Note 11', 3850000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 1, 'Thu cũ đổi mới - Trợ giá đến 300.000đ', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(5, 5, 'iPhone 13 128GB | Chính hãng VN/A', 19590000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, 'Thu cũ lên đời - Trợ giá 1 triệu', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(6, 7, 'iPhone 12 64GB I Chính hãng VN/A', 15990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, '[HOT] Thu cũ lên đời giá cao - Thủ tục nhanh - Trợ giá lên tới 1.000.000đ', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(7, 4, 'Samsung Galaxy S22 Ultra (8GB - 128GB)', 25090000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 2, 'Dịch vụ phòng chờ hạng thương gia tại sân bay và 1 km khác', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(8, 9, 'Samsung Galaxy Z Fold3 5G', 30990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 2, 'Giảm ngay 2.000.000đ khi thanh toán qua Moca', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(9, 10, 'Nubia Red Magic 7 Obsidian 12GB 128GB', 18490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 14, 'Thu cũ đổi mới - Trợ giá 500.000đ', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(10, 11, 'Samsung Galaxy S22 Plus (8GB + 128GB)', 20190000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 2, 'Dịch vụ phòng chờ hạng thương gia tại sân bay và 1 km khác', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(11, 12, 'iPhone 11 128GB I Chính hãng VN/A', 13390000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, '[HOT] Thu cũ lên đời giá cao - Thủ tục nhanh - Trợ giá lên tới 1.000.000đ', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(12, 8, 'Xiaomi Redmi Note 11 Pro Plus 5G', 8890000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 1, 'Thu cũ lên đời trợ giá 500.000đ', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(13, 13, 'Xiaomi Redmi Note 11 Pro', 6450000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 1, 'Thu cũ đổi mới - Trợ giá đến 300.000đ', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(14, 14, 'Samsung Galaxy A73 (5G) 256GB', 11990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 2, 'Thu cũ đổi mới - Trợ giá đến 300.000đ và 1 km khác', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(15, 15, 'Xiaomi Redmi Note 11 128GB', 4130000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 1, 'Thu cũ đổi mới - Trợ giá đến 300.000đ', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(16, 16, 'OPPO Reno6 Z 5G', 6790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 12, 'Thu cũ lên đời - Trợ giá 1 triệu', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(17, 17, 'iPhone 13 Pro 128GB | Chính hãng VN/A', 24790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, 'Thu cũ lên đời - Trợ giá 1 triệu', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(18, 18, 'Xiaomi 11T Pro', 11690000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 1, 'Thu cũ đổi mới - Trợ giá đến 300.000đ', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(19, 19, 'iPhone SE 2022 | Chính hãng VN/A', 11390000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, 'Giảm thêm đến 1.000.000đ khi thanh toán qua thẻ tín dụng Citibank', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(20, 20, 'OPPO Reno7 Z (5G)', 9090000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 12, '', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(21, 21, 'Apple Macbook Air M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', 31490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 3, 'Giảm đến 2 triệu khi thanh toán qua thẻ tín dụng VIB, Sacombank, VP Bank và 1 km khác', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(22, 22, 'Apple MacBook Air M1 256GB 2020 I Chính hãng Apple Việt Nam', 22290000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 3, 'Mua Office Home & Student 2021 kèm Macbook chỉ còn 2,090,000', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(23, 23, 'Apple Macbook Pro 13 M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', 32990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 3, 'Thu cũ lên đời - Trợ giá 1 triệu', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(24, 24, 'Apple MacBook Pro 13 Touch Bar M1 256GB 2020 I Chính hãng Apple Việt Nam', 29590000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 3, 'Mua Office Home & Student 2021 kèm Macbook chỉ còn 2,090,000', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(25, 25, 'Laptop Asus Vivobook 13 Slate Oled T3300KA', 14790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 4, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(26, 26, 'Laptop Asus Gaming Rog Strix G15 G513IH HN015W', 17990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 4, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(27, 27, 'Laptop Gaming MSI Bravo 15 B5DD 276VN', 14890000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 13, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(28, 28, 'Laptop ASUS VivoBook D515DA-EJ845T', 8990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 4, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(29, 29, 'Laptop MSI Modern 14 B11MOU 1030VN', 11790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 13, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(30, 30, 'Laptop Gaming Acer Nitro 5 AN515 45 R6EV', 17990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 15, 'Tặng bàn phím cơ Gaming Predator Aethon TKL 301', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(31, 31, 'Laptop HP 14-CF2033WM 3V7G4UA', 6490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 5, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(32, 32, 'Macbook Pro 14 inch 2021 | Chính hãng Apple Việt Nam', 48590000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 3, 'Mua Office Home & Student 2021 kèm Macbook chỉ còn 2,090,000', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(33, 33, 'Laptop Lenovo Legion 5 15ACH6 82JW00JPVN', 20790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 6, 'Phần Mềm Diệt Virus, Office chính hãng chỉ từ 150k', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(34, 34, 'Laptop Dell Insprion 14 5406-3661SLV Nhập khẩu chính hãng', 12990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 7, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(35, 35, 'Laptop ASUS ZenBook UM5302TA-LX087W', 27990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 4, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(36, 36, 'Laptop Xiaomi RedmiBook 15 JYU4505AP', 11490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 1, 'Tặng balo xiaomi', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(37, 37, 'Laptop Asus Flip BR1100FKA-BP1088W', 5690000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 4, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(38, 38, 'Surface Pro 7 Core i5 / 8GB / 128GB Nhập Khẩu Chính Hãng', 19990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 16, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(39, 39, 'Laptop ASUS VivoBook A515EA-L12033W', 16590000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 4, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(40, 40, 'iMac 24 2021 M1 7GPU 8GB 256GB I Chính hãng Apple Việt Nam', 28990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 3, 'Mua Office Home & Student 2021 kèm Macbook chỉ còn 2,090,000', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(41, 41, 'Laptop Lenovo IdeaPad Gaming 3 15ACH6 82K201BBVN', 15990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 6, 'Phần Mềm Diệt Virus, Office chính hãng chỉ từ 150k', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(42, 42, 'PC Gaming CPS 001', 8730000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 20, '', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(43, 43, 'Màn Hình Thông Minh Samsung M8 LS32BM801UEXXV 32 (4K/VA/60Hz/USB-C)', 14990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 2, '', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(44, 44, 'Màn hình Xiaomi Monitor 1C BHR4510GL 23.8 inch', 3290000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 1, 'Ưu đãi giảm 50,000 khi mua giá treo màn hình', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(45, 45, 'Màn hình LG UltraWide 29WP500 29 inch', 5690000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 9, 'Ưu đãi giảm 50,000 khi mua giá treo màn hình', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(46, 46, 'Màn hình đồ hoạ HUAWEI MateView 28', 15990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 11, 'Tặng kèm chuột Huawei CD20 và 1 km khác', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(47, 47, 'Màn hình thông minh Samsung LS27AM500NEXXV 27 inch', 4990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 2, 'Ưu đãi giảm 50,000 khi mua giá treo màn hình', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(48, 48, 'Màn hình Dell UltraSharp 23.8 inch U2422H', 7190000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 7, 'Ưu đãi giảm 50,000 khi mua giá treo màn hình', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(49, 49, 'Màn hình Dell Monitor S2721DS 27', 6790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 7, '', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(50, 50, 'Màn hình Samsung LU28R550UQEXXV 28 inch', 7990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 2, 'Ưu đãi giảm 50,000 khi mua giá treo màn hình', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(51, 51, 'PC Gaming ASUS ROG STRIX GA35 G35DX-VN003W', 43490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 4, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(52, 52, 'iPad 10.2 2021 WiFi 64GB | Chính hãng Apple Việt Nam', 8990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 3, 'Phần mềm bản quyền Office đi kèm 1 TB Onedrive chỉ từ 990,000', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(53, 53, 'iPad Air 5 (2022) 64GB I Chính hãng Apple Việt Nam', 15590000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 3, 'Phần mềm bản quyền Office đi kèm 1 TB Onedrive chỉ từ 990,000', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(54, 54, 'Samsung Galaxy Tab S8 Ultra', 28890000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 2, 'Tặng bao da kiêm bàn phím Galaxy Tab S8 Ultra chính hãng và 2 km khác', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(55, 55, 'Apple iPad Pro 11 2021 M1 WiFi 128GB I Chính hãng Apple Việt Nam', 19790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 3, 'Thu cũ lên đời - Trợ giá 1 triệu và 1 km khác', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(56, 56, 'Apple iPad mini 6 WiFi 64GB | Chính hãng Apple Việt Nam', 13190000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 3, 'Phần mềm bản quyền Office đi kèm 1 TB Onedrive chỉ từ 990,000', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(57, 57, 'iPad Air 10.9 2020 WiFi 64GB I Chính hãng Apple Việt Nam', 14190000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 3, 'Phần mềm bản quyền Office đi kèm 1 TB Onedrive chỉ từ 990,000', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(58, 58, 'Samsung Galaxy Tab A7 Lite', 3750000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 2, 'Thu cũ đổi mới - Trợ giá đến 300.000đ', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(59, 59, 'Xiaomi Pad 5', 8990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 1, 'Thu cũ đổi mới - Trợ giá đến 300.000đ', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(60, 60, 'Samsung Galaxy Tab A8 (2022)', 6990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 2, 'Tặng Bao da Samsung Galaxy Tab A8 2022 chính hãng và 1 km khác', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(61, 61, 'iPad 10.2 2020 WiFi 32GB I Chính hãng Apple Việt Nam', 9500000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 3, 'Phần mềm bản quyền Office đi kèm 1 TB Onedrive chỉ từ 990,000', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(62, 62, 'Tai nghe Bluetooth Apple AirPods 2 VN/A', 2890000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 3, 'Nhận gói 6 tháng Apple Music miễn phí', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(63, 63, 'Tai nghe Bluetooth Apple AirPods 3 | Chính hãng Apple Việt Nam', 4590000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 3, 'Nhận gói 6 tháng Apple Music miễn phí', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(64, 64, 'Tai nghe chụp tai Sony WH-1000XM4', 5990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 8, '', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(65, 65, 'Tai nghe Bluetooth Apple AirPods Pro 2021 Magsafe | Chính hãng Apple Việt Nam', 4790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 3, 'Nhận gói 6 tháng Apple Music miễn phí', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(66, 66, 'Tai nghe Bluetooth Samsung Galaxy Buds Live', 1490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 2, '', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(67, 67, 'Tai nghe Bluetooth Samsung Galaxy Buds Pro', 2290000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 2, '', '2022-08-06 02:33:42', '2022-08-06 02:33:42'),
(68, 68, 'Tai nghe không dây JBL Live Pro+', 2990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 17, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(69, 69, 'Loa Bluetooth JBL Charge 4', 3490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 17, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(70, 70, 'Tai nghe không dây Xiaomi Redmi Buds 3 lite', 450000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 1, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(71, 71, 'Tai nghe chụp tai chống ồn Apple AirPods Max | Chính hãng Apple Việt Nam', 9390000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 3, 'Nhận gói 6 tháng Apple Music miễn phí', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(72, 72, 'Vòng đeo tay thông minh Huawei Band 7', 990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 11, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(73, 73, 'Vòng đeo tay thông minh Xiaomi Mi Band 7', 1190000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 1, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(74, 74, 'Đồng hồ thông minh Huawei Watch GT3 dây da', 5990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 11, 'Dây đeo đồng hồ Huawei Watch GT3 Silicone 46mm', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(75, 75, 'Đồng hồ thông minh Xiaomi Mi Watch', 1990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 1, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(76, 76, 'Vòng đeo tay thông minh Xiaomi Mi Band 6', 799000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 1, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(77, 77, 'Đồng hồ thông minh Huawei Watch Fit 2', 2990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 11, 'QT.187', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(78, 78, 'Samsung Galaxy Watch4', 4490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 2, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(79, 79, 'Đồng hồ thông minh Huawei Watch GT3 Pro dây silicone', 7990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 11, 'Tặng dây đeo thời trang thay thế', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(80, 80, 'Đồng hồ thông minh trẻ em Myalo KidsPhone K84', 2750000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 18, 'Tặng Sim Mobifone C90N 4GB/Ngày', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(81, 81, 'Đồng hồ thông minh Xiaomi Redmi Watch 2 Lite', 1072000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 1, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(82, 82, 'Robot hút bụi Dreame bot W10', 16990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 1, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(83, 83, 'Apple AirTag | Chính hãng Apple Việt Nam', 790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 3, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(84, 84, 'Quạt thông minh Mi Smart Standing Fan 2 Lite', 1290000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 1, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(85, 85, 'Máy chiếu Xiaomi Mi Smart Projector 2', 14990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 1, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(86, 86, 'Robot hút bụi Dreame D9 Pro', 6790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 1, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(87, 87, 'Robot hút bụi Dreame D9', 6290000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 1, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(88, 88, 'Máy lọc không khí Xiaomi Air Purifier 4 Pro', 5190000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 1, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(89, 89, 'Robot hút bụi Dreame Z10 Pro', 10290000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 1, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(90, 90, 'Máy Chiếu Smart TV 100 inch Bỏ Túi Samsung The Freestyle SP-LSP3', 20990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 2, 'Quà tặng túi đựng Samsung The Freestyle Xanh đen', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(91, 91, 'Máy lọc không khí Xiaomi Air Purifier 4 Lite', 3090000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 1, '', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(92, 92, 'Smart tivi Xiaomi P1 55 inch', 9990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 1, 'Tặng Cân Xiaomi Mi Body Compsition Scale 2', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(93, 93, 'Smart tivi Xiaomi P1 43 inch', 7990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 1, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(94, 94, 'Smart Tivi màn hình cong Samsung 4K 55 inch 55TU8300', 11990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 2, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(95, 95, 'Smart Tivi 4K The Serif Samsung 55 inch QA55LS01TA (Model 2021)', 14990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 2, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(96, 96, 'Smart TV Coocaa HD 32 inch WIFI 32S3U', 3690000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 19, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(97, 97, 'Smart TV Nanocell LG 4K 43 INCH 43NANO77TPA', 12990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 9, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(98, 98, 'Smart Tivi Samsung Crystal UHD 4K 55 INCH UA55AU7700KXXV', 12990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 2, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(99, 99, 'Smart Tivi di động LG Stanby Me 27inch', 18190000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 9, '[01/07 - 30/09/2022]Tặng tai nghe Tone Free trị giá 2.990.000đ qua ứng dụng Urbox', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(100, 100, 'Smart Tivi Samsung Crystal UHD 4K 55 inch UA55AU8000KXXV', 13990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 2, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-08-06 02:33:43', '2022-08-06 02:33:43'),
(101, 101, 'Smart Tivi Samsung QLED 55 inch QA55Q60AA (Model 2021)', 14990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 2, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-08-06 02:33:43', '2022-08-06 02:33:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'customers', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'staffs', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'admins', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20220708152858-create-roles.js'),
('20220708152859-create-user.js'),
('20220708153218-create-bill.js'),
('20220708153219-create-labels.js'),
('20220708153504-create-category.js'),
('20220708153737-create-product.js'),
('20220708153738-create-bill-product.js');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `roleId` int(11) DEFAULT 1,
  `tokenChangePass` varchar(255) DEFAULT NULL,
  `typeLogin` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `phone`, `address`, `roleId`, `tokenChangePass`, `typeLogin`, `createdAt`, `updatedAt`) VALUES
('0ce70fcb-bb6f-4216-9289-48bbf60bc488', 'Sia3333', '$2a$12$sKon9LybXY04lZSrN4iZQ.gAyz.GxI2TnVCS47cMX/CyJAle8SEnW', 'alo@gmail.com', '123455576676', NULL, 1, NULL, NULL, '2022-08-08 16:51:52', '2022-08-08 16:54:49');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `billproducts`
--
ALTER TABLE `billproducts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billId` (`billId`),
  ADD KEY `productId` (`productId`);

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerId` (`customerId`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `labelId` (`labelId`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roleId` (`roleId`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `billproducts`
--
ALTER TABLE `billproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `labels`
--
ALTER TABLE `labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `billproducts`
--
ALTER TABLE `billproducts`
  ADD CONSTRAINT `BillProducts_ibfk_1` FOREIGN KEY (`billId`) REFERENCES `bills` (`id`),
  ADD CONSTRAINT `BillProducts_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `Bills_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `Products_ibfk_2` FOREIGN KEY (`labelId`) REFERENCES `labels` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
