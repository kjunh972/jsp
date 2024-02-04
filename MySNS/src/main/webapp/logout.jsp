<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // 세션에서 사용자 ID를 제거
    session.removeAttribute("id");

    // 응답에 직접 JavaScript 코드를 출력
    response.setContentType("text/html;charset=UTF-8");
%>

<script>
    alert('로그아웃이 완료되었습니다.');
    location.href='main.jsp';
</script>
