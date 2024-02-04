<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style type="text/css">
        body {
            background-color: #9BA4B5;
        }
        a {
            color: #323232;
            text-decoration: none;
            font-weight: bold;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
	<form action="login.jsp">
	<table align=center>
	<tr><td colspan=2 align=center height=40><b>로그인</b><td></tr>
	<tr>
		<td align=right>아이디&nbsp;</td> 
		<td><input type="text" name="id" placeholder="Email address" required></td>
	</tr>
	<tr>
		<td align=right>패스워드&nbsp;</td> 
		<td><input type="password" name="ps" required></td>
	</tr>
	<tr>
		<td colspan=2 align=center height=50>
			<input type="submit" value="로그인하기">
		</td>
	</tr>
	</table>
	</form>
	
	<br><br><br>
	<div align=center>
		<h5>아직 회원이 아니신가요 ?</h5>
		<a href="./signupForm.jsp">회원가입 페이지로 이동하기</a>
	</div>
</body>
</html>