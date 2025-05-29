using System;
namespace WinApp.Views.CoSo
{
    using Vst.Controls;
    using Models;
    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Cơ Sở Chăn Nuôi";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenCoSo", Caption = "Cơ sở", Width = 200, },
                new TableColumn { Name = "ToChuc_or_CaNhan", Caption = "Chủ sở hữu", Width = 250, },
                new TableColumn { Name = "LoaiCoSo", Caption = "Loại cơ sở", Width = 250, },
                new TableColumn { Name = "DonViHanhChinh", Caption = "Đơn vị hành chính", Width = 150, },
                new TableColumn { Name = "DiaChi", Caption = "Địa chỉ", Width = 200, },
                new TableColumn { Name = "NgayCapGiayPhep", Caption = "Ngày cấp giấy phép", Width = 150, },
            };
        }
    }

    class MoHinhChanNuoi : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Title = "Số lượng";
            context.TableColumns = new object[] {
                new TableColumn { Name = "MoHinh", Caption = "Loại Mô Hình", Width = 250, },
                new TableColumn { Name = "SoLuong", Caption = "Số lượng", Width = 100, },
            };
        }
    }

    class GietMo : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Danh sách cơ sở giết mổ";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenCoSo", Caption = "Tên cơ sở", Width = 200, },
                new TableColumn { Name = "DiaChi", Caption = "Địa chỉ", Width = 200, },
                new TableColumn { Name = "NgayCapGiayPhep", Caption = "Ngày cấp giấy phép", Width = 200, },
            };
        }
    }
    class ChiCucThuY : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Danh sách chi cục thú y";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenCoSo", Caption = "Tên cơ sở", Width = 200, },
                new TableColumn { Name = "DiaChi", Caption = "Địa chỉ", Width = 200, },
                new TableColumn { Name = "NgayCapGiayPhep", Caption = "Ngày cấp giấy phép", Width = 200, },
            };
        }
    }
    class DaiLyBanThuoc : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Danh sách đại lý bán thuốc";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenCoSo", Caption = "Tên cơ sở", Width = 200, },
                new TableColumn { Name = "DiaChi", Caption = "Địa chỉ", Width = 200, },
                new TableColumn { Name = "NgayCapGiayPhep", Caption = "Ngày cấp giấy phép", Width = 200, },
            };
        }
    }
    class KhuTamGiu : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Danh sách khu tạm giữ, tiêu hủy gia súc/ gia cầm";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenCoSo", Caption = "Tên cơ sở", Width = 200, },
                new TableColumn { Name = "DiaChi", Caption = "Địa chỉ", Width = 200, },
                new TableColumn { Name = "NgayCapGiayPhep", Caption = "Ngày cấp giấy phép", Width = 200, },
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);

            context.Title = "Thông Tin Cơ Sở";
            context.Editors = new object[] {
                new EditorInfo { Name = "TenCoSo", Caption = "Tên Cơ Sở", Layout = 12,   },
                new EditorInfo { Name = "DiaChi", Caption = " Địa Chỉ", Layout = 12,   },
                new EditorInfo { Name = "NgayCapGiayPhep", Caption = " Ngày Cấp Giấy Phép", Layout = 12,   },
                new EditorInfo { Name = "LoaiCoSoID", Caption = " Tên Loại Cơ Sở", Layout = 12,
    Type = "select", ValueName = "ID", DisplayName = "TenLoaiCoSo", Options = Provider.Select<LoaiCoSo>(), },
                new EditorInfo { Name = "DonViHanhChinhID", Caption = " Tên Đơn Vị Hành Chính", Layout = 12,
    Type = "select", ValueName = "ID", DisplayName = "TenDonVi", Options = Provider.Select<DonViHanhChinh>(), },
                new EditorInfo { Name = "ToChuc_or_CaNhanID", Caption = " Tên Tổ Chức/ Cá Nhân", Layout = 12,
    Type = "select", ValueName = "ID", DisplayName = "Ten", Options = Provider.Select<ToChuc_or_CaNhan>(), },
            };
        }
    }
    class Edit : Add
    {
        protected override void OnReady()
        {
            // Thay FieldName bằng tên trường muốn thể hiện trên câu hỏi xóa bản ghi
            ShowDeleteAction("FieldName");
            // Thay EditorName bằng tên trường muốn cấm soạn thảo
            Find("EditorName", c => c.IsEnabled = false);
        }
    }
}
