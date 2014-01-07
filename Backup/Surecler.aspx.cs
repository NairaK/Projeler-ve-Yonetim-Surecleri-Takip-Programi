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
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlOps Sql = new SqlOps();
        DataSet ds = new DataSet();
        private static string kAdi, yetki;
        private string query;
        private int tarihYaz;
        Login1 l1 = new Login1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (l1.getYetki() == "2")
                ImageButton2.Visible = false;
            kAdi = l1.getKAdi();
            yetki = l1.getYetki();
            Label2.Text = kAdi;
            if (!Page.IsPostBack)
                RefreshTable();
        }
        
        public static int SurecID { get; set; }
        private void RefreshTable()
        {
            dvProje.Dispose();
            query = "SELECT * FROM Surecler where silindi <> 'D'";
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
            Response.Redirect("WebForm2.aspx?sayfa=0");
            RefreshTable();
        }

        protected void search_btn_Click(object sender, EventArgs e)
        {
            Label1.Visible = false;
            if (TextBox1.Text != "")
            {
                query = "SELECT * FROM Surecler WHERE surecNumarasi = '" + TextBox1.Text + "' and silindi = 'N'";
                SqlDataReader reader = Sql.Search(query);
                if (!reader.HasRows)    //not found
                {
                    Label1.Visible = true;
                    TextBox1.Text = "";
                    RefreshTable();
                    return;
                }
                dvProje.AllowPaging = false;
                dvProje.DataSource = reader;
                dvProje.DataBind();
                dvProje.AllowPaging = true;
            }
            else
                RefreshTable();
            TextBox1.Text = "";
        }

        protected void delete_btn_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                query = "UPDATE Surecler SET  silindi = 'D', silinmeTarihi = GetDate() where surecNumarasi = '" + TextBox1.Text + "'";
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
            string surecNumarasi = dvProje.Rows[e.RowIndex].Cells[0].Text;
            string surecAdi = ((TextBox)dvProje.Rows[e.RowIndex].FindControl("TextBox1")).Text;
            string surecSahibi = ((TextBox)dvProje.Rows[e.RowIndex].FindControl("TextBox2")).Text;
            string CMMISurecAlani = ((TextBox)dvProje.Rows[e.RowIndex].FindControl("TextBox3")).Text;
            string izlemeMetrigi = ((TextBox)dvProje.Rows[e.RowIndex].FindControl("TextBox4")).Text;
            string raporPeriyodu = ((TextBox)dvProje.Rows[e.RowIndex].FindControl("TextBox5")).Text;
            string Hedef = "" + Convert.ToDouble(((TextBox)dvProje.Rows[e.RowIndex].FindControl("TextBox6")).Text.Replace(".", ","));
            string olcuBirimi = ((TextBox)dvProje.Rows[e.RowIndex].FindControl("TextBox7")).Text;

            //Hedef.Replace(",", ".");
            //double Hedef1 = Convert.ToDouble(Hedef.Replace(".",","));


            query = "UPDATE Surecler SET surecAdi = '" + surecAdi + "', surecSahibi = " + surecSahibi + ", CMMISurecAlani = '" + CMMISurecAlani + "', izlemeMetrigi = '" + izlemeMetrigi + "', raporPeriyodu = '" + raporPeriyodu + "', Hedef = " + Hedef.Replace(",",".") + ", olcuBirimi = '" + olcuBirimi + "', guncellemeTarihi = GetDate() where surecNumarasi = '" + surecNumarasi + "'";
            Sql.UpdateCmd(query);
            dvProje.EditIndex = -1;
            Label6.Visible = false;
            RefreshTable();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Projeler.aspx");
        }

        protected void dvProje_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dvProje.PageIndex = e.NewPageIndex;
            RefreshTable();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            if (tarihYaz == 0)
                TextBox8.Text = Calendar1.SelectedDate.Date.ToString();
            else if (tarihYaz == 1)
                TextBox9.Text = Calendar1.SelectedDate.Date.ToString();
            Calendar1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
            tarihYaz = 0;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
            tarihYaz = 1;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
