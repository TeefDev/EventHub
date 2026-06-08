<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookEvent.aspx.cs" Inherits="EventHub.BookEvent" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Book Event - EventHub</title>

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
            width: 560px;
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

        .input:focus {
            border-color: #38bdf8;
            box-shadow: 0 0 0 4px rgba(56,189,248,0.12);
        }

        .input[readonly] {
            color: #7dd3fc;
            font-weight: 800;
            background: rgba(56,189,248,0.10);
        }

        .choice-box {
            background: rgba(15,23,42,0.55);
            border: 1px solid rgba(148,163,184,0.18);
            border-radius: 16px;
            padding: 14px;
            margin-top: 8px;
        }

        .choice-box label {
            display: inline-block;
            margin: 0 18px 0 6px;
            color: #cbd5e1;
            font-weight: 600;
        }

        .check-list{
    color:white;
    margin:10px 0 18px;
}

.check-list td{
    padding-right:20px;
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
            opacity: 0;transform: translateY(-20px);
            pointer-events: none;
            transition: all .4s ease;
        }

        .popup-success.show {
            opacity: 1;
            transform: translateY(0);
        }

        .footer {
            text-align: center;
            padding: 22px;
            background: #020617;
            color: #64748b;
            border-top: 1px solid rgba(148,163,184,0.15);
        }
    </style>

    <script>
        function validateBooking() {
            var userName = document.getElementById('<%= txtUserName.ClientID %>').value.trim();

            if (userName === "") {
                alert("Please enter your name.");
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
        ✅ Booking confirmed successfully.
    </div>

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

    <div class="page">
        <div class="card">
            <div class="badge">Event Booking Form</div>

            <h2>Book Your Event</h2>
            <p class="subtitle">Select an event and confirm your reservation.</p>

            <label>Your Name</label>
            <asp:TextBox ID="txtUserName" runat="server" CssClass="input"></asp:TextBox>

            <label>Select Event</label>
            <asp:DropDownList ID="ddlEvents" runat="server" CssClass="input"
                AutoPostBack="true" OnSelectedIndexChanged="ddlEvents_SelectedIndexChanged">
            </asp:DropDownList>

            <label>Event Attendance Type</label>
            <asp:TextBox ID="txtEventMode" runat="server" CssClass="input" ReadOnly="true"></asp:TextBox>

<label>Extra Services</label>

<asp:CheckBoxList ID="cblServices" runat="server" CssClass="check-list" RepeatDirection="Horizontal">
    <asp:ListItem Text="Meal" Value="Meal"></asp:ListItem>
    <asp:ListItem Text="Certificate" Value="Certificate"></asp:ListItem>
    <asp:ListItem Text="VIP Seat" Value="VIP Seat"></asp:ListItem>
</asp:CheckBoxList>

            <asp:Button ID="btnBook" runat="server" Text="Confirm Booking" CssClass="btn"
                OnClientClick="return validateBooking();" OnClick="btnBook_Click" />
        </div>
    </div>

    <div class="footer">
            © 2026 EventHub — Smart Event Booking System
        </div>
</form>
</body>
</html>