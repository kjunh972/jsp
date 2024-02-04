<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.ConnectionPool" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="dao.UserBean">
    <jsp:setProperty name="user" property="*" />
</jsp:useBean>
<%
    String sql = "UPDATE user SET password = ?, name = ? WHERE id = ?";
    
    Connection conn = ConnectionPool.get();
    PreparedStatement stmt = conn.prepareStatement(sql);
    
    // 아이디는 수정하지 않도록 체크
    if (user.getPs() != null && user.getName() != null) {
        stmt.setString(1, user.getPs());
        stmt.setString(2, user.getName());
        stmt.setString(3, user.getId());
        
        int count = stmt.executeUpdate();
        if (count == 1) {
        	out.println("<script>alert('회원정보가 변경되었습니다.'); window.location.href='main.jsp';</script>");
        } else {
        	out.println("<script>alert('오류가 발생하였습니다.'); window.location.href='updateForm.jsp';</script>");
            
        }
    } else {
        out.println("<script>alert('패스워드 또는 이름이 비어있습니다. 아이디는 수정되지 않습니다.'); window.location.href='updateForm.jsp';</script>");
        
    }
    
    stmt.close();
    conn.close();
%>
