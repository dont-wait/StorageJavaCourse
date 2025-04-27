show databases;
create database java28tech; 
use java28tech;
CREATE TABLE tac_gia (
	id int primary key auto_increment,
    ten nvarchar(255) not null,
    but_danh varchar(150)
);

insert into tac_gia values(null, 'Nguyễn Nhật Ánh', 'NNA'), (null, 'Tô Hoài', 'TH');
insert into tac_gia values(null, 'Nguyễn Nhật Ánh', 'NNA2');

create table tac_pham (
	ma_tac_pham char(150) primary key,
    ten_tac_pham nvarchar(150) NOT NULL,
    id_tac_gia int not null,
    ngay_xuat_ban date not null,
	constraint fk_tg_tp foreign key(id_tac_gia) references tac_gia(id)
);

-- chuyển mối quan hệ n:n thành bảng trung gian
-- không xóa dữ liệu account - thêm trường status xóa thì tắt về 0 hoạt động thì về 1 
-- status 0, 1
create database sieuthi;
use sieuthi;
USE sieuthi;

CREATE TABLE bophan(
	mabp varchar(25) not null primary key,
    tenbp nvarchar(100) not null
);
select * from bophan;
INSERT INTO bophan
VALUES('BP001','Bộ phận đồ hải sản'),
('BP002','Bộ phận đồ kĩ thuật'),
('BP003','Bộ phận trái cây tươi'),
('BP004','Bộ phận quần áo');



CREATE TABLE nhanvien(
	manv varchar(25) not null primary key,
    tennv nvarchar(250) not null,
    luong int not null,
    maql varchar(25),
    mabp varchar(25) not null,
    FOREIGN KEY(mabp) REFERENCES bophan(mabp)
);

INSERT INTO nhanvien
VALUES('NV001','Pham Van Tu',20000000,null,'BP001'),
('NV002','Pham Van Tuan',18000000,null,'BP002'),
('NV003','Nguyen Tran Tuan Kiet',15300000,null,'BP001'),
('NV004','Tran Lan Huong',13750000,null,'BP003'),
('NV005','Vu Song Huong',17000000,null,'BP004'),
('NV006','Nguyen Van Khai',10000000,null,'BP002'),
('NV007','Mac Van Khoa',14900000,null,'BP001');


CREATE TABLE mathang(
	masmh varchar(25) not null primary key,
    tenmh nvarchar(250) not null,
    mabp varchar(25) not null,
    FOREIGN KEY(mabp) REFERENCES bophan(mabp)
);

INSERT INTO mathang
VALUES('MH01','Xoai cat tien','BP003'),
('MH02','May khoan','BP002'),
('MH03','Ao thun','BP004'),
('MH04','Ao khoac','BP004'),
('MH05','Ca Ngu','BP001'),
('MH06','Ca Thu','BP001'),
('MH07','Bach tuoc','BP001'),
('MH08','Thanh Long','BP003'),
('MH09','Bua ta','BP002'),
('MH10','Dua Hau','BP003');

CREATE TABLE cungcap(
	macc varchar(25) not null primary key,
    masmh varchar(25) not null,
    mancc varchar(25) not null,
    giacc int not null,
    FOREIGN KEY(masmh) REFERENCES mathang(masmh),
    FOREIGN KEY(mancc) REFERENCES nguoicungcap(mancc)
);
INSERT INTO cungcap
VALUES('001','MH01','NCC01',5000),
('002','MH01','NCC02',4500),
('003','MH02','NCC02',500000),
('004','MH03','NCC03',200000),
('005','MH02','NCC04',550000),
('006','MH04','NCC04',220000),
('007','MH05','NCC05',300000),
('008','MH06','NCC06',32000),
('009','MH07','NCC05',150000),
('010','MH07','NCC01',250000),
('011','MH08','NCC05',6000),
('012','MH09','NCC01',350000);

CREATE TABLE nguoicungcap(
	mancc varchar(25) not null primary key,
    tenncc nvarchar(250) not null,
    diachincc nvarchar(250) not null
);

INSERT INTO nguoicungcap
VALUES('NCC01','Pham Xuan Chi','Hai Phong'),
('NCC02','Nguyen Xuan Loc','Ha Noi'),
('NCC03','Nguyen Van Manh','TPHCM'),
('NCC04','Nguyen Van Long','Ha Noi'),
('NCC05','Pham Xuan Chi','Hai Phong'),
('NCC06','Tran Quoc Co','Da Nang');

CREATE TABLE khachhang(
	makh varchar(25) not null primary key,
    tenkh nvarchar(250) not null,
    diachikh nvarchar(250) not null
);
INSERT INTO khachhang
VALUES('KH001','Tran Xuan Chi','HA Noi'),
('KH002','Nguyen Xuan Loc','Phu Tho'),
('KH003','Nguyen Van Manh','TPHCM'),
('KH004','Vo Van Long','Ha Noi'),
('KH005','Pham Xuan Chi','Hai Phong'),
('KH006','Tran Quoc Co','Da Nang');
CREATE TABLE donhang(
	sohieuddh varchar(25) not null primary key,
    ngaydh date not null,
    makh varchar(25) not null,
    FOREIGN KEY(makh) REFERENCES khachhang(makh)
);
INSERT INTO donhang
VALUES('DDH01','2023-12-12','KH002'),
('DDH02','2023-12-15','KH002'),
('DDH03','2023-10-14','KH001'),
('DDH04','2023-12-12','KH002'),
('DDH05','2023-10-27','KH002'),
('DDH06','2023-08-18','KH004'),
('DDH07','2023-07-15','KH003'),
('DDH08','2023-10-30','KH006'),
('DDH09','2023-12-12','KH006');
CREATE TABLE chitietdonhang(
	id int NOT NULL AUTO_INCREMENT primary key,
    soluong int not null,
    dongia int not null,
    sohieuddh varchar(25) not null,
    masmh varchar(25) not null,
    FOREIGN KEY(sohieuddh) REFERENCES donhang(sohieuddh),
    FOREIGN KEY(masmh) REFERENCES mathang(masmh)
);


INSERT INTO chitietdonhang
VALUES (null,5,10000,'DDH01','MH01'),
(null,2,7000,'DDH01','MH05'),
(null,3,12000,'DDH02','MH05'),
(null,1,11000,'DDH02','MH03'),
(null,5,20000,'DDH06','MH02'),
(null,5,5000,'DDH01','MH04'),
(null,4,5000,'DDH06','MH09'),
(null,3,8000,'DDH07','MH06'),
(null,2,11000,'DDH07','MH03'),
(null,2,9000,'DDH01','MH08');

INSERT INTO chitietdonhang
VALUES(null,1,11000,'DDH04','MH03');

-- 1
select masmh, tenmh from mathang where tenmh = 'Thanh Long';

-- 2
select * from mathang where mabp = 'BP001';

-- 3 In ra TEN_MH, Ma_BP, MA_NGUOI_CUNG_CAP, TEN_NGUOI_CUNG_CAP của MH01.
select * from cungcap;

select m.masmh, m.tenmh, m.mabp, c.mancc, n.tenncc 
from mathang m join cungcap c on m.masmh = c.masmh
			   join nguoicungcap n on n.mancc = c.mancc
where m.masmh = 'MH01';

-- 4
select n.mancc, n.tenncc, count(c.masmh) as sl 
from nguoicungcap n join cungcap c on n.mancc = c.mancc
group by n.mancc, n.tenncc
order by sl desc, n.mancc desc;
                                        
-- 5 .Đếm xem đơn hàng có mã DDH01có tổng bao nhiêu mặt hàng và tổng số lượng của tất cả mặt hàng là bao nhiêu cái.

-- 6.In ra TEN_KHACH_HANG, SO_HIEU_DON_HANG, MA_MH , TEN_MH, SoLuong mà khách hàng có mã là KH02 đã mua.
select kh.tenkh, d.sohieuddh, c.masmh, m.tenmh, c.soluong 
from khachhang kh 
	join donhang d on kh.makh = d.makh
	join chitietdonhang c on d.sohieuddh = c.sohieuddh
	join mathang m on c.masmh = m.masmh
where kh.makh = 'KH002';
                                                                            
-- 7 in ra tất cả MA_KHACH_HANG , TEN_KHACH_HANG, SO_HIEU_DON_HANG,Ngay_Dat_Hang của những khách hàng có địa chỉ ở Ha Noi.                                                                     
select k.makh, k.tenkh, d.sohieuddh, d.ngaydh
from khachhang k join donhang d on k.makh = d.makh
where k.diachikh = 'Ha Noi';																

-- 8 Đếm xem khách hàng có mã KH02 có tổng cộng bao nhiêu đơn hàng.
select count(*) as 'no donhang by KH002' from donhang d where d.makh = 'KH002';

-- 9 .In ra MA_KHACH_HANG , TEN_KHACH_HANG và SO_HIEU_DON_HANG của những khách hàng mua vào tháng 12 năm 2023
select k.makh, k.tenkh from khachhang k join donhang d on k.makh = d.makh 
where month(d.ngaydh) = 12 AND year(d.ngaydh) = 2023  ;                                                         
                                                                            
-- 10 Liệt kê tổng tiền mà khách hàng có mã KH02 đã trả để mua mặt hàng có mã MH01
select soluong * dongia from donhang d join chitietdonhang c on d.sohieuddh = c.sohieuddh
where d.makh = 'KH002' AND c.masmh = 'MH01' ;

-- 11 Tổng số lượng mà mặt hàng có mã MH01 được mua.
select sum(c.soluong) from chitietdonhang c where c.masmh = 'MH01';

-- 12 Liệt kê MA_NCC và Ten_NCC cung cấp nhiều cung cấp có tên là May khoan.
select n.mancc, n.tenncc 
from nguoicungcap n join cungcap c on n.mancc = c.mancc 
				    join mathang m on c.masmh = m.masmh
where m.tenmh = 'May khoan';

-- 13 Liệt kê Tên , địa chỉ của những khách hàng sở hữu đơn hàng có Sohieuddh là DDH07 hoặc DDH08 hoặc DDH02.
select k.tenkh, k.diachikh 
from khachhang k join donhang d on k.makh = d.makh
where d.sohieuddh in('DDH07', 'DDH08', 'DDH02' );

-- 14 Liệt kê Tên , địa chỉ và  số lượng đơn của  khách hàng sở hữu nhiều đơn hàng nhất.
select k.tenkh, k.diachikh, count(d.sohieuddh) 
from khachhang k join donhang d on k.makh = d.makh                          
group by k.tenkh, k.diachikh
having count(d.sohieuddh) >= ALL(select count(*) from donhang group by makh);                                                                            
                                                                            
-- 15 Liệt kê TenMH và tổng tất cả số lượng mà khách hàng đã mua mặt hàng có mã MH03
select m.tenmh, sum(c.soluong) as sl
from mathang m join chitietdonhang c on m.masmh = c.masmh
where m.masmh = 'MH03'
group by m.tenmh