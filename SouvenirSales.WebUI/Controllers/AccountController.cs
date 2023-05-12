using SouvenirSales.WebUI.Models.Context;
using SouvenirSales.WebUI.Models.Entities;
using SouvenirSales.WebUI.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SouvenirSales.WebUI.Controllers
{
    public class AccountController : Controller
    {
        SouvenirSalesDbContext context = new SouvenirSalesDbContext();
        // GET: Account
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginViewModel model)
        {
            var user = context.Users.Where(u => u.Email == model.Email && u.Password == model.Password).FirstOrDefault();
            try
            {
                if (user != null)
                {
                    Session["userId"] = user.ID;
                    Session["userRole"] = user.IsAdmin;
                    Session["userName"] = user.Name+" "+user.LastName;
                    if (user.IsAdmin)
                    {
                        return RedirectToAction("Index", "Admin");

                    }
                    return RedirectToAction("Index", "Home");
                }
            }
            catch (Exception)
            {

                throw;
            }
            return View();
        }

        public ActionResult Register()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Register(RegisterViewModel model)
        {
            if (model.Password != model.ConfirmPassword)
            {
                return View();
            }
            try
            {
                User user = new User
                {
                    Name = model.Name,
                    LastName = model.LastName,
                    Adress = model.Adress,
                    CreateDate = DateTime.Now,
                    Email = model.Email,
                    CreateUserID = 0,
                    IsActive = true,
                    IsAdmin = false,
                    TCKN = model.TCKN,
                    Password = model.Password,
                    Telephone = model.Telephone
                };

                context.Users.Add(user);
                context.SaveChanges();
            }
            catch (Exception)
            {

                throw;
            }


            return RedirectToAction("Login", "Account");
        }

        public ActionResult LogOut()
        {
            Session.RemoveAll();
            return RedirectToAction("Login");
        }
    }
}