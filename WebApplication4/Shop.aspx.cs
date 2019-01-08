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
    public partial class Test : System.Web.UI.Page
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
                    Initial();
                }
                
            }
            catch (System.NullReferenceException)
            {
                Response.Redirect("Login.aspx");
            }
       
        }

        protected void Initial()
        {
            SqlDataReader dr;
            System.Data.SqlClient.SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["HotelConnectionString"].ConnectionString;
            
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select [RoomNum],[RoomPrice]from [Room] ";
            cmd.CommandType = CommandType.Text;
            


            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                int count = 0;
                while (dr.Read())
                {

                    
                    if(count==0)
                    {
                        ANum.Text = dr.GetValue(0).ToString();
                        LabelAPrice.Text = dr.GetValue(1).ToString();
                    }
                    if(count==1)
                    {
                        BNum.Text = dr.GetValue(0).ToString();
                        LabelBPrice.Text = dr.GetValue(1).ToString();
                    }
                    if (count == 2)
                    {
                        CNum.Text = dr.GetValue(0).ToString();
                        LabelCPrice.Text = dr.GetValue(1).ToString();
                    }
                    count++;
                    
                  

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


        protected void Button1_Click(object sender, EventArgs e)
        {
            String A = ANum.Text.ToString();
            String B = BNum.Text.ToString();
            String C = CNum.Text.ToString();

            string AO = AOrderNum.Text.ToString();
            string BO = BOrderNum.Text.ToString();
            string CO = COrderNum.Text.ToString();

            string AP1 = LabelAPrice.Text.ToString();
            string BP1 = LabelBPrice.Text.ToString();
            string CP1 = LabelCPrice.Text.ToString();


            if (AO==""&&BO=="" &&CO=="")
            {
                Response.Write("<script>alert('你还未选择！');</script>");
            }
            else{
                if(AO=="")
                {
                    AO = "0";
                }
                if(BO=="")
                {
                    BO = "0";

                }
                if (CO == "")
                {
                    CO = "0";
                }

                int A1 = Convert.ToInt32(A);
                int B1 = Convert.ToInt32(B);
                int C1 = Convert.ToInt32(C);


                

                int AO1 = Convert.ToInt32(AO);
                int BO1 = Convert.ToInt32(BO);
                int CO1 = Convert.ToInt32(CO);

                int AP01 = Convert.ToInt32(AP1);
                int BP01 = Convert.ToInt32(BP1);
                int CP01 = Convert.ToInt32(CP1);

                if (A1 < AO1 || B1 < BO1 || C1 < CO1)
                {
                    Response.Write("<script>alert('请合理输入！');</script>");
                }
                else
                {
                    Application["ANum"] = AO1;
                    Application["BNum"] = BO1;
                    Application["CNum"] = CO1;


                    Application["APrice"] = AP01;
                    Application["BPrice"] = BP01;
                    Application["CPrice"] = CP01;


                    Response.Redirect("Shoping.aspx");
                }
            }

            

            
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserPersonal.aspx");
        }
    }
}