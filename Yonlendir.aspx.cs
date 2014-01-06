using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Yonlendir : System.Web.UI.Page
    {
        public string yetki;

        protected void Page_Load(object sender, EventArgs e)
        {
            yetki = Request.QueryString["yetki"];
        }
    }
}