<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="EventHub.About" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>About - EventHub</title>

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        body{
            font-family:'Segoe UI',Arial,sans-serif;
            background:#020617;
            color:white;
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

        .hero{
            text-align:center;
            padding:70px 20px 40px;
            background:
            radial-gradient(circle at top, rgba(56,189,248,.20), transparent 35%),
            linear-gradient(135deg,#020617,#0f172a);
        }

        .badge{
            display:inline-block;
            padding:8px 15px;
            border-radius:999px;
            background:rgba(56,189,248,.12);
            border:1px solid rgba(56,189,248,.35);
            color:#7dd3fc;
            font-weight:800;
            margin-bottom:18px;
        }

        .hero h1{
            font-size:44px;
            margin-bottom:12px;
        }

        .hero p{
            color:#cbd5e1;
            font-size:16px;
        }

        .section{
            padding:40px 70px 80px;
        }

        .project-box{
            max-width:950px;
            margin:auto;
            background:rgba(255,255,255,.06);
            border:1px solid rgba(255,255,255,.08);
            border-radius:24px;
            padding:30px;
            text-align:center;
            margin-bottom:35px;
        }

        .project-box h2{
            color:#7dd3fc;
            margin-bottom:14px;
        }

        .project-box p{
            color:#cbd5e1;
            line-height:1.9;
        }

        .cards{
            max-width:1000px;
            margin:auto;
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(320px,1fr));
            gap:25px;
            align-items:start;
        }

        .student-card{
            background:rgba(255,255,255,.06);
            border:1px solid rgba(255,255,255,.08);
            border-radius:24px;
            overflow:hidden;
            box-shadow:0 20px 60px rgba(0,0,0,.30);
            height:auto;
        }

        .file-number{
            background:linear-gradient(135deg,#38bdf8,#2563eb);
            padding:24px;
            text-align:center;
            font-size:38px;
            font-weight:900;
        }


        .footer{
            text-align:center;
            padding:25px;
            color:#64748b;
            border-top:1px solid rgba(255,255,255,.08);
            margin-top:40px;
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
    <div class="badge">About EventHub</div>

    <h1>Smart Event Booking Platform</h1>

    <p>
        Discover, reserve, and manage events through a modern and secure platform.
    </p>
</section>

<section class="section">

    <div class="project-box">

        <h2>Who We Are</h2>

        <p>
            EventHub is a modern web-based platform developed to simplify event
            booking and reservation management. The system allows users to
            discover events, reserve seats, manage bookings, and communicate
            with organizers through a user-friendly interface.

            Built using ASP.NET Web Forms and SQL Server, EventHub combines
            performance, security, and simplicity to deliver an outstanding
            user experience.
        </p>

    </div>

    <div class="cards">

        <div class="student-card">

            <div class="file-number">🎟️</div>

            <div style="padding:25px;text-align:center;">

                <h3 style="margin-bottom:15px;color:#7dd3fc;">
                    Event Booking
                </h3>

                <p style="color:#cbd5e1;line-height:1.8;">
                    Quickly reserve seats and secure your attendance for upcoming events.
                </p>

            </div>

        </div>

        <div class="student-card">

            <div class="file-number">📅</div>

            <div style="padding:25px;text-align:center;">

                <h3 style="margin-bottom:15px;color:#7dd3fc;">
                    Reservation Management
                </h3>

                <p style="color:#cbd5e1;line-height:1.8;">
                    Easily track, review, and manage all your reservations.
                </p>

            </div>

        </div>

        <div class="student-card">

            <div class="file-number">🛡️</div>

            <div style="padding:25px;text-align:center;">

                <h3 style="margin-bottom:15px;color:#7dd3fc;">
                    Secure Platform
                </h3>

                <p style="color:#cbd5e1;line-height:1.8;">
                    Secure authentication and database integration for reliable performance.
                </p>

            </div>

        </div>

    </div>

    <div style="margin-top:60px;">

        <h2 style="text-align:center;margin-bottom:35px;color:#7dd3fc;">
            Why Choose EventHub?
        </h2>

        <div class="cards">

            <div class="student-card">

                <div style="padding:30px;text-align:center;">

                    <h3 style="color:#38bdf8;margin-bottom:12px;">
                        Responsive Design
                    </h3>

                    <p style="color:#cbd5e1;">
                        Optimized for desktop, tablet, and mobile devices.
                    </p>

                </div>

            </div>

            <div class="student-card">

                <div style="padding:30px;text-align:center;">

                    <h3 style="color:#38bdf8;margin-bottom:12px;">
                        Easy Navigation
                    </h3>

                    <p style="color:#cbd5e1;">
                        Clean and intuitive user experience.
                    </p>

                </div>

            </div>

            <div class="student-card">

                <div style="padding:30px;text-align:center;">

                    <h3 style="color:#38bdf8;margin-bottom:12px;">
                        SQL Server Database
                    </h3>

                    <p style="color:#cbd5e1;">
                        Reliable and secure data management system.
                    </p>

                </div>

            </div>

            <div class="student-card">

                <div style="padding:30px;text-align:center;">

                    <h3 style="color:#38bdf8;margin-bottom:12px;">
                        Fast Booking Process
                    </h3>

                    <p style="color:#cbd5e1;">
                        Reserve event seats in just a few clicks.</p>

                </div>

            </div>

        </div>

    </div>

</section>

    <div class="footer">
        © 2026 EventHub — Smart Event Booking System
    </div>

</form>
</body>
</html>