<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="WebApplication4.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div align="right">
            <asp:Button ID="Button1" runat="server" Text="房间信息" OnClick="Button1_Click" />
            &nbsp;
            <asp:Button ID="Button3" runat="server" Text="用户信息" OnClick="Button3_Click" />
            &nbsp;
            <asp:Button ID="Button2" runat="server" Text="退出" OnClick="Button2_Click" />
        </div>
        
        <div align="center">

            <asp:GridView ID="OrderGV" runat="server"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                width="90%"
                CellPadding="3" PageSize="1" AutoGenerateColumns="False" 
                ShowFooter="True" 
                onrowcancelingedit="OrderGV_RowCancelingEdit" 
                onrowediting="OrderGV_RowEditing" 
                onrowupdating="OrderGV_RowUpdating" 
                onrowdeleting="OrderGV_RowDeleting" 
                OnSelectedIndexChanged="OrderGV_SelectedIndexChanged" >
                <Columns>
        <asp:TemplateField HeaderText="订单编号" ItemStyle-Height="35" ItemStyle-Width="150px">
            <EditItemTemplate>
                <asp:TextBox ID="ID" runat="server" ReadOnly="false" Text='<%# Bind("ID") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelID" runat="server" Text='<%# Bind("ID") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="用户">
            <EditItemTemplate>
                <asp:TextBox ID="UserName" runat="server" Text='<%# Bind("UserName") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelOrderUserName" runat="server" Text='<%# Bind("UserName") %>'/>
            </ItemTemplate>
            
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="A">
            <EditItemTemplate>
                <asp:TextBox ID="A" runat="server" Text='<%# Bind("A") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelOrderA" runat="server" Text='<%# Bind("A") %>'/>
            </ItemTemplate>
            
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="B">
            <EditItemTemplate>
                <asp:TextBox ID="B" runat="server" Text='<%# Bind("B") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelOrderB" runat="server" Text='<%# Bind("B") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>

        <asp:TemplateField HeaderText="C">
            <EditItemTemplate>
                <asp:TextBox ID="C" runat="server" Text='<%# Bind("C") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelOrderC" runat="server" Text='<%# Bind("C") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>

        <asp:TemplateField HeaderText="金额">
            <EditItemTemplate>
                <asp:TextBox ID="Money" runat="server" Text='<%# Bind("Money") %>'/>
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
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="true" HeaderText="操作" />
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
