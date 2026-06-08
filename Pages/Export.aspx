<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Export.aspx.cs" Inherits="EventHub.Export" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Export Reports - EventHub</title>

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
            padding: 55px 70px 30px;
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
            font-size: 42px;
        }

        .hero p {
            color: #cbd5e1;
        }

        .section {
            padding: 40px 70px 80px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }

        .card {
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(148,163,184,0.18);
            border-radius: 24px;
            padding: 28px;
            box-shadow: 0 25px 70px rgba(0,0,0,0.25);
            text-align: center;
        }

        .card h2 {
            color: #7dd3fc;
            margin-top: 0;
        }

        .card p {
            color: #cbd5e1;
            line-height: 1.7;
            min-height: 55px;
        }

        .btn {
            width: 100%;
            height: 48px;
            border: none;
            border-radius: 14px;
            background: linear-gradient(135deg,#38bdf8,#2563eb);
            color: white;
            font-size: 16px;
            font-weight: 900;
            cursor: pointer;
            margin-top: 12px;
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
            <a href="AdminDashboard.aspx">Dashboard</a>
            <a href="ManageEvents.aspx">Manage Events</a>
            <a href="ManageBookings.aspx">Manage Bookings</a>
            <a href="Export.aspx">Export</a>
            <a href="Login.aspx">Logout</a>
        </div>
    </div>

    <section class="hero">
        <div class="badge">Export Center</div>
        <h1>Export Reports</h1>
        <p>Download system data as Excel reports.</p>
    </section>

    <section class="section">
        <div class="cards">

            <div class="card">
                <h2>Bookings Report</h2>
                <p>Export all booking records with users, events, status, and booking dates.</p>
                <asp:Button ID="btnExportBookings" runat="server" Text="Export Bookings"
                    CssClass="btn" OnClick="btnExportBookings_Click" />
            </div>

            <div class="card">
                <h2>Events Report</h2>
                <p>Export all events including type, mode, date, location, and capacity.</p><asp:Button ID="btnExportEvents" runat="server" Text="Export Events"
                    CssClass="btn" OnClick="btnExportEvents_Click" />
            </div>

            <div class="card">
                <h2>Users Report</h2>
                <p>Export registered users with their emails, roles, and account creation dates.</p>
                <asp:Button ID="btnExportUsers" runat="server" Text="Export Users"
                    CssClass="btn" OnClick="btnExportUsers_Click" />
            </div>

        </div>
    </section>

    <div class="footer">
        © 2026 EventHub — Export Reports
    </div>

</form>
</body>
</html>