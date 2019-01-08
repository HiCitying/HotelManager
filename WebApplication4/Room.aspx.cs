using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text.RegularExpressions;
using System.Data.SqlClient;

namespace WebApplication4
{
    public partial class Try : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Session["ManagerName"] == null)
                {
                    Response.Write("<script>alert('请先登录！');</script>");
                    Response.Redirect("ManagerLogin.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        GridViewBind();
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
           
            System.Data.SqlClient.SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["HotelConnectionString"].ConnectionString;

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("select *from [Room]", conn);

            conn.Open();
            da.Fill(ds);
            conn.Close();

            GridView1.DataSource = ds;
            GridView1.DataBind();


        }
        private void DeleteRecord(string RoomId)
        {
            SqlConnection connection = new SqlConnection(GetConnectionString());
            string sqlStatement = "DELETE FROM Room WHERE RoomId = @RoomId";

            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand(sqlStatement, connection);
                cmd.Parameters.AddWithValue("@RoomId",RoomId);
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

        
       

        private void UpdateRecord(string RoomId, string RoomType, string RoomTypeNum, string RoomPrice,string RoomNum)
        {
            SqlConnection connection = new SqlConnection(GetConnectionString());
            string sqlStatement = "UPDATE Room " +
                                  "SET RoomType= @RoomType, RoomTypeNum= @RoomTypeNum, RoomPrice= @RoomPrice,RoomNum=@RoomNum " +
                                  "WHERE RoomId = @RoomId";
            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand(sqlStatement, connection);
                cmd.Parameters.AddWithValue("@RoomId", RoomId);
                cmd.Parameters.AddWithValue("@RoomType",RoomType);
                cmd.Parameters.AddWithValue("@RoomTypeNum",RoomTypeNum);
                cmd.Parameters.AddWithValue("@RoomPrice",RoomPrice);
                cmd.Parameters.AddWithValue("@RoomNum", RoomNum);

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

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1; 
            GridViewBind(); 
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex; 
            GridViewBind(); 
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
            string RoomId = ((TextBox)GridView1.Rows[e.RowIndex].Cells[0].FindControl("TextBoxRoomId")).Text;
            string RoomType = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("TextBoxRoomType")).Text;
            string RoomTypeNum = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].FindControl("TextBoxRoomTypeNum")).Text;
            string RoomPrice = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].FindControl("TextBoxRoomPrice")).Text;
            string RoomNum = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].FindControl("TextBoxRoomNum")).Text;


            UpdateRecord(RoomId,RoomType,RoomTypeNum,RoomPrice,RoomNum); 

            GridView1.EditIndex = -1; 
            GridViewBind(); 


        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
            string RoomId = ((Label)GridView1.Rows[e.RowIndex].Cells[0].FindControl("LabelRoomId")).Text;
            
            DeleteRecord(RoomId); 

            GridViewBind(); 

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Order.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("User.aspx");
        }
    }
}

