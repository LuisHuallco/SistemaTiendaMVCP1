using Microsoft.EntityFrameworkCore;
using SistemaTienda.Models;

public class TiendaContext : DbContext
{
    public TiendaContext(DbContextOptions<TiendaContext> options)
        : base(options)
    {
    }

    public DbSet<Producto> Productos { get; set; }
    public DbSet<Cliente> Clientes { get; set; }
    public DbSet<Compra> Compras { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Producto>()
            .Property(p => p.Precio)
            .HasPrecision(18, 2);

        modelBuilder.Entity<Compra>()
            .Property(c => c.Total)
            .HasPrecision(18, 2);
    }
}