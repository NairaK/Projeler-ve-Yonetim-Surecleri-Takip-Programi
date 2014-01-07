<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Projeler.aspx.cs" Inherits="WebApplication3.Projeler" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style6
        {
            width: 350px;
            height: 130px;
        }
        .style2
        {
            font-weight: 700;
            font-size: medium;
        }
        .style5
        {}
        .style9
        {
            color: #007BB0;
        }
        .style11
        {
            color: #007BB0;
        }
        .style12
        {
            width: 64px;
            height: 64px;
            font-size: small;
            color: #FF0000;
        }
        .style13
        {
            width: 64px;
            height: 64px;
            font-size: small;
        }
        .style14
        {
            color: red;
            font-size: small;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
   
        <span class="style9"><strong>PROJE ÖLÇME VE ANALİZ SORUMLUSU İŞLEMLERİ<br />
        <br />
        </strong>
    <span class="style13">Kullanıcı Adı : </span>
    <asp:Label ID="Label2" Width="150px" runat="server" CssClass="style11"></asp:Label>
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/Images/arrow-right-icon.png" onclick="ImageButton1_Click" 
        CssClass="style12" Height="64px" Width="64px" />
        <br />
        </strong></span><br />
    <asp:GridView ID="dvProje" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="projeKodu" OnRowEditing="dvProje_RowEditing" 
            OnRowUpdating="dvProje_RowUpdating" OnRowCancelingEdit="dvProje_RowCancelingEdit" 
            CellPadding="3" Width="686px" GridLines="None" BackColor="White" 
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellSpacing="1" CssClass="style5" 
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
            <Columns>
                <asp:BoundField DataField="projeKodu" HeaderText="Proje Kodu" ReadOnly="true" SortExpression="projeKodu" />
                <asp:TemplateField SortExpression="projeTanimi" HeaderText="Proje Tanımı">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("projeTanimi") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("projeTanimi") %>' 
                            Width="148px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="projeYoneticisi" HeaderText="Proje Yöneticisi">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("projeYoneticisi") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("projeYoneticisi") %>' 
                            Width="101px"></asp:TextBox><span class="style14">*</span>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="olcumAnalizSorumlusu" HeaderText="Ölçüm ve Analiz Sorumlusu">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("olcumAnalizSorumlusu") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("olcumAnalizSorumlusu") %>'
                            Width="145px"></asp:TextBox><span class="style14">*</span>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" CancelText="İptal" EditText="Düzenle" UpdateText="Güncelle" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#007BB0" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />

        </asp:GridView>
    <div>
    
        <asp:Label ID="Label6" runat="server" CssClass="style12" 
            Text="* : Rakamlardan oluşur!" Visible="false"></asp:Label>
    
    </div>
    <p>
        <asp:ImageButton ID="ImageButton4" runat="server" 
        ImageUrl="~/Images/math-add-icon.png" onclick="add_btn_Click" 
        CssClass="style12" Height="64px" Width="64px" />
    </p>
    <p>
        <span class="style9"><strong>Proje Kodu : </strong></span>&nbsp; 
        <asp:TextBox ID="TextBox1" runat="server" CssClass="style3" Height="18px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <asp:Label ID="Label1" runat="server" CssClass="style2" Font-Size="Medium" 
            Visible="False">Proje Bulunamadı!!</asp:Label>
    
    </p>
        
        <span class="style9">
        <strong>
        
        <asp:ImageButton ID="ImageButton2" runat="server" 
        ImageUrl="~/Images/search_btn.png" onclick="search_btn_Click" 
        CssClass="style12" Height="64px" Width="64px" />
        </strong></span>
        
&nbsp;&nbsp;
    &nbsp;&nbsp;
        
        <asp:ImageButton ID="ImageButton3" runat="server" 
        ImageUrl="~/Images/symbol-delete-icon.png" onclick="delete_btn_Click" 
        CssClass="style12" Height="64px" Width="64px" />
        
        </div>
    </form>
</body>
</html>
