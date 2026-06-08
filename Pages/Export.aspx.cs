using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventHub
{
    public partial class Export : System.Web.UI.Page
    {
        CRUD myCrud = new CRUD();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnExportBookings_Click(object sender, EventArgs e)
        {
            string mySql = @"
                SELECT 
                    B.BookingID,
                    U.FullName,
                    U.Email,
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
            ExportToExcel(dt, "Bookings_Report.xls");
        }

        protected void btnExportEvents_Click(object sender, EventArgs e)
        {
            string mySql = @"
                SELECT 
                    EventID,
                    EventTitle,
                    EventType,
                    EventMode,
                    EventDate,
                    EventTime,
                    Location,
                    Description,
                    Capacity,
                    CreatedAt
                FROM Events
                ORDER BY EventDate ASC";

            DataTable dt = myCrud.getDataPassSql(mySql);
            ExportToExcel(dt, "Events_Report.xls");
        }

        protected void btnExportUsers_Click(object sender, EventArgs e)
        {
            string mySql = @"
                SELECT
                    UserID,
                    FullName,
                    Email,
                    Role,
                    CreatedAt
                FROM Users
                ORDER BY CreatedAt DESC";

            DataTable dt = myCrud.getDataPassSql(mySql);
            ExportToExcel(dt, "Users_Report.xls");
        }

        private void ExportToExcel(DataTable dt, string fileName)
        {
            GridView gv = new GridView();
            gv.DataSource = dt;
            gv.DataBind();

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";

            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            gv.RenderControl(hw);

            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }
    }
}