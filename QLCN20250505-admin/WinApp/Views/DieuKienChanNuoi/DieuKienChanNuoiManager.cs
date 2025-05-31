using System;
namespace WinApp.Views.DieuKienChanNuoi
{
    using Vst.Controls;
    using Models;
    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Title = "List of DieuKienChanNuoi";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenVungChanNuoi", Caption = "Tên Vùng Chăn Nuôi", Width = 200, },
                new TableColumn { Name = "MoTa", Caption = "Mô tả", Width = 300, },
                new TableColumn { Name = "NgayCapNhat", Caption = "Ngày cập nhật", Width = 200, },
            };
            context.Search = (item, search) =>
            {
                var model = item as DieuKienChanNuoi;
                return model.TenVungChanNuoi != null && model.TenVungChanNuoi.ToLower().Contains(search.ToLower()) ||
                       model.MoTa != null && model.MoTa.ToLower().Contains(search.ToLower());
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "DieuKienChanNuoi Information";
            context.Editors = new object[] {
                new EditorInfo { Name = "HoChanNuoiID", Caption = " Caption of HoChanNuoiID", Layout = 12,
    Type = "select", ValueName = "ID", DisplayName = "HoChanNuoiID", Options = Provider.Select<HoChanNuoi>(), },
                new EditorInfo { Name = "MoTa", Caption = " Caption of MoTa", Layout = 12,   },
                new EditorInfo { Name = "NgayCapNhat", Caption = " Caption of NgayCapNhat", Layout = 12,   },
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
