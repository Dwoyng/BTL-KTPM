using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinApp.Controllers
{
    internal class QLCNController : BaseController
    {
        public override object Index()
        {
            return Redirect("VungChanNuoi");
        }
        //public override object Index()
        //{
        //    return Redirect("CoSo");
        //}
    }
}
