using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DAO
{
   public class AccountDAO
    {
        private  static AccountDAO instance;

        public static AccountDAO Instance { 
            get
            {
                if(instance==null)
                {
                    instance = new AccountDAO();
                }    
                return instance;
            }
            
            set => instance = value; 
        }
        private AccountDAO() { }
        public bool Login(string userName,string passWord)
        {
            string query = "SELECT * FROM dbo.Account WHERE Username like N'"+userName+"' AND PassWord like N'"+passWord+"'";
            DataTable result = DataProvider.Instance.Excute(query);
            return result.Rows.Count>0;
        }

        internal bool Login()
        {
            throw new NotImplementedException();
        }
    }
}
