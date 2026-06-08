using System;
using System.Data.SqlClient;

namespace EventHub
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateRptEvents();
            }
        }

        private void populateRptEvents()
        {
            CRUD myCrud = new CRUD();

            string mySql = @"select * from Events order by EventDate asc";

            SqlDataReader dr = myCrud.getDrPassSql(mySql);

            rptEvents.DataSource = dr;
            rptEvents.DataBind();

            dr.Close();
        }
    }
}