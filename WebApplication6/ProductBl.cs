using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication6
{
    public class ProductBl
    {
        NorthwindEntities _ctx = new NorthwindEntities();

        public List<Products> GetPaginacionByDesc(int startIndex, int maxRows, string desc)
        {
            var resul = (from oc in _ctx.Products where oc.ProductName.Contains(desc) select oc)
                .OrderBy(p => p.ProductID).
                Skip((startIndex - 1) * maxRows).Take(maxRows);
            return resul.ToList();
        }
        public int GetPaginacionCount(string desc)
        {
            return _ctx.Products.Count(p => p.ProductName.Contains(desc));     
        }
    }
}
