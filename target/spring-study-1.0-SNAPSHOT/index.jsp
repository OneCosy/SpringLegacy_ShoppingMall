<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("button").click(function(){
                alert(this.id);
                document.location.href='${pageContext.request.contextPath}/' + this.id;
            });

            $("input#btnLogin").click(function(){
               $("form").submit();
            });
        });
    </script>
</head>

<body>
    <%-- 버튼 방식 --%>
    <%--<button id="home">HOME</button><button id="message">Message</button><button id="lesson">JAVAbutton</button>
    <br>

    &lt;%&ndash; form 방식 &ndash;%&gt;
    <form action="${pageContext.request.contextPath}/empValue" method="post">
        <input type="text" name="job">
        <input type="text" name="sal">
        <input type="submit" value="Send">
    </form>

    <form action="${pageContext.request.contextPath}/lessonCheck" method="post">
        <input type="checkbox" name="lesson" value="Java">Java
        <input type="checkbox" name="lesson" value="Mysql">Mysql
        <input type="checkbox" name="lesson" value="Html">Html
        <input type="checkbox" name="lesson" value="Spring">Spring
        <input type="submit" value="Send">
    </form>

    <form action="${pageContext.request.contextPath}/login">
        <input type="button" value="Login" id="btnLogin">
    </form>--%>

    <div class="container">
        <h2>DemoBitForm</h2>
        <form class="form-inline" action="${pageContext.request.contextPath}/demoBitInsert" method="post">
            <label for="no">IDNUM:</label>
            <input type="text" class="form-control" id="no" placeholder="no" name="no">

            <label for="message">Message:</label>
            <input type="text" class="form-control" id="message" placeholder="Enter message" name="message">

            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name">

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <div>
        <a href="${pageContext.request.contextPath}/clientProductList">
            <h1>쇼핑몰</h1>
        </a>
    </div>
</body>
</html>