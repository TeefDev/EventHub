using System;
using System.Data;

namespace EventHub
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        CRUD myCrud = new CRUD();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadCounts();
                LoadLatestBookings();
            }
        }

        private void LoadCounts()
        {
            lblUsers.Text = GetCount("Users").ToString();
            lblEvents.Text = GetCount("Events").ToString();
            lblBookings.Text = GetCount("Bookings").ToString();
            lblMessages.Text = GetCount("ContactMessages").ToString();
        }

        private int GetCount(string tableName)
        {
            string mySql = "SELECT COUNT(*) FROM " + tableName;
            object result = myCrud.getSingleValue(mySql);
            return Convert.ToInt32(result);
        }

        private void LoadLatestBookings()
        {
            string mySql = @"
            SELECT TOP 10
            U.FullName,
            E.EventTitle,
            B.BookingType,
            B.ExtraServices,
            B.BookingStatus,
            B.BookingDate
            FROM Bookings B
            INNER JOIN Users U ON B.UserID = U.UserID
            INNER JOIN Events E ON B.EventID = E.EventID
            ORDER BY B.BookingDate DESC";

            DataTable dt = myCrud.getDataPassSql(mySql);

            gvLatestBookings.DataSource = dt;
            gvLatestBookings.DataBind();
        }
    }
}