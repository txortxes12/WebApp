using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebApplication6
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                gdvLista.VirtualItemCount = Count();
                CargarData(1, 5);
            }
        }

        private void CargarData(int starIndex, int maxRows)
        {
            gdvLista.DataSource = new ProductBl().GetPaginacionByDesc(starIndex, maxRows, txtDesc.Text);
            gdvLista.DataBind(); 
        }
        private int Count()
        {
            var desc = txtDesc.Text;
            return new ProductBl().GetPaginacionCount(desc);
        }


        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            gdvLista.VirtualItemCount = Count();
            CargarData(1, 5); 
        }

        protected void gdvLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvLista.PageIndex = e.NewPageIndex;
            CargarData(e.NewPageIndex + 1, 5);
        }
        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            int pagina = gdvLista.PageIndex;
            gdvLista.EditIndex = e.NewEditIndex;//
            this.CargarData(pagina +1,5);
        }
        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gdvLista.Rows[e.RowIndex];
        
            int productID = Convert.ToInt32((row.FindControl("txtCodigo") as TextBox).Text);
            string descripcion = (row.FindControl("txtdescripcion") as TextBox).Text;
            decimal precio =Convert.ToDecimal((row.FindControl("txtPrecio") as TextBox).Text);
            short stock = Convert.ToInt16((row.FindControl("txtUnitsStock") as TextBox).Text);
            using (NorthwindEntities entities = new NorthwindEntities())
            {
                Products product = (from c in entities.Products
                                     where c.ProductID == productID
                                     select c).FirstOrDefault();
                product.ProductName = descripcion;
                product.UnitPrice = precio;
                product.UnitsInStock = stock;
                entities.SaveChanges();
            }
            gdvLista.EditIndex = -1;
            int pagina = gdvLista.PageIndex;
            this.CargarData(pagina+1,5);


        }
        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            gdvLista.EditIndex = -1;
            int pagina = gdvLista.PageIndex;
            this.CargarData(pagina + 1, 5);
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = gdvLista.Rows[e.RowIndex];
            int productID = Convert.ToInt32((row.FindControl("txtCodigo") as TextBox).Text);
            using (NorthwindEntities entities = new NorthwindEntities())
            {
                Products product = (from c in entities.Products
                                     where c.ProductID == productID
                                     select c).FirstOrDefault();
                entities.Products.Remove(product);
                entities.SaveChanges();
            }
        
        }
    
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != gdvLista.EditIndex)
            {
                (e.Row.Cells[4].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Quieres borrar este registro?');";
            }
        }
    }
}