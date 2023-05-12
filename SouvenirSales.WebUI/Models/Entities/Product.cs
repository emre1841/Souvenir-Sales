using SouvenirSales.WebUI.Models.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SouvenirSales.WebUI.Models.Entities
{
    public class Product : EntityBase
    {
        public string Name { get; set; }
        public int CategoryId { get; set; }
        public Category Category { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public string ImageUrl { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
    }
}