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
                new TableColumn { Name = "CapDoHanhChinh", Caption = "Cấp", Width = 120, },
                new TableColumn { Name = "TrucThuoc", Caption = "Trực Thuộc", Width = 200, },
            };
        }
    }
    class ThongKeHuyen : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Title = "Danh sách Huyện/Thành phố";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenDonVi", Caption = "Tên Huyện/Thành phố", Width = 200, },
                new TableColumn { Name = "CapDoHanhChinh", Caption = "Cấp", Width = 120, },
                new TableColumn { Name = "TrucThuoc", Caption = "Trực Thuộc", Width = 200, },
            };
        }
    }
    class ThongKePhuong : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Title = "Danh sách Phường/Thị trấn";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenDonVi", Caption = "Tên Phường/Thị trấn", Width = 200, },
                new TableColumn { Name = "CapDoHanhChinh", Caption = "Cấp", Width = 120, },
                new TableColumn { Name = "TrucThuoc", Caption = "Trực Thuộc", Width = 200, },
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
                new TableColumn { Name = "CapDoHanhChinh", Caption = "Cấp", Width = 120, },
                new TableColumn { Name = "TrucThuoc", Caption = "Trực Thuộc", Width = 200, },
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
                new EditorInfo { Name = "TenDonVi", Caption = "Tên đơn vị", Layout = 12,   },
                new EditorInfo { Name = "CapDoHanhChinhID", Caption = "Cấp", Layout = 12,
                    Type = "select", ValueName = "ID", DisplayName = "TenCapDo", Options = Provider.Select<CapDoHanhChinh>(), },
                new EditorInfo { Name = "TrucThuocID", Caption = "Trực thuộc", Layout = 12,
                    Type = "select", ValueName = "ID", DisplayName = "TenDonVi", Options = Provider.Select<DonViHanhChinh>(), },
            };
        }
    }
    class Edit : Add
    {
        protected override void OnReady()
        {
            ShowDeleteAction("TenDonVi"); // Hiển thị tên đơn vị khi xác nhận xóa
            Find("CapDoHanhChinhID", c => c.IsEnabled = false); // Không cho sửa cấp hành chính khi edit
        }
    }
}