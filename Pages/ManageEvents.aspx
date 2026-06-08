 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageEvents.aspx.cs" Inherits="EventHub.ManageEvents" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Events - EventHub</title>

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
            padding: 35px 70px 70px;
        }

        .form-box, .table-box {
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(148,163,184,0.18);
            border-radius: 24px;
            padding: 26px;
            box-shadow: 0 25px 70px rgba(0,0,0,0.25);
            margin-bottom: 30px;
        }

        .form-box h2, .table-box h2 {
            color: #7dd3fc;
            margin-top: 0;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(3,1fr);
            gap: 18px;
        }

        label {
            display: block;
            margin-bottom: 7px;
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
            height: 90px;
            padding: 12px 14px;
            border-radius: 13px;
            border: 1px solid rgba(148,163,184,0.28);
            outline: none;
            background: rgba(15,23,42,0.75);
            color: white;
            font-size: 15px;
            resize: none;
        }

        .full {
            grid-column: span 3;
        }

        .btn-row {
            display: flex;
            gap: 12px;
            margin-top: 20px;
        }

        .btn {
            height: 45px;
            padding: 0 22px;
            border: none;
            border-radius: 13px;
            color: white;
            font-weight: 900;
            cursor: pointer;
        }

        .add { background: linear-gradient(135deg,#22c55e,#16a34a); }
        .update { background: linear-gradient(135deg,#38bdf8,#2563eb); }
        .clear { background: linear-gradient(135deg,#64748b,#334155); }

        .grid {
            width: 100%;
            border-collapse: collapse;
            color: white;
        }

        .grid th {
            background: rgba(56,189,248,0.18);
            color: #7dd3fc;
            padding: 13px;
            text-align: left;
        }

        .grid td {
padding: 13px;
            border-bottom: 1px solid rgba(148,163,184,0.16);
            color: #e2e8f0;
        }

        .grid a {
            color: #38bdf8;
            font-weight: 800;
            text-decoration: none;
            margin-right: 10px;
        }

        .message {
            display: block;
            margin-top: 15px;
            font-weight: 800;
            color: #86efac;
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
        <div class="badge">Admin Control</div>
        <h1>Manage Events</h1>
        <p>Add, view, update, and delete events from one page.</p>
    </section>

    <section class="section">

        <div class="form-box">
            <h2>Event Form</h2>

            <asp:HiddenField ID="hfEventID" runat="server" />

            <div class="form-grid">
                <div>
                    <label>Event Title</label>
                    <asp:TextBox ID="txtEventTitle" runat="server" CssClass="input"></asp:TextBox>
                </div>

                <div>
                    <label>Event Type</label>
                    <asp:DropDownList ID="ddlEventType" runat="server" CssClass="input">
                        <asp:ListItem Text="Workshop" Value="Workshop"></asp:ListItem>
                        <asp:ListItem Text="Course" Value="Course"></asp:ListItem>
                        <asp:ListItem Text="Party" Value="Party"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div>
                    <label>Event Mode</label>
                    <asp:DropDownList ID="ddlEventMode" runat="server" CssClass="input">
                        <asp:ListItem Text="On-site" Value="On-site"></asp:ListItem>
                        <asp:ListItem Text="Online" Value="Online"></asp:ListItem>
                        <asp:ListItem Text="Hybrid" Value="Hybrid"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div>
                    <label>Event Date</label>
                    <asp:TextBox ID="txtEventDate" runat="server" CssClass="input" TextMode="Date"></asp:TextBox>
                </div>

                <div>
                    <label>Event Time</label>
                    <asp:TextBox ID="txtEventTime" runat="server" CssClass="input" TextMode="Time"></asp:TextBox>
                </div>

                <div>
                    <label>Capacity</label>
                    <asp:TextBox ID="txtCapacity" runat="server" CssClass="input" TextMode="Number"></asp:TextBox>
                </div>

                <div class="full">
                    <label>Location</label>
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="input"></asp:TextBox>
                </div>

                <label>Event Image</label>
                <asp:FileUpload ID="fuEventImage" runat="server" CssClass="input" />

                <div class="full">
                    <label>Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="textarea" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>

            <div class="btn-row">
                <asp:Button ID="btnAdd" runat="server" Text="Add Event" CssClass="btn add" OnClick="btnAdd_Click" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update Event" CssClass="btn update" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn clear" OnClick="btnClear_Click" />
            </div><asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
        </div>

        <div class="table-box">
            <h2>Events List</h2>

            <asp:GridView ID="gvEvents" runat="server"
                CssClass="grid"
                AutoGenerateColumns="False"
                GridLines="None"
                DataKeyNames="EventID"
                OnRowCommand="gvEvents_RowCommand">

                <Columns>
                    <asp:BoundField DataField="EventID" HeaderText="ID" />
                    <asp:BoundField DataField="EventTitle" HeaderText="Title" />
                    <asp:BoundField DataField="EventType" HeaderText="Type" />
                    <asp:BoundField DataField="EventMode" HeaderText="Mode" />
                    <asp:BoundField DataField="EventDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="EventTime" HeaderText="Time" />
                    <asp:BoundField DataField="Location" HeaderText="Location" />
                    <asp:BoundField DataField="Capacity" HeaderText="Capacity" />

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server"
                                Text="Edit"
                                CommandName="EditEvent"
                                CommandArgument='<%# Eval("EventID") %>'>
                            </asp:LinkButton>

                            <asp:LinkButton ID="lnkDelete" runat="server"
                                Text="Delete"
                                CommandName="DeleteEvent"
                                CommandArgument='<%# Eval("EventID") %>'
                                OnClientClick="return confirm('Are you sure you want to delete this event?');">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

    </section>

    <div class="footer">
        © 2026 EventHub — Manage Events
    </div>

</form>
</body>
</html>