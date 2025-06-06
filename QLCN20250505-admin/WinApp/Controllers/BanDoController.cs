using System.Mvc;

namespace WinApp.Controllers
{
    public class BanDoController : Controller
    {
        // Không dùng override
        public object Index()
        {
            return new WinApp.Views.BanDo.BanDoPhanBoView();
        }
    }
}