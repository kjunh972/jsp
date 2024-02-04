<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 작성</title>
</head>
<body>
    <%
        // 현재 로그인한 사용자의 아이디를 가져옴
        String loggedInId = (String) session.getAttribute("id");

        // 로그인 여부를 확인
        if (loggedInId == null) {
            // 로그인되지 않은 경우 경고 메시지 출력
            out.print("<script>alert('로그인 후 이용해주세요.'); window.location.href='loginForm.jsp';</script>");
        }
    %>

    <form action="feedAdd.jsp" method="post" enctype="multipart/form-data">
        <table align=center>
            <tr>
                <td colspan=2 align=center height=40><b>글작성</b><td>
            </tr>
            <tr>
                <td align=right>아이디 : &nbsp;</td> 
                <td>
                    <%-- 로그인한 아이디를 히든 필드로 전송 --%>
                    <input type="hidden" name="id" value="<%=loggedInId%>">
                    <%=loggedInId%>
                </td>
            </tr>
            <tr>
                <td align=right>작성글&nbsp;</td> 
                <td><textarea name="content" rows=5 cols=20></textarea></td>
            </tr>
            <tr>
                <td align=right>이미지&nbsp;</td> 
                <td><input type="file" name="image"></td>
            </tr>
            <tr>
                <td colspan=2 align=center height=50>
                    <input type="submit" value="업로드하기">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
