using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WepApi1.DataObjects
{
    public class Customer
    {
        public int Customer_id { get; set; }
        public string Customer_name { get; set; }
        public int Pasaport_number { get; set; }
        public string Customer_email { get; set; }
        public int Customer_phone { get; set; }
        public string Customer_country { get; set; }
        public string Customer_adress { get; set; }
        public int FFC_card_no { get; set; }
        public int FFC_type { get; set; }
        public int FFC_credit_point { get; set; }
        public string Airline_name { get; set; }
    }
}