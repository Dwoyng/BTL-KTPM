﻿using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinApp.Controllers
{
    partial class TaiKhoanController : DataController<HoSo>
    {
        public object LichSu()
        {
            // Lấy danh sách lịch sử đăng nhập
            var lichSu = Provider.GetTable<LichSuTruyCap>();
                
            return View(lichSu);
        }
        //protected override HoSo CreateEntity()
        //{
        //    return new HoSo { QuyenId = 3 };
        //}

        //protected override void UpdateCore(HoSo e)
        //{
        //    // Đặt tên người dùng mặc định
        //    if (string.IsNullOrWhiteSpace(e.TenDangNhap))
        //        e.TenDangNhap = e.SDT;

        //    base.UpdateCore(e);
        //}

        #region Không dùng Procedure
        //DataSchema.Table HoSoDb => Provider.GetTable<HoSo>();
        //DataSchema.Table TaiKhoanDb => Provider.GetTable<TaiKhoan>();
        //protected override string GetProcName() => null;
        //protected override void TryInsert(ViewHoSo e)
        //{
        //    // Kiểm tra tên đăng nhập trong tài khoản 
        //    if (TaiKhoanDb.GetValueById("HoSoId", e.TenDangNhap) != null)
        //    {
        //        UpdateContext.Message = "Đã có người dùng " + e.TenDangNhap;
        //        return;
        //    }

        //    // Thêm mới hồ sơ
        //    var sql = HoSoDb.CreateInsertSql(e);
        //    ExecSQL(sql);
            
        //    // Thêm mới tài khoản
        //    var acc = new TaiKhoan {
        //        Ten = e.TenDangNhap,
        //        MatKhau = "1234",
        //        QuyenId = e.QuyenId,
        //        HoSoId = HoSoDb.GetIdentity(), // lấy Id của HoSo
        //    };
        //    sql = TaiKhoanDb.CreateInsertSql(acc);
        //    ExecSQL(sql);

        //    // Không gọi lại hàm của lớp cơ sở
        //    // base.TryInsert(e);
        //}
        //protected override void TryUpdate(ViewHoSo e)
        //{
        //    // Cập nhật hồ sơ
        //    ExecSQL(HoSoDb.CreateUpdateSql(e));
        //}
        //protected override void TryDelete(ViewHoSo e)
        //{
        //    // Xóa tài khoản
        //    ExecSQL(TaiKhoanDb.CreateDeleteSql(new TaiKhoan { Ten = e.TenDangNhap }));

        //    // Xóa hồ sơ
        //    ExecSQL(HoSoDb.CreateDeleteSql(e));
        //}
        #endregion
    }
}
