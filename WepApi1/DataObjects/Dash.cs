using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WepApi1.DataObjects
{
    public class Dash
    {
        public List<Customer> Customer_list { get; set; }
        public int Toplam_Customer_sayisi { get; set; }
        public int Toplam_FFC_sayisi { get; set; }
        public int ToplamAirline_Sayisi { get; set; }
        public int ToplamBronze { get; set; }
        public int ToplamSilver { get; set; }
        public int ToplamGold { get; set; }
        public int THY_Bronze { get; set; }
        public int Pegasus_Bronze { get; set; }
        public int OnurAir_Bronze { get; set; }
        public int THY_Silver { get; set; }
        public int Pegasus_Silver { get; set; }
        public int OnurAir_Silver { get; set; }
        public int THY_Gold { get; set; }
        public int Pegasus_Gold { get; set; }
        public int OnurAir_Gold { get; set; }

    }
}