using System;
namespace WinApp.Views.DonViHanhChinh
{
    using Vst.Controls;
    using Models;
    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Danh sách đơn vị hành chính";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenDonVi", Caption = "Tên Đơn Vị", Width = 200, },
                new TableColumn { Name = "CapDoHanhChinh", Caption = "Cấp", Width = 100, },
                new TableColumn { Name = "TrucThuoc", Caption = "Trực Thuộc", Width = 200, },
            };
        }
    }
    class ThongKeHuyen : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Title = "Danh sách Huyện";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenDonVi", Caption = "Tên Huyện", Width = 200, },
                new TableColumn { Name = "TrucThuocID", Caption = "Trực Thuộc", Width = 200, },
            };
        }
    }
    class ThongKePhuong : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Title = "Danh sách Phường";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenDonVi", Caption = "Tên Phường", Width = 200, },
            };
        }
    }
    class ThongKeXa : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Title = "Danh sách Xã";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenDonVi", Caption = "Tên Xã", Width = 200, },
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Thông Tin Đơn Vị Hành Chính";
            context.Editors = new object[] {
                new EditorInfo { Name = "TenDonVi", Caption = " Tên đơn vị", Layout = 12,   },
                new EditorInfo { Name = "CapDoHanhChinhID", Caption = " Cấp", Layout = 12,
    Type = "select", ValueName = "ID", DisplayName = "TenCapDo", Options = Provider.Select<CapDoHanhChinh>(), },
                new EditorInfo { Name = "TrucThuocID", Caption = " Trực thuộc", Layout = 12,
    Type = "select", ValueName = "ID", DisplayName = "TenDonVi", Options = Provider.Select<DonViHanhChinh>(), },
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

