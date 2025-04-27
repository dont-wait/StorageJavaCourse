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
create


