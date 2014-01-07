<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="WebApplication3.Login1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 350px;
            height: 130px;
        }
        .style3
        {
            color: #007BB0;
            font-size: x-large;
        }
        .style6
        {
            width: 430px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
      
        <strong><span class="style3">Süreç Ölçüm ve Analiz Planı Giriş Ekranı</span></strong></p>
        <fieldset style="margin: 60px 515px 6px 200px; width: 213px; font-family: Arial, Helvetica, sans-serif; background-color: #CCCCFF; z-index: auto; 
            position: inherit; clip: rect(auto, auto, auto, auto); table-layout: auto; left: 50px; height: 283px;" >
    <legend>Login</legend>
    <div class='container'>
    <asp:Label ID="Name" runat="server" Text="Kullanıcı Adı:" CssClass="lbl" />
    <br />
    <asp:TextBox ID="txtUsername" runat="server" Height="22px" Width="180px" />
    <asp:RequiredFieldValidator ID="RV" runat="server" ControlToValidate="txtUsername"
    ErrorMessage="Kullanıcı adı girin!" SetFocusOnError="true" ForeColor="Red">* </asp:RequiredFieldValidator><br />
    </div>
    <div class='container'>
    <asp:Label ID="lblPassword" runat="server" Text="Şifre:" CssClass="lbl" />
    <br />
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="pwd" 
            Height="22px" Width="180px" />
    <asp:RequiredFieldValidator ID="RV2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Şifre girin!" SetFocusOnError="true" ForeColor="Red">* </asp:RequiredFieldValidator><br />
    </div>
    <div class='container'>
        <br />
    <asp:Button ID="btnLogin" runat="server" Text="Giriş" OnClick="Button2_Click" 
            Width="105px" />
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" />
            <asp:Label ID="lblMessage" runat="server" CssClass="lbl" Text="" />

      </fieldset><br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
