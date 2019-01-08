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
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //InitData();
            
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
            SqlDataAdapter da = new SqlDataAdapter("select *from [Order]", conn);

            conn.Open();
            da.Fill(ds);
            conn.Close();

            OrderGV.DataSource = ds;
            OrderGV.DataBind();


        }
        private void DeleteRecord(string ID)
        {
            SqlConnection connection = new SqlConnection(GetConnectionString());
            string sqlStatement = "DELETE FROM [Order] WHERE ID = @ID";

            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand(sqlStatement, connection);
                cmd.Parameters.AddWithValue("@ID", ID);
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




        private void UpdateRecord(string ID,string UserName,string A, string B,string C,string Money)
        {
            SqlConnection connection = new SqlConnection(GetConnectionString());
            string sqlStatement = "UPDATE [Order] "  +
                                  "SET A= @A, B= @B, C= @C,Money=@Money " +
                                  "WHERE ID = @ID";
            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand(sqlStatement, connection);

                cmd.Parameters.AddWithValue("@ID", ID);
                cmd.Parameters.AddWithValue("@UserName", UserName);
                cmd.Parameters.AddWithValue("@A", A);
                cmd.Parameters.AddWithValue("@B", B);
                cmd.Parameters.AddWithValue("@C", C);
                cmd.Parameters.AddWithValue("@Money", Money);

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

        protected void OrderGV_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            OrderGV.EditIndex = -1;
            GridViewBind(); 
        }

        protected void OrderGV_RowEditing(object sender, GridViewEditEventArgs e)
        {
            OrderGV.EditIndex = e.NewEditIndex; 
            GridViewBind(); 
        }

        protected void OrderGV_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
           

            
            string ID = ((TextBox)OrderGV.Rows[e.RowIndex].Cells[0].FindControl("ID")).Text;
            string UserName = ((TextBox)OrderGV.Rows[e.RowIndex].Cells[1].FindControl("UserName")).Text;
            string A = ((TextBox)OrderGV.Rows[e.RowIndex].Cells[2].FindControl("A")).Text;
            string B = ((TextBox)OrderGV.Rows[e.RowIndex].Cells[3].FindControl("B")).Text;
            string C = ((TextBox)OrderGV.Rows[e.RowIndex].Cells[4].FindControl("C")).Text;
            string Money = ((TextBox)OrderGV.Rows[e.RowIndex].Cells[5].FindControl("Money")).Text;

            //Response.Write(Money);

            UpdateRecord(ID, UserName, A, B, C,Money); 

            OrderGV.EditIndex = -1; 

            GridViewBind(); 
            

        }


        protected void OrderGV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
            string ID = ((Label)OrderGV.Rows[e.RowIndex].Cells[0].FindControl("LabelID")).Text;
            
            DeleteRecord(ID); 
            GridViewBind(); 

        }

        



        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Room.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void OrderGV_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("User.aspx");
        }
    }
}