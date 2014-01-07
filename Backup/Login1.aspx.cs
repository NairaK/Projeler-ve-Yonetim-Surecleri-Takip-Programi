using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace WebApplication3
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUsername.Focus();
        }
        private static int yetki;
        private static string KullaniciAdi;
        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlOps sql = new SqlOps();
            string query = "SELECT COUNT(*) FROM UserTable1 WHERE UserName = '" + txtUsername.Text + "' AND Password ='" + txtPassword.Text + "'"; //Querry
            int result = sql.LoginCmd(query);   //ExecuteScalar
            if (result == 1)// (result >= 1)
            {
                query = "SELECT Yetki FROM UserTable1 WHERE UserName = '" + txtUsername.Text + "' AND Password = '" + txtPassword.Text + "'"; //Querry
                yetki = sql.LoginCmd(query);
                KullaniciAdi = txtUsername.Text;
                Response.Redirect("Yonlendir.aspx?yetki="+yetki+"");
            }
            else
                lblMessage.Text = "Kullanıcı adı veya şifre yanlış!";
        }

        public string getKAdi()
        {
            return KullaniciAdi;
        }
        
        public string getYetki()
        {
            return yetki.ToString();
        }
    }
}