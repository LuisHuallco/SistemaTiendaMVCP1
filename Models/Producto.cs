namespace SistemaTienda.Models
{
    public class Producto
    {
        public int ProductoId { get; set; }
        public string Nombre { get; set; }
        public string Talla { get; set; }
        public string Color { get; set; }
        public decimal Precio { get; set; }
        public ICollection<Compra>? Compras { get; set; } = new List<Compra>();
    }
}
