use master
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
-- Lấy danh sách các cấp hành chính
SELECT ID, TenCapDo, CapDo
FROM CapDoHanhChinh 
ORDER BY CapDo;
--Bảng quản lý đơn vị hành chính
create table DonViHanhChinh
(
	ID int primary key identity
	,TenDonVi nvarchar(255) 
	,CapDoHanhChinhID int foreign key references CapDoHanhChinh(ID)-- Liên kết cấp độ hành chính
	,TrucThuocID int foreign key references DonViHanhChinh(ID) 
)

insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
    (N'Tỉnh Vĩnh Phúc',1,null)

-- Các huyện/thành phố của tỉnh 
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
 (N'Thành phố Vĩnh Yên', 2, 1),
    ( N'Thành phố Phúc Yên', 2, 1),
    ( N'Huyện Lập Thạch', 3, 1),
    ( N'Huyện Tam Dương', 3, 1),
    ( N'Huyện Tam Đảo', 3, 1),
    ( N'Huyện Bình Xuyên', 3, 1),
    ( N'Huyện Yên Lạc', 3, 1),
    ( N'Huyện Vĩnh Tường', 3, 1),
    ( N'Huyện Sông Lô', 3, 1)

	-- Các đơn vị hành chính cấp xã/phường thuộc thành phố Vĩnh Yên
	insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
	 (N'Phường Tích Sơn', 4, 2),
    (N'Phường Liên Bảo', 4, 2),
    (N'Phường Hội Hợp', 4, 2),
    (N'Phường Đống Đa', 4, 2),
    (N'Phường Ngô Quyền', 4, 2),
    (N'Phường Đồng Tâm', 4, 2),
    (N'Phường Định Trung', 4, 2),
    (N'Phường Khai Quang', 4, 2),
    (N'Xã Thanh Trù', 5, 2);

	-- Insert các phường/xã thuộc thành phố Phúc Yên
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
    (N'Phường Hùng Vương', 4, 3),
    (N'Phường Hai Bà Trưng', 4, 3),
    (N'Phường Phúc Thắng', 4, 3),
    (N'Phường Xuân Hoà', 4, 3),
    (N'Phường Đồng Xuân', 4, 3),
    (N'Xã Ngọc Thanh', 5, 3),
    (N'Xã Cao Minh', 5, 3),
    (N'Phường Nam Viêm', 4, 3),
    (N'Phường Tiền Châu', 4, 3);

	-- Insert các xã/thị trấn thuộc huyện Lập Thạch
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
   (N'Thị trấn Lập Thạch', 6, 4),
    (N'Xã Quang Sơn', 5, 4),
    (N'Xã Ngọc Mỹ', 5, 4),
    (N'Xã Hợp Lý', 5, 4),
    (N'Xã Bắc Bình', 5, 4),
    (N'Xã Thái Hòa', 5, 4),
    (N'Thị trấn Hoa Sơn', 6, 4),
    (N'Xã Liễn Sơn', 5, 4),
    (N'Xã Xuân Hòa', 5, 4),
    (N'Xã Vân Trục', 5, 4),
    (N'Xã Liên Hòa', 5, 4),
    (N'Xã Tử Du', 5, 4),
    (N'Xã Bàn Giản', 5, 4),
    (N'Xã Xuân Lôi', 5, 4),
    (N'Xã Đồng Ích', 5, 4),
    (N'Xã Tiên Lữ', 5, 4),
    (N'Xã Văn Quán', 5, 4),
    (N'Xã Tây Sơn', 5, 4),
    (N'Xã Sơn Đông', 5, 4);

	-- Insert các xã/thị trấn thuộc huyện Tam Dương
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
    ( N'Thị trấn Hợp Hòa', 6, 5),
    ( N'Xã Hoàng Hoa', 5, 5),
    ( N'Xã Đồng Tĩnh', 5, 5),
    ( N'Thị trấn Kim Long', 6, 5),
    ( N'Xã Hướng Đạo', 5, 5),
    ( N'Xã Đạo Tú', 5, 5),
    ( N'Xã An Hòa', 5, 5),
    ( N'Xã Thanh Vân', 5, 5),
    ( N'Xã Duy Phiên', 5, 5),
    ( N'Xã Hoàng Đan', 5, 5),
    ( N'Xã Hoàng Lâu', 5, 5),
    ( N'Xã Hội Thịnh', 5, 5)

	-- Insert các xã/thị trấn thuộc huyện Tam Đảo
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
    (N'Thị trấn Tam Đảo', 6, 6),
    ( N'Thị trấn Hợp Châu', 6, 6),
    ( N'Xã Đạo Trù', 5, 6),
    ( N'Xã Yên Dương', 5, 6),
    ( N'Xã Bồ Lý', 5, 6),
    ( N'Thị trấn Đại Đình', 6, 6),
    ( N'Xã Tam Quan', 5, 6),
    (N'Xã Hồ Sơn', 5, 6),
    ( N'Xã Minh Quang', 5, 6)

	-- Insert các xã/thị trấn thuộc huyện Bình Xuyên
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
       (N'Thị trấn Hương Canh', 6, 7),
    (N'Thị trấn Gia Khánh', 6, 7),
    (N'Xã Trung Mỹ', 5, 7),
    (N'Thị trấn Bá Hiến', 6, 7),
    (N'Xã Thiện Kế', 5, 7),
    (N'Xã Hương Sơn', 5, 7),
    (N'Xã Tam Hợp', 5, 7),
    (N'Xã Quất Lưu', 5, 7),
    (N'Xã Sơn Lôi', 5, 7),
    (N'Thị trấn Đạo Đức', 6, 7),
    (N'Xã Tân Phong', 5, 7),
    (N'Thị trấn Thanh Lãng', 6, 7),
    (N'Xã Phú Xuân', 5, 7)

	-- Insert các xã/thị trấn thuộc huyện Yên Lạc
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
        (N'Thị trấn Yên Lạc', 6, 8),
    (N'Xã Đồng Cương', 5, 8),
    (N'Xã Đồng Văn', 5, 8),
    (N'Xã Bình Định', 5, 8),
    (N'Xã Trung Nguyên', 5, 8),
    (N'Xã Tề Lỗ', 5, 8),
    (N'Thị trấn Tam Hồng', 6, 8),
    (N'Xã Yên Đồng', 5, 8),
    (N'Xã Văn Tiến', 5, 8),
    (N'Xã Nguyệt Đức', 5, 8),
    (N'Xã Yên Phương', 5, 8),
    (N'Xã Trung Kiên', 5, 8),
    (N'Xã Liên Châu', 5, 8),
    (N'Xã Đại Tự', 5, 8),
    (N'Xã Hồng Châu', 5, 8),
    (N'Xã Trung Hà', 5, 8)

	-- Insert các xã/thị trấn thuộc huyện Vĩnh Tường
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
     (N'Thị trấn Vĩnh Tường', 6, 9),
    (N'Xã Kim Xá', 5, 9),
    (N'Xã Yên Bình', 5, 9),
    (N'Xã Chấn Hưng', 5, 9),
    (N'Xã Nghĩa Hưng', 5, 9),
    (N'Xã Yên Lập', 5, 9),
    (N'Xã Sao Đại Việt', 5, 9),
    (N'Xã Đại Đồng', 5, 9),
    (N'Xã Lũng Hoà', 5, 9),
    (N'Thị trấn Thổ Tang', 6, 9),
    (N'Xã Lương Điền', 5, 9),
    (N'Xã Tân Phú', 5, 9),
    (N'Xã Thượng Trưng', 5, 9),
    (N'Xã Vũ Di', 5, 9),
    (N'Xã Tuân Chính', 5, 9),
    (N'Thị trấn Tứ Trưng', 6, 9),
    (N'Xã Ngũ Kiên', 5, 9),
    (N'Xã An Nhân', 5, 9),
    (N'Xã Vĩnh Thịnh', 5, 9),
    (N'Xã Vĩnh Phú', 5, 9);

	-- Insert các xã/thị trấn thuộc huyện Sông Lô
insert into DonViHanhChinh(TenDonVi,CapDoHanhChinhID,TrucThuocID) values
    (N'Xã Lãng Công', 5, 10),
    (N'Xã Quang Yên', 5, 10),
    (N'Xã Hải Lựu', 5, 10),
    (N'Xã Đồng Quế', 5, 10),
    (N'Xã Nhân Đạo', 5, 10),
    (N'Xã Đôn Nhân', 5, 10),
    (N'Xã Phương Khoan', 5, 10),
    (N'Xã Tân Lập', 5, 10),
    (N'Thị trấn Tam Sơn', 6, 10),
    (N'Xã Yên Thạch', 5, 10),
    (N'Xã Đồng Thịnh', 5, 10),
    (N'Xã Tứ Yên', 5, 10),
    (N'Xã Đức Bác', 5, 10),
    (N'Xã Cao Phong', 5, 10)

-- Danh sách đơn vị hành chính
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
    (N'Vùng chăn nuôi Thanh Trù', N'Nuôi lợn tập trung', 
     (select ID from DonViHanhChinh where TenDonVi = N'Xã Thanh Trù')),
    
    (N'Vùng chăn nuôi Ngọc Thanh', N'Nuôi gà thả vườn', 
(select ID from DonViHanhChinh where TenDonVi = N'Xã Ngọc Thanh')),
    
    (N'Vùng chăn nuôi Hợp Lý', N'Nuôi đa dạng các loại gia súc', 
     (select ID from DonViHanhChinh where TenDonVi = N'Xã Hợp Lý')),
    
    (N'Vùng chăn nuôi Minh Quang', N'Nuôi theo hướng hữu cơ', 
     (select ID from DonViHanhChinh where TenDonVi = N'Xã Minh Quang')),
    
    (N'Vùng chăn nuôi Sơn Lôi', N'Vùng an toàn dịch bệnh', 
     (select ID from DonViHanhChinh where TenDonVi = N'Xã Sơn Lôi'));


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
,KetQua nvarchar(50)
,NgayThongKe date

)
insert into HoChanNuoi (VungChanNuoiID, SoHo, KetQua, NgayThongKe) values
(1, 50, N'Đạt tiêu chuẩn', '2025-01-15'),
(2, 30, N'Đạt tiêu chuẩn', '2025-02-10'),
(3, 40, N'Cần cải thiện', '2025-03-05'),
(4, 25, N'Đạt tiêu chuẩn', '2025-03-20'),
(5, 35, N'Đạt tiêu chuẩn', '2025-04-01');

-- Thống kê hộ chăn nuôi theo vùng
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
-- Điều kiện các hộ chăn nuôi
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
(N'Cơ sở xử lý chất thải');


CREATE TABLE ToChuc_or_CaNhan
(
ID int primary key identity
,Ten nvarchar (50)
,DiaChi nvarchar(50)
,Email_or_Phone nvarchar(50)
)

INSERT INTO ToChuc_or_CaNhan (Ten, DiaChi, Email_or_Phone) VALUES
(N'Công ty TNHH Chăn nuôi Vĩnh Phúc', N'123 Đường Láng, Vĩnh Yên', N'vinhphucfarm@gmail.com'),
(N'Hộ ông Nguyễn Văn An', N'Thôn 2, Xã Thanh Trù', N'0912345678'),
(N'Công ty CP Thức ăn chăn nuôi Minh Quang', N'xã Minh Quang, huyện Tam Đảo', N'minhquangfeed@gmail.com'),
(N'Hộ bà Trần Thị Bích', N'Xã Sơn Lôi, huyện Bình Xuyên', N'0923456789'),
(N'Cơ sở giết mổ Hợp Lý', N'Hợp Lý,huyện Lập Thạch', N'0934567890');

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
(N'Trang trại Thanh Trù', N'Xã Thanh Trù, Vĩnh Yên', '2024-06-15', 1, 11, 2),
(N'Cơ sở giết mổ Hợp Lý', N'Hợp Lý, Lập Thạch', '2024-07-01', 2, 13, 5),
(N'Nhà máy Minh Quang', N'Minh Quang, Tam Đảo', '2024-08-10', 3, 15, 3),
(N'Trang trại Sơn Lôi', N'Sơn Lôi, Bình Xuyên', '2024-09-05', 1, 14, 4),
(N'Cơ sở xử lý chất thải Ngọc Thanh', N'Ngọc Thanh, Phúc Yên', '2024-10-20', 4, 12, 1);

-- Chi tiết cơ sở với đầy đủ thông tin
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
(105.592, 21.308, 1, 1),
(105.620, 21.295, NULL, 2),
(105.580, 21.350, 2, 3),
(105.630, 21.280, 3, 4),
(105.600, 21.320, 4, 5);
-- Vị trí các cơ sở/vùng chăn nuôi trên bản đồ
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

-- Lịch sử hoạt động của người dùng
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
(N'Trung tâm Kiểm định Vĩnh Phúc', N'Vĩnh Yên', N'kiemdinhvp@gmail.com'),
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
(N'Phân bón hữu cơ Thanh Trù', N'Phân bón', '2025-01-10', '2026-01-10', 1),
(N'Chất xử lý nước Hợp Lý', N'Hóa chất xử lý', '2025-02-15', '2026-02-15', 2),
(N'Phân vi sinh Minh Quang', N'Phân bón', '2025-03-01', '2026-03-01', 3),
(N'Chất khử mùi Sơn Lôi', N'Hóa chất xử lý', '2025-03-20', '2026-03-20', 4),
(N'Phân bón Ngọc Thanh', N'Phân bón', '2025-04-01', '2026-04-01', 5);

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

-- Chi tiết phân quyền
SELECT v.ID, v.TenVaiTro, 
       COUNT(n.ID) AS 'Số người dùng'
FROM VaiTro v
LEFT JOIN NguoiDung n ON v.ID = n.VaiTroID
GROUP BY v.ID, v.TenVaiTro;
-- Danh sách giấy chứng nhận còn hiệu lực

SELECT g.ID, t.Ten AS 'Tổ chức cấp', g.Ten AS 'Tên chứng nhận',
       o.Ten AS 'Đối tượng được cấp', g.NgayCap, g.NgayHetHan
FROM GiayChungNhan g
JOIN ToChucChungNhan t ON g.ToChucChungNhanID = t.ID
JOIN ToChuc_or_CaNhan o ON g.ToChuc_or_CaNhanID = o.ID
WHERE g.NgayHetHan > GETDATE(); -- Chỉ lấy chứng nhận còn hiệu lực

SELECT n.ID, n.UserName, n.Email_or_Phone, 
       v.TenVaiTro, d.TenDonVi AS 'Đơn vị',
       n.TrangThai, COUNT(l.ID) AS 'Số lần truy cập'
FROM NguoiDung n
JOIN VaiTro v ON n.VaiTroID = v.ID
JOIN DonViHanhChinh d ON n.DonViHanhChinhID = d.ID
LEFT JOIN LichSuTruyCap l ON n.ID = l.NguoiDungID
GROUP BY n.ID, n.UserName, n.Email_or_Phone, v.TenVaiTro, d.TenDonVi, n.TrangThai;

-- Thông tin các cơ sở chăn nuôi
SELECT c.ID, c.TenCoSo, c.DiaChi, c.NgayCapGiayPhep,
       l.TenLoaiCoSo, t.Ten AS 'Chủ sở hữu', dv.TenDonVi AS 'Địa bàn'
FROM CoSo c
JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
JOIN ToChuc_or_CaNhan t ON c.ToChuc_or_CaNhanID = t.ID
JOIN DonViHanhChinh dv ON c.DonViHanhChinhID = dv.ID;

-- Danh sách tổ chức/cá nhân
SELECT ID, Ten, DiaChi, Email_or_Phone,
       CASE 
           WHEN ID IN (SELECT ToChuc_or_CaNhanID FROM CoSo) THEN N'Có cơ sở'
           ELSE N'Chưa có cơ sở'
       END AS TinhTrang
FROM ToChuc_or_CaNhan;

-- Các sản phẩm xử lý chất thải
SELECT s.ID, s.TenSanPham, s.LoaiSanPham, 
       s.NgaySanXuat, s.NgayHetHan,
       c.TenCoSo, l.TenLoaiCoSo
FROM SanPhamXuLyChatThai s
JOIN CoSo c ON s.CoSoID = c.ID
JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
WHERE s.NgayHetHan > GETDATE(); -- Chỉ lấy sản phẩm còn hạn


-- Danh sách tổ chức chứng nhận
SELECT t.ID, t.Ten, t.DiaChi, t.Email_or_Phone,
       COUNT(g.ID) AS 'Số chứng nhận đã cấp'
FROM ToChucChungNhan t
LEFT JOIN GiayChungNhan g ON t.ID = g.ToChucChungNhanID
GROUP BY t.ID, t.Ten, t.DiaChi, t.Email_or_Phone;