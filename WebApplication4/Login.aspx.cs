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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Add("LoginName", null);
        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            string LoginName = UserLoginName.Text.Trim();
            string LoginPassword = UserPassword.Text.Trim();


            SqlDataReader dr;
            System.Data.SqlClient.SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["HotelConnectionString"].ConnectionString;

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select [UserPassword] from [User] where UserLoginName=@UserLoginName";
            cmd.CommandType = CommandType.Text;

            SqlParameter para = new SqlParameter("@UserLoginName", SqlDbType.VarChar, 50);
            para.Value = LoginName;
            cmd.Parameters.Add(para);

            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                if(dr.Read())
                {
                    if(dr.GetString(0)==LoginPassword)
                    {
                        Session.Add("LoginName",LoginName);
                        UserLoginName.Text = "";
                        UserPassword.Text = "";



                        Session.Add("LoginName", LoginName);
                        Response.Redirect("Shop.aspx");
                    }
                    else
                    {
                 
                        
                        Response.Write("<script>alert('密码错误！');</script>");

                    }
                }
                else
                {
                    
                    Response.Write("<script>alert('用户不存在！');</script>");

                }
                dr.Close();


                

            }
            catch(SqlException sqlException)
            {
                Response.Write(sqlException.Message);
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();
            }
        }



        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            UserLoginName.Text ="";
            UserPassword.Text = "";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManagerLogin.aspx");
        }



    }
}