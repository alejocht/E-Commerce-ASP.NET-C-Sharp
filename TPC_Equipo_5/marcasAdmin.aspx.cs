﻿using Dominio.Productos;
using LecturaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_5
{
    public partial class marcasAdmin : System.Web.UI.Page
    {
        public List<Marca> listaLecturaMarca;
        string busqueda;
        public bool listaMostrable;
        protected void Page_Load(object sender, EventArgs e)
        {
            cargardatos();

            if (!IsPostBack)
            {
                cargarddl();
                dgvMarcas.DataSource = listaLecturaMarca;
                dgvMarcas.DataBind();
            }
        }

        protected void btnBusquedaMarca_Click(object sender, EventArgs e)
        {
            busqueda = txtBuscarMarca.Text;
            if (ValidarTextBox(busqueda))
            {
                filtrarMarca(busqueda);
                dgvMarcas.DataSource = listaLecturaMarca;
                dgvMarcas.DataBind();
            }
            else
            {
                cargardatos();
                dgvMarcas.DataSource = listaLecturaMarca;
                dgvMarcas.DataBind();
            }
        }

        protected void ddlOrdenarMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Marca> listaFiltrada;

            if (ddlOrdenarMarca.SelectedValue == "Ascendente")
            {
                listaFiltrada = listaLecturaMarca.OrderBy(x => x.nombre).ToList();
            }
            else if (ddlOrdenarMarca.SelectedValue == "Descendente")
            {
                listaFiltrada = listaLecturaMarca.OrderByDescending(x => x.nombre).ToList();
            }
            else
            {
                listaFiltrada = listaLecturaMarca.OrderBy(x => x.id).ToList();
            }
            listaLecturaMarca = listaFiltrada;
            dgvMarcas.DataSource = listaLecturaMarca;
            dgvMarcas.DataBind();
        }

        protected void dgvMarcas_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvMarcas.SelectedDataKey.Value.ToString();

            //Nueva ventana o usar javascript para abrir un modal
        }

        protected void btnAgregarMarca_Click(object sender, EventArgs e)
        {

        }
        public void cargardatos()
        {
            LecturaMarca lecturaMarca = new LecturaMarca();
            listaLecturaMarca = lecturaMarca.listar();
            dgvMarcas.DataSource = listaLecturaMarca;
            dgvMarcas.DataBind();
        }

        protected bool ValidarTextBox(string busqueda)
        {
            if (string.IsNullOrEmpty(busqueda))
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public void validarListaMostrable()
        {
            int cantidadRegistros = listaLecturaMarca.Count();
            listaMostrable = true;
            if (cantidadRegistros < 1)
            {
                listaMostrable = false;
            }
        }

        private void filtrarMarca(string filtro)
        {
            List<Marca> listaFiltrada;
            listaFiltrada = listaLecturaMarca.FindAll(x => x.nombre.ToUpper().Contains(filtro.ToUpper()));
            listaLecturaMarca = listaFiltrada;
        }

        public void cargarddl()
        {
            ddlOrdenarMarca.Items.Add("Por defecto");
            ddlOrdenarMarca.Items.Add("Ascendente");
            ddlOrdenarMarca.Items.Add("Descendente");
        }
    }
}