using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Minimarket.Controllers
{
    public class ProductoController : Controller
    {
        // GET: Producto
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Admin()
        {
            return View();
        }


        public JsonResult listarTodo()
        {
            List<Minimarket.Models.Producto> elListado = new List<Models.Producto>();


            MinimarketEntities misDatos = new MinimarketEntities();
            foreach (tblProducto elemento in misDatos.tblProducto)
            {
                Minimarket.Models.Producto objeto01 = new Models.Producto();
                objeto01.Codigo = elemento.Codigo;
                objeto01.Nombre = elemento.Nombre;
                objeto01.Descripcion = elemento.Descripcion;
                objeto01.Precio = elemento.Precio;
                objeto01.Stock = elemento.Stock;
                objeto01.Imagen = elemento.Imagen;

                elListado.Add(objeto01);
            }


            return Json(elListado, JsonRequestBehavior.AllowGet);
        }

        public JsonResult listarPorCategoria(byte argCodigoCategoria)
        {
            List<Minimarket.Models.Producto> elListado = new List<Models.Producto>();


            MinimarketEntities misDatos = new MinimarketEntities();
            foreach (tblProducto elemento in misDatos.tblProducto.Where(x => x.CodigoCategoria == argCodigoCategoria))
            {
                Minimarket.Models.Proveedor aux01 = new Minimarket.Models.Proveedor();
                aux01.Nombre = elemento.tblProveedor.Nombre;

                Minimarket.Models.Categoria aux02 = new Minimarket.Models.Categoria();
                aux02.Nombre = elemento.tblCategoria.Nombre;


                Minimarket.Models.Producto objeto01 = new Models.Producto();
                objeto01.Codigo = elemento.Codigo;
                objeto01.Nombre = elemento.Nombre;
                objeto01.Descripcion = elemento.Descripcion;
                objeto01.Precio = elemento.Precio;
                objeto01.Stock = elemento.Stock;
                objeto01.Imagen = elemento.Imagen;
                objeto01.CodigoProveedor = aux01;
                objeto01.CodigoCategoria = aux02;

                elListado.Add(objeto01);
            }


            return Json(elListado, JsonRequestBehavior.AllowGet);
        }
    }
}