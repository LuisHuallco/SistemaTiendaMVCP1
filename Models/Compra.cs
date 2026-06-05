namespace SistemaTienda.Models
{
    public class Compra
    {
        public int CompraId { get; set; }
        public int ClienteId { get; set; }
        public Cliente? Cliente { get; set; }  
        public int ProductoId { get; set; }
        public Producto? Producto { get; set; }
        public DateTime Fecha { get; set; } = DateTime.Now;
        public int Cantidad { get; set; }
        public decimal Total { get; set; }
    }
}