using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        SqlOps Sql = new SqlOps();
        string sayfa, s;
        private string surecNumarasi, surecAdi, surecSahibi, CMMISurecAlani, izlemeMetrigi, raporPeriyodu, Hedef, olcuBirimi, projeKodu, projeTanimi, projeYoneticisi, olcumAnalizSorumlusu;
        Login1 l1 = new Login1();


        protected void Page_Load(object sender, EventArgs e)
        {
            Label10.Text = l1.getKAdi();
            sayfa = Request.QueryString["sayfa"].ToString();
            if (sayfa == "0")   //Süreç Sayfasından Yönlendirme
            {
                Label9.Text = "SÜREÇ EKLEME İŞLEMİ";
                Label1.Text = "Süreç Numarası : ";
                Label2.Text = "Süreç Adı : ";
                Label3.Text = "Süreç Sahibi : ";
                Label4.Text = "CMMI Süreç Alanı : ";
                Label5.Text = "İzleme Metriği : ";
                Label6.Text = "Rapor Periyodu : ";
                Label7.Text = "Hedef : ";
                Label8.Text = "Ölçü Birimi : ";
                Label5.Visible = true;
                Label6.Visible = true;
                Label7.Visible = true;
                Label8.Visible = true;
                Label12.Visible = true;
                Label13.Visible = true;
                Label14.Visible = false;
                TextBox5.Visible = true;
                TextBox6.Visible = true;
                TextBox7.Visible = true;
                TextBox8.Visible = true;
            }
            else if (sayfa == "1")  //Proje Sayfasından Yönlendirme
            {
                Label9.Text = "PROJE EKLEME İŞLEMİ";
                Label1.Text = "Proje Kodu : ";
                Label2.Text = "Proje Tanımı : ";
                Label3.Text = "Proje Yöneticisi : ";
                Label4.Text = "Ölçüm ve Analiz Sorumlusu : ";
                Label5.Visible = false;
                Label6.Visible = false;
                Label7.Visible = false;
                Label8.Visible = false;
                Label12.Visible = true;
                Label13.Visible = false;
                Label14.Visible = true;
                TextBox5.Visible = false;
                TextBox6.Visible = false;
                TextBox7.Visible = false;
                TextBox8.Visible = false;
            }
        }

        protected void add_btn_Click(object sender, ImageClickEventArgs e)
        {
            if (sayfa == "0")   //Süreç Sayfasına Veri Ekleme
            {
                surecNumarasi = TextBox1.Text;
                surecAdi = TextBox2.Text;
                surecSahibi = TextBox3.Text;
                CMMISurecAlani = TextBox4.Text;
                izlemeMetrigi = TextBox5.Text;
                raporPeriyodu = TextBox6.Text;
                Hedef = TextBox7.Text;
                olcuBirimi = TextBox8.Text;
                s = "SELECT * FROM Surecler WHERE surecNumarasi = '" + surecNumarasi + "'";
                SqlDataReader reader = Sql.Search(s);
                if (!reader.HasRows)
                {
                    s = "INSERT INTO Surecler ([surecNumarasi], [surecAdi], [surecSahibi], [CMMISurecAlani], [izlemeMetrigi], [raporPeriyodu],[Hedef],[olcuBirimi],[silindi],[eklenmeTarihi]) VALUES ('" + surecNumarasi + "','" + surecAdi + "','" + surecSahibi + "','" + CMMISurecAlani + "','" + izlemeMetrigi + "','" + raporPeriyodu + "','" + Hedef + "','" + olcuBirimi + "','N', GetDate())";
                    Sql.Insert(s);
                }
                else
                {
                    s = "UPDATE Surecler SET surecAdi = '" + surecAdi + "', surecSahibi = '" + surecSahibi + "',CMMISurecAlani = '" + CMMISurecAlani + "',izlemeMetrigi = '" + izlemeMetrigi + "',raporPeriyodu = '" + raporPeriyodu + "',Hedef = '" + Hedef + "',olcuBirimi = '" + olcuBirimi + "', silindi = 'N', guncellemeTarihi = GetDate() where surecNumarasi = '" + surecNumarasi + "'";
                    Sql.UpdateCmd(s);
                }
                Response.Redirect("Surecler.aspx");
            }
            else if (sayfa == "1")  //Proje Sayfasına Veri Ekleme
            {
                projeKodu = TextBox1.Text;
                projeTanimi = TextBox2.Text;
                projeYoneticisi = TextBox3.Text;
                olcumAnalizSorumlusu = TextBox4.Text;
                s = "SELECT * FROM Projeler WHERE projeKodu = '" + projeKodu + "'";
                SqlDataReader reader = Sql.Search(s);
                if (!reader.HasRows)
                {
                    s = "INSERT INTO Projeler ([projeKodu], [projeTanimi], [projeYoneticisi], [olcumAnalizSorumlusu] ,[silindi],[eklenmeTarihi]) VALUES ('" + projeKodu + "','" + projeTanimi + "','" + projeYoneticisi + "','" + olcumAnalizSorumlusu + "','N', GetDate())";
                    Sql.Insert(s);
                }
                else
                {
                    s = "UPDATE Projeler SET projeTanimi = '" + projeTanimi + "', projeYoneticisi = '" + projeYoneticisi + "',olcumAnalizSorumlusu = '" + olcumAnalizSorumlusu + "', silindi = 'N', guncellemeTarihi = GetDate() where projeKodu = '" + projeKodu + "'";
                    Sql.UpdateCmd(s);
                }
                Response.Redirect("Projeler.aspx");
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            if (sayfa == "0")
                Response.Redirect("Surecler.aspx");
            else if (sayfa == "1")
                Response.Redirect("Projeler.aspx");
        }
    }
}