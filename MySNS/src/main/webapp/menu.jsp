<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쇼핑몰</title>
    <style type="text/css">
        header {
            background-color: #212A3E;
            font-size: 15pt;
            height: 40px;
            line-height: 35px; /* 텍스트를 수직으로 가운데 정렬 */
        }

        header a {
            text-decoration: none;
            color: white;
            margin-right: 10px;
        }

        header a.rightUp {
            float: right;
        }

        header a.last {
            margin-right: 20px; /* 조절할 간격 크기 */
        }
    </style>
</head>
<body>
    <header>
        <a href="main.jsp">Home</a>
        <a href="logout.jsp" class="rightUp">로그아웃 </a>
        <a href="updateForm.jsp" class="rightUp last">회원정보수정</a>
        <a href="withdrawForm.jsp" class="rightUp last">탈퇴하기</a>
    </header>
</body>
</html>
