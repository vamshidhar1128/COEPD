﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ccavRequestHandler.aspx.cs" Inherits="ccavRequestHandler" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
   
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CC Avenue Payment Request</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>  
        <script type="text/javascript">
           $(document).ready(function () {
               $("#nonseamless").submit();
           });
       </script>
</head>
<body>
    <form id="nonseamless" method="post" name="redirect" action="https://secure.ccavenue.com/transaction/transaction.do?command=initiateTransaction"> 
        <input type="hidden" id="encRequest" name="encRequest" value="<%=strEncRequest%>"/>
        <input type="hidden" name="access_code" id="Hidden1" value="<%=strAccessCode%>"/>
    </form>
</body>
</html>
