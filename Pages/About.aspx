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

        .btn-box{
            padding:18px;
        }

        .show-btn{
            width:100%;
            height:45px;
            border:none;
            border-radius:12px;
            background:linear-gradient(135deg,#38bdf8,#2563eb);
            color:white;
            font-size:15px;
            font-weight:800;
            cursor:pointer;
        }

        .show-btn:hover{
            opacity:.92;
        }

        .details{
            max-height:0;
            overflow:hidden;
            opacity:0;
            padding:0 18px;
            transition:all .4s ease;
        }

        .details.show{
            max-height:500px;
            opacity:1;
            padding:0 18px 18px;
        }

        .row{
            background:rgba(15,23,42,.75);
            border:1px solid rgba(255,255,255,.08);
            border-radius:14px;
            padding:14px;
            margin-top:12px;
        }

        .label{
            display:block;
            color:#7dd3fc;
            font-size:13px;font-weight:800;
            margin-bottom:5px;
        }

        .value{
            color:#e2e8f0;
            font-weight:600;
            font-size:18px;
        }

        .footer{
            text-align:center;
            padding:25px;
            color:#64748b;
            border-top:1px solid rgba(255,255,255,.08);
            margin-top:40px;
        }
    </style>

    <script>
        function toggleDetails(id) {
            var box = document.getElementById(id);
            box.classList.toggle("show");
        }
    </script>

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
        <div class="badge">About Team</div>
        <h1>EventHub Project Team</h1>
    </section>

    <section class="section">

        <div class="project-box">
            <h2>About EventHub</h2>
            <p>
                EventHub is a smart event booking platform developed to help users
                discover events, reserve seats, manage bookings, and contact the team.
                The system includes modern UI design, database connection,
                validation, dashboard, and user-friendly features.
            </p>
        </div>

        <div class="cards">

            <!-- Student 1 -->
            <div class="student-card">

                <div class="file-number">12932</div>

                <div class="btn-box">
                    <button type="button" class="show-btn"
                        onclick="toggleDetails('student1')">
                        Show Details
                    </button>
                </div>

                <div id="student1" class="details">

                    <div class="row">
                        <span class="label">Student Name</span>
                        <span class="value">Amirah Alshahrani</span>
                    </div>

                    <div class="row">
                        <span class="label">Section</span>
                        <span class="value">AOL IR3</span>
                    </div>

                    <div class="row">
                        <span class="label">Semester</span>
                        <span class="value">Apr 2026</span>
                    </div>

                </div>

            </div>

            <!-- Student 2 -->
            <div class="student-card">

                <div class="file-number">12944</div>

                <div class="btn-box">
                    <button type="button" class="show-btn"
                        onclick="toggleDetails('student2')">
                        Show Details
                    </button>
                </div>

                <div id="student2" class="details">

                    <div class="row">
                        <span class="label">Student Name</span>
                        <span class="value">Khadeja Waleed</span>
                    </div>

                    <div class="row">
                        <span class="label">Section</span>
                        <span class="value">AOL IR3</span>
                    </div>

                    <div class="row">
                        <span class="label">Semester</span>
                        <span class="value">Apr 2026</span>
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