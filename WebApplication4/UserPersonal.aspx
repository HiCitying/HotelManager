<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPersonal.aspx.cs" Inherits="WebApplication4.UserPersonal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div align="right">
            <asp:Button ID="Button1" runat="server" Text="选购" OnClick="Button1_Click" />
            &nbsp;
            <asp:Button ID="Button2" runat="server" Text="退出" OnClick="Button2_Click" OnClientClick="return confirm('确认退出吗');" />
        </div>
        <div align="center">
           <asp:Label ID="Label1" runat="server" Text="个人资料"></asp:Label>
        </div>
        <div align="center">
        
                       <asp:GridView ID="UserGV" runat="server"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                width="90%"
                CellPadding="3" PageSize="1" AutoGenerateColumns="False" 
                ShowFooter="True" 
                onrowcancelingedit="UserGV_RowCancelingEdit" 
                onrowediting="UserGV_RowEditing" 
                onrowupdating="UserGV_RowUpdating" 
                 >
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

        

        <asp:CommandField ShowEditButton="True" HeaderText="操作" />
    </Columns>
                           <HeaderStyle BackColor="#330066" Font-Bold="True" ForeColor="White" />
                           <FooterStyle BackColor="#330066" ForeColor="#8C4510" />
                           <RowStyle BackColor="#CCCCFF" ForeColor="#8C4510" HorizontalAlign="Center" />
                           <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                           <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                           <AlternatingRowStyle BackColor="#66CCFF" ForeColor="#284775" />
                           
                              
                </asp:GridView>
            
    </div>
        


    
        <div align="center">
             <asp:Label ID="Label2" runat="server" Text="订单信息"></asp:Label>
            </div>
        
        <div align="right">
            &nbsp;
            </div>
        
        <div align="center">

            <asp:GridView ID="OrderGV" runat="server"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                width="90%"
                CellPadding="3" PageSize="1" AutoGenerateColumns="False" 
                ShowFooter="True" 
                 >
                <Columns>
        <asp:TemplateField HeaderText="订单编号" ItemStyle-Height="35" ItemStyle-Width="150px">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxID" runat="server" ReadOnly="false" Text='<%# Bind("ID") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelID" runat="server" Text='<%# Bind("ID") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="用户">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxOrderUserName" runat="server" Text='<%# Bind("UserName") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelOrderUserName" runat="server" Text='<%# Bind("UserName") %>'/>
            </ItemTemplate>
            
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="A">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxOrderA" runat="server" Text='<%# Bind("A") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelOrderA" runat="server" Text='<%# Bind("A") %>'/>
            </ItemTemplate>
            
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="B">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxOrderB" runat="server" Text='<%# Bind("B") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelOrderB" runat="server" Text='<%# Bind("B") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>

        <asp:TemplateField HeaderText="C">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxOrderC" runat="server" Text='<%# Bind("C") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelOrderC" runat="server" Text='<%# Bind("C") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>

        <asp:TemplateField HeaderText="金额">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxOrderMoney" runat="server" Text='<%# Bind("Money") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelOrderMoney" runat="server" Text='<%# Bind("Money") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>

        <asp:TemplateField HeaderText="时间">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxOrderTime" runat="server" Text='<%# Bind("Time") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelOrderTime" runat="server" Text='<%# Bind("Time") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>
        
    </Columns>
                
                    <RowStyle BackColor="#FFFFCC" ForeColor="#333333" HorizontalAlign="Center"/>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#CC9933" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#993333" Font-Bold="True" ForeColor="White" />
                    <FooterStyle BackColor="#993333" ForeColor="#8C4510"  />
                    <AlternatingRowStyle BackColor="#FFCC66" ForeColor="#284775" />
                
    </asp:GridView>
      
            </div>
    </form>
</body>
</html>
