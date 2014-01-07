<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yonlendir2.aspx.cs" Inherits="WebApplication3.Yonlendir2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

 
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 350px;
            height: 130px;
            margin-top: 0px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
     <script language="javascript">
         function yonlendir() {

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
