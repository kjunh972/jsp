<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style type="text/css">
        body {
            background-color: #9BA4B5;
        }
        a {
            color: #323232;
            text-decoration: none;
            font-weight: bold;
            font-size: 0.9em;
        }
    </style>

    <script type="text/javascript">
        async function id_check() {
            var id = document.getElementById('userId').value;
            if (!id) {
                alert("ID를 입력하세요");
                return;
            }

            var url = "confirmId.jsp?id=" + id;

            try {
                const response = await fetch(url);
                const data = await response.text();

                alert(data);

                // 중복 여부에 따라 idConfirmed 값을 설정
                document.getElementById('idConfirmed').value = data.includes("가능") ? "true" : "false";
            } catch (error) {
                console.error('Error:', error);
            }
        }

        function validateForm() {
            var password = document.getElementsByName('ps')[0].value;
            var confirmPassword = document.getElementsByName('ps2')[0].value;

            // 비밀번호와 비밀번호 확인이 다를 경우
            if (password !== confirmPassword) {
                alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                return false;
            }

            var idConfirmed = document.getElementById('idConfirmed').value;
            if (idConfirmed === "false") {
                alert("아이디 중복 확인을 해주세요");
                return false;
            }
            // 추가적인 폼 유효성 검사 로직 추가 가능
            return true;
        }
    </script>
</head>
<body>
    <form action="signup.jsp?action=signup" method="post" onsubmit="return validateForm()">
        <table align=center>
            <tr>
                <td colspan=2 align=center height=40><b>회원가입</b></td>
            </tr>
            <tr>
                <td align=right>아이디&nbsp;</td>
                <td>
                    <input type="text" id="userId" name="id" placeholder="Email address" required>
                    <button type="button" onclick="id_check()">중복확인</button>
                    <input type="hidden" id="idConfirmed" name="idConfirmed" value="false">
                </td>
            </tr>
            <tr>
                <td align=right>비밀번호&nbsp;</td>
                <td><input type="password" name="ps" required pattern="[a-zA-Z][a-zA-Z0-9]{4,11}"></td>
                <!-- 영문자로 시작하고 4글자에서 11글자 사이 입력 -->
            </tr>
            <tr>
                <td align=right>비밀번호(확인)&nbsp;</td>
                <td><input type="password" name="ps2" required pattern="[a-zA-Z][a-zA-Z0-9]{4,11}"></td>
                <!-- 영문자로 시작하고 4글자에서 11글자 사이 입력 -->
            </tr>
            <tr>
                <td align=right>이름&nbsp;</td>
                <td><input type="text" name="name" required></td> 
            </tr>
            <tr>
                <td colspan=2 align=center height=50>
                    <input type="submit" value="회원가입하기">
                </td>
            </tr>
        </table>
    </form>
    
    <br><br><br>
    <div align=center>
        <h5>이미 회원이신가요 ?</h5>
        <a href="./loginForm.jsp">로그인 페이지로 이동하기</a>
    </div>
</body>
</html>
