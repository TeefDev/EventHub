using System;
using System.Data;

namespace EventHub
{
    public partial class MyBookings : System.Web.UI.Page
    {
        CRUD myCrud = new CRUD();

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadMyBookings();
            }
        }

        private void LoadMyBookings()
        {
            string mySql = @"
                SELECT
                    B.BookingID,
                    E.EventTitle,
                    E.EventType,
                    E.EventDate,
                    E.EventTime,
                    E.Location,
                    B.BookingType,
                    B.ExtraServices,
                    B.BookingStatus,
                    B.BookingDate
                FROM Bookings B
                INNER JOIN Events E ON B.EventID = E.EventID
                WHERE B.UserID = " + Session["UserID"].ToString() + @"
                ORDER BY B.BookingDate DESC";

            DataTable dt = myCrud.getDataPassSql(mySql);

            gvMyBookings.DataSource = dt;
            gvMyBookings.DataBind();
        }
    }
}