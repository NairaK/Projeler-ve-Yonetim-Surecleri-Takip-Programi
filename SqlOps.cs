using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Collections;
using System.Data;

namespace WebApplication3
{
    class SqlOps
    {
        //string mac_name = System.Environment.MachineName;   // Gets machine name for sql connection string.
        string mac_name = "11.0.200.39";
        SqlConnection Connect = new SqlConnection();
        string DBName = "KYD_ProjeSurec";
        // string DBname = "Proje";
       
        #region MSSQL
        public void Open()      // Opens the connection
        {
            if (Connect.State == System.Data.ConnectionState.Closed)
            {
                //string conn = "Data Source=" + mac_name + ";Initial Catalog=" + DBName + ";Integrated Security=SSPI;";
                string conn = "Data Source=" + mac_name + ";Initial Catalog=" + DBName + ";User id=kyd_projeSurecUser; password=kyd_proj3Surecl3ri";//Integrated Security=SSPI;";
                Connect = new SqlConnection(conn);
                try
                {
                    Connect.Open();     // If SQLEXPRESS is installed
                }
                catch (Exception)
                {
                    //conn = "Data Source=" + mac_name + ";Initial Catalog=" + DBName + ";Integrated Security=SSPI;";
                    conn = "Data Source=" + mac_name + ";Initial Catalog=" + DBName + ";User id=kyd_projeSurecUser; password=kyd_proj3Surecl3ri";//Integrated Security=SSPI;";
                    Connect = new SqlConnection(conn);
                    Connect.Open();     // If MSSQLSERVER is installed
                }
            }
        }

        public void Close()     // Closes the connection
        {
            if (Connect.State == System.Data.ConnectionState.Open)
            {
                Connect.Close();
            }
        }

        public SqlConnection GetConnection()
        {
            return Connect;
        }
        #endregion

        #region Update Islemleri
        public void UpdateCmd(string s) //surecNumarasi, string surecAdi, string surecSahibi, string CMMISurecAlani, string izlemeMetrigi, string raporPeriyodu, string Hedef, string olcuBirimi, String TableName)
        {
            Close();
            Open();
            //string s = "UPDATE " + TableName + " SET surecAdi = '" + surecAdi + "', surecSahibi = '" + surecSahibi + "',CMMISurecAlani = '" + CMMISurecAlani + "',izlemeMetrigi = '" + izlemeMetrigi + "',raporPeriyodu = '" + raporPeriyodu + "',Hedef = '" + Hedef + "',olcuBirimi = '" + olcuBirimi + "', silindi = 'N', silinmeTarihi = GetDate() where surecNumarasi = '" + surecNumarasi + "'";
            SqlCommand guncelle = new SqlCommand(s, Connect);
            guncelle.ExecuteNonQuery();
            Close();
        }
        #endregion

        #region Login Islemi
        public int LoginCmd(string query) //string TableName)
        {
            Close();
            Open();
            SqlConnection Connect = GetConnection();
            SqlCommand cmd = new SqlCommand(query, Connect);
            cmd.CommandType = CommandType.Text;
            return (int)cmd.ExecuteScalar();
        }
        #endregion

        #region Select Islemleri
        public SqlDataAdapter SelectCmd(string query) //string TableName)
        {
            Open();
            //string StokBilgisi = "SELECT * FROM " + TableName + " WHERE Deleted = 'N'" ;
            SqlConnection Connect = GetConnection();
            SqlCommand cmd = new SqlCommand(query, Connect);
            SqlDataAdapter da = new SqlDataAdapter(query, Connect);
            Close();
            return da;
        }

        public SqlDataReader SelectInfos(string query)
        {
            Open();
            //string query = "SELECT * FROM " + TableName + " WHERE " + PrimaryKeyAttributeName + " = '" + ID + "'";
            SqlCommand myCommand = new SqlCommand(query, Connect);
            SqlDataReader reader = myCommand.ExecuteReader();

            return reader;
        }
        #endregion;

        #region Delete Islemleri
        public void DeleteSurec(String s)   //TableName, String SurecID)
        {
            //Close();
            Open();
            //String s = "UPDATE " + TableName + " SET  silindi = 'D', silinmeTarihi = GetDate() where surecNumarasi = '" + SurecID + "'";
            SqlCommand sil = new SqlCommand(s, Connect);
            sil.ExecuteNonQuery();
            Close();
        }

        public void DeleteTable(string TableName)
        {
            Open();
            string s = "DROP TABLE " + TableName;
            SqlCommand sil = new SqlCommand(s, Connect);
            //sil.ExecuteNonQuery();
            Close();
        }
      
        public void DeleteCmd(string TableName, string Condition)
        {
            Open();
            string s = "DELETE FROM " + TableName + " WHERE " + Condition;
            SqlCommand sil = new SqlCommand(s, Connect);
            sil.ExecuteNonQuery();
            Close();
        }

        public void DeleteAllInfos(string TableName)
        {
            Open();
            string s = "DELETE FROM " + TableName;
            SqlCommand sil = new SqlCommand(s, Connect);
            sil.ExecuteNonQuery();
            Close();
        }
        #endregion;

        #region Insert Islemleri
        public void Insert(string s)   // surecNumarasi, string surecAdi, string surecSahibi, string CMMISurecAlani, string izlemeMetrigi, string raporPeriyodu, string Hedef, string olcuBirimi, string TableName)
        {
            Close();
            Open();
            SqlCommand cmd = new SqlCommand(s, Connect);
            SqlDataReader reader = cmd.ExecuteReader();
            //cmd.ExecuteNonQuery();
            Close();
        }
        #endregion

        #region Search
       public SqlDataReader Search(string query)   // TableName, string ID)
        {
            Close();
            Open();
            //string query = "SELECT * FROM " + TableName + " WHERE surecNumarasi = '" + ID + "'";
            SqlCommand myCommand = new SqlCommand(query, Connect);
            SqlDataReader reader = myCommand.ExecuteReader();
            return reader;
        }
        #endregion
    }
}