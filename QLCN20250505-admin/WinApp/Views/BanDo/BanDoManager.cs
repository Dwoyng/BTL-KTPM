using WinApp.Views.BanDo;

namespace WinApp.Views.BanDo
{
    public class Index : BaseView<BanDoManagerView>
    {
        protected override object CreateLayout()
        {
            // Tạo layout mới
            return new DataListViewLayout();
        }

        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);

            var layout = context.Layout as DataListViewLayout;
            if (layout != null)
            {
                // Nếu bạn muốn thay thế TableView mặc định bằng BanDoManagerView:
                layout.Body.Child = MainView;

                // Nếu muốn set DataContext cho Header để hiển thị thông tin (ví dụ tiêu đề):
                layout.Header.DataContext = context;

                // Nếu muốn set tiêu đề động, hãy thêm property Title vào context rồi binding trong PageHeader.
                // context.Title = "Bản đồ phân bố";
            }
        }
    }
}