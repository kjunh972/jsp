<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ include file="./menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <style type="text/css">
        body {
            background-color: #F1F6F9;
        }
        table {
            width: 70%;
            margin: auto;
            text-align: center; /* 텍스트 가운데 정렬 */
        }
        td {
            padding: 5px; /* 셀 안의 내용과 테두리 간격 설정 */
        }
        button {
            background-color: #9BA4B5; /* 버튼 색상 설정 */
            color: white; /* 버튼 텍스트 색상 설정 */
            border: none;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            cursor: pointer;
        }
        .list-header {
            text-align: right;
            padding-right: 80px; /* 우측 여백 추가 */
        }
    </style>
</head>
<body>

<%
    String uid = (String) session.getAttribute("id");
    if (uid == null) {
        response.sendRedirect("loginForm.jsp");
        return;
    }
    session.setAttribute("id", uid);
    
    ArrayList<FeedObj> feeds = (new FeedDAO()).getList();
    
    String str = "<table align=center style='background-color: #9BA4B5;'>";
    str += "<tr height=70><td colspan=1 class='list-header'><b>작성글 리스트</b></td>";
    str += "<td align=right>";
    str += "<a href='feedAddForm.jsp'><button>글쓰기</button></a>"; 
    str += "</td></tr>";
    
    for (FeedObj feed : feeds) {
        String img = feed.getImages(), imgstr = "";
        if (img != null) {
            imgstr = "<img src='images/" + img + "' width=240>";
        }       
        str += "<tr><td colspan=2><hr></td></tr>";
        str += "<tr>";
        str += "<td style='text-align: left;'><small>" + feed.getId() + "</small></td>";
        str += "<td style='text-align: right;'><small>(" + feed.getTs() + ")</small></td>";
        str += "</tr>";
        str += "<tr><td colspan=2>" + imgstr + "</td></tr>";
        str += "<tr><td colspan=2 style='text-align: center;'>" + feed.getContent() + "</td></tr>"; 
        str += "<tr><td colspan=2 align=right>";
        str += "<form action='feedDelete.jsp' method='post'>";
        str += "<input type='hidden' name='feedId' value='" + feed.getId() + "'>";
        str += "<button type='submit'>삭제</button>";
        str += "</form>";
        str += "</td></tr>";
    }
    str += "</table>";
    out.print(str);
%>

</body>
</html>
