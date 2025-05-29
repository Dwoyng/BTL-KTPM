using System;

namespace Models
{
    public partial class BanDoPhanBo
    {
        public int? ID { get; set; }
        public double? KinhDo { get; set; }
        public double? ViDo { get; set; }
        public int? CoSoID { get; set; }
        public int? VungChanNuoiID { get; set; }
    }
}
namespace Models
{
    public partial class CapDoHanhChinh
    {
        public int? ID { get; set; }
        public string TenCapDo { get; set; }
        public int? CapDo { get; set; }
    }
}
namespace Models
{
    public partial class CoSo
    {
        public int? ID { get; set; }
        public string TenCoSo { get; set; }
        public string DiaChi { get; set; }
        public DateTime? NgayCapGiayPhep { get; set; }
        public int? LoaiCoSoID { get; set; }
        public int? DonViHanhChinhID { get; set; }
        public int? ToChuc_or_CaNhanID { get; set; }
        //public bool Loai { get; set; }
    }
    public partial class MoHinhChanNuoi
    {
        public string MoHinh { get; set; }
        public int? SoLuong { get; set; }
    }
    public partial class CoSoGietMo
    {
        public int? ID { get; set; }
        public string TenCoSo { get; set; }
        public string DiaChi { get; set; }
        public DateTime? NgayCapGiayPhep { get; set; }
        public int? LoaiCoSoID { get; set; }
        public int? DonViHanhChinhID { get; set; }
        public int? ToChuc_or_CaNhanID { get; set; }
        public bool? Loai { get; set; }
    }
    public partial class ChiCucThuY
    {
        public int? ID { get; set; }
        public string TenCoSo { get; set; }
        public string DiaChi { get; set; }
        public DateTime? NgayCapGiayPhep { get; set; }
        public int? LoaiCoSoID { get; set; }
        public int? DonViHanhChinhID { get; set; }
        public int? ToChuc_or_CaNhanID { get; set; }
        public bool? Loai { get; set; }
    }
    public partial class DaiLyBanThuoc
    {
        public int? ID { get; set; }
        public string TenCoSo { get; set; }
        public string DiaChi { get; set; }
        public DateTime? NgayCapGiayPhep { get; set; }
        public int? LoaiCoSoID { get; set; }
        public int? DonViHanhChinhID { get; set; }
        public int? ToChuc_or_CaNhanID { get; set; }
        public bool? Loai { get; set; }
    }
    public partial class KhuTamGiu
    {
        public int? ID { get; set; }
        public string TenCoSo { get; set; }
        public string DiaChi { get; set; }
        public DateTime? NgayCapGiayPhep { get; set; }
        public int? LoaiCoSoID { get; set; }
        public int? DonViHanhChinhID { get; set; }
        public int? ToChuc_or_CaNhanID { get; set; }
        public bool? Loai { get; set; }
    }
}
namespace Models
{
    public partial class DieuKienChanNuoi
    {
        public int? ID { get; set; }
        public int? HoChanNuoiID { get; set; }
        public string MoTa { get; set; }
        public DateTime? NgayCapNhat { get; set; }
    }
}
namespace Models
{
    public partial class DonViHanhChinh
    {
        public int? ID { get; set; }
        public string TenDonVi { get; set; }
        public int? CapDoHanhChinhID { get; set; }
        public int? TrucThuocID { get; set; }
    }
    public partial class DonVi_Huyen
    {
        public int? ID { get; set; }
        public string TenDonVi { get; set; }
        public int? CapDoHanhChinhID { get; set; }
        public int? TrucThuocID { get; set; }
    }
    public partial class DonVi_Phuong
    {
        public int? ID { get; set; }
        public string TenDonVi { get; set; }
        public int? CapDoHanhChinhID { get; set; }
        public int? TrucThuocID { get; set; }
    }
    public partial class DonVi_Xa
    {
        public int? ID { get; set; }
        public string TenDonVi { get; set; }
        public int? CapDoHanhChinhID { get; set; }
        public int? TrucThuocID { get; set; }
    }
}
namespace Models
{
    public partial class GiayChungNhan
    {
        public int? ID { get; set; }
        public int? ToChucChungNhanID { get; set; }
        public string Ten { get; set; }
        public int? ToChuc_or_CaNhanID { get; set; }
        public DateTime? NgayCap { get; set; }
        public DateTime? NgayHetHan { get; set; }
    }
}
namespace Models
{
    public partial class HoChanNuoi
    {
        public int? ID { get; set; }
        public int? VungChanNuoiID { get; set; }
        public int? SoHo { get; set; }
        public bool KetQua { get; set; }
        public DateTime? NgayThongKe { get; set; }
    }

    public partial class ThongKeHoChanNuoi
    {
        public string KiemDinh { get; set; }
        public int? SL { get; set; }
    }
}
namespace Models
{
    public partial class HoSo
    {
        public int? Id { get; set; }
        public string Ten { get; set; }
        public string SDT { get; set; }
        public string Email { get; set; }
        public string Ext { get; set; }
    }
}
namespace Models
{
    public partial class LichSuTruyCap
    {
        public int? ID { get; set; }
        public DateTime? ThoiGianTruyCap { get; set; }
        public string MoTaHanhDong { get; set; }
        public int? NguoiDungID { get; set; }
    }
}
namespace Models
{
    public partial class LoaiCoSo
    {
        public int? ID { get; set; }
        public string TenLoaiCoSo { get; set; }
    }
}
namespace Models
{
    public partial class NguoiDung
    {
        public int? ID { get; set; }
        public string UserName { get; set; }
        public string Email_or_Phone { get; set; }
        public string Password { get; set; }
        public string TrangThai { get; set; }
        public int? VaiTroID { get; set; }
        public int? DonViHanhChinhID { get; set; }
    }
}
namespace Models
{
    public partial class Quyen
    {
        public int? Id { get; set; }
        public string Ten { get; set; }
        public string Ext { get; set; }
    }
}
namespace Models
{
    public partial class SanPhamXuLyChatThai
    {
        public int? ID { get; set; }
        public string TenSanPham { get; set; }
        public string LoaiSanPham { get; set; }
        public DateTime? NgaySanXuat { get; set; }
        public DateTime? NgayHetHan { get; set; }
        public int? CoSoID { get; set; }
    }
    public partial class SanPhamConHan
    {
        public int? ID { get; set; }
        public string TenSanPham { get; set; }
        public string LoaiSanPham { get; set; }
        public DateTime? NgaySanXuat { get; set; }
        public DateTime? NgayHetHan { get; set; }
        public int? CoSoID { get; set; }
    }
}
namespace Models
{
    public partial class TaiKhoan
    {
        public string Ten { get; set; }
        public string MatKhau { get; set; }
        public int? QuyenId { get; set; }
        public int? HoSoId { get; set; }
    }
}
namespace Models
{
    public partial class ToChuc_or_CaNhan
    {
        public int? ID { get; set; }
        public string Ten { get; set; }
        public string DiaChi { get; set; }
        public string Email_or_Phone { get; set; }
    }
}
namespace Models
{
    public partial class ToChucChungNhan
    {
        public int? ID { get; set; }
        public string Ten { get; set; }
        public string DiaChi { get; set; }
        public string Email_or_Phone { get; set; }
    }
}
namespace Models
{
    public partial class VaiTro
    {
        public int? ID { get; set; }
        public string TenVaiTro { get; set; }
    }
}
namespace Models
{
    public partial class VungChanNuoi
    {
        public int? ID { get; set; }
        public string TenVungChanNuoi { get; set; }
        public string MoTa { get; set; }
        public int? DonViHanhChinhID { get; set; }
    }
}

