using System.Windows;
using System.Windows.Controls;
using GMap.NET;
using GMap.NET.WindowsPresentation;
using GMap.NET.MapProviders;
using System.Data;
using System.Windows.Media;
using System.Windows.Shapes;
using System;

namespace WinApp.Views
{
    public partial class BanDoManagerView : UserControl
    {
        public BanDoManagerView()
        {
            InitializeComponent();
        }

        private void Gmap_Loaded(object sender, RoutedEventArgs e)
        {
            // Khởi tạo bản đồ
            gmap.MapProvider = GMapProviders.GoogleMap;
            GMaps.Instance.Mode = AccessMode.ServerOnly;
            gmap.Position = new PointLatLng(20.94, 106.35); // Trung tâm Hải Dương
            gmap.MinZoom = 5;
            gmap.MaxZoom = 18;
            gmap.Zoom = 11;
            gmap.ShowCenter = false;

            // Xóa marker cũ (nếu có)
            gmap.Markers.Clear();

            // Lấy dữ liệu các điểm từ SQL
            var dt = Provider.Load(@"
                SELECT b.ID, 
                       CASE 
                           WHEN b.CoSoID IS NOT NULL THEN c.TenCoSo 
                           ELSE v.TenVungChanNuoi 
                       END AS Ten,
                       b.KinhDo, b.ViDo
                FROM BanDoPhanBo b
                LEFT JOIN CoSo c ON b.CoSoID = c.ID
                LEFT JOIN VungChanNuoi v ON b.VungChanNuoiID = v.ID
            ");

            // Thêm marker đỏ cho từng điểm
            foreach (DataRow row in dt.Rows)
            {
                double lat = Convert.ToDouble(row["ViDo"]);
                double lng = Convert.ToDouble(row["KinhDo"]);
                string ten = row["Ten"].ToString();

                // Tạo chấm đỏ (Ellipse)
                var ellipse = new Ellipse
                {
                    Width = 16,
                    Height = 16,
                    Stroke = Brushes.Red,
                    StrokeThickness = 2,
                    Fill = Brushes.Red,
                    Opacity = 0.8,
                    ToolTip = ten
                };

                var marker = new GMapMarker(new PointLatLng(lat, lng))
                {
                    Shape = ellipse,
                    Offset = new System.Windows.Point(-8, -8)
                };

                gmap.Markers.Add(marker);
            }
        }
    }
}