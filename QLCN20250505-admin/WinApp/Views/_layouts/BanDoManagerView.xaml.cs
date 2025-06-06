using System.Windows;
using GMap.NET;
using GMap.NET.WindowsPresentation;
using GMap.NET.MapProviders;
using System.Windows.Controls;

namespace WinApp.Views
{
    public partial class BanDoManagerView : UserControl   // Sửa Window -> UserControl
    {
        public BanDoManagerView()
        {
            InitializeComponent();
        }

        private void Gmap_Loaded(object sender, RoutedEventArgs e)
        {
            gmap.MapProvider = GMapProviders.GoogleMap;
            gmap.Position = new PointLatLng(21.028511, 105.804817); // Tọa độ mặc định
            gmap.MinZoom = 1;
            gmap.MaxZoom = 20;
            gmap.Zoom = 10;
            gmap.ShowCenter = false;

            // Thêm Marker mẫu với Tooltip
            var ellipse = new System.Windows.Shapes.Ellipse
            {
                Width = 12,
                Height = 12,
                Stroke = System.Windows.Media.Brushes.Red,
                StrokeThickness = 2,
                Fill = System.Windows.Media.Brushes.Yellow,
                ToolTip = "Trung tâm Hà Nội"
            };

            var marker = new GMapMarker(new PointLatLng(21.028511, 105.804817))
            {
                Shape = ellipse
            };
            gmap.Markers.Add(marker);
        }
    }
}