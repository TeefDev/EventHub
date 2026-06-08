using System;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace EventHub
{
    public partial class BookEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!Page.IsPostBack)
            {
                populateDdlEvents();
                populateUserName();
            }
        }

        private void populateUserName()
        {
            if (Session["FullName"] != null)
            {
                txtUserName.Text = Session["FullName"].ToString();
            }
        }

        private void populateDdlEvents()
        {
            CRUD myCrud = new CRUD();

            string mySql = @"select EventID, EventTitle from Events order by EventDate asc";

            SqlDataReader dr = myCrud.getDrPassSql(mySql);

            ddlEvents.DataValueField = "EventID";
            ddlEvents.DataTextField = "EventTitle";
            ddlEvents.DataSource = dr;
            ddlEvents.DataBind();

            dr.Close();

            if (Request.QueryString["EventID"] != null)
            {
                ddlEvents.SelectedValue = Request.QueryString["EventID"];
            }

            populateEventMode();
        }

        private void populateEventMode()
        {
            CRUD myCrud = new CRUD();

            string mySql = @"select EventMode from Events where EventID = " + ddlEvents.SelectedValue;

            object result = myCrud.getSingleValue(mySql);

            if (result != null)
            {
                txtEventMode.Text = result.ToString();
            }
        }

        protected void ddlEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            populateEventMode();
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();

            string extraServices = string.Join(", ",
                cblServices.Items.Cast<ListItem>()
                .Where(item => item.Selected)
                .Select(item => item.Text));

            string mySql = @"insert into Bookings
                            (UserID, EventID, BookingType, ExtraServices, BookingStatus)
                            values
                            (" + Session["UserID"].ToString() + @",
                             " + ddlEvents.SelectedValue + @",
                             N'" + txtEventMode.Text + @"',
                             N'" + extraServices + @"',
                             'Confirmed')";

            myCrud.executeQuery(mySql);

            foreach (ListItem item in cblServices.Items)
            {
                item.Selected = false;
            }

            ClientScript.RegisterStartupScript(this.GetType(), "popup", "showSuccessPopup();", true);
        }
    }
}