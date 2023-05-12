using SouvenirSales.WebUI.Models.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SouvenirSales.WebUI.Models.Entities
{
    public class Category : EntityBase
    {
        
        public string Name { get; set; }
        public bool IsActive { get; set; }
    }
}