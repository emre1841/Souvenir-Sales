using SouvenirSales.WebUI.Models.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SouvenirSales.WebUI.Models.Entities
{
    public class User : EntityBase
    {
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Telephone { get; set; }
        public string Password { get; set; }
        public string TCKN { get; set; }
        public string Adress { get; set; }
        public bool IsActive { get; set; }
        public bool IsAdmin { get; set; }

    }
}