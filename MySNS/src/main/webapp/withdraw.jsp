<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>
<%@ page import="java.io.*,java.util.*" %>

<%
    // 사용자가 입력한 아이디
    String inputId = request.getParameter("id");

    // 현재 로그인한 사용자의 아이디
    String loggedInId = (String) session.getAttribute("id");

    // 아이디가 입력되었는지, 로그인한 사용자와 일치하는지 확인
    if (inputId != null && loggedInId != null && inputId.equals(loggedInId)) {
        // 일치하면 회원 탈퇴 로직 수행
        UserDAO dao = new UserDAO();
        if (dao.delete(loggedInId)) {
            // 탈퇴 성공 시 세션을 무효화하고 로그인 페이지로 이동
            session.invalidate();
%>
            <script>
                alert('회원 탈퇴가 완료되었습니다.');
                window.location.href = 'loginForm.jsp';
            </script>
<%
        } else {
            // 탈퇴 실패 시 에러 메시지를 출력
            out.println("<script>alert('탈퇴 중 오류가 발생하였습니다.'); window.location.href='withdrawForm.jsp';</script>");
        }
    } else {
        // 입력한 아이디와 로그인한 아이디가 일치하지 않을 경우 경고 메시지 출력
        out.println("<script>alert('입력한 아이디와 로그인한 아이디가 일치하지 않습니다.'); window.location.href='withdrawForm.jsp';</script>");
    }
%>
