﻿using System;
namespace WinApp.Views.ToChucChungNhan
{
    using Vst.Controls;
    using Models;
    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Title = "Danh sách tổ chức chứng nhận";
            context.TableColumns = new object[] {
                new TableColumn { Name = "Ten", Caption = "Tên tổ chức", Width = 200, },
                new TableColumn { Name = "DiaChi", Caption = "Địa chỉ", Width = 200, },
                new TableColumn { Name = "Email_or_Phone", Caption = "Email/ SDT", Width = 200, },
            };
            context.Search = (item, search) =>
            {
                var model = item as ToChucChungNhan;
                return model.Ten != null && model.Ten.ToLower().Contains(search.ToLower()) ||
                       model.DiaChi != null && model.DiaChi.ToLower().Contains(search.ToLower()) ||
                       model.Email_or_Phone != null && model.Email_or_Phone.ToLower().Contains(search.ToLower());
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Thông Tin Tổ Chức Chứng Nhận";
            context.Editors = new object[] {
                new EditorInfo { Name = "Ten", Caption = " Tên", Layout = 12,   },
                new EditorInfo { Name = "DiaChi", Caption = " Địa chỉ", Layout = 12,   },
                new EditorInfo { Name = "Email_or_Phone", Caption = " Email/ SDT", Layout = 12,   },
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
