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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UserName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string A = UserPassword.Text;
            string B = RUserPassword.Text;
            if (A != B)
            {
                Response.Write("<script>alert('密码不一致！');</script>");
            }
            else
            {

           
            System.Data.SqlClient.SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["HotelConnectionString"].ConnectionString;
       
            conn.Open();

            SqlCommand Cmd = new SqlCommand();
            Cmd.Connection = conn;
            Cmd.CommandText = "select [UserLoginName] from [User]";
            SqlDataReader dr = Cmd.ExecuteReader();

            while(dr.Read())
            {
                if(dr.GetString(0)==UserLoginName.Text)
                {
                    Response.Write("<script>alert('该用户已注册！');</script>");

                    return;
                }
            }
            conn.Close();



            string SqlStr;
            SqlStr = "insert into [User]([UserLoginName],[UserPassword],[UserName],[UserSex],[UserTelephone],[UserAddress],[USerEmail])"
                + "values(@UserLoginName,@UserPassword,@UserName,@UserSex,@UserTelephone,@UserAddress,@USerEmail)";
            Cmd.CommandText = SqlStr;

            SqlParameter para1 = new SqlParameter("@UserLoginName", SqlDbType.VarChar, 50);
            para1.Value = UserLoginName.Text;
            Cmd.Parameters.Add(para1);

            SqlParameter para2 = new SqlParameter("@UserPassword", SqlDbType.VarChar,50);
            para2.Value = UserPassword.Text;
            Cmd.Parameters.Add(para2);

            SqlParameter para3 = new SqlParameter("@UserName", SqlDbType.VarChar, 50);
            para3.Value = UserName.Text;
            Cmd.Parameters.Add(para3);

            SqlParameter para4 = new SqlParameter("@UserSex", SqlDbType.VarChar, 50);
            para4.Value = UserSex.SelectedValue.ToString();
            Cmd.Parameters.Add(para4);

            SqlParameter para5 = new SqlParameter("@UserTelephone", SqlDbType.VarChar, 50);
            para5.Value = UserTelephone.Text;
            Cmd.Parameters.Add(para5);

            SqlParameter para6 = new SqlParameter("@UserAddress", SqlDbType.VarChar, 50);
            para6.Value = UserAddress.Text;
            Cmd.Parameters.Add(para6);

            SqlParameter para7 = new SqlParameter("@UserEmail", SqlDbType.VarChar, 50);
            para7.Value = UserEmail.Text;
            Cmd.Parameters.Add(para7);


            try
            {
                conn.Open();
                Cmd.ExecuteNonQuery();
                    //Response.Write("<script>alert('注册成功！');</script>");
                    Response.Write("<script>alert('注册成功,请先登录！');</script>");
                    

                Response.Redirect("Login.aspx");
                    Response.End();
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
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            UserLoginName.Text = "";
            UserPassword.Text = "";
            UserPassword.Text = "";
            UserName.Text = "";
            UserSex.SelectedValue = "其他";
            UserTelephone.Text = "";
            UserEmail.Text = "";
            //Response.Write("<script>alert('用户取消注册！');</script>");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}