using System;
namespace WinApp.Views.SanPhamXuLyChatThai
{
    using Vst.Controls;
    using Models;
    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Danh sách sản phẩm xử lý chất thải";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenSanPham", Caption = "Tên Sản Phẩm", Width = 200, },
                new TableColumn { Name = "LoaiSanPham", Caption = "Loại Sản Phẩm", Width = 200, },
                new TableColumn { Name = "NgaySanXuat", Caption = "Ngày Sản Xuất", Width = 200, },
                new TableColumn { Name = "NgayHetHan", Caption = "Ngày Hết Hạn", Width = 200, },
            };
            context.Search = (item, search) =>
            {
                var model = item as SanPhamXuLyChatThai;
                return model.TenSanPham != null && model.TenSanPham.ToLower().Contains(search.ToLower()) ||
                       model.LoaiSanPham != null && model.LoaiSanPham.ToLower().Contains(search.ToLower());
            };
        }
    }
    class SanPhamConHan : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Danh sách sản phẩm còn hạn";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenSanPham", Caption = "Tên Sản Phẩm", Width = 200, },
                new TableColumn { Name = "LoaiSanPham", Caption = "Loại Sản Phẩm", Width = 200, },
                new TableColumn { Name = "NgayHetHan", Caption = "Ngày Hết Hạn", Width = 200, },
            };
            context.Search = (item, search) =>
            {
                var model = item as SanPhamXuLyChatThai;
                return model.TenSanPham != null && model.TenSanPham.ToLower().Contains(search.ToLower()) ||
                       model.LoaiSanPham != null && model.LoaiSanPham.ToLower().Contains(search.ToLower());
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Thông Tin Sản Phẩm";
            context.Editors = new object[] {
                new EditorInfo { Name = "TenSanPham", Caption = " Tên Sản Phẩm", Layout = 12,   },
                new EditorInfo { Name = "LoaiSanPham", Caption = " Loại Sản Phẩm", Layout = 12,   },
                new EditorInfo { Name = "NgaySanXuat", Caption = " Ngày Sản Xuất", Layout = 12,   },
                new EditorInfo { Name = "NgayHetHan", Caption = " Ngày Hết Hạn", Layout = 12,   },
                new EditorInfo { Name = "CoSoID", Caption = " Tên Cơ Sở", Layout = 12,
    Type = "select", ValueName = "ID", DisplayName = "TenCoSo", Options = Provider.Select<CoSo>(), },
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
