<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cast Your Vote</title>
<style>
* { box-sizing: border-box; margin: 0; padding: 0; }
body { font-family: Arial, sans-serif; min-height: 100vh; background: linear-gradient(135deg, #1a237e, #1565c0); display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 2rem; }
.header { text-align: center; margin-bottom: 2rem; }
.header h1 { color: white; font-size: 26px; font-weight: bold; }
.header p { color: rgba(255,255,255,0.75); font-size: 14px; margin-top: 6px; }
.card { background: white; border-radius: 12px; padding: 2rem; width: 100%; max-width: 460px; }
.card h2 { font-size: 20px; color: #1a237e; margin-bottom: 4px; }
.card p { font-size: 13px; color: #666; margin-bottom: 1.5rem; }
.candidates { display: flex; flex-direction: column; gap: 12px; margin-bottom: 1.5rem; }
.candidate { display: flex; align-items: center; gap: 12px; border: 1.5px solid #e0e0e0; border-radius: 10px; padding: 14px 16px; cursor: pointer; transition: all 0.2s; }
.candidate:hover { border-color: #1565c0; background: #f0f4ff; }
.candidate.selected { border-color: #1565c0; background: #e8f0fe; }
.candidate input[type="radio"] { accent-color: #1565c0; width: 18px; height: 18px; }
.avatar { width: 42px; height: 42px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 16px; color: white; flex-shrink: 0; }
.candidate-info { flex: 1; }
.candidate-info .name { font-size: 15px; font-weight: bold; color: #1a1a1a; }
.candidate-info .party { font-size: 12px; color: #666; margin-top: 2px; }
.or-manual { text-align: center; color: #999; font-size: 13px; margin-bottom: 1rem; position: relative; }
.or-manual::before, .or-manual::after { content: ''; position: absolute; top: 50%; width: 42%; height: 0.5px; background: #ddd; }
.or-manual::before { left: 0; }
.or-manual::after { right: 0; }
.field label { display: block; font-size: 13px; font-weight: bold; color: #444; margin-bottom: 6px; }
.field input { width: 100%; height: 42px; border: 1px solid #ddd; border-radius: 8px; padding: 0 12px; font-size: 14px; outline: none; }
.field input:focus { border-color: #1565c0; box-shadow: 0 0 0 3px rgba(21,101,192,0.12); }
.btn { width: 100%; height: 44px; background: #1565c0; color: white; border: none; border-radius: 8px; font-size: 15px; font-weight: bold; cursor: pointer; margin-top: 1.2rem; }
.btn:hover { background: #1976d2; }
.btn:disabled { background: #90a4ae; cursor: not-allowed; }
.success { display: none; text-align: center; padding: 1rem; background: #e8f5e9; border-radius: 8px; color: #2e7d32; font-weight: bold; margin-top: 1rem; }
.badge { margin-top: 1.5rem; background: rgba(255,255,255,0.15); border: 1px solid rgba(255,255,255,0.3); border-radius: 20px; padding: 6px 16px; color: rgba(255,255,255,0.9); font-size: 13px; }
</style>
</head>
<body>

<div class="header">
  <h1>Online Polling System</h1>
  <p>Your vote is anonymous and secure</p>
</div>

<div class="card">
  <h2>Cast Your Vote</h2>
  <p>Select a candidate below or enter their ID manually</p>

  <form action="VoteServlet" method="post" id="voteForm">

    <div class="candidates">

      <label class="candidate" onclick="selectCandidate(this, '1')">
        <input type="radio" name="cid" value="1" />
        <div class="avatar" style="background:#1565c0;">A</div>
        <div class="candidate-info">
          <div class="name">Candidate A</div>
          <div class="party">Party / Description</div>
        </div>
      </label>

      <label class="candidate" onclick="selectCandidate(this, '2')">
        <input type="radio" name="cid" value="2" />
        <div class="avatar" style="background:#6a1b9a;">B</div>
        <div class="candidate-info">
          <div class="name">Candidate B</div>
          <div class="party">Party / Description</div>
        </div>
      </label>

      <label class="candidate" onclick="selectCandidate(this, '3')">
        <input type="radio" name="cid" value="3" />
        <div class="avatar" style="background:#00695c;">C</div>
        <div class="candidate-info">
          <div class="name">Candidate C</div>
          <div class="party">Party / Description</div>
        </div>
      </label>

    </div>

    <div class="or-manual">or enter candidate ID manually</div>

    <div class="field">
      <label>Candidate ID</label>
      <input type="text" name="cid" id="manualCid" placeholder="e.g. 1, 2, 3..." />
    </div>

    <button type="submit" class="btn">Cast My Vote</button>
  </form>
</div>

<div class="badge">Voting is currently open</div>

<script>
function selectCandidate(el, id) {
  document.querySelectorAll('.candidate').forEach(c => c.classList.remove('selected'));
  el.classList.add('selected');
  document.getElementById('manualCid').value = id;
}
</script>

</body>
</html>