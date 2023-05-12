using SouvenirSales.WebUI.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SouvenirSales.WebUI.Models.ViewModels
{
    public class BasketViewModel
    {
        public List<Basket> Baskets { get; set; }
        public decimal TotalPrice { get; set; }
    }
}