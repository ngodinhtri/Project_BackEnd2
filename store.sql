-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th10 19, 2019 lúc 12:33 PM
-- Phiên bản máy phục vụ: 5.7.26
-- Phiên bản PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `store`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `ID_acc` int(11) NOT NULL AUTO_INCREMENT,
  `acc_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `acc_email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `acc_pass` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `acc_phone` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acc_type` int(11) NOT NULL,
  PRIMARY KEY (`ID_acc`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `accounts`
--

INSERT INTO `accounts` (`ID_acc`, `acc_name`, `acc_email`, `acc_pass`, `acc_phone`, `avatar`, `acc_type`) VALUES
(1, 'nhom06', 'nhom06@gmail.com', '123456', '0123456789', 'avt1', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufactures`
--

DROP TABLE IF EXISTS `manufactures`;
CREATE TABLE IF NOT EXISTS `manufactures` (
  `ID_manu` int(11) NOT NULL AUTO_INCREMENT,
  `name_manu` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `img_manu` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_manu`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `manufactures`
--

INSERT INTO `manufactures` (`ID_manu`, `name_manu`, `img_manu`) VALUES
(1, 'Adidas', 'adidas.jpg'),
(2, 'Vans', 'vans.jpg'),
(3, 'Converse', 'converse.jpg'),
(4, 'Balenciaga', 'balenciaga.jpg'),
(5, 'Nike', 'nike.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `ID_product` int(11) NOT NULL AUTO_INCREMENT,
  `ID_manu` int(11) NOT NULL,
  `ID_type` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `unit_price` int(11) NOT NULL,
  PRIMARY KEY (`ID_product`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`ID_product`, `ID_manu`, `ID_type`, `name`, `description`, `img`, `unit_price`) VALUES
(1, 2, 1, 'OLD SKOOL CLASSIC BLACK', 'Fullbox Old Skool Black / Đen. Thiết kế basic trend dài dài. Phù hợp: nam nữ, đi học, đi làm, hoạt động thể thao. Size: 36-44. Chất liệu: Canvas. Giao hàng toàn quốc. Bảo hành 3 tháng. Đổi trả dễ dàng. Streetwear, trẻ trung năng động.', '1.jpg', 1090000),
(2, 1, 1, 'P.R.O.PHERE GREY SOLAR RED', 'Fullbox Prophere. 3 ver Trắng / Đen / Xám. Đế giày tăng chiều cao. Phù hợp: nam nữ, đi học, đi làm, hoạt động thể thao. Size: 36-44. Giao hàng toàn quốc. Bảo hành 3 tháng. Đổi trả dễ dàng. Streetwear, trẻ trung năng động.\r\n\r\nProphere chính là cái tên đang được nhắc đến nhiều nhất trên các cộng đồng người chơi giày. Bộ đế và midsole được thiết kế vô cùng đặc biệt chắc chắn sẽ không thể tìm thấy ở bất kì phiên bản nào khác.\r\n\r\nMột trong những mẫu giày được thiết kế dành cho tương lai. Phong cách hiện đại, trẻ trung, sống động và vô cùng cá tính. Mang đậm sự kết hợp giữa thời trang đường phố streetwear và thời trang thể thao.\r\n\r\nĐệm midsole ấn tượng và không thể lẫn lộn, Ngoài ra, Prophere vẫn giữ những nguyên bản từ Original với các chi tiết góc cạnh mạnh mẽ. Các chi tiết chất liệu da lộn tổng hợp sang trọng và logo 3 sọc 3-Stripes nổi bật từ thương hiệu.', '2.jpg', 1290000),
(3, 1, 2, 'YEEZY 350V2 WHITE RAINBOW', 'Yeezy Boost 350 v2 Rainbow được giới thiệu mùa hè 2018 với màu vàng nhạt tương tự thỏi bơ ngọt ngào, trên nền vải Primeknit được dệt nhiều mũi kim khác nhau tạo ra hiệu ứng thị giác cực ấn tượng. Bên cạnh chất liệu thoải mái Primeknit thì đế giày Boost thường thấy của dòng Yeezy lần này được phủ lớp cao su cùng tông màu vàng nhạt tạo ra bản phối giày Yeezy thú vị', '3.jpg', 1290000),
(4, 5, 1, 'A-I-R J-O-R-D-A-N 1 X O.F.F-W.H.I.T.E X RETRO HIGH OG CHICAGO SAMPLE', 'Phát hành vào ngày 3/3/2018, mẫu Air Jordan 1 Retro High OFF-WHITE của Virgil Abloh đang được kỳ vọng là phiên bản sneakers xuất sắc nhất năm nay. Với số lượng phát hành nhỏ giọt ở châu Âu, Air Jordan 1 Retro High OFF-WHITE càng khiến người yêu giày ở Bắc Mỹ và châu Á thèm muốn. Kết quả, mẫu giày này đứng đầu bảng xếp hạng vì giá bán lại cực cao trên StockX: 1771 USD (khoảng 40 triệu đồng).\r\n\r\nGiày Off White X Air Jordan là một sản phẩm kết hợp xu hướng Off White đang thống trị xu thế đường phố vẫn với tinh thần Giày Air Jordan kèm với một số chi tiết nổi bật đặc trưng cùa Off White. Chính những điều đó đã mang đến nét mới lạ cho Air Jordan.', '4.jpg', 1790000),
(5, 1, 2, 'EQT SUPPORT ADV PRIMEKNIT TURBO', 'Nếu phiên bản EQT nguyên thủy của những năm 90s lấy cảm hứng từ bảng màu xanh lá và phá cách với họa tiết táo bạo trên trang phục thể thao, thì diện mạo EQT của ngày hôm nay mang đậm hơi hướng đương đại với các hình khối cắt ghép cứng cáp và phóng khoáng. Làm sống lại huyền thoại của thương hiệu từ quá khứ.\r\n\r\nEQT không dành cho những người thích sự bão hòa, chịu sự chi phối của xu hướng và số đông. Chính sự tối giản trong thiết kế, màu sắc độc đáo – người mang EQT sẽ tự tạo ra phong cách cho riêng mình, trụ vững, nổi bật trong dòng chảy luôn có xu hướng quay vòng và đào thải của thời trang.', '5.jpg', 1190000),
(6, 4, 2, 'NB CRT 300 BEIGE', 'Fullbox NB CRT 300. 3 ver Gót Đỏ / Xanh Navy / Full White. Phù hợp: nam nữ, đi học, đi làm, hoạt động thể thao. Size: 36-44. Chất liệu: Da lộn. Giao hàng toàn quốc. Bảo hành 3 tháng. Đổi trả dễ dàng. Streetwear, trẻ trung năng động.\r\n\r\nVào năm 2015, NB quyết định nâng cấp cho một trong những đứa con cưng của mình. CT 300 trở thành CRT 300, tiếp tục thừa kế những đặc điểm truyền thống về thiết kế và chất liệu (da lộn, lưới), ngoài ra còn được trang bị thêm công nghệ đế REVlite mới, êm ái và nhẹ nhàng hơn.\r\n\r\nHiệu năng tốt bên trong dáng vẻ “retro”, CRT300 lại được sao Hàn làm nên cơn sốt. CRT300 không có dáng vẻ hào nhoáng hay quá sang chảnh. Vẫn là sự giản dị, gần gũi nhưng không tầm thường của New Balance.', '6.jpg', 1390000),
(7, 4, 1, 'NB MS247MR MENS CLASSIC NAVY', 'A unique and versatile NB lifestyle shoe for the modern urban consumer and\r\ntheir 24/7 lifestyle. New Balance, is dedicated to helping athletes achieve\r\ntheir goals. It\'s been their mission for more than a century. It\'s why they\r\ndon\'t spend money on celebrity endorsements. They spend it on research and\r\ndevelopment. It\'s why they don\'t design products to fit an image. They design\r\nthem to fit. New Balance is driven to make the finest shoes for the same\r\nreason athletes lace them up: to achieve the very best.', '7.jpg', 2095000),
(8, 5, 2, 'A-I-R MAX 97 ULTRA 17 TRIPLE WHITE', 'Air Max 97 có thiết kế lấy cảm hứng từ chiếc tàu siêu tốc – bullet train của Nhật và cấu tạo từ chất liệu mesh. Một dòng air max trong bộ sưu tập air max huyền thoại của thương hiệu này. Toàn bộ đế giày được lót đệm khí so với những phiên bản air max đời trước. Vừa cổ điển vừa hiện đại, năng động, sáng tạo là tất cả những gì có thể nói về Air Max 97 – sở hữu vẻ đặc trưng , nổi bật không thể lẫn lộn.', '8.jpg', 1290000),
(9, 5, 2, 'A-I-R FORCE 1 LOW GS TRIPLE WHITE', 'Air Force 1 (AF1) là một trong những mẫu sneaker kinh điển mọi thời đại của thương hiệu này. Là một trong những item được cả những người sành giày và các bạn trẻ yêu thích phong cách thời trang đường phố trên khắp thế giới yêu thích. Thiết kế trẻ trung với duy nhất một màu trắng chính là điểm nhấn đặc biệt. Mọi thứ bạn trải qua trên đôi chân sẽ được lưu lại vĩnh viễn.', '9.jpg', 990000),
(10, 3, 2, 'CV CHUCK TAYLOR ALL-STAR 70S HI COMME DES GARCONS PLAY BLACK (1970S CDG)', 'Fullbox CV 1970 CDG cổ cao, thấp 2 màu đen, trắng. Phù hợp: nam nữ, đi học, đi làm, hoạt động thể thao. Size: 36-44. Chất liệu: Canvas. Giao hàng toàn quốc. Bảo hành 3 tháng. Đổi trả dễ dàng. Streetwear, trẻ trung năng động.\r\n\r\nCOMME des GARÇONS và CV 1970 thật sự đã mang đến một làn gió mới cho những ai yêu thích sự giản đơn nhưng vẫn thể hiện được phong cách riêng và sự sáng tạo trong đó.\r\n\r\nĐôi giày CDG Play x CV 1970 được ra mắt lần đầu vào năm 2013. Sự kết hợp này không chỉ mang đến một hình ảnh mới mẻ cho CV 1970 cũng như CDG Play mà còn tạo được dấu ấn khá rõ nét trong lòng những ai đam mê sneakers.\r\n\r\nĐơn giản mà hiệu quả, nắm bắt được tâm lý này của giới đam mê thời trang và sneakers toàn thế giới, COMME des GARÇONS Play và CV 1970 thật sự đã mang đến một làn gió mới cho những ai yêu thích sự giản đơn nhưng vẫn thể hiện được phong cách riêng và sự sáng tạo trong đó.\r\n\r\nDễ dàng kết hợp với các loại trang phục và phong cách khác nhau, CDG Play X CV 1970 thật sự rất đáng để chúng ta sở hữu và làm mới hình ảnh thay vì những mẫu CV 1970 thông thường đúng không nào?', '10.jpg', 1290000),
(11, 3, 2, 'CV CHUCK 70 LOW TOP SUNFLOWER', 'Cứ hễ 1s thì CV 1970 bán được 1 đôi CV Chuck 70 trên toàn thế giới. Được xem là đôi giày mà ai-cũng-phải-có. CV Chuck Taylor 1970s là dòng giày bá đạo nhất trong tất cả\r\n\r\nxem chi tiết\r\nFullbox CV 1970 cổ thấp 3 màu đen, trắng, sunflower. Phù hợp: nam nữ, đi học, đi làm, hoạt động thể thao. Size: 36-44. Chất liệu: Canvas. Giao hàng toàn quốc. Bảo hành 3 tháng. Đổi trả dễ dàng. Streetwear, trẻ trung năng động.', '11.jpg', 1090000),
(12, 3, 1, 'CV CHUCK TAYLOR ALL STAR HIGH TOP BLACK (CLASSIC)', 'Với thiết kế đơn giản, trẻ trung và năng động đã giúp CV dần trở thành một item thời trang đáng có trong bộ sưu tập giày của tất cả mọi người nói chung và của các đầu giày nói riêng, nhất là trong list thời trang của mọi cô gái đều chắc chắn có 1 đôi giày CV. Hướng đến tiêu chí thời trang, Classic trở thành biểu tượng phù hợp với mọi độ tuổi, mọi tầng lớp, không bao giờ lỗi thời.  ', '12.jpg', 990000),
(13, 3, 1, 'CV CHUCK TAYLOR ALL STAR LOW TOP BLACK (CLASSIC)', 'Với thiết kế đơn giản, trẻ trung và năng động đã giúp CV dần trở thành một item thời trang đáng có trong bộ sưu tập giày của tất cả mọi người nói chung và của các đầu giày nói riêng, nhất là trong list thời trang của mọi cô gái đều chắc chắn có 1 đôi giày CV. Hướng đến tiêu thời trang, Classic trở thành biểu tượng phù hợp với mọi độ tuổi, mọi tầng lớp, không bao giờ lỗi thời.', '13.jpg', 890000),
(14, 4, 1, 'BALEN TRIPLE S TRAINER BLACK RED 2018', 'Đây là thương hiệu thời trang lâu đời nổi tiếng, cao cấp nhất nhì thế giới được thành lập từ năm 1919. Tiếp nối sự thành công, thương hiệu tiếp tục tung ra Triple S – dòng giày đa sắc màu, phá bỏ mọi giới hạn, đủ đẹp, đủ chất để khiến giới mộ điệu lại một lần nữa phải điên đảo Đây là mẫu giày cũng được nhiều người nghệ sĩ thế giới lựa chọn. Tại Việt Nam, giày Triple S được rất nhiều nghệ sĩ nổi tiếng yêu thích.', '14.jpg', 1890000),
(15, 2, 2, 'SLIP ON CHECKERBOARD', 'Fullbox Slip On Checkerboard Giày Lười. Phù hợp: nam nữ, đi học, đi làm, hoạt động thể thao. Size: 36-44. Chất liệu: Canvas. Giao hàng toàn quốc. Bảo hành 3 tháng. Đổi trả dễ dàng. Streetwear, trẻ trung năng động.\r\n\r\nĐây là thương hiệu hoạt động mạnh mẽ trong lĩnh vực thể thao mạo hiểm với những đôi giày của họ được thiết kế tối ưu cho những môn thể thao như trượt ván, BMX, mô tô đua, trượt tuyết v.v… với kiểu dáng cổ điển nhưng luôn ra mắt những phiên bản có phong cách sáng tạo.', '15.jpg', 1090000),
(16, 2, 2, 'STYLE 36 AMBER GLOW', 'Fullbox Style 36 Retro Sport. 3 ver Đỏ / Xanh Navy/ Vàng. Phù hợp: nam nữ, đi học, đi làm, hoạt động thể thao. Size: 36-44. Chất liệu: Canvas. Giao hàng toàn quốc. Bảo hành 3 tháng. Đổi trả dễ dàng. Streetwear, trẻ trung năng động.\r\n\r\nTiếp nối thành công những “đàn anh” đi trước có kiểu dáng vintage như: Style 37 DX, Sport… thương hiệu nổi tiếng này tiếp tục cho ra mắt bộ sưu tập Retro Sport Style 36. Giữ nguyên các thiết kế có kiểu dáng truyền thống như Old Skool hay Era, phối màu mới chính là điểm đặc sắc của dòng sản phẩm này.\r\n\r\nRetro Sport Style 36 là bước ngoặt mới mà hãng muốn mang đến cho các tín đồ thời trang – những người đam mê phong cách streetwear đường phố bởi những chi tiết được biến tấu trên đôi giày vô cùng đặc biệt.\r\n\r\nẤn tượng đầu tiên khi nhìn vào bộ sưu tập Retro Sport Style 36 chính là sự phối hợp nhịp nhàng của những mảng màu cuốn hút. Gam màu trắng ngà chủ đạo kết hợp cùng tone xanh blue sky và sắc đỏ tươi mới của hai phiên bản Old Skool khiến người xem phải “choáng ngợp” bởi độ chill của thiết kế.', '16.jpg', 1190000),
(17, 2, 1, 'OLD SKOOL BLACK CHECKERBOARD', 'Fullbox Old Skool Checkerboard. Hợp với style basic. Phù hợp: nam nữ, đi học, đi làm, hoạt động thể thao. Size: 36-44. Chất liệu: Canvas. Giao hàng toàn quốc. Bảo hành 3 tháng. Đổi trả dễ dàng. Streetwear, trẻ trung năng động.\r\n\r\nOld Skool ra đời với phong cách trẻ trung, năng động, nhưng không kém phần tinh tế, thời trang và nay điều ấy thật sự được khẳng định thêm lần nữa khi PRIMARY CHECKERBOARD OLD SKOOL BLACK/WHITE ra đời, với sọc caro đậm chất thương hiệu, đôi giày này một lần nữa khẳng định vị trí đặc biệt của mình đối với các tín đồ yêu cái đẹp cùng sự mạnh mẽ vốn có của hãng giày…', '17.png', 1190000),
(18, 4, 2, 'BALEN TRIPLE S TRAINER BLUE RED 2018', 'Đây là thương hiệu thời trang lâu đời nổi tiếng, cao cấp nhất nhì thế giới được thành lập từ năm 1919. Tiếp nối sự thành công, thương hiệu tiếp tục tung ra Triple S – dòng giày đa sắc màu, phá bỏ mọi giới hạn, đủ đẹp, đủ chất để khiến giới mộ điệu lại một lần nữa phải điên đảo Đây là mẫu giày cũng được nhiều người nghệ sĩ thế giới lựa chọn. Tại Việt Nam, giày Triple S được rất nhiều nghệ sĩ nổi tiếng yêu thích.', '18.jpg', 1890000),
(19, 1, 1, 'NMD R1 GREY', 'Fullbox NMD R1. 2 màu Xám / Trắng. Đế boost đàn hồi êm chân. Phù hợp: nam nữ, đi học, đi làm, hoạt động thể thao. Size: 36-44. Chất liệu: Vải dệt Primeknit. Giao hàng toàn quốc. Bảo hành 3 tháng. Đổi trả dễ dàng.', '19.jpg', 1190000),
(20, 5, 2, 'A-I-R FORCE 1 LOW \'JUST DO IT\'', 'Air Force 1 “JUST DO IT” được coi là một trong những đứa con cưng của nhãn hàng, góp phần đưa khách hàng đến gần hơn với nhà sản xuất. Thương hiệu và uy tín của hãng vì thế mà cũng ngày càng được đánh giá cao hơn sau sự kiện ra mắt của dòng sản phẩm đẳng cấp này. Dòng giày này không phải là quá mới mẻ với các tín đồ giày nhưng sức hút của nó thì chưa bao giờ mất đi. Bạn có thể sử dụng giày để đi hàng ngày và đặc biệt có thể trưng diện vào những dịp đặc biệt, lễ hội, tiệc tùng một cách ấn tượng, không cầu kỳ nhưng vẫn luôn thể hiện được đẳng cấp riêng của mình.', '20.jpg', 1190000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `protypes`
--

DROP TABLE IF EXISTS `protypes`;
CREATE TABLE IF NOT EXISTS `protypes` (
  `ID_type` int(11) NOT NULL AUTO_INCREMENT,
  `name_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `img_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_type`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `protypes`
--

INSERT INTO `protypes` (`ID_type`, `name_type`, `img_type`) VALUES
(1, 'Male', 'male.jpg'),
(2, 'Famale', 'famale.jpeg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
