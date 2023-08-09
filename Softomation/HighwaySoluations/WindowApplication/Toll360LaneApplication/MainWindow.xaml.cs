using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace LaneApplication
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        //variable declaration

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //display login screen, on login successful show main window, create login event and send to database, send login event to lsdu

            //initialize all vehicles 

            //initialize hardware like TLS, OHLS, barrier gate

            //access vehicle class, payment method, shift, toll rate etc and show main screen

            //display main screen, show first panel

            //start background threads like sensor scanning, etc reader, smartcard reader, sensor live status, WIM scanning etc

        }

        private void buttonSubmit_Click(object sender, RoutedEventArgs e)
        {
            //collect data from form

            //create transaction (manual, smartcard or etc), attach WIM data and send AVC request

            //attach presence loop image to the transaction

            //control hardware (barriergate, TLS, OHLS)

            //wait for AVC transaction and attach

            //send transaction to database
        }

        private void buttonCancel_Click(object sender, RoutedEventArgs e)
        {
            //erase all the data in the form, initializa variables

            //take the window to initial state
        }       

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            //close all the threads, close open sockets, ports etc

            //show logout message

            //create logout event and send to database, send logout event to lsdu
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            //show login screen
        }

        //==================================================================

        //private classes

        //helper functions

        //threads
        //1. hardware scanning thread
        //2. etc reader scanning thread
        //3. smartcard reader scanning thread
        //4. avc listner thread
        //5. live status updating thread
        //6. event messenger thread
        //7. plaza server listner thread (or lane updater thread)
    }
}
