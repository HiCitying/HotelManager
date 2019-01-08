<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="WebApplication4.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div align="right">
            <asp:Button ID="Button1" runat="server" Text="房间信息" OnClick="Button1_Click1" /> &nbsp;
            <asp:Button ID="Button2" runat="server" Text="订单信息" OnClick="Button2_Click1" /> &nbsp;
            <asp:Button ID="Button3" runat="server" Text="退出" OnClick="Button3_Click" />
        </div>
        <div align="center">
        
                       <asp:GridView ID="UserGV" runat="server"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                width="100%"
                CellPadding="3" PageSize="1" AutoGenerateColumns="False" 
                ShowFooter="True" 
                onrowcancelingedit="UserGV_RowCancelingEdit" 
                onrowediting="UserGV_RowEditing" 
                onrowupdating="UserGV_RowUpdating" 
                onrowdeleting="UserGV_RowDeleting" >
                <Columns>
        <asp:TemplateField HeaderText="用户编号" ItemStyle-Height="35" ItemStyle-Width="120">
            <EditItemTemplate>
                <asp:TextBox ID="TextUserID" runat="server" Text='<%# Bind("UserID") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="UserID" runat="server" Text='<%# Bind("UserID") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="登录名">
            <EditItemTemplate>
                <asp:TextBox ID="UserLoginName" runat="server" Text='<%# Bind("UserLoginName") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="UserLoginName" runat="server" Text='<%# Bind("UserLoginName") %>'/>
            </ItemTemplate>
            
        </asp:TemplateField>
          
                    
        <asp:TemplateField HeaderText="密码">
            <EditItemTemplate>
                <asp:TextBox ID="UserPassword" runat="server" Text='<%# Bind("UserPassword") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="UserPassword" runat="server" Text='<%# Bind("UserPassword") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>

        <asp:TemplateField HeaderText="姓名">
            <EditItemTemplate>
                <asp:TextBox ID="UserName" runat="server" Text='<%# Bind("UserName") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="UserName" runat="server" Text='<%# Bind("UserName") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>

        <asp:TemplateField HeaderText="性别">
            <EditItemTemplate>
                <asp:TextBox ID="UserSex" runat="server" Text='<%# Bind("UserSex") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="UserSex" runat="server" Text='<%# Bind("UserSex") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>

        <asp:TemplateField HeaderText="地址">
            <EditItemTemplate>
                <asp:TextBox ID="UserAddress" runat="server" Text='<%# Bind("UserAddress") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="UserAddress" runat="server" Text='<%# Bind("UserAddress") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>

        <asp:TemplateField HeaderText="电话">
            <EditItemTemplate>
                <asp:TextBox ID="UserTelephone" runat="server" Text='<%# Bind("UserTelephone") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="UserTelephone" runat="server" Text='<%# Bind("UserTelephone") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>

        <asp:TemplateField HeaderText="邮箱">
            <EditItemTemplate>
                <asp:TextBox ID="UserEmail" runat="server" Text='<%# Bind("UserEmail") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="UserEmail" runat="server" Text='<%# Bind("UserEmail") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>

        

        <asp:CommandField ShowEditButton="True" ShowDeleteButton="true" HeaderText="操作" />
    </Columns>
                           <HeaderStyle BackColor="#330066" Font-Bold="True" ForeColor="White" />
                           <FooterStyle BackColor="#330066" ForeColor="#8C4510" />
                           <RowStyle BackColor="#CCCCFF" ForeColor="#8C4510" HorizontalAlign="Center" />
                           <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                           <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                           <AlternatingRowStyle BackColor="#66CCFF" ForeColor="#284775" />
                           
                              
                </asp:GridView>
            
    </div>
    </form>
</body>
</html>
