<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication3.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            text-align: left;
            margin-bottom: 0px;
        }
        .style2
        {
            width: 300px;
        }
        .style4
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
        {
            font-size: small;
            color: #FF0000;
        }
        .style14
        {
            font-size: small;
            color: #FF0000;
        }
        .style15
        {
            font-size: small;
            color: #FF0000;
        }
        </style>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    </div>

    
        <h4><span class="style9"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    </strong><asp:Label ID="Label9" runat="server" Text="SÜREÇ EKLEME İŞLEMİ"></asp:Label>
    </span></h3>
    <br />
    <span class="style10">Kullanıcı Adı : </span>
    <asp:Label ID="Label10" runat="server" CssClass="style11" Text=""></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" CssClass="style1" Text="Süreç Numarası : " 
        Height="25px" Width="110px"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <p>
        <asp:Label ID="Label2" runat="server" CssClass="style1" Text="Süreç Adı : " 
            Height="25px" Width="110px"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </p>
    <asp:Label ID="Label3" runat="server" CssClass="style1" Height="25px" 
        Text="Süreç Sahibi : " Width="110px"></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <asp:Label ID="Label12" runat="server" Text="*" CssClass="style15"></asp:Label>
    <p>
        <asp:Label ID="Label4" runat="server" CssClass="style1" Text="CMMI Süreç Alanı : " 
            Height="35px" Width="110px"></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <asp:Label ID="Label14" runat="server" Text="*" CssClass="style14"></asp:Label>
    </p>
    <asp:Label ID="Label5" runat="server" CssClass="style1" Text="İzleme Metriği : " 
        Width="110px" Height="25px"></asp:Label>
    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
    <p>
        <asp:Label ID="Label6" runat="server" CssClass="style1" Height="25px" 
            Text="Rapor Periyodu : " Width="110px"></asp:Label>
        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label7" runat="server" CssClass="style1" Height="25px" 
            Text="Hedef : " Width="110px"></asp:Label>
        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        <asp:Label ID="Label13" runat="server" Text="*" CssClass="style13"></asp:Label>
    </p>
    <p>
        <asp:Label ID="Label8" runat="server" CssClass="style1" Height="25px" 
            Text="Ölçü Birimi : " Width="110px"></asp:Label>
        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
    </p>
    <p class="style2">
        <asp:ImageButton ID="ImageButton2" runat="server" 
        ImageUrl="~/Images/.p.png" onclick="ImageButton2_Click" 
        CssClass="style13" Height="64px" Width="64px"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/Images/math-add-icon.png" onclick="add_btn_Click" 
        CssClass="style12" Height="64px" Width="64px" />
        </p>
    
    <asp:Label ID="Label11" runat="server" Text="* : Rakamlardan oluşur!" 
        CssClass="style12"></asp:Label>
    
    </form>
    </body>
</html>
