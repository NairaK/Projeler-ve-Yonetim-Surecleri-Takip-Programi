using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class Projeler : System.Web.UI.Page
    {
        SqlOps Sql = new SqlOps();
        DataSet ds = new DataSet();
        private static string kAdi, yetki;
        private string query;
        Login1 l1 = new Login1();
        protected void Page_Load(object sender, EventArgs e)
        {
            kAdi = l1.getKAdi();
            yetki = l1.getYetki();
            Label2.Text = kAdi;
            if (!Page.IsPostBack)
                RefreshTable();
        }

        public static int projeKodu { get; set; }
        private void RefreshTable()
        {
            dvProje.Dispose();
            query = "SELECT * FROM Projeler  where silindi <> 'D'";
            SqlDataAdapter da = Sql.SelectCmd(query);
            da.Fill(ds);
            try
            {
                dvProje.DataSource = ds;
                dvProje.DataBind();
            }
            catch { }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            RefreshTable();
        }

        protected void add_btn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("WebForm2.aspx?sayfa=1");
            RefreshTable();
        }

        protected void search_btn_Click(object sender, ImageClickEventArgs e)
        {
            Label1.Visible = false;
            if (TextBox1.Text != "")
            {
                query = "SELECT * FROM Projeler WHERE projeKodu = '" + TextBox1.Text + "' and silindi = 'N'";
                SqlDataReader reader = Sql.Search(query);
                if (!reader.HasRows)    //not found
                {
                    Label1.Visible = true;
                    TextBox1.Text = "";
                    RefreshTable();
                    return;
                }
                dvProje.DataSource = reader;
                dvProje.DataBind();
            }
            else
                RefreshTable();
            TextBox1.Text = "";
        }

        protected void delete_btn_Click(object sender, ImageClickEventArgs e)
        {
            if (TextBox1.Text != "")
            {
                query = "UPDATE Projeler SET  silindi = 'D', silinmeTarihi = GetDate() where projeKodu = '" + TextBox1.Text + "'";
                Sql.DeleteSurec(query);
                TextBox1.Text = "";
                RefreshTable();
                return;
            }
        }

        protected void dvProje_RowEditing(object sender, GridViewEditEventArgs e)
        {
            dvProje.EditIndex = e.NewEditIndex;
            Label6.Visible = true;
            RefreshTable();
        }

        protected void dvProje_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            dvProje.EditIndex = -1;
            Label6.Visible = false;
            RefreshTable();
        }

        protected void dvProje_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string projeKodu = dvProje.Rows[e.RowIndex].Cells[0].Text;
            string projeTanimi = ((TextBox)dvProje.Rows[e.RowIndex].FindControl("TextBox1")).Text;
            string projeYoneticisi = ((TextBox)dvProje.Rows[e.RowIndex].FindControl("TextBox2")).Text;
            string olcumAnalizSorumlusu = ((TextBox)dvProje.Rows[e.RowIndex].FindControl("TextBox3")).Text;

            query = "UPDATE Projeler SET projeTanimi = '" + projeTanimi + "', projeYoneticisi = '" + projeYoneticisi + "',olcumAnalizSorumlusu = '" + olcumAnalizSorumlusu + "', guncellemeTarihi = GetDate() where projeKodu = '" + projeKodu + "'";
            Sql.UpdateCmd(query);
            dvProje.EditIndex = -1;
            Label6.Visible = false;
            RefreshTable();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Surecler.aspx");
        }
    }
}