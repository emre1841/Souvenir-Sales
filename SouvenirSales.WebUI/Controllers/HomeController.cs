using SouvenirSales.WebUI.Models.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SouvenirSales.WebUI.Controllers
{
    public class HomeController : Controller
    {
        SouvenirSalesDbContext context = new SouvenirSalesDbContext();
        public ActionResult Index()
        {
            var products = context.Products.ToList();
            return View(products);
        }
       

    }
}