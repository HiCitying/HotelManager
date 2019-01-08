<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="WebApplication4.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .main{
            width:800px;
            height:200px; 
        }
        .image{
            width:180px;
            height:200px;
            float:left;
            margin-right:100px;
        }
        .detail{
            width:180px;
            height:200px;
            float:left;
            
        }
        .price{
            width:180px;
            height:200px;
            float:right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <asp:Label ID="Label12" runat="server" Text="欢迎选购房间" Width="360px" Height="50px" BackColor="#993333" Font-Size="X-Large"></asp:Label>
        </div>
        <div align="right">
            
            
            <asp:Button ID="Button3" runat="server" Text="个人中心" OnClick="Button3_Click" /></div>
        <div align="center">
            <div class="main">
                <div class="image">
                    <asp:Image ID="Image1" runat="server" src="Image/1.jpg" Width="180px" Height="200px" />
                </div>
                <div class="detail">
                    
                   
                    <br />
                    <asp:Label ID="LabelA1" runat="server" Text="豪华双人房" Width="180px" Height="40px"></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text="数量" Width="180px" Height="30px"></asp:Label>
                    <asp:Label ID="ANum" runat="server" Text="Label" Width="180px" Height="20px"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="价格" Width="180px" Height="30px"></asp:Label>
                    <asp:Label ID="LabelAPrice" runat="server" Text="Label" Width="180px" Height="20px"></asp:Label>
                </div>
                <div class="price">
                    
                    <br />
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="请输入你要住的间数" Width="180px" Height="50px"></asp:Label>
                    <asp:TextBox ID="AOrderNum" runat="server" Height="50px" Width="160px"></asp:TextBox>
                    
                    
                </div>    
            </div>
           <br />
            <div class="main">
                <div class="image">
                    <asp:Image ID="Image2" runat="server" src="Image/2.jpg" Width="180px" Height="200px" />
                </div>
                <div class="detail">
                    
                    
                    <br />
                   
                    <asp:Label ID="Label2" runat="server" Text="高级双人房" Width="180px" Height="40px"></asp:Label>
                     <asp:Label ID="Label8" runat="server" Text="数量" Width="180px" Height="30px"></asp:Label>
                    <asp:Label ID="BNum" runat="server" Text="Label" Width="180px" Height="20px"></asp:Label>
                     <asp:Label ID="Label9" runat="server" Text="价格" Width="180px" Height="30px"></asp:Label>
                    <asp:Label ID="LabelBPrice" runat="server" Text="Label" Width="180px" Height="20px"></asp:Label>
                </div>
                <div class="price">
                    
                    <br />
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="请输入你要住的间数" Width="180px" Height="50px"></asp:Label>
                    <asp:TextBox ID="BOrderNum" runat="server" Height="50px" Width="160px"></asp:TextBox>
                </div>
            </div>
            <br />
           
            <div class="main">
                <div class="image">
                    <asp:Image ID="Image3" runat="server" src="Image/3.jpg" Width="180px" Height="200px" />
                </div>
                <div class="detail">
                    
                   
                    <br />
                   
                    <asp:Label ID="Label3" runat="server" Text="标准单人房" Width="180px" Height="40px"></asp:Label>
                    <asp:Label ID="Label10" runat="server" Text="数量" Width="180px" Height="30px"></asp:Label>
                    <asp:Label ID="CNum" runat="server" Text="Label" Width="180px" Height="20px"></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="价格" Width="180px" Height="30px"></asp:Label>
                    <asp:Label ID="LabelCPrice" runat="server" Text="Label" Width="180px" Height="20px"></asp:Label>
                </div>
                <div class="price">
                    
                    <br />
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="请输入你要住的间数" Width="180px" Height="50px"></asp:Label>
                    <asp:TextBox ID="COrderNum" runat="server" Height="50px" Width="160px"></asp:TextBox>
                </div>
            </div>
            <br />
            <div>

                <asp:Button ID="Button1" runat="server" Text="确认" Width="400px" Height="50px" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="退出" Width="400px" Height="50px" OnClick="Button2_Click" OnClientClick="return confirm('确认退出吗');"/>

            </div>
          
        </div>
    </form>
</body>
</html>
