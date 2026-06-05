using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using SistemaTienda.Models;

public class ComprasController : Controller
{
    private readonly TiendaContext _context;

    public ComprasController(TiendaContext context)
    {
        _context = context;
    }

    // GET: COMPRAS
    public async Task<IActionResult> Index()
    {
        var compras = _context.Compras
            .Include(c => c.Cliente)
            .Include(c => c.Producto);

        return View(await compras.ToListAsync());
    }

    // GET: COMPRAS/Details/5
    public async Task<IActionResult> Details(int? id)
    {
        if (id == null)
        {
            return NotFound();
        }

        var compra = await _context.Compras
            .Include(c => c.Cliente)
            .Include(c => c.Producto)
            .FirstOrDefaultAsync(m => m.CompraId == id);

        if (compra == null)
        {
            return NotFound();
        }

        return View(compra);
    }

    // GET: COMPRAS/Create
    public IActionResult Create()
    {
        ViewData["ClienteId"] = new SelectList(_context.Clientes, "ClienteId", "Nombre");
        ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "Nombre");

        return View();
    }

    // POST: COMPRAS/Create
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create([Bind("CompraId,ClienteId,ProductoId,Fecha,Cantidad,Total")] Compra compra)
    {
        if (ModelState.IsValid)
        {
            var producto = await _context.Productos.FindAsync(compra.ProductoId);
            if (producto != null)
            {
                compra.Total = producto.Precio * compra.Cantidad;
            }

            _context.Add(compra);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        ViewData["ClienteId"] = new SelectList(_context.Clientes, "ClienteId", "Nombre", compra.ClienteId);
        ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "Nombre", compra.ProductoId);

        return View(compra);
    }

    // GET: COMPRAS/Edit/5
    public async Task<IActionResult> Edit(int? id)
    {
        if (id == null)
        {
            return NotFound();
        }

        var compra = await _context.Compras.FindAsync(id);
        if (compra == null)
        {
            return NotFound();
        }

        ViewData["ClienteId"] = new SelectList(_context.Clientes, "ClienteId", "Nombre", compra.ClienteId);
        ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "Nombre", compra.ProductoId);

        return View(compra);
    }

    // POST: COMPRAS/Edit/5
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(int id, [Bind("CompraId,ClienteId,ProductoId,Fecha,Cantidad,Total")] Compra compra)
    {
        if (id != compra.CompraId)
        {
            return NotFound();
        }

        if (ModelState.IsValid)
        {
            try
            {
                var producto = await _context.Productos.FindAsync(compra.ProductoId);
                if (producto != null)
                {
                    compra.Total = producto.Precio * compra.Cantidad;
                }

                _context.Update(compra);
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CompraExists(compra.CompraId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToAction(nameof(Index));
        }

        ViewData["ClienteId"] = new SelectList(_context.Clientes, "ClienteId", "Nombre", compra.ClienteId);
        ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "Nombre", compra.ProductoId);

        return View(compra);
    }

    // GET: COMPRAS/Delete/5
    public async Task<IActionResult> Delete(int? id)
    {
        if (id == null)
        {
            return NotFound();
        }

        var compra = await _context.Compras
            .Include(c => c.Cliente)
            .Include(c => c.Producto)
            .FirstOrDefaultAsync(m => m.CompraId == id);

        if (compra == null)
        {
            return NotFound();
        }

        return View(compra);
    }

    // POST: COMPRAS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(int? id)
    {
        var compra = await _context.Compras.FindAsync(id);
        if (compra != null)
        {
            _context.Compras.Remove(compra);
        }

        await _context.SaveChangesAsync();
        return RedirectToAction(nameof(Index));
    }

    private bool CompraExists(int? id)
    {
        return _context.Compras.Any(e => e.CompraId == id);
    }
}