using System;
using System.Data;

namespace EventHub
{
    public partial class ManageBookings : System.Web.UI.Page
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
                LoadBookings();
                btnUpdate.Enabled = false;
            }
        }

        private void LoadBookings()
        {
            string mySql = @"
                SELECT 
                    B.BookingID,
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

            gvBookings.DataSource = dt;
            gvBookings.DataBind();
        }

        protected void gvBookings_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int bookingID = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditBooking")
            {
                LoadBookingByID(bookingID);
            }

            if (e.CommandName == "DeleteBooking")
            {
                DeleteBooking(bookingID);
                ClearForm();
                LoadBookings();
                lblMessage.Text = "Booking deleted successfully.";
            }
        }

        private void LoadBookingByID(int bookingID)
        {
            string mySql = @"
                SELECT 
                    B.BookingID,
                    U.FullName,
                    E.EventTitle,
                    B.BookingStatus
                FROM Bookings B
                INNER JOIN Users U ON B.UserID = U.UserID
                INNER JOIN Events E ON B.EventID = E.EventID
                WHERE B.BookingID = " + bookingID;

            DataTable dt = myCrud.getDataPassSql(mySql);

            if (dt.Rows.Count > 0)
            {
                hfBookingID.Value = dt.Rows[0]["BookingID"].ToString();
                txtUserName.Text = dt.Rows[0]["FullName"].ToString();
                txtEventTitle.Text = dt.Rows[0]["EventTitle"].ToString();
                ddlStatus.SelectedValue = dt.Rows[0]["BookingStatus"].ToString();

                btnUpdate.Enabled = true;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (hfBookingID.Value == "")
            {
                lblMessage.Text = "Please select a booking to update.";
                return;
            }

            string mySql = @"UPDATE Bookings
                             SET BookingStatus = N'" + ddlStatus.SelectedValue + @"'
                             WHERE BookingID = " + hfBookingID.Value;

            myCrud.executeQuery(mySql);

            lblMessage.Text = "Booking status updated successfully.";
            ClearForm();
            LoadBookings();
        }

        private void DeleteBooking(int bookingID)
        {
            string mySql = "DELETE FROM Bookings WHERE BookingID = " + bookingID;
            myCrud.executeQuery(mySql);
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void ClearForm()
        {
            hfBookingID.Value = "";
            txtUserName.Text = "";
            txtEventTitle.Text = "";
            ddlStatus.SelectedIndex = 0;
            btnUpdate.Enabled = false;
        }
    }
}