<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Surecler.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style3
        {}
        .style2
        {
            font-weight: 700;
            font-size: medium;
        }
        .style5
        {}
        .style6
        {
            width: 350px;
            height: 130px;
        }
        .style9
        {
            color: #007BB0;
        }
        .style10
        {
            font-size: small;
            color: #007BB0;
            height: 65px;
            width: 64px;
        }
        .style11
        {
            color: #007BB0;
        }
        .style12
        {
            font-size: small;
            color: #FF0000;
        }
        .style13
        {}
        .style14
        {}
        </style>

</head>
<body>
    <form id="form1" runat="server">
    <strong>
  
    </strong><span class="style9"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PROJE ÖLÇÜM VE ANALİZ PLANI</strong></span><br />
    <br />
    <span class="style10">Kullanıcı Adı : </span>
    <asp:Label ID="Label2" Width="150px" runat="server" CssClass="style11"></asp:Label>
        <asp:ImageButton ID="ImageButton2" runat="server" 
        ImageUrl="~/Images/.p.png" CssClass="style13" Height="64px" 
        onclick="ImageButton2_Click" Width="64px"/>
    <span class="style9">
        <strong>    
        <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/Images/arrow-right-icon.png" onclick="ImageButton1_Click" 
        CssClass="style12" Height="64px" Width="64px" Visible="false" />
    </strong></span><br />
    <br />
    <asp:GridView ID="dvProje" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="surecNumarasi" OnRowEditing = "dvProje_RowEditing" 
            OnRowUpdating="dvProje_RowUpdating" OnRowCancelingEdit="dvProje_RowCancelingEdit" 
            CellPadding="3" Width="1088px" GridLines="None" BackColor="White" 
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellSpacing="1" CssClass="style5"
        OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" 
        onpageindexchanging="dvProje_PageIndexChanging" PageSize="5">
            <Columns>
                <asp:BoundField HeaderStyle-Width="120px" HeaderStyle-Wrap="false" DataField="surecNumarasi"  HeaderText="Süreç Numarası" ReadOnly="true" SortExpression="surecNumarasi" />
                <asp:TemplateField ControlStyle-Width="280px" SortExpression="surecAdi" HeaderText="Süreç Adı">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("surecAdi") %>' Height="56px"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("surecAdi") %>' 
                            Width="170px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="surecSahibi" HeaderText="Süreç Sahibi">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Width="93px" Text='<%# Bind("surecSahibi") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("surecSahibi") %>'
                            Width="78px"></asp:TextBox><span class="style12">*</span>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ControlStyle-Width="135px" SortExpression="CMMISurecAlani" HeaderText="CMMI Süreç Alanı">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("CMMISurecAlani") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CMMISurecAlani") %>'
                            Width="88px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ControlStyle-Width="310px" SortExpression="izlemeMetrigi" HeaderText="İzleme Metriği">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("izlemeMetrigi") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("izlemeMetrigi") %>' 
                            Width="310px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ControlStyle-Width="111px" SortExpression="raporPeriyodu" HeaderText="Rapor Periyodu">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("raporPeriyodu") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("raporPeriyodu") %>' 
                            Width="70px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="Hedef" HeaderText="Hedef">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Width="55px" Text='<%# Bind("Hedef") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Hedef") %>'
                            Width="38px" CssClass="style14"></asp:TextBox>
                        <span class="style12">*</span>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ControlStyle-Width="83px" SortExpression="olcuBirimi" HeaderText="Ölçü Birimi">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("olcuBirimi") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("olcuBirimi") %>' 
                            Width="70px"></asp:TextBox>
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
        <asp:ImageButton ID="ImageButton3" runat="server" 
        ImageUrl="~/Images/math-add-icon.png" onclick="add_btn_Click" 
        CssClass="style12" Height="64px" Width="64px" />
    <p>
        <span class="style9"><strong>&nbsp;Süreç Numarası :</strong></span> &nbsp; 
        <asp:TextBox ID="TextBox1" runat="server" CssClass="style3" Height="18px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <asp:Label ID="Label1" runat="server" CssClass="style2" Font-Size="Medium" 
            Visible="False">Süreç Bulunamadı!!</asp:Label>
    
    </p>
    <asp:ImageButton ID="ImageButton4" runat="server" CssClass="style12" 
        Height="64px" ImageUrl="~/Images/search_btn.png" onclick="search_btn_Click" 
        Width="64px" />
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton5" runat="server" 
        ImageUrl="~/Images/symbol-delete-icon.png" onclick="delete_btn_Click" 
        CssClass="style12" Height="64px" Width="64px" />
    <br />
    </form>
</body>
</html>
