2. SELECT * FROM manager_resort.nhanvien
where HoTen LIKE '____K%'
;
3. SELECT khachhang.HoTen,khachhang.SDT,khachhang.SoCMND,khachhang.Email,khachhang.DiaChi,khachhang.NgaySinh ,round(DATEDIFF(CURDATE(), khachhang.NgaySinh)/365,0) AS age
FROM khachhang
where  DiaChi = 'Đà nẵng' or DiaChi = 'Quảng trị' and round(DATEDIFF(CURDATE(), khachhang.NgaySinh)/365,0)  between 18 and 50 
;
4.
SELECT khachhang.HoTen,loaikhach.TenLoaiKhach,count(hopdongchitiet.SoLuong) as solandat
FROM khachhang
Inner join  loaikhach
on khachhang.IdLoaiKhach = loaikhach.IdLoaiKhach
Inner join  hopdong
on khachhang.IdKhachHang = hopdong.IdKhachHang
Inner join  hopdongchitiet
on hopdongchitiet.IdHopDong = hopdong.IdHopDong 
where TenLoaiKhach = 'Diamond'
order by SoLuong asc
;
5.
SELECT khachhang.IdKhachHang,khachhang.HoTen,loaikhach.TenLoaiKhach,hopdong.IdHopDong,dichvu.IdDichVu,hopdong.NgayLamHopDong,hopdong.NgayKetThuc, ChiPhiThue + (SoLuong*Gia) as TongTien
FROM khachhang
Inner join  loaikhach
on khachhang.IdLoaiKhach = loaikhach.IdLoaiKhach

Inner join  hopdong
on khachhang.IdKhachHang = hopdong.IdKhachHang

Inner join  hopdongchitiet
on hopdongchitiet.IdHopDong = hopdong.IdHopDong 

Inner join  dichvu
on dichvu.IdDichVu = hopdong.IdDichVu

Inner join dichvudikem
on hopdongchitiet.IdDichVuDiKem = dichvudikem.IdDichVuDiKem
;

câu 6 :
select dichvu.IDDichVu, dichvu.TenDichVu, dichvu.DienTich, dichvu.ChiPhiThue, loaidichvu.TenLoaiDichVu 
from qlknd.dichvu 
inner join qlknd.loaidichvu
 on loaidichvu.IDLoaiDichVu = dichvu.IDLoaiDichVu  
 where dichvu.IDDichVu not in  (select IDDichVu from qlknd.hopdong where year(NgayLamHopDong) = 2019 and quarter(NgayLamHopDong) =(1)) ;
-- --Hàm QUARTER() trong SQL trả về quý trong năm từ ngày đã cho, trong khoảng từ 1 đến 4

câu 7 :
select dichvu.IDDichVu, dichvu.TenDichVu, dichvu.DienTich, dichvu.SoNguoiToiDa, dichvu.ChiPhiThue, loaidichvu.TenLoaiDichVu 
from qlknd.dichvu 
inner join qlknd.loaidichvu 
on loaidichvu.IDLoaiDichVu = dichvu.IDLoaiDichVu 
 where (dichvu.IDDichVu in (select IDDichVu from qlknd.hopdong where year(NgayLamHopDong) = 2018)) and (dichvu.IDDichVu not in  (select IDDichVu from qlknd.hopdong where year(NgayLamHopDong) = 2019));
;
câu 8 
select distinct HoTen 
from qlknd.khachhang ; 
-- distinct loại bỏ trùng lặp

câu 9 
select hopdong.IDHopDong, NgayLamHopDong,NgayKetThuc,TienDatCoc,SoLuong,count(IDHopDongChiTiet) 
from qlknd.hopdong 
inner join qlknd.hopdongchitiet 
on hopdong.IDHopDong= hopdongchitiet.IDHopDong
group by IDHopDong;

câu 10 
select hopdong.IDHopDong, hopdong.NgayLamHopDong, hopdong.NgayKetThuc, hopdong.TienDatCoc, count(hopdongchitiet.IDDichVuDiKem) as SoLuongDichVuDiKem  
from qlknd.hopdong 
left join qlknd.hopdongchitiet 
on hopdong.IDHopDong = hopdongchitiet.IDHopDong 
group by hopdong.IDHopDong;

câu 11
select dichvudikem.IDDichVuDiKem, dichvudikem.TenDichVuDiKem, dichvudikem.Gia, dichvudikem.DonVi, dichvudikem.TrangThaiKhaDung from ((((qlknd.dichvudikem inner join qlknd.hopdongchitiet on dichvudikem.IDDichVuDiKem = hopdongchitiet.IDDichVuDiKem) inner join qlknd.hopdong on hopdong.IDHopDong = hopdongchitiet.IDHopDong) inner join qlknd.khachhang on khachhang.IDKhachHang = hopdong.IDKhachHang) 
inner join qlknd.loaikhach 
on loaikhach.IDLoaiKhach = khachhang.IDLoaiKhach) 
where (loaikhach.TenLoaiKhach like "Diamond") and (khachhang.Diachi like "%Quang Ngai%" or khachhang.Diachi like "%Vinh%");

câu 12
select hopdong.IDHopDong, nhanvien.HoTen as NhanVien, khachhang.Hoten as KhachHang, khachhang.SDT, dichvu.TenDichVu, count(hopdongchitiet.IDDichVuDiKem) as SoLuongDichVuDikem  
from ((((qlknd.nhanvien inner join qlknd.hopdong on nhanvien.IDNhanVien = hopdong.IDNhanVien) 
inner join qlknd.khachhang on khachhang.IDKhachHang = hopdong.IDKhachHang) 
inner join qlknd.dichvu on dichvu.IDDichVu = hopdong.IDDichVu) 
inner join qlknd.hopdongchitiet on hopdongchitiet.IDHopDong = hopdong.IDHopDong) 
where hopdong.NgayLamHopDong not in (select NgayLamHopDong from qlknd.hopdong where month(NgayLamHopDong) = 6) and (year(hopdong.NgayLamHopDong) = 2019 and quarter(hopdong.NgayLamHopDong) = 4) group by hopdong.IDHopDong;

câu 13 
select DISTINCT dichvudikem.IDDichVuDiKem, dichvudikem.TenDichVuDiKem
from qlknd.hopdongchitiet 
left join qlknd.dichvudikem  
on hopdongchitiet.IDDichVuDiKem = dichvudikem.IDDichVuDiKem
left join qlknd.hopdong  
on hopdong.IDHopDong = hopdongchitiet.IDHopDong
where dichvudikem.IDDichVuDiKem in (select IDDichVuDiKem from qlknd.hopdongchitiet where SoLuong = (select max(SoLuong) from qlknd.hopdongchitiet));

câu 14
Select hopdongchitiet.IDHopDongChiTiet, loaidichvu.TenLoaiDichVu, dichvudikem.TenDichVuDiKem, dichvudikem.IDDichVuDiKem as solansudung
From qlknd.hopdong ,qlknd.loaidichvu , qlknd.dichvudikem , qlknd.hopdongchitiet , qlknd.dichvu 
where dichvudikem.IDDichVuDiKem = hopdongchitiet.IDDichVuDiKem and
hopdong.IDHopDong = hopdongchitiet.IDHopDong and 
hopdong.IDDichVu = dichvu.IDDichVu and
dichvu.IDLoaiDichVu = loaidichvu.IDLoaiDichVu
group by hopdong.IDHopDong, loaidichvu.TenLoaiDichVu, dichvudikem.TenDichVuDiKem, solansudung
having solansudung=1;

câu 15 
select hopdong.IDNhanVien, nhanvien.HoTen ,trinhdo.TrinhDo, bophan.TenBoPhan, nhanvien.SDT, nhanvien.DiaChi
from qlknd.nhanvien ,qlknd.hopdong ,qlknd.bophan , qlknd.trinhdo 
where nhanvien.IDNhanVien = hopdong.IDNhanVien and
bophan.IDBoPhan = nhanvien.IDBoPhan and
trinhdo.IDTrinhDo = nhanvien.IDTrinhDo and
year(NgayLamHopDong) between 2018 and 2019
group by hopdong.IDNhanVien, nhanvien.HoTen ,trinhdo.TrinhDo, bophan.TenBoPhan, nhanvien.SDT, nhanvien.DiaChi
having count(hopdong.IDNhanVien)<=3;

câu 16
DELETE FROM qlknd.nhanvien
WHERE EXISTS (select * from qlknd.hopdong 
where 
nhanvien.IDNhanVien = hopdong.IDNhanVien 
and year(hopdong.NgayLamHopDong) between 2017 and 2019);

câu 17 

câu 18 

câu 19
update qlknd.dichvudikem 
set Gia = Gia*2
where IDDichVuDiKem in (select hopdongchitiet.IDDichVuDiKem from qlknd.hopdongchitiet , qlknd.hopdong  where SoLuong > 10 and year(hopdong.NgayLamHopDong) = 2019);

câu 20
SELECT IDKhachHang as IDKhachHang,HoTen,Email,SDT,NgaySinh,DiaChi FROM qlknd.khachhang
UNION 
SELECT IDNhanVien as IDNhanVien,HoTen,Email,SDT,NgaySinh,DiaChi FROM qlknd.nhanvien;

