CREATE TABLE `bophan` (
  `IdBoPhan` int NOT NULL,
  `TenBoPhan` varchar(45) ,
  PRIMARY KEY (`IdBoPhan`)
);
CREATE TABLE `dichvu` (
  `IdDichVu` int NOT NULL,
  `TenDichVu` varchar(45) ,
  `DienTich` int NOT NULL,
  `SoTang` int NOT NULL,
  `SoNguoiToiDa` varchar(45) ,
  `ChiPhiThue` int NOT NULL,
  `IdKieuThue` int NOT NULL,
  `IdLoaiDichVu` int NOT NULL,
  `TrangThai` varchar(45) ,
  PRIMARY KEY (`IdDichVu`),
  KEY `IdKieuThue` (`IdKieuThue`),
  KEY `IdLoaiDichVu` (`IdLoaiDichVu`),
  CONSTRAINT `IdKieuThue` FOREIGN KEY (`IdKieuThue`) REFERENCES `kieuthue` (`IdKieuThue`),
  CONSTRAINT `IdLoaiDichVu` FOREIGN KEY (`IdLoaiDichVu`) REFERENCES `loaidichvu` (`IdLoaiDichVu`)
);
CREATE TABLE `dichvudikem` (
  `IdDichVuDiKem` int NOT NULL,
  `TenDichVuDiKem` varchar(45) ,
  `Gia` int NOT NULL,
  `DonVi` int NOT NULL,
  `TrangThaiKhaDung` varchar(45) ,
  PRIMARY KEY (`IdDichVuDiKem`)
);
CREATE TABLE `hopdong` (
  `IdHopDong` int NOT NULL,
  `IdNhanVien` int NOT NULL,
  `IdKhachHang` int NOT NULL,
  `IdDichVu` int NOT NULL,
  `NgayLamHopDong` date NOT NULL,
  `NgayKetThuc` date NOT NULL,
  `TienDatCoc` int NOT NULL,
  `TongTien` int NOT NULL,
  PRIMARY KEY (`IdHopDong`),
  KEY `IdNhanVien` (`IdNhanVien`),
  KEY `IdKhachHang` (`IdKhachHang`),
  KEY `IdDichVu` (`IdDichVu`),
  CONSTRAINT `IdDichVu` FOREIGN KEY (`IdDichVu`) REFERENCES `dichvu` (`IdDichVu`),
  CONSTRAINT `IdKhachHang` FOREIGN KEY (`IdKhachHang`) REFERENCES `khachhang` (`IdKhachHang`),
  CONSTRAINT `IdNhanVien` FOREIGN KEY (`IdNhanVien`) REFERENCES `nhanvien` (`IdNhanVien`)
);
CREATE TABLE `hopdongchitiet` (
  `IdHopDongChiTiet` int NOT NULL,
  `IdHopDong` int NOT NULL,
  `IdDichVuDiKem` int NOT NULL,
  `SoLuong` int NOT NULL,
  PRIMARY KEY (`IdHopDongChiTiet`),
  KEY `IdDichVuDiKem` (`IdDichVuDiKem`),
  KEY `IdHopDong` (`IdHopDong`),
  CONSTRAINT `IdDichVuDiKem` FOREIGN KEY (`IdDichVuDiKem`) REFERENCES `dichvudikem` (`IdDichVuDiKem`),
  CONSTRAINT `IdHopDong` FOREIGN KEY (`IdHopDong`) REFERENCES `hopdong` (`IdHopDong`)
);
CREATE TABLE `khachhang` (
  `IdKhachHang` int NOT NULL,
  `IdLoaiKhach` int NOT NULL,
  `HoTen` varchar(45)  NOT NULL,
  `NgaySinh` date NOT NULL,
  `SoCMND` varchar(45)  NOT NULL,
  `SDT` varchar(45)  NOT NULL,
  `Email` varchar(45)  NOT NULL,
  `DiaChi` varchar(45)  NOT NULL,
  PRIMARY KEY (`IdKhachHang`),
  KEY `IdLoaiKhach_` (`IdLoaiKhach`),
  CONSTRAINT `IdLoaiKhach` FOREIGN KEY (`IdLoaiKhach`) REFERENCES `loaikhach` (`IdLoaiKhach`)
);
CREATE TABLE `kieuthue` (
  `IdKieuThue` int NOT NULL,
  `TenKieuThue` varchar(45)  NOT NULL,
  `Gia` int NOT NULL,
  PRIMARY KEY (`IdKieuThue`)
);
CREATE TABLE `loaidichvu` (
  `IdLoaiDichVu` int NOT NULL,
  `TenLoaiDichVu` varchar(45) NOT NULL,
  PRIMARY KEY (`IdLoaiDichVu`)
);
CREATE TABLE `loaikhach` (
  `IdLoaiKhach` int NOT NULL,
  `TenLoaiKhach` varchar(45)  NOT NULL,
  PRIMARY KEY (`IdLoaiKhach`)
);
CREATE TABLE `nhanvien` (
  `IdNhanVien` int NOT NULL,
  `HoTen` varchar(45)  NOT NULL,
  `IdViTri` int NOT NULL,
  `IdTrinhDo` int NOT NULL,
  `IdBoPhan` int NOT NULL,
  `NgaySinh` date NOT NULL,
  `SoCMND` varchar(45)  NOT NULL,
  `Luong` varchar(45)  NOT NULL,
  `SDT` varchar(45)  NOT NULL,
  `Email` varchar(45) NOT NULL,
  `DiaChi` varchar(45) NOT NULL,
  PRIMARY KEY (`IdNhanVien`),
  KEY `IdViTri` (`IdViTri`),
  KEY `IdBoPhan` (`IdBoPhan`),
  KEY `IdTrinhDo` (`IdTrinhDo`),
  CONSTRAINT `IdBoPhan` FOREIGN KEY (`IdBoPhan`) REFERENCES `bophan` (`IdBoPhan`),
  CONSTRAINT `IdTrinhDo` FOREIGN KEY (`IdTrinhDo`) REFERENCES `trinhdo` (`IdTrinhDo`),
  CONSTRAINT `IdViTri` FOREIGN KEY (`IdViTri`) REFERENCES `vitri` (`Idvitri`)
);
CREATE TABLE `trinhdo` (
  `IdTrinhDo` int NOT NULL,
  `TrinhDo` varchar(45)  NOT NULL,
  PRIMARY KEY (`IdTrinhDo`)
);
CREATE TABLE `vitri` (
  `Idvitri` int NOT NULL,
  `TenViTri` varchar(45)  NOT NULL,
  PRIMARY KEY (`Idvitri`)
)
