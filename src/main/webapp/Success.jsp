<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vote Success</title>
<style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: Arial, sans-serif; min-height: 100vh; background: linear-gradient(135deg, #1a237e, #1565c0); display: flex; align-items: center; justify-content: center; padding: 20px; }
    .card { background: white; border-radius: 16px; padding: 40px; width: 100%; max-width: 400px; text-align: center; box-shadow: 0 10px 25px rgba(0,0,0,0.2); }
    .check { width: 70px; height: 70px; background: #e8f5e9; color: #2e7d32; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 32px; margin: 0 auto 24px; }
    h2 { color: #1a237e; font-size: 24px; margin-bottom: 12px; }
    p { color: #666; font-size: 14px; margin-bottom: 30px; line-height: 1.5; }
    .btn { display: inline-block; background: #1565c0; color: white; padding: 12px 30px; border-radius: 8px; text-decoration: none; font-weight: bold; transition: background 0.2s; }
    .btn:hover { background: #1976d2; }
</style>
</head>
<body>
    <div class="card">
        <div class="check">✓</div>
        <h2>Vote Cast Successfully!</h2>
        <p>Thank you for participating in the Online Polling System. Your vote has been recorded.</p>
        <a href="login.jsp" class="btn">Back to Home</a>
    </div>
</body>
</html>