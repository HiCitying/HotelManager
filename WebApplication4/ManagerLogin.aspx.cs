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
    public partial class ManagerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Add("ManagerName", null);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string ManagerLoginName = ManagerName.Text.Trim();
            string ManagerLoginPassword = ManagerPassword.Text.Trim();


            SqlDataReader dr;
            System.Data.SqlClient.SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["HotelConnectionString"].ConnectionString;

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select [ManagerPassword] from [Manager] where ManagerName=@ManagerName";
            cmd.CommandType = CommandType.Text;

            SqlParameter para = new SqlParameter("@ManagerName", SqlDbType.VarChar, 50);
            para.Value = ManagerLoginName;
            cmd.Parameters.Add(para);

            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr.GetString(0) == ManagerLoginPassword)
                    {

                        Session.Add("ManagerName",ManagerLoginName);
                        ManagerName.Text = "";
                        ManagerPassword.Text = "";
                        //Session.Add("ManagerName", ManagerLoginName);
                        Response.Redirect("Room.aspx");



                    }
                    else
                    {

                        Response.Write("<script>alert('密码错误！');</script>");

                    }
                }
                else
                {
                    Response.Write("<Script language=javascript>alert('管理员不存在！');</Script>");
                }
                dr.Close();


                

            }
            catch (SqlException sqlException)
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
            Response.Redirect("Login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ManagerName.Text = "";
            ManagerPassword.Text = "";
        }
    }
}
