using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DAO
{
    public class DataProvider
    {
        private static DataProvider instance;
        private string ConnectionSTR = "Data Source=PHUC-VY\\SQLEXPRESS;Initial Catalog=Quanliquancafe;Integrated Security=True";
        private DataProvider() { }
        public static DataProvider Instance
        {
            get
            {
                if (instance == null)
                {
                    DataProvider dataProvider = new DataProvider();
                    instance = dataProvider;
                }
                return instance;
            }
            private set => instance = value;
        }


        public DataTable Excute(string query, object[] parameter = null)
        {
            DataTable data = new DataTable();
            using (SqlConnection connection = new System.Data.SqlClient.SqlConnection(ConnectionSTR))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);
                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command);
                  sqlDataAdapter.Fill(data);
                connection.Close();
            }
            return data;

        }
        public int ExcuteNon(string query, object[] parameter = null)
        {
            int data = 0;
            using (SqlConnection connection = new System.Data.SqlClient.SqlConnection(ConnectionSTR))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);
                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            _ = command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteNonQuery();
                connection.Close();
            }
            return data;

        }
        public object ExcuteScalar(string query, object[] parameter = null)
        {
            object data = 0;
            using (SqlConnection connection = new System.Data.SqlClient.SqlConnection(ConnectionSTR))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);
                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            _ = command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteScalar();
                connection.Close();
            }
            return data;

        }

    }
}
