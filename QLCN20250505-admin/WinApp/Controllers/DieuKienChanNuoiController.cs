using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinApp.Controllers
{
    internal class DieuKienChanNuoiController : DataController<DieuKienChanNuoi>
    {
    
   
    public object MoHinhChanNuoi()
        {
            var dsMoHinh = Provider.GetTable<MoHinhChanNuoi>()
                .ToList<MoHinhChanNuoi>(null, null);
            return View(dsMoHinh);
        }
    }
}
