<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="WebApplication4.Try" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
   
</head>
<body>
    <form id="form1" runat="server">
        <div align="right">
    <asp:Button ID="Button1" runat="server" Text="订单信息" OnClick="Button1_Click" />
            &nbsp;
    <asp:Button ID="Button3" runat="server" Text="用户信息" OnClick="Button3_Click" />
            &nbsp;
    <asp:Button ID="Button2" runat="server" Text="退出" OnClick="Button2_Click" />
        </div>
    <div align="center">
        
                       <asp:GridView ID="GridView1" runat="server"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                width="70%"
                CellPadding="3" PageSize="1" AutoGenerateColumns="False" 
                ShowFooter="True" 
                onrowcancelingedit="GridView1_RowCancelingEdit" 
                onrowediting="GridView1_RowEditing" 
                onrowupdating="GridView1_RowUpdating" 
                onrowdeleting="GridView1_RowDeleting" >
                <Columns>
        <asp:TemplateField HeaderText="房间编号" ItemStyle-Height="35" ItemStyle-Width="180">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxRoomId" runat="server" ReadOnly="true" Text='<%# Bind("RoomId") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelRoomId" runat="server" Text='<%# Bind("RoomId") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="房间类型">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxRoomType" runat="server" Text='<%# Bind("RoomType") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelRoomType" runat="server" Text='<%# Bind("RoomType") %>'/>
            </ItemTemplate>
            
        </asp:TemplateField>
          
                    
        <asp:TemplateField HeaderText="居住人数">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxRoomTypeNum" runat="server" Text='<%# Bind("RoomTypeNum") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LableRoomTypeNum" runat="server" Text='<%# Bind("RoomTypeNum") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>

        <asp:TemplateField HeaderText="数量">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxRoomNum" runat="server" Text='<%# Bind("RoomNum") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LableRoomNum" runat="server" Text='<%# Bind("RoomNum") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>

        <asp:TemplateField HeaderText="价格">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxRoomPrice" runat="server" Text='<%# Bind("RoomPrice") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LableRoomPrice" runat="server" Text='<%# Bind("RoomPrice") %>'/>
            </ItemTemplate>
           
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="True" ShowDeleteButton="true" HeaderText="操作" />
    </Columns>
                           <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                           <FooterStyle BackColor="#A55129" ForeColor="#8C4510" />
                           <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" HorizontalAlign="Center" />
                           <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                           <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                           <AlternatingRowStyle BackColor="#FFFFCC" ForeColor="#284775" />
                           
                              
                </asp:GridView>
            
    </div>
    </form>
</body>
</html>
