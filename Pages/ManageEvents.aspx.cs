using System;
using System.Data;
using System.IO;

namespace EventHub
{
    public partial class ManageEvents : System.Web.UI.Page
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
                LoadEvents();
                btnUpdate.Enabled = false;
            }
        }

        private void LoadEvents()
        {
            string mySql = "SELECT * FROM Events ORDER BY EventDate ASC";
            DataTable dt = myCrud.getDataPassSql(mySql);

            gvEvents.DataSource = dt;
            gvEvents.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!ValidateFields())
                return;

            string imagePath = "";

            if (fuEventImage.HasFile)
            {
                string fileName = Path.GetFileName(fuEventImage.FileName);
                string folderPath = Server.MapPath("~/images/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                fuEventImage.SaveAs(folderPath + fileName);
                imagePath = "~/images/" + fileName;
            }

            string mySql = @"INSERT INTO Events
                            (EventTitle, EventType, EventMode, EventDate, EventTime, Location, Description, Capacity, EventImage)
                            VALUES
                            (N'" + txtEventTitle.Text.Trim() + @"',
                             N'" + ddlEventType.SelectedValue + @"',
                             N'" + ddlEventMode.SelectedValue + @"',
                             '" + txtEventDate.Text.Trim() + @"',
                             '" + txtEventTime.Text.Trim() + @"',
                             N'" + txtLocation.Text.Trim() + @"',
                             N'" + txtDescription.Text.Trim() + @"',
                             " + txtCapacity.Text.Trim() + @",
                             N'" + imagePath + @"')";

            myCrud.executeQuery(mySql);

            lblMessage.Text = "Event added successfully.";
            ClearForm();
            LoadEvents();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (hfEventID.Value == "")
            {
                lblMessage.Text = "Please select an event to update.";
                return;
            }

            if (!ValidateFields())
                return;

            string imageSql = "";

            if (fuEventImage.HasFile)
            {
                string fileName = Path.GetFileName(fuEventImage.FileName);
                string folderPath = Server.MapPath("~/images/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                fuEventImage.SaveAs(folderPath + fileName);
                string imagePath = "~/images/" + fileName;

                imageSql = ", EventImage = N'" + imagePath + @"'";
            }

            string mySql = @"UPDATE Events
                            SET EventTitle = N'" + txtEventTitle.Text.Trim() + @"',
                                EventType = N'" + ddlEventType.SelectedValue + @"',
                                EventMode = N'" + ddlEventMode.SelectedValue + @"',
                                EventDate = '" + txtEventDate.Text.Trim() + @"',
                                EventTime = '" + txtEventTime.Text.Trim() + @"',
                                Location = N'" + txtLocation.Text.Trim() + @"',
                                Description = N'" + txtDescription.Text.Trim() + @"',
                                Capacity = " + txtCapacity.Text.Trim() +
                                imageSql + @"
                            WHERE EventID = " + hfEventID.Value; myCrud.executeQuery(mySql);

            lblMessage.Text = "Event updated successfully.";
            ClearForm();
            LoadEvents();
        }

        protected void gvEvents_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int eventID = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditEvent")
            {
                LoadEventByID(eventID);
            }

            if (e.CommandName == "DeleteEvent")
            {
                DeleteEvent(eventID);
                ClearForm();
                LoadEvents();
                lblMessage.Text = "Event deleted successfully.";
            }
        }

        private void LoadEventByID(int eventID)
        {
            string mySql = "SELECT * FROM Events WHERE EventID = " + eventID;
            DataTable dt = myCrud.getDataPassSql(mySql);

            if (dt.Rows.Count > 0)
            {
                hfEventID.Value = dt.Rows[0]["EventID"].ToString();
                txtEventTitle.Text = dt.Rows[0]["EventTitle"].ToString();
                ddlEventType.SelectedValue = dt.Rows[0]["EventType"].ToString();
                ddlEventMode.SelectedValue = dt.Rows[0]["EventMode"].ToString();

                DateTime eventDate = Convert.ToDateTime(dt.Rows[0]["EventDate"]);
                txtEventDate.Text = eventDate.ToString("yyyy-MM-dd");

                txtEventTime.Text = dt.Rows[0]["EventTime"].ToString();
                txtLocation.Text = dt.Rows[0]["Location"].ToString();
                txtDescription.Text = dt.Rows[0]["Description"].ToString();
                txtCapacity.Text = dt.Rows[0]["Capacity"].ToString();

                btnAdd.Enabled = false;
                btnUpdate.Enabled = true;
            }
        }

        private void DeleteEvent(int eventID)
        {
            string mySql = "DELETE FROM Events WHERE EventID = " + eventID;
            myCrud.executeQuery(mySql);
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void ClearForm()
        {
            hfEventID.Value = "";
            txtEventTitle.Text = "";
            ddlEventType.SelectedIndex = 0;
            ddlEventMode.SelectedIndex = 0;
            txtEventDate.Text = "";
            txtEventTime.Text = "";
            txtLocation.Text = "";
            txtDescription.Text = "";
            txtCapacity.Text = "";

            btnAdd.Enabled = true;
            btnUpdate.Enabled = false;
        }

        private bool ValidateFields()
        {
            if (txtEventTitle.Text.Trim() == "" ||
                txtEventDate.Text.Trim() == "" ||
                txtEventTime.Text.Trim() == "" ||
                txtLocation.Text.Trim() == "" ||
                txtCapacity.Text.Trim() == "")
            {
                lblMessage.Text = "Please fill all required fields.";
                return false;
            }

            return true;
        }
    }
}