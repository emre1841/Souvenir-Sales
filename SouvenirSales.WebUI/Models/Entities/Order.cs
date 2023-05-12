using SouvenirSales.WebUI.Models.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SouvenirSales.WebUI.Models.Entities
{
    public class Order : EntityBase
    {
        public int UserId { get; set; }
        public User User { get; set; }
        public decimal TotalPrice { get; set; }
        public List<OrderProduct> OrderProducts { get; set; }
    }
}