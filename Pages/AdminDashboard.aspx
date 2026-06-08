<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="EventHub.AdminDashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Dashboard - EventHub</title>

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

        .nav-links a:hover { color: #38bdf8; }

        .hero {
            padding: 60px 70px 30px;
            background:
                radial-gradient(circle at top, rgba(56,189,248,0.20), transparent 35%),
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
            font-size: 44px;
        }

        .hero p {
            color: #cbd5e1;
            margin-top: 10px;
        }

        .section {
            padding: 35px 70px 70px;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(4,1fr);
            gap: 22px;
            margin-bottom: 35px;
        }

        .stat-card {
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(148,163,184,0.18);
            border-radius: 22px;
            padding: 25px;
            box-shadow: 0 25px 70px rgba(0,0,0,0.25);
        }

        .stat-card h2 {
            color: #38bdf8;
            font-size: 36px;
            margin: 0;
        }

        .stat-card p {
            color: #cbd5e1;
            margin-bottom: 0;
            font-weight: 700;
        }

        .actions {
            display: grid;
            grid-template-columns: repeat(3,1fr);
            gap: 18px;
            margin-bottom: 35px;
        }

        .action-btn {
            display: block;
            text-align: center;
            padding: 15px;
            border-radius: 14px;
            background: linear-gradient(135deg,#38bdf8,#2563eb);
            color: white;
            text-decoration: none;
            font-weight: 900;
        }

        .table-box {
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(148,163,184,0.18);
            border-radius: 24px;
            padding: 24px;
            overflow-x: auto;
        }

        .table-box h2 {
            margin-top: 0;
            color: #7dd3fc;
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
        }

        .grid td {
            padding: 14px;
            border-bottom: 1px solid rgba(148,163,184,0.16);
            color: #e2e8f0;
        }

        .footer {
            text-align: center;
            padding: 22px;
            color: #64748b;
            border-top: 1px solid rgba(148,163,184,0.15);
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="navbar">
    <div class="logo">EventHub Admin</div>

    <div class="nav-links">
        <a href="../Pages/AdminDashboard.aspx">Dashboard</a>
        <a href="../Pages/ManageEvents.aspx">Manage Events</a>
        <a href="../Pages/ManageBookings.aspx">Manage Bookings</a>
        <a href="../Pages/Login.aspx">Logout</a>
    </div>
</div>

    <section class="hero">
        <div class="badge">Admin Panel</div>
        <h1>Dashboard Overview</h1>
        <p>Monitor users, events, bookings, and messages from one place.</p>
    </section>

    <section class="section">

        <div class="stats">
            <div class="stat-card">
                <h2><asp:Label ID="lblUsers" runat="server"></asp:Label></h2>
                <p>Total Users</p>
            </div>

            <div class="stat-card">
                <h2><asp:Label ID="lblEvents" runat="server"></asp:Label></h2>
                <p>Total Events</p>
            </div>

            <div class="stat-card">
                <h2><asp:Label ID="lblBookings" runat="server"></asp:Label></h2>
                <p>Total Bookings</p>
            </div>

            <div class="stat-card">
                <h2><asp:Label ID="lblMessages" runat="server"></asp:Label></h2>
                <p>Contact Messages</p>
            </div>
        </div>

        <div class="actions">
            <a class="action-btn" href="ManageEvents.aspx">Manage Events</a>
            <a class="action-btn" href="ManageBookings.aspx">Manage Bookings</a>
            <a class="action-btn" href="Export.aspx">Export Reports</a>
        </div>

        <div class="table-box">
            <h2>Latest Bookings</h2>

            <asp:GridView ID="gvLatestBookings" runat="server"
                CssClass="grid"
                AutoGenerateColumns="False"
                GridLines="None"
                EmptyDataText="No bookings found.">

                <Columns>
                    <asp:BoundField DataField="FullName" HeaderText="User" />
                    <asp:BoundField DataField="EventTitle" HeaderText="Event" />
                    <asp:BoundField DataField="BookingType" HeaderText="Type" />
                    <asp:BoundField DataField="ExtraServices" HeaderText="Services" />
                    <asp:BoundField DataField="BookingStatus" HeaderText="Status" />
                    <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                </Columns>
            </asp:GridView>
        </div>

    </section>

    <div class="footer">
        © 2026 EventHub — Admin Dashboard
    </div>

</form>
</body>
</html>