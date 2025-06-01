USE QuanLyChanNuoi
GO

-- Thay thế DROP PROC IF EXISTS cho SQL Server 2012 trở xuống
IF OBJECT_ID('sp_CapDoHanhChinh_CRUD', 'P') IS NOT NULL
    DROP PROCEDURE sp_CapDoHanhChinh_CRUD
GO

CREATE PROCEDURE sp_CapDoHanhChinh_CRUD
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

IF OBJECT_ID('sp_DonViHanhChinh_CRUD', 'P') IS NOT NULL
    DROP PROCEDURE sp_DonViHanhChinh_CRUD
GO

CREATE PROCEDURE sp_DonViHanhChinh_CRUD
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
            RAISERROR(N'Không thể xóa đơn vị hành chính này', 16, 1)
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

IF OBJECT_ID('sp_NguoiDung_CRUD', 'P') IS NOT NULL
    DROP PROCEDURE sp_NguoiDung_CRUD
GO

CREATE PROCEDURE sp_NguoiDung_CRUD
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

IF OBJECT_ID('sp_ChangePassword', 'P') IS NOT NULL
    DROP PROCEDURE sp_ChangePassword
GO

CREATE PROCEDURE sp_ChangePassword
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
        RAISERROR(N'Không tìm thấy người dùng', 16, 1)
    END
END
GO

IF OBJECT_ID('sp_VungChanNuoi_CRUD', 'P') IS NOT NULL
    DROP PROCEDURE sp_VungChanNuoi_CRUD
GO

CREATE PROCEDURE sp_VungChanNuoi_CRUD
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

IF OBJECT_ID('sp_CoSo_CRUD', 'P') IS NOT NULL
    DROP PROCEDURE sp_CoSo_CRUD
GO

CREATE PROCEDURE sp_CoSo_CRUD
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