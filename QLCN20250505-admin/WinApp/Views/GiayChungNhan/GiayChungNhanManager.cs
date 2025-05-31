using System;
namespace WinApp.Views.GiayChungNhan
{
    using Vst.Controls;
    using Models;
    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Giấy Chứng Nhận";
            context.TableColumns = new object[] {
                new TableColumn { Name = "ToChuc_or_CaNhan", Caption = "Đối tượng được cấp", Width = 250, },
                new TableColumn { Name = "Ten", Caption = "Tên giấy chứng nhận", Width = 200, },
                new TableColumn { Name = "ToChucChungNhan", Caption = "Tổ chức chứng nhận", Width = 200, },
                new TableColumn { Name = "NgayCap", Caption = "Ngày cấp", Width = 200, },
                new TableColumn { Name = "NgayHetHan", Caption = "Ngày hết hạn", Width = 200, },
            };
            context.Search = (item, search) =>
            {
                var model = item as GiayChungNhan;
                return model.ToChuc_or_CaNhan != null && model.Ten.ToLower().Contains(search.ToLower()) ||
                       model.Ten != null && model.Ten.ToLower().Contains(search.ToLower()) ||
                       model.ToChucChungNhan != null && model.Ten.ToLower().Contains(search.ToLower());
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Thông Tin Giấy Chứng Nhận";
            context.Editors = new object[] {
                new EditorInfo { Name = "ToChuc_or_CaNhanID", Caption = " Tên chủ sở hữu", Layout = 12,
    Type = "select", ValueName = "ID", DisplayName = "Ten", Options = Provider.Select<ToChuc_or_CaNhan>(), },
                new EditorInfo { Name = "Ten", Caption = " Tên giấy chứng nhận", Layout = 12,   },
                new EditorInfo { Name = "ToChucChungNhanID", Caption = " Tổ chức chứng nhận", Layout = 12,
    Type = "select", ValueName = "ID", DisplayName = "Ten", Options = Provider.Select<ToChucChungNhan>(), },
                new EditorInfo { Name = "NgayCap", Caption = " Ngày cấp", Layout = 6,   },
                new EditorInfo { Name = "NgayHetHan", Caption = " Ngày hết hạn", Layout = 6,   },
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
