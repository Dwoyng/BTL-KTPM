using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinApp.Controllers
{
    internal class SanPhamXuLyChatThaiController : DataController<SanPhamXuLyChatThai>
    {
        public object SanPhamConHan()
        {
            // Lấy danh sách tất cả sản phẩm xử lý chất thải
            var allSanPham = Provider.GetTable<SanPhamXuLyChatThai>().ToList<SanPhamXuLyChatThai>(null, null);

            // Lọc ra các sản phẩm còn hạn sử dụng
            var conHan = allSanPham
                .Where(sp => sp.NgayHetHan.HasValue && sp.NgayHetHan.Value > DateTime.Now)
                .ToList();

            return View(conHan);
        }
    }
}
