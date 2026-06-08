using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace EventHub
{
    public partial class Contact : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["EventHubConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string subject = txtSubject.Text.Trim();
            string message = txtMessage.Text.Trim();

            if (fullName == ""|| subject == "" || message == "")
            {
                lblMessage.Text = "Please fill all fields.";
                return;
            }

            try
            {
                SaveMessage(fullName, email, subject, message);
                SendEmail(fullName, email, subject, message);

                txtFullName.Text = "";
                txtEmail.Text = "";
                txtSubject.Text = "";
                txtMessage.Text = "";
                lblMessage.Text = "";

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "popup",
                    "showSuccessPopup();",
                    true
                );
            }
            catch
            {
                lblMessage.Text = "Message saved, but email settings need to be checked.";
            }
        }

        private void SaveMessage(string fullName, string email, string subject, string message)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"INSERT INTO ContactMessages 
                                (FullName, Email, Subject, Message)
                                VALUES 
                                (@FullName, @Email, @Subject, @Message)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Subject", subject);
                cmd.Parameters.AddWithValue("@Message", message);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void SendEmail(string fullName, string email, string subject, string message)
        {
            string fromEmail = "teefmoo@gmail.com";
            string appPassword = "uleorcwnovhkwvtn";
            string toEmail = "teef122@icloud.com";

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(fromEmail);
            mail.To.Add(toEmail);
            mail.Subject = "EventHub Contact: " + subject;
            mail.Body =
                "Name: " + fullName + "\n" +
                "Email: " + email + "\n\n" +
                "Message:\n" + message;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new NetworkCredential(fromEmail, appPassword);
            smtp.EnableSsl = true;

            smtp.Send(mail);
        }
    }
}