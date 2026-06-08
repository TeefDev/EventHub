<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="EventHub.Events" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Events - EventHub</title>

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

        .nav-links a:hover {
            color: #38bdf8;
        }

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
            font-weight: 700;
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

        .events-section {
            padding: 45px 70px 70px;
        }

        .events-grid{
    display:flex;
    flex-wrap:wrap;
    gap:22px;
    justify-content:flex-start;
    direction:ltr;
}

.event-card{
    width:320px;
    min-height:auto;
    background:rgba(255,255,255,0.07);
    border:1px solid rgba(148,163,184,0.18);
    border-radius:24px;
    padding:22px;
    box-shadow:0 25px 70px rgba(0,0,0,0.25);
    transition:0.3s;
    direction:ltr;
    text-align:left;
}

        .event-card:hover {
            transform: translateY(-6px);
            border-color: rgba(56,189,248,0.45);
        }

        .event-type {
            display: inline-block;
            padding: 7px 12px;
            border-radius: 999px;
            background: rgba(56,189,248,0.14);
            color: #7dd3fc;
            font-size: 13px;
            font-weight: 800;
            margin-bottom: 16px;
        }

.event-card h3{
    color:white;
    font-size:23px;
    margin:0 0 12px;
    text-align:center;   /* العنوان بالنص */
}

.event-info{
    color:#cbd5e1;
    line-height:1.8;
    font-size:15px;
    text-align:left;
}

.desc{
    color:#94a3b8;
    line-height:1.7;
    min-height:auto;     /* يشيل الفراغ */
    margin:8px 0 0;
    text-align:left;
}

.btn{
    display:block;
    width:100%;
    text-align:center;
    padding:13px;
    border-radius:14px;
    background:linear-gradient(135deg,#38bdf8,#2563eb);
    color:white;
    text-decoration:none;
    font-weight:900;
    margin-top:10px;   /* الزر قريب من الوصف */
}

        .event-img {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-radius: 14px;
    margin: 12px 0;
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
            <div class="badge">Available Events</div>
            <h1>Explore Smart Events</h1>
            <p>Choose your favorite event and reserve your seat instantly.</p>
        </section>

        <section class="events-section">
            <div class="events-grid">

                <asp:Repeater ID="rptEvents" runat="server">
                    <ItemTemplate>
                        <div class="event-card">
                            <div class="event-type"><%# Eval("EventType") %></div>
                            <asp:Image ID="imgEvent" runat="server"
                            ImageUrl='<%# Eval("EventImage") %>'
                            CssClass="event-img" />

                            <h3><%# Eval("EventTitle") %></h3>

                            <div class="event-info">
                                📅 Date: <%# Eval("EventDate", "{0:yyyy-MM-dd}") %><br />
                                ⏰ Time: <%# Eval("EventTime") %><br />
                                📍 Location: <%# Eval("Location") %><br />
                                👥 Capacity: <%# Eval("Capacity") %>
                            </div>

                            <p class="desc"><%# Eval("Description") %></p>

                            <a class="btn" href='BookEvent.aspx?EventID=<%# Eval("EventID") %>'>
                                Book Now
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </section>

        <div class="footer">
            © 2026 EventHub — Smart Event Booking System
        </div>

    </form>
</body>
</html>