﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using Vst.Controls;

namespace WinApp.Views.TaiKhoan
{
    using TC = TableColumn;
    using TE = EditorInfo;

    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Danh sách người dùng";
            context.TableColumns = new object[] {
                new TC { Name = "Ten", Caption = "Họ tên", Width = 250 },
                new TC { Name = "SDT", Caption = "Số điện thoại", Width = 120 },
                new TC { Name = "Email", Caption = "Email", Width = 120 },
                new TC { Name = "TenDangNhap", Caption = "Tên đăng nhập", Width = 120 },
                new TC { Name = "Quyen", Caption = "Quyền truy cập", Width = 150 },
            };
            // Thêm logic tìm kiếm theo Họ tên
            context.Search = (item, search) =>
            {
                var model = item as Models.HoSo;
                return model.Ten != null && model.Ten.ToLower().Contains(search.ToLower());
            };
        }
    }

    class LichSu : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Title = "Lịch sử đăng nhập";
            context.TableColumns = new object[] {
                new TC { Name = "NguoiDungID", Caption = "Mã người dùng", Width = 120 },
                new TC { Name = "ThoiGianTruyCap", Caption = "Thời gian truy cập", Width = 180 },
                new TC { Name = "MoTaHanhDong", Caption = "Hành động", Width = 250 }
            };

            context.Model = System.Provider.Select<Models.LichSuTruyCap>();

            context.Search = (item, search) =>
            {
                var model = item as Models.LichSuTruyCap;
                return model.NguoiDungID.ToString().Contains(search) || model.MoTaHanhDong.ToString().Contains(search.ToLower());
            };
        }
    }
    class Edit : Add
    {
        protected override void OnReady()
        {
            var key = "TenDangNhap";
            Find(key, e => e.IsEnabled = false);
            ShowDeleteAction("Ten");
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Cập nhật người dùng";
            context.Editors = new object[] {
                new TE { Name = "Ten", Caption = "Họ tên" },
                new TE { Name = "SDT", Caption = "Số điện thoại", Layout = 6 },
                new TE { Name = "Email", Caption = "Email", Layout = 6 },
                new TE { Name = "TenDangNhap", Caption = "Tên đăng nhập", Layout = 6 },

                new TE { Name = "QuyenId", Caption = "Quyền truy cập", Layout = 6,
                    Type = "select", ValueName = "Id", DisplayName = "Ten", 
                    Options = Provider.Select<Models.Quyen>(),
                },
            };
        }

        protected override void OnReady()
        {
            FindEditor("SDT", sdt => {
                sdt.GetInput().LostFocus += (s, e) => {
                    var un = FindEditor("TenDangNhap", null);
                    if (un.Text == string.Empty)
                        un.Value = sdt.Value;
                };
            });
        }
    }
}
