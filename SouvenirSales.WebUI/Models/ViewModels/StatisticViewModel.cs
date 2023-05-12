using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SouvenirSales.WebUI.Models.ViewModels
{
    public class StatisticViewModel
    {
        public int UserCount { get; set; }
        public int OrderCount { get; set; }
        public int CategoryCount { get; set; }
        public int ProductCount { get; set; }
    }
}