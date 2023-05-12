using SouvenirSales.WebUI.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SouvenirSales.WebUI.Models.ViewModels
{
    public class OrderViewModel
    {
        public List<Order> Order { get; set; }
        public List<OrderProduct> OrderProducts { get; set; }
    }
}