<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>관리자</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=10"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="copyright" content="Copyright 2009 @ high1 all rights reserved"/>
    <link href="${pageContext.request.contextPath}/resources/css/contents.css?ver=1" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script type="text/javascript">
        function getCookie(key){
            var cookies = document.cookie.split(';');
            console.log(cookies);
            for (var i=0; i<cookies.length; i++) {
                var cookie = cookies[i].trim();
                if (cookie.startsWith(key+'=')){
                    return cookie.substring(key.length+1);
                }
            }
            return null;
        }

        $(function() {
            var id = getCookie("id");
            console.log(id);

            if (id!=null) {
                $("input[name='user_id']").val('${id}');
                $("input#checker").prop("checked", true);
            }
            else {
                $("input[name='user_id']").val('');
                $("input#checker").prop("checked", false);
            }

            $("#btnSubmit").click(function() {
                if ($("input[name='user_id']").val().length == 0 || $("input[type='password']").val().length == 0) {
                    alert('ID OR PASS CHECK!');
                    $("input[name='user_id']").val('');
                    $("input[name='user_passwd']").val('');
                    $("input[name='user_id']").focus();
                    return false;
                } else {
                    let serialdata = $("form#form").serialize();
                    $.ajax({
                        url: '${pageContext.request.contextPath}/loginCheck',
                        type: 'POST',
                        data: serialdata,
                        success: function(data) {
                            if(data.trim() == 'T') {
                                document.location.href = '${pageContext.request.contextPath}/clientProductList';
                            } else {
                                $("dt#show").html("<font color='red'>Check</font>");
                                $("input[name='user_id']").val('').focus();
                                $("input[name='user_passwd']").val('');
                            }
                        }, error: function () {
                            console.log('error');
                        }
                    });
                }
            });
        });
    </script>
</head>

<body>
    <form id="form" name="login" method="post" action="${pageContext.request.contextPath}/loginCheck">
        <div id="loginWrapper">
            <div class="loginForm">
                <fieldset>
                    <legend>관리자 시스템 로그인</legend>
                    <dl>
                        <dt><img src="${pageContext.request.contextPath}/resources/img/common/th_id.gif" alt="아이디"/></dt>
                        <dd><input type="text" name="user_id" class="text" id="user_id" value="${id}"/></dd>

                        <dt><img src="${pageContext.request.contextPath}/resources/img/common/th_pw.gif" alt="비밀번호"/></dt>
                        <dd><input type="password" name="user_passwd" class="text" id="user_passwd"/></dd>
                    </dl>
                    <div class="btn">
                        <img id="btnSubmit" src="${pageContext.request.contextPath}/resources/img/button/btn_login.gif" alt="LOGIN" title="LOGIN"/>
                    </div>

                    <div class="saveId">
                        <input type="checkbox" id="checker" name="checker"/>
                        <span><img src="${pageContext.request.contextPath}/resources/img/common/save_id.gif" alt="아이디 저장"/></span>
                        <span><a href="#"><u>회원가입</u></a></span>
                    </div>
                </fieldset>
            </div>
        </div>
    </form>
</body>
</html>