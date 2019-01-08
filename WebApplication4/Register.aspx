<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication4.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
div{
    background:#009FCC;
    font-size:24px;
    padding:5px;
    color:white;
    
}
form{
    background: #F8F8FF ;
    border:#357FC4 solid 1px;
    color:#575454;  
    width:400px;
    margin:20px auto;
    font-size:15px;
}
table{
    margin:10px auto;
}
a{
    text-decoration:none;
}

td:first-child{
    text-align:right;
    padding:0 5px;
}
td:only-child{
    text-align:center;
    font-size:12px;
}

        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        

<div align="center"><asp:Label ID="Label9" runat="server" Text="注册账号"></asp:Label></div>
       
<table runat="server" >
    <tr><td><asp:Label ID="Label1" runat="server" Text="登录名:"></asp:Label></td><td><asp:TextBox ID="UserLoginName" runat="server"></asp:TextBox></td>
    <td width="50px"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不为空" ControlToValidate="UserLoginName" ValidationGroup="Personal"></asp:RequiredFieldValidator></td></tr>
    <tr><td><asp:Label ID="Label2" runat="server" Text="密码:"></asp:Label></td><td> <asp:TextBox ID="UserPassword" runat="server" TextMode="Password"></asp:TextBox></td>
    <td width="50px"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不为空" ControlToValidate="UserPassword" ValidationGroup="Personal"></asp:RequiredFieldValidator></td></tr>
    <tr><td><asp:Label ID="Label3" runat="server" Text="确认密码:"></asp:Label></td><td><asp:TextBox ID="RUserPassword" runat="server" TextMode="Password"></asp:TextBox></td>
    <td width="50px"><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="不一致" ControlToCompare="UserPassword" ControlToValidate="RUserPassword"></asp:CompareValidator></td></tr>
    
    <tr><td><asp:Label ID="Label4" runat="server" Text="姓名:"></asp:Label></td><td><asp:TextBox ID="UserName" runat="server"></asp:TextBox></td></tr>   
    <tr><td><asp:Label ID="Label5" runat="server" Text="姓别:"></asp:Label></td><td>
                        <asp:RadioButtonList ID="UserSex" runat="server" RepeatDirection="Horizontal" >
                            <asp:ListItem>男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                            <asp:ListItem Selected ="True">其他</asp:ListItem>
                        </asp:RadioButtonList></td></tr>
    <tr><td><asp:Label ID="Label8" runat="server" Text="手机号码:"></asp:Label></td><td><asp:TextBox ID="UserTelephone" runat="server"></asp:TextBox></td></tr>
    <tr><td><asp:Label ID="Label6" runat="server" Text="地址:"></asp:Label></td><td><asp:TextBox ID="UserAddress" runat="server"></asp:TextBox></td></tr>
    <tr><td><asp:Label ID="Label7" runat="server" Text="邮箱:"></asp:Label></td><td><asp:TextBox ID="UserEmail" runat="server"></asp:TextBox></td></tr>
    
    <tr><td colspan="2"><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="注册" ValidationGroup="Personal"/>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="重置"/>
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="退出" />

        </td></tr>
</table>



      <div></div>
        
    </form>
</body>
</html>
