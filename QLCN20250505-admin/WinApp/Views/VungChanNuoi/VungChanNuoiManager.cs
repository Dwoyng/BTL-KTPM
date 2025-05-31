using System;
namespace WinApp.Views.VungChanNuoi
{
    using Vst.Controls;
    using Models;
    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Danh sách vùng chăn nuôi";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenVungChanNuoi", Caption = "Tên vùng chăn nuôi", Width = 200, },
                new TableColumn { Name = "DonViHanhChinh", Caption = "Trực thuộc", Width = 200, },
                new TableColumn { Name = "MoTa", Caption = "Mô tả", Width = 200, },
            };
            // Thêm logic tìm kiếm theo Tên vùng chăn nuôi
            context.Search = (item, search) =>
            {
                var model = item as VungChanNuoi;
                return model.TenVungChanNuoi != null && model.TenVungChanNuoi.ToLower().Contains(search.ToLower());
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Thông Tin Vùng Chăn Nuôi";
            context.Editors = new object[] {
                new EditorInfo { Name = "TenVungChanNuoi", Caption = " Tên vùng chăn nuôi", Layout = 12,   },
                new EditorInfo { Name = "DonViHanhChinhID", Caption = " Trực thuộc", Layout = 12,
    Type = "select", ValueName = "ID", DisplayName = "TenDonVi", Options = Provider.Select<DonViHanhChinh>(), },
                new EditorInfo { Name = "MoTa", Caption = " Mô tả", Layout = 12,   },
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
