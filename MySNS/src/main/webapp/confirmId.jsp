<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>

<%
    request.setCharacterEncoding("utf-8");
    String uid = request.getParameter("id");

    UserDAO dao = new UserDAO();

    if (dao.exists(uid)) {
%>
    이미 사용 중인 ID입니다. 다른 ID를 선택해주세요.
<%} else {%>
    사용 가능한 ID입니다.
<%}%>
