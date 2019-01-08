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
    public partial class Shoping : System.Web.UI.Page
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
                    canshu();
                }

            }
            catch (System.NullReferenceException)
            {
                Response.Redirect("Login.aspx");
            }
            
        }

        protected void canshu()
        {
            
            
            LabelA.Text = Application["ANum"].ToString();
            LabelB.Text = Application["BNum"].ToString();
            LabelC.Text = Application["CNum"].ToString();

            int A1 = Convert.ToInt32(Application["ANum"]);
            int B1 = Convert.ToInt32(Application["BNum"]);
            int C1 = Convert.ToInt32(Application["CNum"]);


            int AP = Convert.ToInt32(Application["APrice"]);
            int BP = Convert.ToInt32(Application["BPrice"]);
            int CP = Convert.ToInt32(Application["CPrice"]);

            int Price = A1 * AP + B1 * BP + C1 * CP;
            LabeAPrice.Text = Price.ToString();
            //int Price = A1 + B1 + C1;
            //LabeAPrice.Text = Price.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            LoginSql();
        }

        protected void LoginSql()
        {
            System.Data.SqlClient.SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["HotelConnectionString"].ConnectionString;

           // conn.Open();

            SqlCommand Cmd = new SqlCommand();
            Cmd.Connection = conn;

            string SqlStr;
            SqlStr = "insert into [Order]([UserName],[A],[B],[C],[Money],[Time])values(@UserName,@A,@B,@C,@Money,getDate())";
            Cmd.CommandText = SqlStr;

            SqlParameter para1 = new SqlParameter("@UserName", SqlDbType.VarChar, 50);
            para1.Value = Session["LoginName"].ToString();
            Cmd.Parameters.Add(para1);


            LabelA.Text = Application["ANum"].ToString();
            LabelB.Text = Application["BNum"].ToString();
            LabelC.Text = Application["CNum"].ToString();

            int A1 = Convert.ToInt32(Application["ANum"]);
            int B1 = Convert.ToInt32(Application["BNum"]);
            int C1 = Convert.ToInt32(Application["CNum"]);

            int AP = Convert.ToInt32(Application["APrice"]);
            int BP = Convert.ToInt32(Application["BPrice"]);
            int CP = Convert.ToInt32(Application["CPrice"]);

            int Price = A1 * AP + B1 * BP + C1 * CP;

            SqlParameter para2 = new SqlParameter("@A", SqlDbType.Int);
            para2.Value = A1;
            Cmd.Parameters.Add(para2);

            SqlParameter para3 = new SqlParameter("@B", SqlDbType.Int);
            para3.Value = B1;
            Cmd.Parameters.Add(para3);

            SqlParameter para4 = new SqlParameter("@C", SqlDbType.Int);
            para4.Value = C1;
            Cmd.Parameters.Add(para4);

            SqlParameter para5 = new SqlParameter("@Money", SqlDbType.Int);
            para5.Value = Price;
            Cmd.Parameters.Add(para5);


            try
            {
                conn.Open();
                Cmd.ExecuteNonQuery();
                Response.Write("<script>alert('预定成功！');</script>");
                //Response.Redirect("Shop.aspx");
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shop.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}