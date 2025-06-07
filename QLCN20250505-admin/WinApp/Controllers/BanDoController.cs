using System.Mvc;

namespace WinApp.Controllers
{
    public class BanDoController : Controller
    {
        public object Index()
        {
            return new WinApp.Views.BanDo.BanDoPhanBoView();
        }
    }
}