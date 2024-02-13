using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DTO
{
    public class Menu
    {
        public Menu(string foodName, int count, float price, float totalPrice)
        {
            FoodName = foodName;
            Count = count;
            Price = price;
            TotalPrice = totalPrice;
        }
        public Menu(DataRow row)
        {
            FoodName = row["name"].ToString();
            Count = (int)row["count"];
            Price = (float)Convert.ToDouble(row["price"].ToString());
            TotalPrice = (float)Convert.ToDouble(row["totalPrice"].ToString());
        }
        private float totalPrice;
        private float price;
        private int count;
        private string foodName;

        public string FoodName
        {
            get => foodName;
            set => foodName = value;
        }
        public int Count
        {
            get => count;
            set => count = value;
        }
        public float Price
        {
            get => price;
            set => price = value;
        }
        public float TotalPrice
        {
            get => totalPrice;
            set => totalPrice = value;
        }
    }
}
