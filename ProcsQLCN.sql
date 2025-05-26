USE QuanLyChanNuoi
GO

DROP PROC IF EXISTS sp_CapDoHanhChinh_CRUD
GO

CREATE PROC sp_CapDoHanhChinh_CRUD
(
    @action INT,
    @ID INT OUTPUT,
    @TenCapDo NVARCHAR(50) = NULL,
    @CapDo INT = NULL
)
AS
BEGIN
    IF @action = -1 -- DELETE
    BEGIN
        DELETE FROM CapDoHanhChinh WHERE ID = @ID
        RETURN
    END
    
    IF @action = 0 -- UPDATE
    BEGIN
        UPDATE CapDoHanhChinh SET
            TenCapDo = ISNULL(@TenCapDo, TenCapDo),
            CapDo = ISNULL(@CapDo, CapDo)
        WHERE ID = @ID
        RETURN
    END
    
    -- INSERT
    INSERT INTO CapDoHanhChinh (TenCapDo, CapDo)
    VALUES (@TenCapDo, @CapDo)
    
    SET @ID = SCOPE_IDENTITY()
END
GO

DROP PROC IF EXISTS sp_DonViHanhChinh_CRUD
GO

CREATE PROC sp_DonViHanhChinh_CRUD
(
    @action INT,
    @ID INT OUTPUT,
    @TenDonVi NVARCHAR(255) = NULL,
    @CapDoHanhChinhID INT = NULL,
    @TrucThuocID INT = NULL
)
AS
BEGIN
    IF @action = -1 -- DELETE
    BEGIN
        -- Kiểm tra xem đơn vị này có được tham chiếu bởi các bảng khác trước khi xóa không
        IF NOT EXISTS (SELECT 1 FROM VungChanNuoi WHERE DonViHanhChinhID = @ID)
        AND NOT EXISTS (SELECT 1 FROM CoSo WHERE DonViHanhChinhID = @ID)
        AND NOT EXISTS (SELECT 1 FROM NguoiDung WHERE DonViHanhChinhID = @ID)
        AND NOT EXISTS (SELECT 1 FROM DonViHanhChinh WHERE TrucThuocID = @ID)
        BEGIN
            DELETE FROM DonViHanhChinh WHERE ID = @ID
        END
        ELSE
        BEGIN
            RAISERROR('Không thể xóa đơn vị hành chính này', 16, 1)
        END
        RETURN
    END
    
    IF @action = 0 -- UPDATE
    BEGIN
        UPDATE DonViHanhChinh SET
            TenDonVi = ISNULL(@TenDonVi, TenDonVi),
            CapDoHanhChinhID = ISNULL(@CapDoHanhChinhID, CapDoHanhChinhID),
            TrucThuocID = @TrucThuocID -- Allowing NULL for top-level units
        WHERE ID = @ID
        RETURN
    END
    
    -- INSERT
    INSERT INTO DonViHanhChinh (TenDonVi, CapDoHanhChinhID, TrucThuocID)
    VALUES (@TenDonVi, @CapDoHanhChinhID, @TrucThuocID)
    
    SET @ID = SCOPE_IDENTITY()
END
GO

DROP PROC IF EXISTS sp_NguoiDung_CRUD
GO

CREATE PROC sp_NguoiDung_CRUD
(
    @action INT,
    @ID INT OUTPUT,
    @UserName NVARCHAR(50) = NULL,
    @Email_or_Phone NVARCHAR(50) = NULL,
    @Password NVARCHAR(50) = NULL,
    @TrangThai NVARCHAR(50) = NULL,
    @VaiTroID INT = NULL,
    @DonViHanhChinhID INT = NULL
)
AS
BEGIN
    IF @action = -1 -- DELETE
    BEGIN
        -- Đầu tiên xóa lịch sử truy cập
        DELETE FROM LichSuTruyCap WHERE NguoiDungID = @ID
       -- Sau đó xóa người dùng
        DELETE FROM NguoiDung WHERE ID = @ID
        RETURN
    END
    
    IF @action = 0 -- UPDATE
    BEGIN
        UPDATE NguoiDung SET
            UserName = ISNULL(@UserName, UserName),
            Email_or_Phone = ISNULL(@Email_or_Phone, Email_or_Phone),
            TrangThai = ISNULL(@TrangThai, TrangThai),
            VaiTroID = ISNULL(@VaiTroID, VaiTroID),
            DonViHanhChinhID = ISNULL(@DonViHanhChinhID, DonViHanhChinhID)
        WHERE ID = @ID
        
        -- Update password if provided
        IF @Password IS NOT NULL
        BEGIN
            UPDATE NguoiDung SET Password = @Password WHERE ID = @ID
        END
        RETURN
    END
    
    -- INSERT
    INSERT INTO NguoiDung (UserName, Email_or_Phone, Password, TrangThai, VaiTroID, DonViHanhChinhID)
    VALUES (@UserName, @Email_or_Phone, @Password, @TrangThai, @VaiTroID, @DonViHanhChinhID)
    
    SET @ID = SCOPE_IDENTITY()
END
GO


DROP PROC IF EXISTS sp_ChangePassword
GO

CREATE PROC sp_ChangePassword
(
    @UserName NVARCHAR(50),
    @NewPassword NVARCHAR(50)
)
AS
BEGIN
    UPDATE NguoiDung 
    SET Password = @NewPassword
    WHERE UserName = @UserName
    
    IF @@ROWCOUNT = 0
    BEGIN
        RAISERROR('Không tìm thấy người dùng', 16, 1)
    END
END
GO
DROP PROC IF EXISTS sp_VungChanNuoi_CRUD
GO

CREATE PROC sp_VungChanNuoi_CRUD
(
    @action INT,
    @ID INT OUTPUT,
    @TenVungChanNuoi NVARCHAR(50) = NULL,
    @MoTa NVARCHAR(250) = NULL,
    @DonViHanhChinhID INT = NULL
)
AS
BEGIN
    IF @action = -1 -- DELETE
    BEGIN
      -- Đầu tiên xóa hộ gia đình có liên quan
        DELETE FROM HoChanNuoi WHERE VungChanNuoiID = @ID
       -- Sau đó xóa vùng chăn nuôi 
        DELETE FROM VungChanNuoi WHERE ID = @ID
        RETURN
    END
    
    IF @action = 0 -- UPDATE
    BEGIN
        UPDATE VungChanNuoi SET
            TenVungChanNuoi = ISNULL(@TenVungChanNuoi, TenVungChanNuoi),
            MoTa = ISNULL(@MoTa, MoTa),
            DonViHanhChinhID = ISNULL(@DonViHanhChinhID, DonViHanhChinhID)
        WHERE ID = @ID
        RETURN
    END
    
    -- INSERT
    INSERT INTO VungChanNuoi (TenVungChanNuoi, MoTa, DonViHanhChinhID)
    VALUES (@TenVungChanNuoi, @MoTa, @DonViHanhChinhID)
    
    SET @ID = SCOPE_IDENTITY()
END
GO

DROP PROC IF EXISTS sp_CoSo_CRUD
GO

CREATE PROC sp_CoSo_CRUD
(
    @action INT,
    @ID INT OUTPUT,
    @TenCoSo NVARCHAR(50) = NULL,
    @DiaChi NVARCHAR(50) = NULL,
    @NgayCapGiayPhep DATE = NULL,
    @LoaiCoSoID INT = NULL,
    @DonViHanhChinhID INT = NULL,
    @ToChuc_or_CaNhanID INT = NULL
)
AS
BEGIN
    IF @action = -1 -- DELETE
    BEGIN
        
        DELETE FROM BanDoPhanBo WHERE CoSoID = @ID
        DELETE FROM SanPhamXuLyChatThai WHERE CoSoID = @ID
        
        DELETE FROM CoSo WHERE ID = @ID
        RETURN
    END
    
    IF @action = 0 -- UPDATE
    BEGIN
        UPDATE CoSo SET
            TenCoSo = ISNULL(@TenCoSo, TenCoSo),
            DiaChi = ISNULL(@DiaChi, DiaChi),
            NgayCapGiayPhep = ISNULL(@NgayCapGiayPhep, NgayCapGiayPhep),
            LoaiCoSoID = ISNULL(@LoaiCoSoID, LoaiCoSoID),
            DonViHanhChinhID = ISNULL(@DonViHanhChinhID, DonViHanhChinhID),
            ToChuc_or_CaNhanID = ISNULL(@ToChuc_or_CaNhanID, ToChuc_or_CaNhanID)
        WHERE ID = @ID
        RETURN
    END
    
    -- INSERT
    INSERT INTO CoSo (TenCoSo, DiaChi, NgayCapGiayPhep, LoaiCoSoID, DonViHanhChinhID, ToChuc_or_CaNhanID)
    VALUES (@TenCoSo, @DiaChi, @NgayCapGiayPhep, @LoaiCoSoID, @DonViHanhChinhID, @ToChuc_or_CaNhanID)
    
    SET @ID = SCOPE_IDENTITY()
END
GO

USE QuanLyChanNuoi
GO

DROP PROC IF EXISTS sp_HoChanNuoi_CRUD
GO

CREATE PROC sp_HoChanNuoi_CRUD
(
    @action INT,
    @ID INT OUTPUT,
    @VungChanNuoiID INT = NULL,
    @SoHo INT = NULL,
    @KetQua NVARCHAR(50) = NULL,
    @NgayThongKe DATE = NULL
)
AS
BEGIN
    IF @action = -1 -- DELETE
    BEGIN
        -- Đầu tiên xóa các điều kiện liên quan
        DELETE FROM DieuKienChanNuoi WHERE HoChanNuoiID = @ID
        -- Sau đó xóa hộ chăn nuôi
        DELETE FROM HoChanNuoi WHERE ID = @ID
        RETURN
    END
    
    IF @action = 0 -- UPDATE
    BEGIN
        UPDATE HoChanNuoi SET
            VungChanNuoiID = ISNULL(@VungChanNuoiID, VungChanNuoiID),
            SoHo = ISNULL(@SoHo, SoHo),
            KetQua = ISNULL(@KetQua, KetQua),
            NgayThongKe = ISNULL(@NgayThongKe, NgayThongKe)
        WHERE ID = @ID
        RETURN
    END
    
   
    INSERT INTO HoChanNuoi (VungChanNuoiID, SoHo, KetQua, NgayThongKe)
    VALUES (
        @VungChanNuoiID, 
        @SoHo, 
        @KetQua, 
        ISNULL(@NgayThongKe, GETDATE())
    )
    
    SET @ID = SCOPE_IDENTITY()
END
GO

DROP PROC IF EXISTS sp_DieuKienChanNuoi_CRUD
GO

CREATE PROC sp_DieuKienChanNuoi_CRUD
(
    @action INT,
    @ID INT OUTPUT,
    @HoChanNuoiID INT = NULL,
    @MoTa NVARCHAR(250) = NULL,
    @NgayCapNhat DATE = NULL
)
AS
BEGIN
    IF @action = -1 -- DELETE
    BEGIN
        DELETE FROM DieuKienChanNuoi WHERE ID = @ID
        RETURN
    END
    
    IF @action = 0 -- UPDATE
    BEGIN
        UPDATE DieuKienChanNuoi SET
            HoChanNuoiID = ISNULL(@HoChanNuoiID, HoChanNuoiID),
            MoTa = ISNULL(@MoTa, MoTa),
            NgayCapNhat = ISNULL(@NgayCapNhat, NgayCapNhat)
        WHERE ID = @ID
        RETURN
    END
    
  
    INSERT INTO DieuKienChanNuoi (HoChanNuoiID, MoTa, NgayCapNhat)
    VALUES (
        @HoChanNuoiID, 
        @MoTa, 
        ISNULL(@NgayCapNhat, GETDATE())
    )
    
    SET @ID = SCOPE_IDENTITY()
END
GO

DROP PROC IF EXISTS sp_ToChucCaNhan_CRUD
GO

CREATE PROC sp_ToChucCaNhan_CRUD
(
    @action INT,
    @ID INT OUTPUT,
    @Ten NVARCHAR(50) = NULL,
    @DiaChi NVARCHAR(50) = NULL,
    @Email_or_Phone NVARCHAR(50) = NULL
)
AS
BEGIN
    IF @action = -1 -- DELETE
    BEGIN
       -- Kiểm tra xem tổ chức/cá nhân này có sở hữu bất kỳ cơ sở nào không
        IF NOT EXISTS (SELECT 1 FROM CoSo WHERE ToChuc_or_CaNhanID = @ID)
        AND NOT EXISTS (SELECT 1 FROM GiayChungNhan WHERE ToChuc_or_CaNhanID = @ID)
        BEGIN
            DELETE FROM ToChuc_or_CaNhan WHERE ID = @ID
        END
        ELSE
        BEGIN
            RAISERROR('Không thể xóa tổ chức/cá nhân này vì họ sở hữu cơ sở hoặc có chứng chỉ', 16, 1)
        END
        RETURN
    END
    
    IF @action = 0 -- UPDATE
    BEGIN
        UPDATE ToChuc_or_CaNhan SET
            Ten = ISNULL(@Ten, Ten),
            DiaChi = ISNULL(@DiaChi, DiaChi),
            Email_or_Phone = ISNULL(@Email_or_Phone, Email_or_Phone)
        WHERE ID = @ID
        RETURN
    END
    
    -- INSERT
    INSERT INTO ToChuc_or_CaNhan (Ten, DiaChi, Email_or_Phone)
    VALUES (@Ten, @DiaChi, @Email_or_Phone)
    
    SET @ID = SCOPE_IDENTITY()
END
GO

DROP PROC IF EXISTS sp_GiayChungNhan_CRUD
GO

CREATE PROC sp_GiayChungNhan_CRUD
(
    @action INT,
    @ID INT OUTPUT,
    @ToChucChungNhanID INT = NULL,
    @Ten NVARCHAR(50) = NULL,
    @ToChuc_or_CaNhanID INT = NULL,
    @NgayCap DATE = NULL,
    @NgayHetHan DATE = NULL
)
AS
BEGIN
    IF @action = -1 -- DELETE
    BEGIN
        DELETE FROM GiayChungNhan WHERE ID = @ID
        RETURN
    END
    
    IF @action = 0 -- UPDATE
    BEGIN
        UPDATE GiayChungNhan SET
            ToChucChungNhanID = ISNULL(@ToChucChungNhanID, ToChucChungNhanID),
            Ten = ISNULL(@Ten, Ten),
            ToChuc_or_CaNhanID = ISNULL(@ToChuc_or_CaNhanID, ToChuc_or_CaNhanID),
            NgayCap = ISNULL(@NgayCap, NgayCap),
            NgayHetHan = ISNULL(@NgayHetHan, NgayHetHan)
        WHERE ID = @ID
        RETURN
    END
    
    -- INSERT
    INSERT INTO GiayChungNhan (ToChucChungNhanID, Ten, ToChuc_or_CaNhanID, NgayCap, NgayHetHan)
    VALUES (@ToChucChungNhanID, @Ten, @ToChuc_or_CaNhanID, @NgayCap, @NgayHetHan)
    
    SET @ID = SCOPE_IDENTITY()
END
GO

DROP PROC IF EXISTS sp_BanDoPhanBo_CRUD
GO

CREATE PROC sp_BanDoPhanBo_CRUD
(
    @action INT,
    @ID INT OUTPUT,
    @KinhDo FLOAT = NULL,
    @ViDo FLOAT = NULL,
    @CoSoID INT = NULL,
    @VungChanNuoiID INT = NULL
)
AS
BEGIN
   
    IF (@action = 1) AND ((@CoSoID IS NOT NULL AND @VungChanNuoiID IS NOT NULL) OR 
                         (@CoSoID IS NULL AND @VungChanNuoiID IS NULL))
    BEGIN
        RAISERROR('Cung cấp ID cơ sở hoặc ID vùng chăn nuôi', 16, 1)
        RETURN
    END
    
    IF @action = -1 -- DELETE
    BEGIN
        DELETE FROM BanDoPhanBo WHERE ID = @ID
        RETURN
    END
    
    IF @action = 0 -- UPDATE
    BEGIN
        UPDATE BanDoPhanBo SET
            KinhDo = ISNULL(@KinhDo, KinhDo),
            ViDo = ISNULL(@ViDo, ViDo),
            CoSoID = @CoSoID, -- Can be set to NULL
            VungChanNuoiID = @VungChanNuoiID -- Can be set to NULL
        WHERE ID = @ID
        
        -- Ensure we don't have both IDs set after update
        IF (SELECT COUNT(*) FROM BanDoPhanBo 
            WHERE ID = @ID 
            AND CoSoID IS NOT NULL 
            AND VungChanNuoiID IS NOT NULL) > 0
        BEGIN
            RAISERROR('Không thể thiết lập cả ID cở sở và ID vùng chăn nuôi', 16, 1)
            ROLLBACK
            RETURN
        END
        RETURN
    END
    
    -- INSERT
    INSERT INTO BanDoPhanBo (KinhDo, ViDo, CoSoID, VungChanNuoiID)
    VALUES (@KinhDo, @ViDo, @CoSoID, @VungChanNuoiID)
    
    SET @ID = SCOPE_IDENTITY()
END
GO

DROP PROC IF EXISTS sp_SanPhamXuLyChatThai_CRUD
GO

CREATE PROC sp_SanPhamXuLyChatThai_CRUD
(
    @action INT,
    @ID INT OUTPUT,
    @TenSanPham NVARCHAR(50) = NULL,
    @LoaiSanPham NVARCHAR(50) = NULL,
    @NgaySanXuat DATE = NULL,
    @NgayHetHan DATE = NULL,
    @CoSoID INT = NULL
)
AS
BEGIN
    IF @action = -1 -- DELETE
    BEGIN
        DELETE FROM SanPhamXuLyChatThai WHERE ID = @ID
        RETURN
    END
    
    IF @action = 0 -- UPDATE
    BEGIN
        UPDATE SanPhamXuLyChatThai SET
            TenSanPham = ISNULL(@TenSanPham, TenSanPham),
            LoaiSanPham = ISNULL(@LoaiSanPham, LoaiSanPham),
            NgaySanXuat = ISNULL(@NgaySanXuat, NgaySanXuat),
            NgayHetHan = ISNULL(@NgayHetHan, NgayHetHan),
            CoSoID = ISNULL(@CoSoID, CoSoID)
        WHERE ID = @ID
        RETURN
    END
    
    -- INSERT
    INSERT INTO SanPhamXuLyChatThai (TenSanPham, LoaiSanPham, NgaySanXuat, NgayHetHan, CoSoID)
    VALUES (@TenSanPham, @LoaiSanPham, @NgaySanXuat, @NgayHetHan, @CoSoID)
    
    SET @ID = SCOPE_IDENTITY()
END
GO

DROP PROC IF EXISTS sp_LichSuTruyCap_CRUD
GO

CREATE PROC sp_LichSuTruyCap_CRUD
(
    @action INT,
    @ID INT OUTPUT,
    @ThoiGianTruyCap DATETIME2 = NULL,
    @MoTaHanhDong NVARCHAR(50) = NULL,
    @NguoiDungID INT = NULL
)
AS
BEGIN
    IF @action = -1 -- DELETE
    BEGIN
        DELETE FROM LichSuTruyCap WHERE ID = @ID
        RETURN
    END
    
    IF @action = 0 -- UPDATE
    BEGIN
        UPDATE LichSuTruyCap SET
            ThoiGianTruyCap = ISNULL(@ThoiGianTruyCap, ThoiGianTruyCap),
            MoTaHanhDong = ISNULL(@MoTaHanhDong, MoTaHanhDong),
            NguoiDungID = ISNULL(@NguoiDungID, NguoiDungID)
        WHERE ID = @ID
        RETURN
    END
    
    INSERT INTO LichSuTruyCap (ThoiGianTruyCap, MoTaHanhDong, NguoiDungID)
    VALUES (
        ISNULL(@ThoiGianTruyCap, GETDATE()),
        @MoTaHanhDong,
        @NguoiDungID
    )
    
    SET @ID = SCOPE_IDENTITY()
END
GO

DROP PROC IF EXISTS sp_ToChucChungNhan_CRUD
GO

CREATE PROC sp_ToChucChungNhan_CRUD
(
    @action INT,
    @ID INT OUTPUT,
    @Ten NVARCHAR(50) = NULL,
    @DiaChi NVARCHAR(50) = NULL,
    @Email_or_Phone NVARCHAR(50) = NULL
)
AS
BEGIN
    IF @action = -1 -- DELETE
    BEGIN
       -- Kiểm tra xem cơ quan chứng nhận này có cấp bất kỳ chứng chỉ nào không
        IF NOT EXISTS (SELECT 1 FROM GiayChungNhan WHERE ToChucChungNhanID = @ID)
        BEGIN
            DELETE FROM ToChucChungNhan WHERE ID = @ID
        END
        ELSE
        BEGIN
            RAISERROR('Không thể xóa tổ chức chứng nhận này vì nó đã cấp chứng chỉ', 16, 1)
        END
        RETURN
    END
    
    IF @action = 0 -- UPDATE
    BEGIN
        UPDATE ToChucChungNhan SET
            Ten = ISNULL(@Ten, Ten),
            DiaChi = ISNULL(@DiaChi, DiaChi),
            Email_or_Phone = ISNULL(@Email_or_Phone, Email_or_Phone)
        WHERE ID = @ID
        RETURN
    END
    
    -- INSERT
    INSERT INTO ToChucChungNhan (Ten, DiaChi, Email_or_Phone)
    VALUES (@Ten, @DiaChi, @Email_or_Phone)
    
    SET @ID = SCOPE_IDENTITY()
END
GO

DROP PROC IF EXISTS sp_VaiTro_CRUD
GO

CREATE PROC sp_VaiTro_CRUD
(
    @action INT,
    @ID INT OUTPUT,
    @TenVaiTro NVARCHAR(50) = NULL
)
AS
BEGIN
    IF @action = -1 -- DELETE
    BEGIN
        -- Kiểm tra xem có người dùng nào có vai trò này không
        IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE VaiTroID = @ID)
        BEGIN
            DELETE FROM VaiTro WHERE ID = @ID
        END
        ELSE
        BEGIN
            RAISERROR('Không thể xóa vai trò này vì nó được chỉ định cho người dùng', 16, 1)
        END
        RETURN
    END
    
    IF @action = 0 -- UPDATE
    BEGIN
        UPDATE VaiTro SET
            TenVaiTro = ISNULL(@TenVaiTro, TenVaiTro)
        WHERE ID = @ID
        RETURN
    END
    
    -- INSERT
    INSERT INTO VaiTro (TenVaiTro)
    VALUES (@TenVaiTro)
    
    SET @ID = SCOPE_IDENTITY()
END
GO

