<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EventHub.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Login - EventHub</title>

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

        .error {
            display: block;
            text-align: center;
            margin-top: 12px;
            color: red;
            font-weight: bold;
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
    </style>

    <script>
        function validateLogin() {
            var email = document.getElementById('<%= txtEmail.ClientID %>').value.trim();
            var password = document.getElementById('<%= txtPassword.ClientID %>').value.trim();

            if (email === "" || password === "") {
                alert("Please fill all fields.");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">

        <div class="card">
            <div class="logo">EventHub</div>

            <label>Email Address</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input"></asp:TextBox>

            <label>Password</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>

            <asp:Button ID="btnLogin" runat="server" Text="Login"
                CssClass="btn"
                OnClientClick="return validateLogin();"
                OnClick="btnLogin_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>

            <div class="link">
                Don’t have an account?
                <a href="Register.aspx">Register here</a>
            </div>
        </div></form>
</body>
</html>