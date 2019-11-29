using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Minimarket.Controllers
{
    public class CategoriaController : Controller
    {
        // GET: Categoria
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult listarTodo()
        {
            List<Minimarket.Models.Categoria> elListado = new List<Models.Categoria>();


            MinimarketEntities misDatos = new MinimarketEntities();
            foreach (tblCategoria elemento in misDatos.tblCategoria)
            {
                Minimarket.Models.Categoria objeto01 = new Models.Categoria();
                objeto01.Codigo = elemento.Codigo;
                objeto01.Nombre = elemento.Nombre;
                objeto01.Descripcion = elemento.Descripcion;
                elListado.Add(objeto01);
            }


            return Json(elListado, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Buscar_PorCodigo(int argCodigo)
        {
            List<Minimarket.Models.Categoria> elListado = new List<Models.Categoria>();

            MinimarketEntities misDatos = new MinimarketEntities();
            foreach (tblCategoria elemento in misDatos.tblCategoria.Where(x => x.Codigo == argCodigo))
            {

                Minimarket.Models.Categoria objeto01 = new Models.Categoria();
                objeto01.Codigo = elemento.Codigo;
                objeto01.Nombre = elemento.Nombre;
                objeto01.Descripcion = elemento.Descripcion;

                elListado.Add(objeto01);
            }

            return Json(elListado, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public bool Editar(Minimarket.Models.Categoria argNuevosDatosDeCategoria)
        {
            MinimarketEntities misDatos = new MinimarketEntities();

            tblCategoria categoriaExistente =
                misDatos.tblCategoria.Where(x => x.Codigo == argNuevosDatosDeCategoria.Codigo).First();

            categoriaExistente.Nombre = argNuevosDatosDeCategoria.Nombre;
            categoriaExistente.Descripcion = argNuevosDatosDeCategoria.Descripcion;


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

        public bool Insertar(tblCategoria categoria)
        {
            MinimarketEntities misDatos = new MinimarketEntities();

            misDatos.tblCategoria.Add(categoria);

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

        public bool Eliminar(Minimarket.Models.Categoria argIdCategoria)
        {
            MinimarketEntities misDatos = new MinimarketEntities();

            tblCategoria categoria =
                misDatos.tblCategoria.Where(x => x.Codigo == argIdCategoria.Codigo).First();
            misDatos.tblCategoria.Remove(categoria);

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