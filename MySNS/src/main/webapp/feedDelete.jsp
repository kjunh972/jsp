<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.FeedDAO" %>

<%
    request.setCharacterEncoding("utf-8");

    String feedId = request.getParameter("feedId");

    if (feedId != null && !feedId.isEmpty()) {
        FeedDAO dao = new FeedDAO();
        try {
            String uid = (String) session.getAttribute("id");
            
            // 게시물 작성자 아이디 가져오기
            String authorId = dao.getAuthorId(feedId);

            // 현재 사용자의 아이디와 게시물 작성자의 아이디 비교
            if (uid != null && uid.equals(authorId)) {
                if (dao.delete(feedId)) {
                    out.println("<script>alert('게시물 삭제가 완료되었습니다.'); window.location.href='main.jsp';</script>");
                } else {
                    out.println("<script>alert('게시물 삭제 중 오류가 발생하였습니다.'); window.location.href='main.jsp';</script>");
                }
            } else {
                out.println("<script>alert('자신이 작성한 게시물만 삭제할 수 있습니다.'); window.location.href='main.jsp';</script>");
            }
        } catch (SQLException e) {
            out.println("<script>alert('게시물 삭제 중 오류가 발생하였습니다. 오류 메시지: " + e.getMessage() + "'); window.location.href='main.jsp';</script>");
            e.printStackTrace();
        }
    } else {
        out.print("게시물 ID가 제공되지 않았습니다.");
    }
%>
