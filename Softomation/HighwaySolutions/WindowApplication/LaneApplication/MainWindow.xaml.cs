using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Windows;
using System.Windows.Input;
using System.Windows.Threading;
using HighwaySoluations.Softomation.CommonLibrary;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.BL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

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
        TollFareIL currentTollFare;
        public MainWindow()
        {
            InitializeComponent();
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
            lblLoginTime.Content = "Login Time: " + d.Hour + " : " + d.Minute + " : " + d.Second;
            MasterDataThread = new Thread(new ThreadStart(this.MasterDataFuntion));
            MasterDataThread.IsBackground = true;
            MasterDataThread.Start();
        }

        private void MasterDataFuntion()
        {
            systemVehicleClassList = SystemVehicleClassBL.GetActive();
            transactionTypeList = TransactionTypeBL.GetActive();
            paymentTypeList = PaymentMethodTypeBL.GetActive();
            exemptTypeList = ExemptTypeBL.GetActive();
            currentShiftDetails = ShiftTiminingBL.GetByDateTime(DateTime.Now);
            currentTollFare = TollFareBL.GetByEffectedFrom(DateTime.Now.ToString(Constants.DateFormat));
            Dispatcher.BeginInvoke(new Action(() => {
                lblShiftId.Content = currentShiftDetails.ShiftNumber + " " + currentShiftDetails.StartTimmng + " " + currentShiftDetails.EndTimming;
            }), DispatcherPriority.Background);

            lvVehicleClass.Dispatcher.Invoke(new Action(() => lvVehicleClass.DataContext = systemVehicleClassList));
            lvTransactionType.Dispatcher.Invoke(new Action(() => lvTransactionType.DataContext = transactionTypeList));

            Timer.Tick += new EventHandler(Timer_Click);
            Timer.Interval = new TimeSpan(0, 0, 1);
            Timer.Start();
        }


        private void Timer_Click(object sender, EventArgs e)
        {
            DateTime d;
            d = DateTime.Now;
            lblTimer.Content = "Time: " + d.Hour + " : " + d.Minute + " : " + d.Second;

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
                SubClassPopup.IsOpen = true;
                lvVehicleSubClass.Dispatcher.Invoke(new Action(() => lvVehicleSubClass.DataContext = selectedVehicleClass.SystemSubClassList));
            }
        }
       
        private void lvVehicleSubClass_SelectionChanged(Object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            selectedVehicleSubClass = (FasTagVehicleClassIL)lvVehicleSubClass.SelectedItem;
            if (selectedVehicleClass != null)
            {
                SubClassPopup.IsOpen = false;
            }
        }
       
        private void lvTransactionType_SelectionChanged(Object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            selectedTransactionType = (TransactionTypeIL)lvTransactionType.SelectedItem;
            selectedPaymentType = null;
            selectedExemptType = null;
            if (selectedTransactionType != null)
            {
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

            }
        }
        
        private void lvPaymentType_SelectionChanged(Object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            selectedPaymentType = (PaymentMethodTypeIL)lvPaymentType.SelectedItem;
            if (selectedPaymentType != null)
            {
                PaymentTypePopup.IsOpen = false;
            }
        }

        private void lvExemptType_SelectionChanged(Object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            selectedExemptType = (ExemptTypeIL)lvExemptType.SelectedItem;
            if (selectedExemptType != null)
            {
                ExemptTypePopup.IsOpen = false;
            }
        }
    }
}
