<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EventHub.Home" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Home - EventHub</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #020617;
            color: white;
        }

        .navbar {
            width: 100%;
            padding: 20px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(2, 6, 23, 0.85);
            border-bottom: 1px solid rgba(148, 163, 184, 0.18);
            position: sticky;
            top: 0;
            z-index: 10;
            backdrop-filter: blur(14px);
        }

        .logo {
            font-size: 27px;
            font-weight: 900;
            color: #38bdf8;
        }

        .nav-links a {
            color: #cbd5e1;
            text-decoration: none;
            margin-left: 22px;
            font-weight: 600;
            font-size: 14px;
        }

        .nav-links a:hover {
            color: #38bdf8;
        }

        .hero {
            min-height: 88vh;
            display: grid;
            grid-template-columns: 1.1fr 0.9fr;
            align-items: center;
            gap: 40px;
            padding: 70px 70px;
            background:
                radial-gradient(circle at 20% 20%, rgba(56,189,248,0.22), transparent 35%),
                radial-gradient(circle at 80% 30%, rgba(37,99,235,0.22), transparent 30%),
                linear-gradient(135deg, #020617, #0f172a);
        }

        .badge {
            display: inline-block;
            padding: 9px 16px;
            border-radius: 999px;
            background: rgba(56,189,248,0.12);
            border: 1px solid rgba(56,189,248,0.35);
            color: #7dd3fc;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .hero h1 {
            font-size: 62px;
            line-height: 1.05;
            margin: 0 0 22px;
        }

        .hero h1 span {
            color: #38bdf8;
        }

        .hero p {
            color: #cbd5e1;
            font-size: 18px;
            line-height: 1.8;
            max-width: 650px;
        }

        .hero-actions {
            margin-top: 32px;
        }

        .btn-primary, .btn-secondary {
            display: inline-block;
            padding: 14px 24px;
            border-radius: 14px;
            text-decoration: none;
            font-weight: 800;
            margin-right: 12px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #38bdf8, #2563eb);
            color: white;
            box-shadow: 0 14px 35px rgba(37,99,235,0.35);
        }

        .btn-secondary {
            color: #e2e8f0;
            border: 1px solid rgba(148,163,184,0.35);
            background: rgba(255,255,255,0.06);
        }

        .ai-card {
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(148,163,184,0.22);
            border-radius: 30px;
            padding: 28px;
            box-shadow: 0 30px 90px rgba(0,0,0,0.35);
            backdrop-filter: blur(18px);
        }

        .ai-top {
            display: flex;
            gap: 8px;
            margin-bottom: 22px;
        }

        .dot {
            width: 11px;
            height: 11px;
            border-radius: 50%;
            background: #38bdf8;
        }

        .ai-box {
            background: rgba(15,23,42,0.75);
            border-radius: 20px;
            padding: 22px;
            margin-bottom: 18px;
            border: 1px solid rgba(148,163,184,0.14);
        }

        .ai-box h3 {
            margin: 0 0 10px;
            color: #7dd3fc;
        }

        .progress {
            height: 10px;
            background: rgba(148,163,184,0.18);
            border-radius: 99px;
            overflow: hidden;
            margin-top: 14px;
        }

        .progress span {
            display: block;height: 100%;
            width: 78%;
            background: linear-gradient(90deg, #38bdf8, #2563eb);
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(3,1fr);
            gap: 16px;
            padding: 45px 70px;
            background: #020617;
        }

        .stat {
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(148,163,184,0.16);
            border-radius: 22px;
            padding: 25px;
            text-align: center;
        }

        .stat h2 {
            color: #38bdf8;
            margin: 0;
            font-size: 34px;
        }

        .stat p {
            color: #94a3b8;
            margin-bottom: 0;
        }

        .section {
            padding: 65px 70px;
            text-align: center;
            background: linear-gradient(180deg, #020617, #0f172a);
        }

        .section h2 {
            font-size: 38px;
            margin-bottom: 12px;
        }

        .section > p {
            color: #94a3b8;
            margin-bottom: 35px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3,1fr);
            gap: 22px;
        }

        .card {
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(148,163,184,0.18);
            border-radius: 24px;
            padding: 28px;
            text-align: left;
        }

        .icon {
            font-size: 32px;
            margin-bottom: 15px;
        }

        .card h3 {
            color: #7dd3fc;
            margin-top: 0;
        }

        .card p {
            color: #cbd5e1;
            line-height: 1.7;
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
            <div>
                <div class="badge">Smart Event Booking Platform</div>

                <h1>Book Events with a <span>Smarter</span> Experience.</h1>

                <p>
                    EventHub helps users discover events, reserve seats, and manage bookings
                    through a clean and intelligent digital experience.
                </p>

                <div class="hero-actions">
                    <a href="Events.aspx" class="btn-primary">Explore Events</a>
                    <a href="BookEvent.aspx" class="btn-secondary">Book Now</a>
                </div>
            </div>

            <div class="ai-card">
                <div class="ai-top">
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                </div>

                <div class="ai-box">
                    <h3>Recommended Event</h3>
                    <p>Web Development Workshop</p>
                    <div class="progress"><span></span></div>
                </div>

                <div class="ai-box">
                    <h3>Booking Status</h3>
                    <p>Seats available • Fast confirmation • Secure access</p>
                </div>

                <div class="ai-box">
                    <h3>System Features</h3>
                    <p>CRUD • Dashboard • Export • Validation • Email</p>
                </div>
            </div>
        </section>

        <section class="stats">
            <div class="stat">
                <h2>30+</h2><p>Available Seats</p>
            </div>

            <div class="stat">
                <h2>3</h2>
                <p>Event Categories</p>
            </div>

            <div class="stat">
                <h2>24/7</h2>
                <p>Online Booking</p>
            </div>
        </section>

        <section class="section">
            <h2>Why EventHub?</h2>
            <p>A modern platform designed for smooth event booking and management.</p>

            <div class="cards">
                <div class="card">
                    <div class="icon">⚡</div>
                    <h3>Fast Booking</h3>
                    <p>Users can book events quickly using a simple and clear form.</p>
                </div>

                <div class="card">
                    <div class="icon">🔐</div>
                    <h3>Secure Access</h3>
                    <p>Login and registration protect user information and bookings.</p>
                </div>

                <div class="card">
                    <div class="icon">📊</div>
                    <h3>Smart Dashboard</h3>
                    <p>Admins can monitor users, bookings, and events from one dashboard.</p>
                </div>
            </div>
        </section>

        <div class="footer">
            © 2026 EventHub — Smart Event Booking System
        </div>

    </form>
</body>
</html>