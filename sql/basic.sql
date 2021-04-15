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
group by Hoten
;
5.SELECT khachhang.IdKhachHang,khachhang.HoTen,loaikhach.TenLoaiKhach,hopdong.IdHopDong,dichvu.IdDichVu,hopdong.NgayLamHopDong,hopdong.NgayKetThuc,hopdong.TongTien
FROM khachhang
Inner join  loaikhach
on khachhang.IdLoaiKhach = loaikhach.IdLoaiKhach

Inner join  hopdong
on khachhang.IdKhachHang = hopdong.IdKhachHang

Inner join  hopdongchitiet
on hopdongchitiet.IdHopDong = hopdong.IdHopDong 

Inner join  dichvu
on dichvu.IdDichVu = hopdong.IdDichVu

;

