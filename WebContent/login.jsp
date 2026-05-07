<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Polling System - Login</title>
<style>
* { box-sizing: border-box; margin: 0; padding: 0; }
body { font-family: Arial, sans-serif; min-height: 100vh; background: linear-gradient(135deg, #1a237e, #1565c0); display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 2rem; }
.logo-area { text-align: center; margin-bottom: 2rem; }
.logo-area h1 { color: white; font-size: 26px; font-weight: bold; }
.logo-area p { color: rgba(255,255,255,0.75); font-size: 14px; margin-top: 6px; }
.card { background: white; border-radius: 12px; padding: 2rem; width: 100%; max-width: 380px; }
.card h2 { font-size: 20px; color: #1a237e; margin-bottom: 4px; }
.card p { font-size: 13px; color: #666; margin-bottom: 1.5rem; }
.field { margin-bottom: 1rem; }
.field label { display: block; font-size: 13px; font-weight: bold; color: #444; margin-bottom: 6px; }
.field input { width: 100%; height: 42px; border: 1px solid #ddd; border-radius: 8px; padding: 0 12px; font-size: 14px; outline: none; }
.field input:focus { border-color: #1565c0; box-shadow: 0 0 0 3px rgba(21,101,192,0.12); }
.btn { width: 100%; height: 42px; background: #1565c0; color: white; border: none; border-radius: 8px; font-size: 15px; font-weight: bold; cursor: pointer; margin-top: 0.5rem; }
.btn:hover { background: #1976d2; }
.error { color: red; font-size: 13px; margin-top: 8px; }
.links { display: flex; justify-content: space-between; margin-top: 1rem; }
.links a { font-size: 12px; color: #1565c0; text-decoration: none; }
.badge { margin-top: 1.5rem; background: rgba(255,255,255,0.15); border: 1px solid rgba(255,255,255,0.3); border-radius: 20px; padding: 6px 16px; color: rgba(255,255,255,0.9); font-size: 13px; }
</style>
</head>
<body>

<div class="logo-area">
  <h1>Online Polling System</h1>
  <p>Secure, transparent, and fair voting</p>
</div>

<div class="card">
  <h2>Voter Login</h2>
  <p>Enter your credentials to access the ballot</p>

  <% if ("1".equals(request.getParameter("error"))) { %>
    <div class="error">Invalid email or password. Please try again.</div>
  <% } %>

  <form action="LoginServlet" method="post">
    <div class="field">
      <label>Email Address</label>
      <input type="email" name="email" placeholder="you@example.com" required />
    </div>
    <div class="field">
      <label>Password</label>
      <input type="password" name="password" placeholder="Enter your password" required />
    </div>
    <button type="submit" class="btn">Login to Vote</button>
  </form>
</div>

<div class="badge">Voting is currently open</div>

</body>
</html>