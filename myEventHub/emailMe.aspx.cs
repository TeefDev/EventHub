using System;
using System.Drawing;
using System.Net;
using System.Web;
using System.Net.Mail;

namespace EventHub.myEventHub
{
    public partial class emailMe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string subject = txtSubject.Text.Trim();
            string message = txtMessage.Text.Trim();
            string type = rblMessageType.SelectedValue;

            if (email == ""|| message == "" || type == "")
    {
                lblMessage.Text = "Please fill all fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("teefmoo@gmail.com");
                mail.To.Add("teef122@icloud.com");

                mail.Subject = "EventHub " + type + ": " + subject;
                mail.IsBodyHtml = true;

                mail.Body =
                "<div style='font-family:Segoe UI,Arial;padding:25px;background:#f4f8fc;color:#111'>" +

                "<div style='max-width:700px;margin:auto;background:white;border-radius:14px;overflow:hidden;border:1px solid #dbe4f0'>" +

                "<div style='background:linear-gradient(135deg,#0f172a,#2563eb);padding:25px;color:white'>" +
                "<h1 style='margin:0;font-size:32px;'>EventHub</h1>" +
                "</div>" +

                "<div style='padding:25px'>" +

                "<div style='margin-bottom:16px;padding:14px;background:#f8fafc;border-radius:10px'>" +
                "<div style='font-weight:bold;color:#0f172a;margin-bottom:6px;'>Type</div>" +
                "<div style='font-size:16px;color:#111827;'>" + type + "</div>" +
                "</div>" +

                "<div style='margin-bottom:16px;padding:14px;background:#f8fafc;border-radius:10px'>" +
                "<div style='font-weight:bold;color:#0f172a;margin-bottom:6px;'>Email</div>" +
                "<div style='font-size:15px;color:#111827;'>" + email + "</div>" +
                "</div>" +

                "<div style='margin-bottom:16px;padding:14px;background:#f8fafc;border-radius:10px'>" +
                "<div style='font-weight:bold;color:#0f172a;margin-bottom:6px;'>Subject</div>" +
                "<div style='font-size:16px;color:#111827;'>" + subject + "</div>" +
                "</div>" +

                "<div style='margin-bottom:16px;padding:14px;background:#f8fafc;border-radius:10px'>" +
                "<div style='font-weight:bold;color:#0f172a;margin-bottom:6px;'>Message</div>" +
                "<div style='font-size:16px;line-height:1.8;color:#111827;word-break:break-word;'>" + message + "</div>" +
                "</div>" +

                "<div style='margin-bottom:5px;padding:14px;background:#eff6ff;border-radius:10px;border:1px solid #bfdbfe'>" +
                "<div style='font-weight:bold;color:#1e3a8a;margin-bottom:6px;'>Attachments</div>" +
                "<div style='font-size:16px;color:#111827;'>" + (fuAttachment.HasFile ? fuAttachment.FileName : "No File") + "</div>" +
                "</div>" +

                "</div></div></div>";

                if (fuAttachment.HasFile)
                {
                    foreach (HttpPostedFile file in fuAttachment.PostedFiles)
                    {
                        string fileName = System.IO.Path.GetFileName(file.FileName);
                        mail.Attachments.Add(new Attachment(file.InputStream, fileName));
                    }
                }

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new NetworkCredential("teefmoo@gmail.com", "uleorcwnovhkwvtn");
                smtp.EnableSsl = true;
                smtp.Send(mail);

                lblMessage.Text = "Email sent successfully.";
                lblMessage.ForeColor = System.Drawing.Color.LimeGreen;
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}