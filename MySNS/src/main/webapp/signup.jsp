<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="dao.UserBean">
    <jsp:setProperty name="user" property="*" />
</jsp:useBean>
<%
    UserDAO dao = new UserDAO();
    
    if (dao.exists(user.getId())) {
    	out.println("<script>alert('이미 가입한 회원입니다.');window.location.href='signupForm.jsp';</script>");
        return;
    }

    if (dao.insert(user)) {
    	out.println("<script>alert('회원가입이 완료되었습니다.'); window.location.href='loginForm.jsp';</script>");
    } else {
    	out.println("<script>alert('회원가입중 오류가 발생하였습니다.');window.location.href='signupForm.jsp';</script>");
    }
%>
