<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emailMe.aspx.cs" Inherits="EventHub.myEventHub.emailMe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Contact - EventHub</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #020617;
            color: white;
        }

        .navbar {
            padding: 20px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(2,6,23,0.9);
            border-bottom: 1px solid rgba(148,163,184,0.18);
        }

        .logo {
            color: #38bdf8;
            font-size: 27px;
            font-weight: 900;
        }

        .nav-links a {
            color: #cbd5e1;
            text-decoration: none;
            margin-left: 22px;
            font-weight: 600;
            font-size: 14px;
        }

        .hero {
            padding: 55px 70px 25px;
            background: radial-gradient(circle at top, rgba(56,189,248,0.20), transparent 35%),
                        linear-gradient(135deg,#020617,#0f172a);
        }

        .badge {
            display: inline-block;
            padding: 9px 16px;
            border-radius: 999px;
            background: rgba(56,189,248,0.12);
            border: 1px solid rgba(56,189,248,0.35);
            color: #7dd3fc;
            font-weight: 800;
            margin-bottom: 16px;
        }

        .hero h1 {
            margin: 0;
            font-size: 42px;
        }

        .hero p {
            color: #cbd5e1;
        }

        .section {
            padding: 35px 70px 70px;
        }

        .contact-box {
            max-width: 760px;
            margin: auto;
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(148,163,184,0.18);
            border-radius: 24px;
            padding: 30px;
            box-shadow: 0 25px 70px rgba(0,0,0,0.25);
        }

        label {
            display: block;
            color: #e2e8f0;
            font-weight: 800;
            margin-bottom: 8px;
        }

        .input, .file-box {
            width: 100%;
            height: 47px;
            padding: 12px 15px;
            margin-bottom: 18px;
            border-radius: 14px;
            border: 1px solid rgba(148,163,184,.28);
            background: rgba(15,23,42,.75);
            color: white;
            outline: none;
            font-size: 15px;
        }

        .textarea {
            width: 100%;
            height: 140px;
            padding: 12px 15px;
            margin-bottom: 18px;
            border-radius: 14px;
            border: 1px solid rgba(148,163,184,.28);
            background: rgba(15,23,42,.75);
            color: white;
            outline: none;
            resize: none;
            font-size: 15px;
        }

        .type-box {
            display: grid;
            grid-template-columns: repeat(3,1fr);
            gap: 14px;
            margin-bottom: 20px;
        }

        .type-box label {
            background: rgba(15,23,42,.75);
            border: 1px solid rgba(148,163,184,.28);
            border-radius: 14px;
            padding: 14px;
            text-align: center;
            color: #e2e8f0;
            cursor: pointer;
        }

        .btn {
            width: 100%;
            height: 50px;
            border: none;
            border-radius: 15px;
            background: linear-gradient(135deg,#38bdf8,#2563eb);
            color: white;
            font-weight: 900;
            font-size: 16px;
            cursor: pointer;
        }

        .message {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-weight: 900;
        }

        .footer {
            text-align: center;
            padding: 22px;
            background: #020617;
            color: #64748b;
            border-top: 1px solid rgba(148,163,184,0.15);
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="navbar">
    <div class="logo">EventHub</div>

    <div class="nav-links">
        <a href="../Pages/Home.aspx">Home</a>
        <a href="../Pages/About.aspx">About Us</a>
        <a href="../Pages/Events.aspx">Events</a>
        <a href="../Pages/BookEvent.aspx">Bookings</a>
        <a href="../Pages/MyBookings.aspx">My Tickets</a>
        <a href="../myEventHub/emailMe.aspx">Contact</a>
        <a href="../Pages/Login.aspx">Sign Out</a>
    </div>
</div>

    <section class="hero">
        <div class="badge">Contact Center</div>
        <h1>Contact EventHub</h1>
        <p>Send your message directly to the EventHub admin.</p>
    </section>

    <section class="section">
        <div class="contact-box">

            <label>Message Type</label>
            <asp:RadioButtonList ID="rblMessageType" runat="server" CssClass="type-box" RepeatDirection="Horizontal">
                <asp:ListItem Text="Complaint" Value="Complaint"></asp:ListItem>
                <asp:ListItem Text="Note" Value="Note"></asp:ListItem>
                <asp:ListItem Text="Suggestion" Value="Suggestion"></asp:ListItem>
            </asp:RadioButtonList>

            <label>From Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input" TextMode="Email"></asp:TextBox>

            <label>Subject</label>
            <asp:TextBox ID="txtSubject" runat="server" CssClass="input"></asp:TextBox>

            <label>File Attachments</label>
            <asp:FileUpload ID="fuAttachment" runat="server" CssClass="file-box" AllowMultiple="true" />

            <label>Message</label>
            <asp:TextBox ID="txtMessage" runat="server" CssClass="textarea" TextMode="MultiLine"></asp:TextBox>

            <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn" OnClick="btnSend_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

        </div>
    </section>
    
    <div class="footer">
            © 2026 EventHub — Smart Event Booking System
        </div>

</form>
</body>
</html>