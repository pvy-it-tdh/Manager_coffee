using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DTO
{
    
    public class BillInfo
    {
        public BillInfo(int id, int billID,int foodID,int count)

        {
            ID = id;
            BillID = billID;
            FoodID = foodID;
            Count = count;
        }

        private int iD;

        public int ID 
        { 
            get => iD; 
            set => iD = value;
        }
        private int billID;
        public int BillID 
        {
            get => billID;
            set => billID = value;
        }
       

        private int foodID;
        public int FoodID
        {
            get => foodID; 
            set => foodID = value;
        }
        

        private int count;
    

        public int Count 
        { 
            get => count; 
            set => count = value;
        }
        public BillInfo(DataRow row)
        {
            this.ID = (int)row["id"];
            this.BillID = (int)row["idbill"];
            this.FoodID = (int)row["idfood"];
            this.Count = (int)row["count"];
        }
        
    }
}
