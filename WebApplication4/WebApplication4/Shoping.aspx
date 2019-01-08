<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shoping.aspx.cs" Inherits="WebApplication4.Shoping" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .text{
            width:1100px;
            height:100px;
            border-style:solid; 
            border-width:3px; 
            border-color:#000;
        }
        .a1{
            
            float:left;
            width:100px;
            height:100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <div class="text" >
                <div class="a1">
                    <asp:Image ID="Image1" runat="server" src="Image/1.jpg" Width="100" Height="100"/>
                </div>
                <div class="a1">
                    <br />
                    <br />
                    <asp:Label ID="LabelA" runat="server" Text="Label" Width="100" Height="50"></asp:Label>
                </div>
                <div class="a1">
                    <asp:Image ID="Image2" runat="server" src="Image/2.jpg" Width="100" Height="100"/>
                </div>
                <div class="a1">
                    <br />
                    <br />
                    <asp:Label ID="LabelB" runat="server" Text="Label" Width="100" Height="50"></asp:Label>
                </div>
                <div class="a1">
                    <asp:Image ID="Image3" runat="server" src="Image/3.jpg" Width="100" Height="100"/>
                </div>
                <div class="a1">
                    <br />
                    <br />
                    <asp:Label ID="LabelC" runat="server" Text="Label" Width="100" Height="50"></asp:Label>
                </div>
                <div class="a1">
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="总价" Width="100" Height="50"></asp:Label>
                </div>
                <div class="a1">
                    <br />
                    <br />
                    <asp:Label ID="LabeAPrice" runat="server" Text="Label" Width="100" Height="50"></asp:Label>
                </div>
                <div class="a1">
                    <asp:Button ID="Button1" runat="server" Text="确认订单" Width="100" Height="100" OnClick="Button1_Click"/>
                </div>
                <div class="a1">
                    <asp:Button ID="Button2" runat="server" Text="重新购买" Width="100" Height="100" OnClick="Button2_Click"/>
                </div>
                <div class="a1">
                    <asp:Button ID="Button3" runat="server" Text="退出" Width="100" Height="100" OnClick="Button3_Click" OnClientClick="return confirm('确认退出吗');"/>
                </div>

                

            </div>
        </div>
    </form>
</body>
</html>
