using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media.Imaging;
using System.Windows.Threading;
using HighwaySoluations.Softomation.CommonLibrary;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.BL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using LaneApplication.Model;

namespace LaneApplication
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        System.Windows.Threading.DispatcherTimer Timer = new System.Windows.Threading.DispatcherTimer();
        Thread MasterDataThread;
        List<SystemVehicleClassIL> systemVehicleClassList;
        List<TransactionTypeIL> transactionTypeList;
        List<PaymentMethodTypeIL> paymentTypeList;
        List<ExemptTypeIL> exemptTypeList;
        TransactionTypeIL selectedTransactionType;
        PaymentMethodTypeIL selectedPaymentType;
        ExemptTypeIL selectedExemptType;
        SystemVehicleClassIL selectedVehicleClass;
        FasTagVehicleClassIL selectedVehicleSubClass;
        ShiftTiminingIL currentShiftDetails;
        List<TollFareConfigurationIL> currenttollFareList;
        LaneTransactionIL laneData;
        List<LaneTransactionIL> laneDataList;
        List<WIMTransactionIL> wIMTransactionsQueue;
        WIMTransactionIL selectedWIMQueue;
        List<hardwareIL> hardwares = new List<hardwareIL>();
        public MainWindow()
        {
            InitializeComponent();
            Timer.Tick += new EventHandler(Timer_Click);
            Timer.Interval = new TimeSpan(0, 0, 1);
            Timer.Start();
            int nWidth = (int)SystemParameters.PrimaryScreenWidth;
            int nHeight = (int)SystemParameters.PrimaryScreenHeight;
            this.Width = nWidth;
            this.Height = nHeight;
            RootTopColMid.Width = new GridLength(Width - 1000);
            int RootColMidValue = nWidth - 1050;
            RootColMid.Width = new GridLength(RootColMidValue);
            int RootColMidCValue = (RootColMidValue - 250) / 2;
            RootColMidO.Width = new GridLength(RootColMidCValue);
            RootColMidT.Width = new GridLength(RootColMidCValue);
            DateTime d = DateTime.Now;
            lblLoginId.Content = "TC-admin";
            lblShiftId.Content = "Shift-II 08:00:00 - 16:59:59";
            lblLoginTime.Content = "Login Time: " + d.ToString("HH:mm:ss");

            hardwareIL bg = new hardwareIL();
            bg.HardwareName = "Barrier";
            bg.ImagePath = "Icons\\bariearClose.png";
            bg.ImageData = LoadImage(bg.ImagePath);
            hardwares.Add(bg);

            hardwareIL rf = new hardwareIL();
            rf.HardwareName = "RFID";
            rf.ImagePath = "Icons\\rfidReader.png";
            rf.ImageData = LoadImage(rf.ImagePath);
            hardwares.Add(rf);

            hardwareIL ci = new hardwareIL();
            ci.HardwareName = "Camera";
            ci.ImagePath = "Icons\\camera.png";
            ci.ImageData = LoadImage(ci.ImagePath);
            hardwares.Add(ci);

            hardwareIL tl = new hardwareIL();
            tl.HardwareName = "Traffic";
            tl.ImagePath = "Icons\\light.png";
            tl.ImageData = LoadImage(tl.ImagePath);
            hardwares.Add(tl);

            MasterDataThread = new Thread(new ThreadStart(this.MasterDataFuntion));
            MasterDataThread.IsBackground = true;
            MasterDataThread.Start();
            laneData = new LaneTransactionIL();
            laneDataList = new List<LaneTransactionIL>();

            //ImageViewer1.Source = new BitmapImage(new Uri("Icons\\bariearClose.png", UriKind.Relative));
        }

        private void MasterDataFuntion()
        {
            systemVehicleClassList = SystemVehicleClassBL.GetActive();
            transactionTypeList = TransactionTypeBL.GetActive();
            paymentTypeList = PaymentMethodTypeBL.GetActive();
            exemptTypeList = ExemptTypeBL.GetActive();
            currentShiftDetails = ShiftTiminingBL.GetByDateTime(DateTime.Now);
            TollFareIL currentTollFare = TollFareBL.GetByEffectedFrom(DateTime.Now.ToString(Constants.DateFormat));
            currenttollFareList = currentTollFare.TollFareConfigurations;
            Dispatcher.BeginInvoke(new Action(() => {
                lblShiftId.Content = currentShiftDetails.ShiftNumber + " " + currentShiftDetails.StartTimmng + " " + currentShiftDetails.EndTimming;
            }), DispatcherPriority.Background);

            lvVehicleClass.Dispatcher.Invoke(new Action(() => lvVehicleClass.DataContext = systemVehicleClassList));
            lvTransactionType.Dispatcher.Invoke(new Action(() => lvTransactionType.DataContext = transactionTypeList));
            wIMTransactionsQueue = new List<WIMTransactionIL>();
            for (int i = 0; i < systemVehicleClassList.Count; i++)
            {
                WIMTransactionIL d = new WIMTransactionIL();
                d.WimSequenceNumber = i + 1;
                d.WimClassName = systemVehicleClassList[i].SystemVehicleClassName;
                d.WimClassId = systemVehicleClassList[i].SystemVehicleClassId;
                d.StaticWeight = systemVehicleClassList[i].PermissibleWeight;
                d.TotalWeight = systemVehicleClassList[i].PermissibleWeight;
                d.IsOverWeight = false;
                wIMTransactionsQueue.Add(d);
            }
            lvWimQueue.Dispatcher.Invoke(new Action(() => lvWimQueue.DataContext = wIMTransactionsQueue));
            
          
            lvHardwareStatus.Dispatcher.Invoke(new Action(() => lvHardwareStatus.DataContext = hardwares));
        }
        private void Timer_Click(object sender, EventArgs e)
        {
            DateTime d;
            d = DateTime.Now;
            lblTimer.Content = "Time: " + d.ToString("HH:mm:ss");
        }
        private void Logout_Click(Object sender, RoutedEventArgs e)
        {
            this.Close();
        }
        private void lvVehicleClass_SelectionChanged(Object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            selectedVehicleClass = (SystemVehicleClassIL)lvVehicleClass.SelectedItem;
            if (selectedVehicleClass != null)
            {
                laneData.VehicleClassId = selectedVehicleClass.SystemVehicleClassId;
                laneData.VehicleClassName = selectedVehicleClass.SystemVehicleClassName;
                laneData.PermissibleVehicleWeight = selectedVehicleClass.PermissibleWeight;
                Dispatcher.BeginInvoke(new Action(() => {
                    txtVehicleClass.Content = laneData.VehicleClassName;
                }), DispatcherPriority.Background);
                SubClassPopup.IsOpen = true;
                lvVehicleSubClass.Dispatcher.Invoke(new Action(() => lvVehicleSubClass.DataContext = selectedVehicleClass.SystemSubClassList));
            }
        }
        private void lvVehicleSubClass_SelectionChanged(Object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            selectedVehicleSubClass = (FasTagVehicleClassIL)lvVehicleSubClass.SelectedItem;
            if (selectedVehicleSubClass != null)
            {
                laneData.VehicleSubClassId = selectedVehicleSubClass.FasTagVehicleClassId;
                laneData.VehicleSubClassName = selectedVehicleSubClass.FasTagVehicleClassName;
                Dispatcher.BeginInvoke(new Action(() => {
                    txtVehicleSubClass.Content = laneData.VehicleSubClassName;
                }), DispatcherPriority.Background);
                SubClassPopup.IsOpen = false;
                GetTollFare();
            }
        }
        private void lvTransactionType_SelectionChanged(Object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            selectedTransactionType = (TransactionTypeIL)lvTransactionType.SelectedItem;
            selectedPaymentType = null;
            selectedExemptType = null;
            if (selectedTransactionType != null)
            {
                laneData.TransactionTypeId = selectedTransactionType.TransactionTypeId;
                laneData.TransactionTypeName = selectedTransactionType.TransactionTypeName;
                Dispatcher.BeginInvoke(new Action(() => {
                    txtTransactionType.Content = laneData.TransactionTypeName;
                }), DispatcherPriority.Background);
                if (selectedTransactionType.TransactionTypeName == "Cash")
                {
                    PaymentTypePopup.IsOpen = true;
                    lvPaymentType.Dispatcher.Invoke(new Action(() => lvPaymentType.DataContext = paymentTypeList));
                }
                else if (selectedTransactionType.TransactionTypeName == "Exempt")
                {
                    ExemptTypePopup.IsOpen = true;
                    lvExemptType.Dispatcher.Invoke(new Action(() => lvExemptType.DataContext = exemptTypeList));
                }
                GetTollFare();
            }
        }
        private void lvPaymentType_SelectionChanged(Object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            selectedPaymentType = (PaymentMethodTypeIL)lvPaymentType.SelectedItem;
            if (selectedPaymentType != null)
            {
                laneData.PaymentTypeId = selectedPaymentType.PaymentTypeId;
                laneData.PaymentTypeName = selectedPaymentType.PaymentTypeName;
                Dispatcher.BeginInvoke(new Action(() => {
                    txtPaymentType.Content = laneData.PaymentTypeName;
                }), DispatcherPriority.Background);
                PaymentTypePopup.IsOpen = false;
            }
        }
        private void lvExemptType_SelectionChanged(Object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            selectedExemptType = (ExemptTypeIL)lvExemptType.SelectedItem;
            if (selectedExemptType != null)
            {
                laneData.ExemptTypeId = selectedExemptType.ExemptTypeId;
                laneData.ExemptTypeName = selectedExemptType.ExemptTypeName;
                Dispatcher.BeginInvoke(new Action(() => {
                    txtExemptType.Content = laneData.ExemptTypeName;
                }), DispatcherPriority.Background);
                ExemptTypePopup.IsOpen = false;
            }
        }
        private void lvWimQueue_SelectionChanged(Object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            selectedWIMQueue = (WIMTransactionIL)lvWimQueue.SelectedItem;
            if (selectedWIMQueue != null)
            {
                laneData.ActualVehicleWeight = selectedWIMQueue.TotalWeight;
                GetTollFare();
            }
        }
        private void GetTollFare()
        {
            try
            {
                if (laneData != null)
                {
                    TollFareConfigurationIL filtered = currenttollFareList.FirstOrDefault(e => e.SystemVehicleClassId == laneData.VehicleSubClassId);
                    if (filtered != null && filtered.SystemVehicleClassId == laneData.VehicleSubClassId)
                    {
                        if (laneData.TransactionTypeId == 1)
                        {
                            laneData.TransactionAmount = filtered.TollFare;
                            laneData.TagPenaltyAmount = 0;

                        }
                        else if (laneData.TransactionTypeId == 2)
                        {
                            laneData.TransactionAmount = filtered.TollFare;
                            laneData.TagPenaltyAmount = filtered.FasTagPenalty;
                        }
                        else if (laneData.TransactionTypeId == 3)
                        {
                            laneData.TransactionAmount = 0;
                            laneData.TagPenaltyAmount = 0;
                        }
                        else if (laneData.TransactionTypeId == 4)
                        {
                            laneData.TransactionAmount = 0;
                            laneData.TagPenaltyAmount = 0;
                        }
                        if (laneData.ActualVehicleWeight > laneData.PermissibleVehicleWeight)
                        {
                            laneData.OverWeightAmount = filtered.OverweightPenalty;
                        }
                        Dispatcher.BeginInvoke(new Action(() => {
                            txtTollFare.Content = Constants.CurrecyFromater(laneData.TransactionAmount);
                            txtTagPenalityFare.Content = Constants.CurrecyFromater(laneData.TagPenaltyAmount);
                            txtOverweightFare.Content = Constants.CurrecyFromater(laneData.OverWeightAmount);
                            txtTransactionAmount.Content = Constants.CurrecyFromater(laneData.TransactionAmount + laneData.TagPenaltyAmount + laneData.OverWeightAmount);
                        }), DispatcherPriority.Background);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Somthing went wrong to get the toll fare " + ex.Message.ToString());
            }
        }
        private void btnRemoveQueue_Click(Object sender, RoutedEventArgs e)
        {

        }
        private void btnSubmit_Click(Object sender, RoutedEventArgs e)
        {

        }

        private BitmapImage LoadImage(string filename)
        {
            return new BitmapImage(new Uri(filename, UriKind.Relative));
        }
    }
}
