<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="EventHub.MyBookings" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>My Bookings - EventHub</title>

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

        .hero {
            padding: 65px 70px 35px;
            text-align: center;
            background:
                radial-gradient(circle at top, rgba(56,189,248,0.20), transparent 35%),
                linear-gradient(135deg, #020617, #0f172a);
        }

        .badge {
            display: inline-block;
            padding: 9px 16px;
            border-radius: 999px;
            background: rgba(56,189,248,0.12);
            border: 1px solid rgba(56,189,248,0.35);
            color: #7dd3fc;
            font-weight: 800;
            margin-bottom: 18px;
        }

        .hero h1 {
            font-size: 46px;
            margin: 0 0 14px;
        }

        .hero p {
            color: #cbd5e1;
            font-size: 17px;
        }

        .section {
            padding: 45px 70px 70px;
        }

        .table-box {
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(148,163,184,0.18);
            border-radius: 24px;
            padding: 24px;
            box-shadow: 0 25px 70px rgba(0,0,0,0.25);
            overflow-x: auto;
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
            color: white;
        }

        .grid th {
            background: rgba(56,189,248,0.18);
            color: #7dd3fc;
            padding: 14px;
            text-align: left;
            font-size: 14px;
        }

        .grid td {
            padding: 14px;
            border-bottom: 1px solid rgba(148,163,184,0.16);
            color: #e2e8f0;
            font-size: 14px;
        }

        .empty {
            text-align: center;
            color: #94a3b8;
            padding: 35px;
            font-size: 17px;
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
        <div class="badge">My Reservations</div>
        <h1>My Bookings</h1>
        <p>View all events you have booked through EventHub.</p>
    </section>

    <section class="section">
        <div class="table-box">
            <asp:GridView ID="gvMyBookings" runat="server"
                CssClass="grid"
                AutoGenerateColumns="False"
                GridLines="None"
                EmptyDataText="No bookings found.">

                <Columns>
                    <asp:BoundField DataField="EventTitle" HeaderText="Event" /><asp:BoundField DataField="EventType" HeaderText="Type" />
                    <asp:BoundField DataField="EventDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="EventTime" HeaderText="Time" />
                    <asp:BoundField DataField="Location" HeaderText="Location" />
                    <asp:BoundField DataField="BookingType" HeaderText="Booking Type" />
                    <asp:BoundField DataField="ExtraServices" HeaderText="Extra Services" />
                    <asp:BoundField DataField="BookingStatus" HeaderText="Status" />
                    <asp:BoundField DataField="BookingDate" HeaderText="Booked At" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                </Columns>
            </asp:GridView>
        </div>
    </section>

    <div class="footer">
        © 2026 EventHub — Smart Event Booking System
    </div>

</form>
</body>
</html>