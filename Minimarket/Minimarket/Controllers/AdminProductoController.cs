using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Minimarket.Controllers
{
    public class AdminProductoController : Controller
    {
        // GET: AdminProducto
        public ActionResult Index()
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

        public JsonResult Buscar_PorCodigo(int argCodigo)
        {
            List<Minimarket.Models.Producto> elListado = new List<Models.Producto>();

            MinimarketEntities misDatos = new MinimarketEntities();
            foreach (tblProducto elemento in misDatos.tblProducto.Where(x => x.Codigo == argCodigo))
            {
                Minimarket.Models.Proveedor aux01 = new Minimarket.Models.Proveedor();
                aux01.Nombre = elemento.tblProveedor.Nombre;
                aux01.Codigo = elemento.tblProveedor.Codigo;

                Minimarket.Models.Categoria aux02 = new Minimarket.Models.Categoria();
                aux02.Nombre = elemento.tblCategoria.Nombre;
                aux02.Codigo = elemento.tblCategoria.Codigo;

                Minimarket.Models.Producto objeto01 = new Models.Producto();
                objeto01.Codigo = elemento.Codigo;
                objeto01.Nombre = elemento.Nombre;
                objeto01.Descripcion = elemento.Descripcion;
                objeto01.CodigoProveedor = aux01;
                objeto01.CodigoCategoria = aux02;
                objeto01.Precio = elemento.Precio;
                objeto01.Stock = elemento.Stock;
                objeto01.Imagen = elemento.Imagen; //Nuevo
                elListado.Add(objeto01);
            }

            return Json(elListado, JsonRequestBehavior.AllowGet);
        }

        public bool Editar(Minimarket.Models.Producto argNuevosDatosDeProducto)
        {
            MinimarketEntities misDatos = new MinimarketEntities();

            tblProducto productoExistente =
                misDatos.tblProducto.Where(x => x.Codigo == argNuevosDatosDeProducto.Codigo).First();

            productoExistente.Nombre = argNuevosDatosDeProducto.Nombre;
            productoExistente.Descripcion = argNuevosDatosDeProducto.Descripcion;
            productoExistente.Precio = argNuevosDatosDeProducto.Precio;
            productoExistente.Stock = argNuevosDatosDeProducto.Stock;
            //CUIDADO 22222222 ---------------------
            productoExistente.CodigoCategoria = argNuevosDatosDeProducto.CodigoCategoria.Codigo;
            productoExistente.CodigoProveedor = argNuevosDatosDeProducto.CodigoProveedor.Codigo;
            //CUIDADO 22222222 ---------------------
            try
            {
                misDatos.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public bool Insertar(tblProducto producto)
        {
            MinimarketEntities misDatos = new MinimarketEntities();

            misDatos.tblProducto.Add(producto);

            try
            {
                misDatos.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public bool Eliminar(Minimarket.Models.Producto argIdProducto)
        {
            MinimarketEntities misDatos = new MinimarketEntities();

            tblProducto producto = misDatos.tblProducto.Where(x => x.Codigo == argIdProducto.Codigo).First();
            misDatos.tblProducto.Remove(producto);

            try
            {
                misDatos.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
    }
}