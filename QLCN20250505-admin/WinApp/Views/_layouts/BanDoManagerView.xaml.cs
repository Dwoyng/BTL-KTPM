using System.Windows;
using System.Windows.Controls;
using GMap.NET;
using GMap.NET.WindowsPresentation;
using GMap.NET.MapProviders;

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
            gmap.MapProvider = GMapProviders.GoogleMap;
            gmap.Position = new PointLatLng(21.028511, 105.804817);
            gmap.MinZoom = 1;
            gmap.MaxZoom = 20;
            gmap.Zoom = 10;
            gmap.ShowCenter = false;
        }
    }
}