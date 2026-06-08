using System;
using System.Data;

namespace EventHub
{
    public partial class Register : System.Web.UI.Page
    {
        CRUD myCrud = new CRUD();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (fullName == ""|| password == "" || confirmPassword == "")
            {
                lblMessage.Text = "Please fill all fields.";
                return;
            }

            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            string checkSql = "SELECT * FROM Users WHERE Email = N'" + email + "'";
            DataTable dt = myCrud.getDataPassSql(checkSql);

            if (dt.Rows.Count > 0)
            {
                lblMessage.Text = "This email is already registered.";
                return;
            }

            string insertSql = @"INSERT INTO Users
                                (FullName, Email, Password, Role)
                                VALUES
                                (N'" + fullName + @"',
                                 N'" + email + @"',
                                 N'" + password + @"',
                                 'User')";

            myCrud.executeQuery(insertSql);

            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            lblMessage.Text = "";

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "successPopup",
                "showPopup('Account created successfully.');",
                true
            );
        }
    }
}