using SouvenirSales.WebUI.Models.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using SouvenirSales.WebUI.Models.ViewModels;

namespace SouvenirSales.WebUI.Controllers
{
    public class AdminController : Controller
    {
        SouvenirSalesDbContext context = new SouvenirSalesDbContext();
        // GET: Admin
        public ActionResult Index()
        {
            StatisticViewModel model = new StatisticViewModel();
            int userCount = context.Users.Where(u => u.IsAdmin == false).Count();
            int productCount = context.Products.Count();
            int orderCount = context.Orders.Count();
            int categoryCount = context.Categories.Count();
            model.UserCount = userCount;
            model.ProductCount = productCount;
            model.OrderCount = orderCount;
            model.CategoryCount = categoryCount;

            return View(model);
        }
        public ActionResult UserList()
        {
            var users = context.Users.Where(c => c.IsAdmin == false).ToList();
            return View(users);
        }
        public ActionResult OrderList()
        {
             var order = context.Orders.Include(u=>u.User).ToList();
            
            return View(order);
        }
        public ActionResult OrderProducts(int id)
        {
            var products = context.OrderProducts.Include(p=>p.Product).Where(p => p.OrderId == id).ToList();
            return View(products);
        }



    }
}
