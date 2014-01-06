<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yonlendir.aspx.cs" Inherits="WebApplication3.Yonlendir" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            width: 350px;
            height: 130px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
      <img alt="X" class="style2" src="Images/aselsan_logo.png" /></div>

    <script language="javascript">
        function yonlendir(){
            var yetki = <%=yetki %>
            if(yetki == 2)
                location.href = "Surecler.aspx"
            else if(yetki == 1)
                location.href = "Projeler.aspx"
        }
         setTimeout('yonlendir()', 3000);
    </script>
<h3 style="margin-left: 355px">
            Giriş Başarılı! Yetkinize Göre Yönlendiriliyorsunuz...</h3>
    
   
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    </form>
</body>
</html>
