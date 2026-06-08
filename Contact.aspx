<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="EventHub.Contact" %>

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
            background: rgba(2, 6, 23, 0.9);
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

        .nav-links a:hover { color: #38bdf8; }

        .page {
            min-height: 88vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 45px 20px;
            background:
                radial-gradient(circle at top left, rgba(56,189,248,0.20), transparent 35%),
                linear-gradient(135deg, #020617, #0f172a);
        }

        .card {
            width: 620px;
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(148,163,184,0.20);
            border-radius: 26px;
            padding: 34px;
            box-shadow: 0 30px 80px rgba(0,0,0,0.35);
            backdrop-filter: blur(16px);
        }

        .badge {
            display: inline-block;
            padding: 8px 14px;
            border-radius: 999px;
            background: rgba(56,189,248,0.13);
            border: 1px solid rgba(56,189,248,0.35);
            color: #7dd3fc;
            font-weight: 800;
            margin-bottom: 16px;
        }

        h2 {
            margin: 0 0 8px;
            font-size: 34px;
        }

        .subtitle {
            color: #cbd5e1;
            margin-bottom: 24px;
        }

        label {
            display: block;
            margin: 14px 0 7px;
            color: #e2e8f0;
            font-weight: 700;
            font-size: 14px;
        }

        .input {
            width: 100%;
            height: 44px;
            padding: 10px 14px;
            border-radius: 13px;
            border: 1px solid rgba(148,163,184,0.28);
            outline: none;
            background: rgba(15,23,42,0.75);
            color: white;
            font-size: 15px;
        }

        .textarea {
            width: 100%;
            height: 120px;
            padding: 12px 14px;
            border-radius: 13px;
            border: 1px solid rgba(148,163,184,0.28);
            outline: none;
            background: rgba(15,23,42,0.75);
            color: white;
            font-size: 15px;
            resize: none;
        }

        .input:focus, .textarea:focus {
            border-color: #38bdf8;
            box-shadow: 0 0 0 4px rgba(56,189,248,0.12);
        }

        .btn {
            width: 100%;
            height: 48px;
            margin-top: 24px;
            border: none;
            border-radius: 14px;
            background: linear-gradient(135deg, #38bdf8, #2563eb);
            color: white;
            font-size: 16px;
            font-weight: 900;
            cursor: pointer;
        }

        .popup-success {
            position: fixed;
            top: 25px;
            right: 25px;
            background: linear-gradient(135deg,#22c55e,#16a34a);
            color: white;
            padding: 16px 24px;
            border-radius: 14px;
            font-weight: 900;
            box-shadow: 0 20px 45px rgba(0,0,0,0.30);
            z-index: 9999;
            opacity: 0;
            transform: translateY(-20px);
            pointer-events: none;
            transition: all .4s ease;
        }

        .popup-success.show {opacity: 1;
            transform: translateY(0);
        }

        .error {
            display: block;
            text-align: center;
            color: #f87171;
            font-weight: 800;
            margin-top: 14px;
        }
    </style>

    <script>
        function validateContact() {
            var name = document.getElementById('<%= txtFullName.ClientID %>').value.trim();
            var email = document.getElementById('<%= txtEmail.ClientID %>').value.trim();
            var subject = document.getElementById('<%= txtSubject.ClientID %>').value.trim();
            var message = document.getElementById('<%= txtMessage.ClientID %>').value.trim();

            if (name === ""|| subject === "" || message === "") {
                alert("Please fill all fields.");
                return false;
            }

            if (!email.includes("@") || !email.includes(".")) {
                alert("Please enter a valid email address.");
                return false;
            }

            return true;
        }

        function showSuccessPopup() {
            var popup = document.getElementById("successPopup");
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 5000);
        }
    </script>
</head>

<body>
<form id="form1" runat="server">

    <div id="successPopup" class="popup-success">
        ✅ Message sent successfully.
    </div>

    <div class="navbar">
        <div class="logo">EventHub</div>

        <div class="nav-links">
            <a href="Home.aspx">Home</a>
            <a href="About.aspx">About</a>
            <a href="Events.aspx">Events</a>
            <a href="BookEvent.aspx">Book Event</a>
            <a href="MyBookings.aspx">My Bookings</a>
            <a href="Contact.aspx">Contact</a>
            <a href="Login.aspx">Logout</a>
        </div>
    </div>

    <div class="page">
        <div class="card">
            <div class="badge">Contact Us</div>

            <h2>Get in Touch</h2>
            <p class="subtitle">Send us your questions or feedback through this form.</p>

            <label>Full Name</label>
            <asp:TextBox ID="txtFullName" runat="server" CssClass="input"></asp:TextBox>

            <label>Email Address</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input" TextMode="Email"></asp:TextBox>

            <label>Subject</label>
            <asp:TextBox ID="txtSubject" runat="server" CssClass="input"></asp:TextBox>

            <label>Message</label>
            <asp:TextBox ID="txtMessage" runat="server" CssClass="textarea" TextMode="MultiLine"></asp:TextBox>

            <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn"
                OnClientClick="return validateContact();" OnClick="btnSend_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>
        </div>
    </div>

</form>
</body>
</html>