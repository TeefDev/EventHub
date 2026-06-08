<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EventHub.Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Register - EventHub</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #020617, #0f172a);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .card {
            width: 430px;
            background: #ffffff;
            border-radius: 24px;
            padding: 34px;
            box-shadow: 0 30px 80px rgba(0,0,0,0.35);
        }

        .logo {
            text-align: center;
            font-size: 28px;
            font-weight: 900;
            color: #2563eb;
            margin-bottom: 8px;
        }

        h2 {
            text-align: center;
            margin: 0;
            color: #0f172a;
            font-size: 30px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin: 10px 0 26px;
            font-size: 15px;
        }

        label {
            display: block;
            margin: 14px 0 6px;
            color: #334155;
            font-weight: 700;
            font-size: 14px;
        }

        .input {
            width: 100%;
            height: 44px;
            padding: 10px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 13px;
            font-size: 15px;
            outline: none;
            background: #f8fafc;
        }

        .input:focus {
            background: #ffffff;
            border-color: #2563eb;
            box-shadow: 0 0 0 4px rgba(37,99,235,0.12);
        }

        .btn {
            width: 100%;
            height: 46px;
            margin-top: 22px;
            border: none;
            border-radius: 13px;
            background: linear-gradient(135deg, #2563eb, #0284c7);
            color: white;
            font-size: 16px;
            font-weight: 800;
            cursor: pointer;
        }

        .btn:hover {
            opacity: 0.95;
        }

        .link {
            text-align: center;
            margin-top: 18px;
            color: #475569;
            font-size: 14px;
        }

        .link a {
            color: #2563eb;
            text-decoration: none;
            font-weight: 800;
        }

        .popup {
            position: fixed;
            top: 22px;
            right: 22px;
            background: white;
            color: #166534;
            padding: 16px 20px;
            border-radius: 14px;
            box-shadow: 0 18px 45px rgba(0,0,0,0.25);
            font-weight: 800;
            display: none;
            z-index: 9999;
            border-left: 6px solid #22c55e;
        }

        .popup.show {
            display: block;
            animation: slideIn .4s ease, fadeOut .5s ease 4.5s forwards;
        }

        @keyframes slideIn {
            from {
                transform: translateX(80px);
                opacity: 0;
            }

            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes fadeOut {
            to {
                opacity: 0;
                transform: translateX(80px);
            }
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
        function validateRegister() {
            var name = document.getElementById('<%= txtFullName.ClientID %>').value.trim();
            var email = document.getElementById('<%= txtEmail.ClientID %>').value.trim();
            var password = document.getElementById('<%= txtPassword.ClientID %>').value.trim();
            var confirm = document.getElementById('<%= txtConfirmPassword.ClientID %>').value.trim();

            if (name === ""|| password === "" || confirm === "") {
                alert("Please fill all fields.");
                return false;
            }
            if (!email.includes("@") || !email.includes(".")) {
                alert("Please enter a valid email address.");
                return false;
            }

            if (password.length < 6) {
                alert("Password must be at least 6 characters.");
                return false;
            }

            if (password !== confirm) {
                alert("Passwords do not match.");
                return false;
            }

            return true;
        }

        function showPopup(message) {
            var popup = document.getElementById("successPopup");
            popup.innerHTML = message;
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 5000);
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">

        <div id="successPopup" class="popup"></div>

        <div class="card">
            <div class="logo">EventHub</div>

            <h2>Create Account</h2>
            <p class="subtitle">
                Your next event starts here.
            </p>

            <label>Full Name</label>
            <asp:TextBox ID="txtFullName" runat="server" CssClass="input"></asp:TextBox>

            <label>Email Address</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input" TextMode="Email"></asp:TextBox>

            <label>Password</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>

            <label>Confirm Password</label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>

            <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn"
                OnClientClick="return validateRegister();" OnClick="btnRegister_Click" />

            <asp:Label ID="lblMessage" runat="server" Style="display:none;"></asp:Label>

            <div class="link">
                Already have an account?
                <a href="Login.aspx">Login here</a>
            </div>
        </div>

        <div class="footer">
            © 2026 EventHub — Smart Event Booking System
        </div> 

    </form>
</body>
</html>