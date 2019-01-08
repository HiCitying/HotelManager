<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .abc {
            background: #FF3300;
            font-size: 24px;
            padding: 5px;
            color: white;
            align-content:center;
        }
        .abd{
            width:400px;
            height:275px;
           border-style:solid; 
           border-width:2px; 
           border-color:#F30;
           
        }
        .a{
            width:100px;
            height:80px;
             float:left;
        }
        .b{
            width:300px;
            height:80px;
            float:left;
        }
        .c{
            width:130px;
            height:80px;
            float:left;
        }
        .d{
            width:200px;
            height:80px;
            float:left;
        }
        .e{
            width:100px;
            height:80px;
            float:left;
        }
    </style>
    
    
</head>
<body>
    <form id="form1" runat="server" >
        
        <div>
           
            <div align="right">
            <asp:Button ID="Button4" runat="server" Text="管理员登录" OnClick="Button4_Click" />

            </div>
        </div>
        <div align="center">
        <div class="abd" align="center">
            <div class="abc">
                <asp:Label ID="Label3" runat="server" Text="用户登录" Width="393px" Height="30px"></asp:Label>
            </div>
            <div class="a">
               
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="用户名:" Font-Size="Medium" Width="100px"></asp:Label>

            </div>
            <div class="b">
               <div>
                  <br />
                   <asp:TextBox ID="UserLoginName" runat="server" Height="50px" Width="200px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空" ControlToValidate="UserLoginName" ValidationGroup="User"></asp:RequiredFieldValidator>
               </div>
                
             
            
            </div>

            <div class="a">
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="密码:" Width="100px"></asp:Label>

            </div>
            <div class="b">
                <br />
                 <asp:TextBox ID="UserPassword" runat="server" Height="50px" Width="200px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空" ControlToValidate="UserPassword" ValidationGroup="User"></asp:RequiredFieldValidator>
            </div>

            <div class="c">
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="登录" Width="130px" Height="50px" ValidationGroup="User"/>
            </div>
            <div class="c">
                <br />
                <asp:Button ID="Button2" runat="server" Text="重置" OnClick="Button2_Click" Width="130px" Height="50px"/>
            </div>
            <div class="c">
                <br />
                 <asp:Button ID="Button3" runat="server" Text="注册" OnClick="Button3_Click" Width="140px" Height="50px" />
            </div>

        </div>
        

 
    </form>
</body>
</html>
