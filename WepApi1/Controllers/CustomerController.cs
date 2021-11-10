using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using WepApi1.DataObjects;

namespace WepApi1.Controllers
{
   
    public class CustomerController : ApiController
    {
        private SqlConnection connection;
      //  private SqlDataAdapter dataAdapter;
        private SqlCommand command;
        private SqlDataReader dataReader;
      //  private DataSet dataSet;
      //  private DataTable dataTable;

        // GET api/<controller>

        public IEnumerable<Customer> GetCustomer()
        {
            connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["MyDatabase"].ConnectionString);
            command = new SqlCommand();
            connection.Open();
            command.Connection = connection;
            command.CommandText = "SELECT * from Customer";
            dataReader = command.ExecuteReader();
            List<Customer> CustomerList = new List<Customer>();
            while (dataReader.Read())
            {
                Customer customer = new Customer();
              
               customer.Customer_adress = dataReader["Customer_adress"].ToString();
               customer.Customer_email = dataReader["Customer_email"].ToString();
                customer.Customer_country = dataReader["Customer_country"].ToString();
                customer.Customer_name = dataReader["Customer_name"].ToString();
                customer.Customer_id = Convert.ToInt32(dataReader["Customer_id"].ToString());
                if (dataReader["Pasaport_number"]!=DBNull.Value)
                {
                    customer.Pasaport_number = Convert.ToInt32(dataReader["Pasaport_number"].ToString());
                    
                }
                else
                {
                    customer.Pasaport_number=-1;
                }
            
               // customer.Pasaport_number = dataReader["Pasaport_number"] == System.DBNull.Value ? default(int) : (int)dataReader["Pasaport_number"];

                customer.Customer_phone = Convert.ToInt32(dataReader["Customer_phone"].ToString());
                CustomerList.Add(customer);
            }
            connection.Close();
            return CustomerList.ToList();
        }

        // GET api/<controller>/5
        public Customer Get(int id)
        {
            connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["MyDatabase"].ConnectionString);
            command = new SqlCommand();
            connection.Open();
            command.Connection = connection;
          //  command.CommandText = "SELECT * from CUSTOMER WHERE Customer_id='" + id + "'";
            command.CommandText = "SELECT * from CUSTOMER WHERE Customer_id=" +id;
            //string sorgu = "Select ekleyen from ilanlar Where ekleyen = '" + ekleyen + "'";;
            // command.Parameters.Add("@Id", SqlDbType.Int32).Value = Id;
            dataReader = command.ExecuteReader();

            Customer customer = new Customer();
       
            while (dataReader.Read())
            {
                customer.Customer_adress = dataReader["Customer_adress"].ToString();
                customer.Customer_email = dataReader["Customer_email"].ToString();
                customer.Customer_country = dataReader["Customer_country"].ToString();
                customer.Customer_name = dataReader["Customer_name"].ToString();
                customer.Customer_id = Convert.ToInt32(dataReader["Customer_id"].ToString());
                //ffc.Credit_point= Convert.ToInt32(dataReader["Credit_point"].ToString());
                if (dataReader["Pasaport_number"] != DBNull.Value)
                {
                    customer.Pasaport_number = Convert.ToInt32(dataReader["Pasaport_number"].ToString());
                }
                else
                {
                    customer.Pasaport_number = -1;
                }

                // customer.Pasaport_number = dataReader["Pasaport_number"] == System.DBNull.Value ? default(int) : (int)dataReader["Pasaport_number"];

                customer.Customer_phone = Convert.ToInt32(dataReader["Customer_phone"].ToString());
            }
            connection.Close();

            return customer;
        }
      
            
            
        

        // POST api/<controller>
        public void Post([FromBody] Customer value)
        {
            String query = "INSERT INTO Customer(Customer_name,Customer_adress,Customer_country,Pasaport_number,Customer_phone,Customer_email) VALUES (@Customer_name,@Customer_adress,@Customer_country,@Pasaport_number,@Customer_phone,@Customer_email)";
            connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["MyDatabase"].ConnectionString);
            command = new SqlCommand(query,connection);
           


            command.Parameters.AddWithValue("@Customer_name", value.Customer_name);
            command.Parameters.AddWithValue("@Customer_adress", value.Customer_adress);
            command.Parameters.AddWithValue("@Customer_country", value.Customer_country);
            command.Parameters.AddWithValue("@Pasaport_number", value.Pasaport_number);
            command.Parameters.AddWithValue("@Customer_phone", value.Customer_phone);
            command.Parameters.AddWithValue("@Customer_email", value.Customer_phone);
            connection.Open();
            dataReader = command.ExecuteReader();
            connection.Close();

        }

        // PUT api/<controller>/5
        public void Put( int id ,[FromBody] Customer value)
        {

            String query = "UPDATE Customer set Customer_name=@Customer_name , Customer_adress=@Customer_adress , Customer_country=@Customer_country , Pasaport_number=@Pasaport_number , Customer_phone=@Customer_phone ,Customer_email=@Customer_email where Customer_id=" + id;
            connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["MyDatabase"].ConnectionString);
            command = new SqlCommand(query, connection);

            command.Parameters.AddWithValue("@Customer_name", value.Customer_name);
            command.Parameters.AddWithValue("@Customer_adress", value.Customer_adress);
            command.Parameters.AddWithValue("@Customer_country", value.Customer_country);
            command.Parameters.AddWithValue("@Pasaport_number", value.Pasaport_number);
            command.Parameters.AddWithValue("@Customer_phone", value.Customer_phone);
            command.Parameters.AddWithValue("@Customer_email", value.Customer_phone);
            connection.Open();
            // dataReader = command.ExecuteReader();
           command.ExecuteNonQuery();
            connection.Close();

        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
            connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["MyDatabase"].ConnectionString);
            command = new SqlCommand();
            connection.Open();
            command.Connection = connection;
            //  command.CommandText = "SELECT * from CUSTOMER WHERE Customer_id='" + id + "'";
            command.CommandText = "DELETE from CUSTOMER WHERE Customer_id=" + id;
            //string sorgu = "Select ekleyen from ilanlar Where ekleyen = '" + ekleyen + "'";;
            // command.Parameters.Add("@Id", SqlDbType.Int32).Value = Id;
            dataReader = command.ExecuteReader();
        }


        public Dash GetDashCustomer()
        {

            connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["MyDatabase"].ConnectionString);
            command = new SqlCommand();
            connection.Open();
            command.Connection = connection;
            command.CommandText = "select c.*,f.Credit_point,f.FFC_card_no,f.FFC_type,a.Airline_name from FFC f LEFT JOIN Customer c ON f.Customer_id=c.Customer_id LEFT JOIN Airline a on f.Airline_id=a.Airline_id";
            dataReader = command.ExecuteReader();
            Dash dash = new Dash();
            List<Customer> customerList = new List<Customer>();
            while (dataReader.Read())
            {
                Customer customer = new Customer();

                customer.Customer_adress = dataReader["Customer_adress"].ToString();
                customer.Customer_email = dataReader["Customer_email"].ToString();
                customer.Customer_country = dataReader["Customer_country"].ToString();
                customer.Customer_name = dataReader["Customer_name"].ToString();
                customer.Customer_id = Convert.ToInt32(dataReader["Customer_id"].ToString());

                customer.FFC_card_no= Convert.ToInt32(dataReader["FFC_card_no"].ToString());
                customer.FFC_type= Convert.ToInt32(dataReader["FFC_type"].ToString());
                customer.FFC_credit_point = Convert.ToInt32(dataReader["Credit_point"].ToString());
                customer.Airline_name = dataReader["Airline_name"].ToString();


                if (dataReader["Pasaport_number"] != DBNull.Value)
                {
                    customer.Pasaport_number = Convert.ToInt32(dataReader["Pasaport_number"].ToString());

                }
                else
                {
                    customer.Pasaport_number = -1;
                }

                // customer.Pasaport_number = dataReader["Pasaport_number"] == System.DBNull.Value ? default(int) : (int)dataReader["Pasaport_number"];

                customer.Customer_phone = Convert.ToInt32(dataReader["Customer_phone"].ToString());
                customerList.Add(customer);
            }
            connection.Close();
            dash.Customer_list = customerList;
            //
            connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["MyDatabase"].ConnectionString);
            command = new SqlCommand();
            connection.Open();
            command.Connection = connection;
            command.CommandText = "exec deniz";
            dataReader = command.ExecuteReader();
            while (dataReader.Read())
            {
               dash.OnurAir_Bronze = Convert.ToInt32(dataReader["OnurAir_Bronze"].ToString());
                dash.OnurAir_Silver = Convert.ToInt32(dataReader["OnurAir_Silver"].ToString());
                dash.OnurAir_Gold = Convert.ToInt32(dataReader["OnurAir_Gold"].ToString());


                dash.THY_Bronze = Convert.ToInt32(dataReader["THY_Bronze"].ToString());
                dash.THY_Silver = Convert.ToInt32(dataReader["THY_Silver"].ToString());
                dash.THY_Gold = Convert.ToInt32(dataReader["THY_Gold"].ToString());

                dash.Pegasus_Bronze = Convert.ToInt32(dataReader["Pegasus_Bronze"].ToString());
                dash.Pegasus_Silver = Convert.ToInt32(dataReader["Pegasus_Silver"].ToString());
                dash.Pegasus_Gold = Convert.ToInt32(dataReader["Pegasus_Gold"].ToString());

                dash.ToplamBronze= Convert.ToInt32(dataReader["ToplamBronze"].ToString());
                dash.ToplamSilver = Convert.ToInt32(dataReader["ToplamSilver"].ToString());
                dash.ToplamGold = Convert.ToInt32(dataReader["ToplamGold"].ToString());

                dash.ToplamAirline_Sayisi = Convert.ToInt32(dataReader["ToplamAirline_Sayisi"].ToString());
                dash.Toplam_Customer_sayisi= Convert.ToInt32(dataReader["Toplam_Customer_sayisi"].ToString());
                dash.Toplam_FFC_sayisi = Convert.ToInt32(dataReader["Toplam_FFC_sayisi"].ToString());

            }
            connection.Close();
            return dash;
        }

    }
}