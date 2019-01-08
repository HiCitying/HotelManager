using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class UserPersonal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["LoginName"] == null)
                {
                    Response.Write("<script>alert('请先登录！');</script>");
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        GridViewBind();
                        GridViewBind2();
                    }

                }

            }
            catch (System.NullReferenceException)
            {
                Response.Redirect("Login.aspx");
            }
            
           
        }


        private void GridViewBind()
        {
            
            string LoginName = Session["LoginName"].ToString();

            System.Data.SqlClient.SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["HotelConnectionString"].ConnectionString;

            DataSet ds = new DataSet();

            
            SqlDataAdapter da = new SqlDataAdapter("select *from [User] where UserLoginName ='"+LoginName+"'", conn);
            //SqlDataAdapter db = new SqlDataAdapter("select *from [Order]", conn);

            conn.Open();
            da.Fill(ds);
            //db.Fill(ds);
            conn.Close();

            UserGV.DataSource = ds;
            UserGV.DataBind();

            //OrderGV.DataSource = ds;
            //OrderGV.DataBind();


        }


        private void GridViewBind2()
        {
            

            string LoginName = Session["LoginName"].ToString();
            System.Data.SqlClient.SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["HotelConnectionString"].ConnectionString;

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("select *from [Order] where UserName ='" + LoginName + "'", conn);

            conn.Open();
            da.Fill(ds);
            conn.Close();

            OrderGV.DataSource = ds;
            OrderGV.DataBind();


        }
        private void DeleteRecord(string UserID)
        {
            SqlConnection connection = new SqlConnection(GetConnectionString());
            string sqlStatement = "DELETE FROM [User] WHERE UserID = @UserID";

            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand(sqlStatement, connection);
                cmd.Parameters.AddWithValue("@UserID", UserID);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Deletion Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                connection.Close();
            }
        }



        private string GetConnectionString()
        {
            
            string connstr = "Data Source=localhost;Initial Catalog=Hotel;Persist Security Info=True;User ID=sa;Password=12345";
            return connstr;
        }




        private void UpdateRecord(string UserID, string UserLoginName, string UserPassword, string UserName, string UserSex, string UserAddress, string UserTelephone, string UserEmail)
        {
            SqlConnection connection = new SqlConnection(GetConnectionString());
            string sqlStatement = "UPDATE [User] " +
                                  "SET UserLoginName= @UserLoginName, UserPassword= @UserPassword, UserName= @UserName,UserSex=@UserSex,UserAddress=@UserAddress,UserTelephone=@UserTelephone,UserEmail=@UserEmail " +
                                  "WHERE UserID = @UserID";
            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand(sqlStatement, connection);
                cmd.Parameters.AddWithValue("@UserID", UserID);
                cmd.Parameters.AddWithValue("@UserLoginName", UserLoginName);
                cmd.Parameters.AddWithValue("@UserPassword", UserPassword);
                cmd.Parameters.AddWithValue("@UserName", UserName);
                cmd.Parameters.AddWithValue("@UserSex", UserSex);
                cmd.Parameters.AddWithValue("@UserAddress", UserAddress);
                cmd.Parameters.AddWithValue("@UserTelephone", UserTelephone);
                cmd.Parameters.AddWithValue("@UserEmail", UserEmail);


                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert/Update Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                connection.Close();
            }
        }

        protected void UserGV_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            UserGV.EditIndex = -1;
            GridViewBind(); 
        }

        protected void UserGV_RowEditing(object sender, GridViewEditEventArgs e)
        {
            UserGV.EditIndex = e.NewEditIndex; 
            GridViewBind(); 
        }

        protected void UserGV_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
            string UserID = ((TextBox)UserGV.Rows[e.RowIndex].Cells[0].FindControl("TextUserID")).Text;
            string UserLoginName = ((TextBox)UserGV.Rows[e.RowIndex].Cells[1].FindControl("UserLoginName")).Text;
            string UserPassword = ((TextBox)UserGV.Rows[e.RowIndex].Cells[2].FindControl("UserPassword")).Text;
            string UserName = ((TextBox)UserGV.Rows[e.RowIndex].Cells[1].FindControl("UserName")).Text;
            string UserSex = ((TextBox)UserGV.Rows[e.RowIndex].Cells[3].FindControl("UserSex")).Text;
            string UserAddress = ((TextBox)UserGV.Rows[e.RowIndex].Cells[3].FindControl("UserAddress")).Text;
            string UserTelephone = ((TextBox)UserGV.Rows[e.RowIndex].Cells[3].FindControl("UserTelephone")).Text;
            string UserEmail = ((TextBox)UserGV.Rows[e.RowIndex].Cells[3].FindControl("UserEmail")).Text;


            UpdateRecord(UserID, UserLoginName, UserPassword, UserName, UserSex, UserAddress, UserTelephone, UserEmail); 

            UserGV.EditIndex = -1; 

            GridViewBind(); 


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shop.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}