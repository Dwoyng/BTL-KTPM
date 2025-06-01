﻿use master
go
drop database QuanLyChanNuoi
go
create database QuanLyChanNuoi
go 
use QuanLyChanNuoi
go

create table HoSo
( Id int primary key identity
, Ten nvarchar(50)
, SDT varchar(50)
, Email varchar(50)
, Ext text
)
go
insert into HoSo values
	(N'Lê Chí Công', '0912345678', 'cong.dz@hust.edu.vn', null),
	(N'Vũ Thị Hải Anh', '0989708960', 'anh.vh@hust.edu.vn', null)
go

create table Quyen
( Id int primary key identity
, Ten nvarchar(50)
, Ext varchar(50)
)
go
insert into Quyen values
	(N'Lập trình viên', 'Developer'),
	(N'Quản trị hệ thống', 'Admin'),
	(N'Cán bộ nghiệp vụ', 'Staff')
go

create table TaiKhoan
( Ten varchar(50) primary key
, MatKhau varchar(255)
, QuyenId int foreign key references Quyen(Id)
, HoSoId int foreign key references HoSo(Id)
)
go
insert into TaiKhoan values
	('dev', '1234', 1, null),
	('admin', '1234', 2, null),
	('0989154248', '1234', 3, 1),
	('0989708960', '1234', 3, 2)
go

--Bảng quản lý cấp hành chính (cấp tỉnh, huyện, xã...)
create table CapDoHanhChinh 
(
    ID int primary key identity 
	,TenCapDo nvarchar(50) 
	, CapDo int
)

insert into CapDoHanhChinh values
	(N'Tỉnh', 1),
	(N'Thành phố', 2),
	(N'Huyện', 2),
	(N'Phường' , 3 ),
	(N'Xã', 3),
	(N'Thị trấn', 3),
	(N'Thôn', 4)
SELECT ID, TenCapDo, CapDo
FROM CapDoHanhChinh 
ORDER BY CapDo;

create table DonViHanhChinh
(
	ID int primary key identity
	,TenDonVi nvarchar(255) 
	,CapDoHanhChinhID int foreign key references CapDoHanhChinh(ID)
	,TrucThuocID int foreign key references DonViHanhChinh(ID) 
)
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
    (N'Tỉnh Hải Dương',1,null)

-- Các huyện/thành phố của tỉnh 
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
 (N'Thành phố Hải Dương', 2, 1),
    (N'Thành phố Chí Linh', 2, 1),
    (N'Huyện Nam Sách', 3, 1),
    (N'Huyện Kinh Môn', 3, 1),
    (N'Huyện Gia Lộc', 3, 1),
    (N'Huyện Thanh Hà', 3, 1),
    (N'Huyện Thanh Miện', 3, 1),
    (N'Huyện Tứ Kỳ', 3, 1),
    (N'Huyện Cẩm Giàng', 3, 1)

	-- Các đơn vị hành chính cấp xã/phường thuộc thành phố Hải Dương
	insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
	 (N'Phường Bình Hàn', 4, 2),
    (N'Phường Trần Hưng Đạo', 4, 2),
    (N'Phường Quang Trung', 4, 2),
    (N'Phường Nguyễn Trãi', 4, 2),
    (N'Phường Hải Tân', 4, 2),
    (N'Phường Thanh Bình', 4, 2),
    (N'Phường Tân Bình', 4, 2),
    (N'Phường Thạch Khôi', 4, 2),
    (N'Xã Liên Hồng', 5, 2);

	-- Insert các phường/xã thuộc thành phố Chí Linh
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
    (N'Phường Sao Đỏ', 4, 3),
    (N'Phường Cộng Hoà', 4, 3),
    (N'Phường Văn Đức', 4, 3),
    (N'Phường Hoàng Tân', 4, 3),
    (N'Phường Cổ Thành', 4, 3),
    (N'Xã Lê Lợi', 5, 3),
    (N'Xã Hoàng Hoa Thám', 5, 3),
    (N'Phường Chí Minh', 4, 3),
    (N'Xã Bắc An', 5, 3);

	-- Insert các xã/thị trấn thuộc huyện Nam Sách
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
   (N'Thị trấn Nam Sách', 6, 4),
    (N'Xã An Bình', 5, 4),
    (N'Xã Hiệp Cát', 5, 4),
    (N'Xã Nam Hồng', 5, 4),
    (N'Xã Nam Trung', 5, 4),
    (N'Xã Thanh Quang', 5, 4),
    (N'Thị trấn An Lạc', 6, 4),
    (N'Xã Nam Chính', 5, 4),
    (N'Xã Nam Chính', 5, 4),
    (N'Xã Thái Tân', 5, 4),
    (N'Xã Hợp Tiến', 5, 4),
    (N'Xã Nam Tân', 5, 4),
    (N'Xã Đồng Lạc', 5, 4),
    (N'Xã An Sơn', 5, 4),
    (N'Xã Quốc Tuấn', 5, 4),
    (N'Xã Nam Trung', 5, 4),
    (N'Xã Nam Chính', 5, 4),
    (N'Xã An Lâm', 5, 4),
    (N'Xã Bình Minh', 5, 4);

	-- Insert các xã/thị trấn thuộc huyện Kinh Môn
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
    (N'Thị trấn Kinh Môn', 6, 5),
    (N'Thị trấn Minh Tân', 6, 5),
    (N'Xã Hiệp Sơn', 5, 5),
    (N'Xã An Sinh', 5, 5),
    (N'Xã Quang Thành', 5, 5),
    (N'Xã Hiệp An', 5, 5),
    (N'Thị trấn Phạm Thái', 6, 5),
    (N'Xã Duy Tân', 5, 5),
    (N'Xã Thái Sơn', 5, 5),
    (N'Xã Bạch Đằng', 5, 5);

	-- Insert các xã/thị trấn thuộc huyện Gia Lộc
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
        (N'Thị trấn Gia Lộc', 6, 6),
    (N'Xã Đồng Quang', 5, 6),
    (N'Xã Phạm Trấn', 5, 6),
    (N'Xã Quang Minh', 5, 6),
    (N'Xã Thống Nhất', 5, 6),
    (N'Xã Hồng Hưng', 5, 6),
    (N'Thị trấn Hải Lộc', 6, 6),
    (N'Xã Đoàn Thượng', 5, 6),
    (N'Xã Đức Xương', 5, 6),
    (N'Xã Hùng Thắng', 5, 6),
    (N'Xã Nhật Tân', 5, 6),
    (N'Xã Phú Hưng', 5, 6),
    (N'Xã Đồng Gia', 5, 6),
    (N'Xã Gia Khánh', 5, 6),
    (N'Xã Hải Hà', 5, 6);

	-- Insert các xã/thị trấn thuộc huyện Thanh Hà
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
    (N'Thị trấn Thanh Hà', 6, 7),
    (N'Xã Hồng Lạc', 5, 7),
    (N'Xã Thanh Khê', 5, 7),
    (N'Xã Thanh Xá', 5, 7),
    (N'Xã Tân Việt', 5, 7),
    (N'Xã Thanh Sơn', 5, 7),
    (N'Thị trấn Cẩm Vũ', 6, 7),
    (N'Xã An Thanh', 5, 7),
    (N'Xã Thanh Lang', 5, 7),
    (N'Xã Trường Thành', 5, 7),
    (N'Xã Thanh Hải', 5, 7),
    (N'Xã Thanh Thủy', 5, 7),
    (N'Xã Thanh Xuân', 5, 7);

	-- Insert các xã/thị trấn thuộc huyện Thanh Miện
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
     (N'Thị trấn Thanh Miện', 6, 8),
    (N'Xã Thanh Giang', 5, 8),
    (N'Xã Đoàn Tùng', 5, 8),
    (N'Xã Lam Sơn', 5, 8),
    (N'Xã Ngô Quyền', 5, 8),
    (N'Xã Đoàn Kết', 5, 8),
    (N'Xã Hồng Phong', 5, 8),
    (N'Xã Thanh Tùng', 5, 8),
    (N'Thị trấn Tứ Kỳ', 6, 8),
    (N'Xã Hưng Thái', 5, 8),
    (N'Xã Minh Đức', 5, 8),
    (N'Xã Tân Hưng', 5, 8),
    (N'Xã Thái Học', 5, 8),
    (N'Xã Tân Trào', 5, 8),
    (N'Xã Thanh Khê', 5, 8);

	-- Insert các xã/thị trấn thuộc huyện Tứ Kỳ
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
    (N'Thị trấn Tứ Kỳ', 6, 9),
    (N'Xã Quang Phục', 5, 9),
    (N'Xã Đại Hợp', 5, 9),
    (N'Xã Quang Trung', 5, 9),
    (N'Xã Dân Chủ', 5, 9),
    (N'Xã Hà Thanh', 5, 9),
    (N'Xã Hưng Đạo', 5, 9),
    (N'Xã Tân Kỳ', 5, 9),
    (N'Xã Văn Tố', 5, 9),
    (N'Xã Quý Cao', 5, 9),
    (N'Xã Ngọc Sơn', 5, 9),
    (N'Xã Đại Sơn', 5, 9),
    (N'Xã Hưng Thái', 5, 9);

	-- Insert các xã/thị trấn thuộc huyện Cẩm Giàng
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
    (N'Thị trấn Lai Cách', 6, 10),
    (N'Xã Cẩm Đông', 5, 10),
    (N'Xã Cẩm Đoài', 5, 10),
    (N'Xã Cẩm Phúc', 5, 10),
    (N'Xã Cẩm Văn', 5, 10),
    (N'Xã Cẩm Vũ', 5, 10),
    (N'Xã Cẩm Giang', 5, 10),
    (N'Xã Cẩm Điền', 5, 10),
    (N'Xã Cẩm Hưng', 5, 10),
    (N'Xã Cẩm Hoàng', 5, 10);

SELECT dv.ID, dv.TenDonVi, cd.TenCapDo, cd.CapDo,
       CASE WHEN dv.TrucThuocID IS NULL THEN N'Không' ELSE parent.TenDonVi END AS TrucThuoc
FROM DonViHanhChinh dv
JOIN CapDoHanhChinh cd ON dv.CapDoHanhChinhID = cd.ID
LEFT JOIN DonViHanhChinh parent ON dv.TrucThuocID = parent.ID
ORDER BY cd.CapDo, dv.TenDonVi;

CREATE TABLE VungChanNuoi
(
ID int primary key identity 
,TenVungChanNuoi nvarchar(50)
,MoTa nvarchar(250) 
,DonViHanhChinhID int foreign key references DonViHanhChinh(ID)
)

-- Thêm dữ liệu vào bảng VungChanNuoi (cách chính xác nhất)
insert into VungChanNuoi(TenVungChanNuoi, MoTa, DonViHanhChinhID) values
    (N'Vùng chăn nuôi Bình Hàn', N'Nuôi lợn tập trung', 
     (select ID from DonViHanhChinh where TenDonVi = N'Phường Bình Hàn')),
    
    (N'Vùng chăn nuôi Sao Đỏ', N'Nuôi gà thả vườn', 
(select ID from DonViHanhChinh where TenDonVi = N'Phường Sao Đỏ')),
    
    (N'Vùng chăn nuôi Nam Sách', N'Nuôi đa dạng các loại gia súc', 
     (select ID from DonViHanhChinh where TenDonVi = N'Thị trấn Nam Sách')),
    
    (N'Vùng chăn nuôi Minh Tân', N'Nuôi theo hướng hữu cơ', 
     (select ID from DonViHanhChinh where TenDonVi = N'Thị trấn Minh Tân')),
    
    (N'Vùng chăn nuôi Thanh Hà', N'Vùng an toàn dịch bệnh', 
     (select ID from DonViHanhChinh where TenDonVi = N'Thị trấn Thanh Hà'));

SELECT v.ID, v.TenVungChanNuoi, v.MoTa, 
       dv.TenDonVi AS 'Đơn vị hành chính',
       parent.TenDonVi AS 'Thuộc đơn vị'
FROM VungChanNuoi v
JOIN DonViHanhChinh dv ON v.DonViHanhChinhID = dv.ID
LEFT JOIN DonViHanhChinh parent ON dv.TrucThuocID = parent.ID;

CREATE TABLE HoChanNuoi
(
ID int primary key identity
,VungChanNuoiID int foreign key references VungChanNuoi(ID)
,SoHo int 
,KetQua bit
,NgayThongKe date

)
insert into HoChanNuoi (VungChanNuoiID, SoHo, KetQua, NgayThongKe) values
(1, 50, 1, '2025-01-15'),
(2, 30, 1, '2025-02-10'),
(3, 40, 0, '2025-03-05'),
(4, 25, 1, '2025-03-20'),
(5, 35, 1, '2025-04-01');

SELECT h.ID, v.TenVungChanNuoi, h.SoHo, h.KetQua, h.NgayThongKe
FROM HoChanNuoi h
JOIN VungChanNuoi v ON h.VungChanNuoiID = v.ID
ORDER BY h.NgayThongKe DESC;

CREATE TABLE DieuKienChanNuoi
(
ID int primary key identity
,HoChanNuoiID int foreign key references HoChanNuoi(ID)
,MoTa nvarchar(250)
,NgayCapNhat date
);
INSERT INTO DieuKienChanNuoi (HoChanNuoiID, MoTa, NgayCapNhat) VALUES
(1, N'Hệ thống chuồng trại đạt chuẩn, đảm bảo vệ sinh', '2025-01-20'),
(2, N'Chăn nuôi gà thả vườn, nguồn nước sạch', '2025-02-15'),
(3, N'Chuồng trại cũ, cần cải tạo hệ thống thoát nước', '2025-03-10'),
(4, N'Sử dụng thức ăn hữu cơ, không hóa chất', '2025-03-25'),
(5, N'Hệ thống xử lý chất thải đạt tiêu chuẩn', '2025-04-05');

SELECT d.ID, v.TenVungChanNuoi, h.SoHo, d.MoTa, d.NgayCapNhat
FROM DieuKienChanNuoi d
JOIN HoChanNuoi h ON d.HoChanNuoiID = h.ID
JOIN VungChanNuoi v ON h.VungChanNuoiID = v.ID
ORDER BY d.NgayCapNhat DESC;

CREATE TABLE VaiTro
(
ID int primary key identity
,TenVaiTro nvarchar(50)
)
insert into VaiTro (TenVaiTro) values 
( N'Admin'), 
(N'User');

CREATE TABLE NguoiDung
(
ID int primary key identity
,UserName nvarchar (50)
,Email_or_Phone nvarchar (50)
,Password nvarchar (50)
,TrangThai nvarchar (50)
,VaiTroID int foreign key references VaiTro(ID)
,DonViHanhChinhID int foreign key references DonViHanhChinh(ID)
)

insert into NguoiDung ( UserName , Email_or_Phone, Password ,VaiTroID ,TrangThai,  DonViHanhChinhID ) values  
    (N'Lê Chí Công', 'conglc2004@gmail.com', 'chicong', 1, N'Hoạt Động' , 1), -- Admin
    (N'Vũ Thị Hải Anh', 'anhvth2004@gmail.com', 'haianh', 1, N'Hoạt động' , 1 ), -- Admin
     (N'Đào Nguyễn Minh', 'minhdn2004@gmail.com', 'daominh', 1,N'Hoạt động' , 1 ), -- Admin
    (N'Đỗ Chí Thanh', 'chithanh@gmail.com', 'chithanh', 2,N'Hoạt động' , 1 ), -- User
    (N'Phạm Quốc Bảo', 'phamquoce@gmail.com', 'phamquoc', 2,N'Hoạt động' , 1), -- User
    (N'Hoàng Minh Anh', 'hoangminhf@gmail.com', 'hoangminh', 2,N'Hoạt động' , 1), -- User
    (N'Lê Hoài Thương', 'lehoaig@gmail.com', 'lehoai', 2, N'Hoạt động' ,1), -- User
    (N'Trần Thị Hà', 'tranthih@gmail.com', 'tranthi', 2, N'Hoạt động' ,1), -- User
    (N'Nguyễn Hữu Trí', 'nguyenhuui@gmail.com', 'nguyenhuu', 2,N'Hoạt động' , 1), -- User
    (N'Lê Thùy Trang', 'lethuyj@gmail.com', 'lethuy', 2, N'Hoạt động' ,1), -- User
    (N'Nguyễn Văn Khang', 'nguyenvank@gmail.com', 'vank', 2,N'Hoạt động' , 1), -- User
    (N'Phạm Thị Lan', 'phamthil@gmail.com', 'thil', 2, N'Hoạt động' ,1), -- User
    (N'Lê Anh Mão', 'leanhm@gmail.com', 'anhm', 2, N'Hoạt động' ,1), -- User
    (N'Hoàng Thị Lan', 'hoangthin@gmail.com', 'hoangn', 2,N'Hoạt động' , 1); -- User

CREATE TABLE LoaiCoSo
(
ID int primary key identity
,TenLoaiCoSo nvarchar(50)
)

insert into LoaiCoSo (TenLoaiCoSo) values
(N'Trang trại chăn nuôi'),
(N'Cơ sở giết mổ'),
(N'Nhà máy chế biến thức ăn chăn nuôi'),
(N'Cơ sở xử lý chất thải'),
(N'Chi cục thú y'),
(N'Đại lý bán thuốc'),
(N'Khu tạm giữ')

CREATE TABLE ToChuc_or_CaNhan
(
ID int primary key identity
,Ten nvarchar (50)
,DiaChi nvarchar(50)
,Email_or_Phone nvarchar(50)
)

INSERT INTO ToChuc_or_CaNhan (Ten, DiaChi, Email_or_Phone) VALUES
(N'Công ty TNHH Chăn nuôi Hải Dương', N'123 Đường Láng, Hải Dương', N'haiduongfarm@gmail.com'),
(N'Hộ ông Nguyễn Văn An', N'Thôn 2, Xã Liên Hồng', N'0912345678'),
(N'Công ty CP Thức ăn chăn nuôi Minh Tân', N'xã Minh Tân, huyện Kinh Môn', N'minhtanfeed@gmail.com'),
(N'Hộ bà Trần Thị Bích', N'Xã Thanh Hà, huyện Thanh Hà', N'0923456789'),
(N'Cơ sở giết mổ Nam Sách', N'Nam Sách, huyện Nam Sách', N'0934567890'),
(N'Chi cục thú y Hải Dương', N'Đường Kim Ngọc, Hải Dương', N'thuyhd@vietnam.gov.vn'),
(N'Đại lý thuốc thú y Minh Phát', N'Thị trấn Minh Tân', N'dailyminhphat@gmail.com'),
(N'Khu tạm giữ gia súc Kinh Môn', N'Huyện Kinh Môn', N'khutamgiu.km@gmail.com');

CREATE TABLE CoSo
(
ID int primary key identity
,TenCoSo nvarchar(50)
,DiaChi nvarchar(50)
,NgayCapGiayPhep date 
,LoaiCoSoID int foreign key references LoaiCoSo(ID)
,DonViHanhChinhID int foreign key references DonViHanhChinh(ID)
,ToChuc_or_CaNhanID int foreign key references ToChuc_or_CaNhan(ID)
)

INSERT INTO CoSo (TenCoSo, DiaChi, NgayCapGiayPhep, LoaiCoSoID, DonViHanhChinhID, ToChuc_or_CaNhanID) VALUES
(N'Trang trại Liên Hồng', N'Xã Liên Hồng, Hải Dương', '2024-06-15', 1, 11, 2),
(N'Cơ sở giết mổ Nam Sách', N'Nam Sách, Nam Sách', '2024-07-01', 2, 13, 5),
(N'Nhà máy Minh Tân', N'Minh Tân, Kinh Môn', '2024-08-10', 3, 15, 3),
(N'Trang trại Thanh Hà', N'Thanh Hà, Thanh Hà', '2024-09-05', 1, 14, 4),
(N'Cơ sở xử lý chất thải Sao Đỏ', N'Sao Đỏ, Chí Linh', '2024-10-20', 4, 12, 1),
(N'Chi cục thú y Hải Dương', N'Đường Kim Ngọc, Hải Dương', '2024-05-29', 5, 1, 6),
(N'Đại lý thuốc thú y Minh Phát', N'Thị trấn Minh Tân', '2024-05-29', 6, 25, 7),
(N'Khu tạm giữ gia súc Kinh Môn', N'Huyện Kinh Môn', '2024-05-29', 7, 7, 8);

SELECT c.ID, c.TenCoSo, c.DiaChi, c.NgayCapGiayPhep,
       l.TenLoaiCoSo, d.TenDonVi AS 'Địa bàn',
       t.Ten AS 'Chủ sở hữu', t.Email_or_Phone AS 'Liên hệ',
       DATEDIFF( DAY, c.NgayCapGiayPhep, GETDATE()) AS 'Số ngày cấp'
FROM CoSo c
JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
JOIN DonViHanhChinh d ON c.DonViHanhChinhID = d.ID
JOIN ToChuc_or_CaNhan t ON c.ToChuc_or_CaNhanID = t.ID;

CREATE TABLE BanDoPhanBo
(
ID int primary key identity
,KinhDo float 
,ViDo float 
,CoSoID int foreign key references CoSo(ID)
,VungChanNuoiID int foreign key references VungChanNuoi(ID)
)
INSERT INTO BanDoPhanBo (KinhDo, ViDo, CoSoID, VungChanNuoiID) VALUES
(106.350, 20.937, 1, 1),
(106.400, 20.950, NULL, 2),
(106.380, 20.910, 2, 3),
(106.420, 20.980, 3, 4),
(106.390, 20.945, 4, 5);

SELECT b.ID, 
       CASE 
           WHEN b.CoSoID IS NOT NULL THEN c.TenCoSo 
           ELSE v.TenVungChanNuoi 
       END AS Ten,
       b.KinhDo, b.ViDo,
       CASE 
           WHEN b.CoSoID IS NOT NULL THEN l.TenLoaiCoSo 
           ELSE N'Vùng chăn nuôi' 
       END AS Loai
FROM BanDoPhanBo b
LEFT JOIN CoSo c ON b.CoSoID = c.ID
LEFT JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
LEFT JOIN VungChanNuoi v ON b.VungChanNuoiID = v.ID;

CREATE TABLE LichSuTruyCap 
(
ID int primary key identity
,ThoiGianTruyCap datetime2
,MoTaHanhDong nvarchar(50)
,NguoiDungID int foreign key references NguoiDung(ID)
)

insert into LichSuTruyCap (ThoiGianTruyCap, MoTaHanhDong, NguoiDungID) values
('2025-04-20 08:30', N'Đăng nhập hệ thống', 1),
('2025-04-20 09:00', N'Cập nhật dữ liệu cơ sở', 2),
('2025-04-21 10:15', N'Xem báo cáo vùng chăn nuôi', 3),
('2025-04-22 14:20', N'Thêm thông tin hộ chăn nuôi', 4),
('2025-04-23 07:45', N'Đăng xuất hệ thống', 1);

SELECT l.ID, n.UserName,  FORMAT(ThoiGianTruyCap, 'yyyy-MM-dd HH:mm:ss') AS ThoiGianTruyCap, l.MoTaHanhDong
FROM LichSuTruyCap l
JOIN NguoiDung n ON l.NguoiDungID = n.ID
ORDER BY l.ThoiGianTruyCap DESC;

CREATE TABLE ToChucChungNhan
(
ID int primary key identity
,Ten nvarchar(50)
,DiaChi nvarchar(50)
,Email_or_Phone nvarchar(50)
)
INSERT INTO ToChucChungNhan (Ten, DiaChi, Email_or_Phone) VALUES
(N'Cục Chăn nuôi Việt Nam', N'Hà Nội', N'channuoi@vn.gov.vn'),
(N'Trung tâm Kiểm định Hải Dương', N'Hải Dương', N'kiemdinhhd@gmail.com'),
(N'Công ty Chứng nhận VietCert', N'TP.HCM', N'vietcert@gmail.com');

CREATE TABLE SanPhamXuLyChatThai
(
ID int primary key identity
,TenSanPham nvarchar(50)
,LoaiSanPham nvarchar(50)
,NgaySanXuat date
,NgayHetHan date
,CoSoID int foreign key references CoSo(ID)
)
INSERT INTO SanPhamXuLyChatThai (TenSanPham, LoaiSanPham, NgaySanXuat, NgayHetHan, CoSoID) VALUES
(N'Phân bón hữu cơ Liên Hồng', N'Phân bón', '2025-01-10', '2025-04-10', 1),
(N'Chất xử lý nước Nam Sách', N'Hóa chất xử lý', '2025-02-15', '2026-02-15', 2),
(N'Phân vi sinh Minh Tân', N'Phân bón', '2025-03-01', '2026-03-01', 3),
(N'Chất khử mùi Thanh Hà', N'Hóa chất xử lý', '2024-03-20', '2025-03-15', 4),
(N'Phân bón Sao Đỏ', N'Phân bón', '2025-04-01', '2026-04-01', 5);

CREATE TABLE GiayChungNhan 
(
ID int primary key 
,ToChucChungNhanID int foreign key references ToChucChungNhan(ID)
,Ten nvarchar(50)
,ToChuc_or_CaNhanID int foreign key references ToChuc_or_CaNhan(ID)
,NgayCap date
,NgayHetHan date

)
INSERT INTO GiayChungNhan (ID, ToChucChungNhanID, Ten, ToChuc_or_CaNhanID, NgayCap, NgayHetHan) VALUES
(1, 1, N'Chứng nhận an toàn chăn nuôi', 2, '2024-06-20', '2025-06-20'),
(2, 2, N'Chứng nhận cơ sở giết mổ', 5, '2024-07-10', '2025-07-10'),
(3, 3, N'Chứng nhận sản xuất thức ăn', 3, '2024-08-15', '2025-08-15'),
(4, 2, N'Chứng nhận chăn nuôi sạch', 4, '2024-09-10', '2025-09-10'),
(5, 1, N'Chứng nhận xử lý chất thải', 1, '2024-10-25', '2025-10-25');

SELECT v.ID, v.TenVaiTro, 
       COUNT(n.ID) AS 'Số người dùng'
FROM VaiTro v
LEFT JOIN NguoiDung n ON v.ID = n.VaiTroID
GROUP BY v.ID, v.TenVaiTro;

SELECT g.ID, t.Ten AS 'Tổ chức cấp', g.Ten AS 'Tên chứng nhận',
       o.Ten AS 'Đối tượng được cấp', g.NgayCap, g.NgayHetHan
FROM GiayChungNhan g
JOIN ToChucChungNhan t ON g.ToChucChungNhanID = t.ID
JOIN ToChuc_or_CaNhan o ON g.ToChuc_or_CaNhanID = o.ID
WHERE g.NgayHetHan > GETDATE();

SELECT n.ID, n.UserName, n.Email_or_Phone, 
       v.TenVaiTro, d.TenDonVi AS 'Đơn vị',
       n.TrangThai, COUNT(l.ID) AS 'Số lần truy cập'
FROM NguoiDung n
JOIN VaiTro v ON n.VaiTroID = v.ID
JOIN DonViHanhChinh d ON n.DonViHanhChinhID = d.ID
LEFT JOIN LichSuTruyCap l ON n.ID = l.NguoiDungID
GROUP BY n.ID, n.UserName, n.Email_or_Phone, v.TenVaiTro, d.TenDonVi, n.TrangThai;

SELECT c.ID, c.TenCoSo, c.DiaChi, c.NgayCapGiayPhep,
       l.TenLoaiCoSo, t.Ten AS 'Chủ sở hữu', dv.TenDonVi AS 'Địa bàn'
FROM CoSo c
JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
JOIN ToChuc_or_CaNhan t ON c.ToChuc_or_CaNhanID = t.ID
JOIN DonViHanhChinh dv ON c.DonViHanhChinhID = dv.ID;

SELECT ID, Ten, DiaChi, Email_or_Phone,
       CASE 
           WHEN ID IN (SELECT ToChuc_or_CaNhanID FROM CoSo) THEN N'Có cơ sở'
           ELSE N'Chưa có cơ sở'
       END AS TinhTrang
FROM ToChuc_or_CaNhan;

SELECT s.ID, s.TenSanPham, s.LoaiSanPham, 
       s.NgaySanXuat, s.NgayHetHan,
       c.TenCoSo, l.TenLoaiCoSo
FROM SanPhamXuLyChatThai s
JOIN CoSo c ON s.CoSoID = c.ID
JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
WHERE s.NgayHetHan > GETDATE();

SELECT t.ID, t.Ten, t.DiaChi, t.Email_or_Phone,
       COUNT(g.ID) AS 'Số chứng nhận đã cấp'
FROM ToChucChungNhan t
LEFT JOIN GiayChungNhan g ON t.ID = g.ToChucChungNhanID
GROUP BY t.ID, t.Ten, t.DiaChi, t.Email_or_Phone;