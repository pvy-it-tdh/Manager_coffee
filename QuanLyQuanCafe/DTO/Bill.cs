using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DTO
{
    public class Bill
    {


        public Bill(int id,DateTime? dateCheckin, DateTime? dateCheckOut,int status,int discount=0)
        {
            ID = id;
            DateCheckOut = dateCheckOut;
            DateCheckIn = dateCheckIn;
            Status = status;
            Discount = discount;

        }
        public Bill(DataRow row)
        {
            ID =(int) row["id"];
            var dateCheckOutTemp = row["dateCheckOut"];
            if(dateCheckOutTemp.ToString()!="")
                
            DateCheckOut = (DateTime?)dateCheckOutTemp;
            DateCheckIn = (DateTime?)row["dateCheckIn"];    
            Status = (int)row["status"];
            if (row["discount"].ToString() != "")
                this.Discount = (int)row["discount"];

        }

        public Bill()
        {
        }

        private int iD;

        public int ID 
        { 
            get => iD;
            set => iD = value;
        }
        private DateTime? dateCheckIn;


        public DateTime? DateCheckIn 
        { 
            get => dateCheckIn;
            set => dateCheckIn = value; 
        }
       

        private  DateTime? dateCheckOut;
        public DateTime? DateCheckOut 
        { 
            get => dateCheckOut; 
            set => dateCheckOut = value;
        
        }
        

        private int status;
        public int Status 
        { 
            get => status; 
            set => status = value;
        }
        private int discount;
        public int Discount
        { 
            get => discount;
            set => discount = value;
        }
        public object DataCheckin { get; }
       
    }
}
