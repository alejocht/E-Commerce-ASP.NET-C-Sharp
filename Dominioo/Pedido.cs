using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio.Productos;
using Dominio.Usuarios;

namespace Dominio.Pedidos
{
    public class Pedido
    {
        public Pedido() 
        {
            id = -1;
            usuario = new Usuario();
            fecha = new DateTime();
            productos = new List<Producto>();
            importe = -1;
            estado = new EstadoPedido();
            metodoPago = new MetodoPago();
        }
        public int id { get; set; }
        public Usuario usuario { get; set; }
        public DateTime fecha { get; set; }
        public List<Producto> productos { get; set; }
        public decimal importe { get; set; }
        public EstadoPedido estado { get; set; }
        public MetodoPago metodoPago { get; set; }
    }
}
