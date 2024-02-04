<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ include file="./menu.jsp" %>
<%
    String uid = (String) session.getAttribute("id");
    if (uid == null) {
        response.sendRedirect("loginForm.jsp");
        return;
    }
    session.setAttribute("id", uid);
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
    body {
        background-color: #F1F6F9;
    }
</style>

<script type="text/javascript">
    function validateForm() {
        var password = document.getElementsByName('ps')[0].value;
        var confirmPassword = document.getElementsByName('ps2')[0].value;

        // 비밀번호와 비밀번호 확인이 다를 경우
        if (password !== confirmPassword) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false;
        }
    }
</script>
</head>
<body>
<br><br>
<form action="update.jsp" method="post" onsubmit="return validateForm()">
<table align=center>
<tr><td colspan=2 align=center height=40><b>회원정보 수정</b></td></tr>
<tr>
    <td align=right>아이디&nbsp;</td>
    <td><input type="text" name="id" value="<%=uid%>" readonly></td>
</tr>
<tr>
    <td align=right>비밀번호&nbsp;</td>
    <td><input type="password" name="ps" pattern="[a-zA-Z][a-zA-Z0-9]{4,11}"></td>
	<!-- 영문자로 시작하고 4글자에서 11글자 사이 입력 -->
</tr>
<tr> 
    <td align=right>비밀번호(확인)&nbsp;</td>
    <td><input type="password" name="ps2" pattern="[a-zA-Z][a-zA-Z0-9]{4,11}"></td>
	 <!-- 영문자로 시작하고 4글자에서 11글자 사이 입력 -->
</tr>
<tr>
    <td align=right>이름&nbsp;</td>
    <td><input type="text" name="name" required></td> 
</tr>
<tr>
    <td colspan=2 align=center height=50>
        <input type="submit" value="수정하기">
    </td>
</tr>
</table>
</form>
</body>
</html>
