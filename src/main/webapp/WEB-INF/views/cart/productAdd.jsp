<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>관리자</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=10"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <%--	<link href="${pageContext.request.contextPath}/resources/css/contents.css" rel="stylesheet" type="text/css" />--%>
    <link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript">
        function clearInputValues() {
            var inputs = document.querySelectorAll('table input');
            for (var i=0; i<inputs.length; i++) {
                inputs[i].value = '';
            }
        }

        $(function() {
            // 저장
            $("a#btn_save").click(function() {
                let formData = new FormData($('form#frm')[0]);

                $.ajax({
                    url: '${pageContext.request.contextPath}/productInsert',
                    type: 'POST',
                    enctype: "multipart/form-data",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(data) {
                        console.log(data);
                        if (data) {
                            alert('등록 성공');
                            document.location.href = '${pageContext.request.contextPath}/productAdd';
                        }
                    }, error: function() {
                        console.log('error');
                    }
                });
            });

            // 삭제
            $("a#delete").click(function() {
                $.ajax({
                    url: '${pageContext.request.contextPath}/productDelete',
                    type: 'POST',
                    data: {"no":$(this).attr("class")},
                    success: function(data)  {
                        if (data) {
                            alert('삭제 완료');
                            document.location.href = '${pageContext.request.contextPath}/productAdd';
                        }
                    }, error: function() {
                        console.log('error');
                    }
                });
            });

            // 수정
            $("a#modify").click(function() {
                $.ajax({
                    url: '${pageContext.request.contextPath}/productModify',
                    type: 'POST',
                    data: {"no":$(this).attr("class")},
                    success: function(data) {
                        if (data) {
                            $("input#productName").val(data.productName);
                            $("input#productOrigin").val(data.productOrigin);
                            $("input#productPrice").val(data.productPrice);
                            $("select#productCategory").val(data.productCategory).prop("select",true);
                            $("input#companyName").val(data.companyName);
                            $("a#btn_save").css('display', 'none');
                            $("a#btn_modify").css('display', 'block');

                        }
                    }, error: function() {
                        console.log('error');
                    }
                });
            });

            // 수정 확인
            $("a#btn_modify").click(function() {
                let formData = new FormData($('form#frm')[0]);

                $.ajax({
                    url: '${pageContext.request.contextPath}/productUpdate',
                    type: 'POST',
                    enctype: "multipart/form-data",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(data) {
                        console.log(data);
                        if (data) {
                            document.location.href = '${pageContext.request.contextPath}/productAdd';
                        }
                    }, error: function() {
                        console.log('error');
                    }
                });

                clearInputValues(); // 수정 후 초기화
                $("a#btn_save").css('display', 'block');
                $("a#btn_modify").css('display', 'none');
                document.getElementById("productCategory").value = "select";
            });

            // 검색
            $("a#search").click(function() {
                $("#searchForm").submit();  // 폼 전송
            });
        });
    </script>
</head>
<body>
    <div id="wrap">
        <div id="sub_container">
            <div id="contentsWrap" class="sub_con5">
                <div class="board_form">
                    <div class="con_title">
                        <p>상품등록/보기/수정</p>
                    </div>

                    <div class="contents">
                        <div class="btnSet clfix mgb15">
                            <span class="fr">
                                <span class="button">
                                    <a href="clientProductList">목록</a>
                                </span>
                            </span>
                        </div>

                        <form action="${pageContext.request.contextPath}/searchInsertListProcess" method="post" id="searchForm">
                            <table class="bbsWrite mgb35">
                                <caption></caption>
                                <colgroup>
                                    <col width="95"/>
                                    <col width="395"/>
                                    <col width="95"/>
                                    <col/>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>도매법인</th>
                                    <td>
                                        <select name="company" id="selectCompany" style="width: 200px;">
                                            <option selected="selected" value="select">선택하세요</option>
                                            <option value="농협">농협</option>
                                            <option value="동부청과">동부청과</option>
                                            <option value="부산중앙청과">부산중앙청과</option>
                                        </select>
                                    </td>
                                    <input type="hidden" name="column" value="column"/>
                                    <th>상품명</th>
                                    <td>
                                        <input type="text" name="inputText" style="border:1px solid #ddd; height:20px;" class="inputText" size="30"/>
                                        <span class="button"><a href="#" id="search">검색</a></span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>

                        <%-- 리스트 영역 --%>
                        <div class="clfix">
                            <div class="tbWrapLt">
                                <table class="bbsList">
                                    <colgroup>
                                        <col width="30"/>
                                        <col width="100"/>
                                        <col width="100"/>
                                        <col width="100"/>
                                        <col width="100"/>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope="col">NO.</th>
                                            <th scope="col">상품명</th>
                                            <th scope="col">모델</th>
                                            <th scope="col">가격</th>
                                            <th scope="col">상태</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach var="entry" items="${productList}">
                                            <tr>
                                                <td>${entry.no}</td>
                                                <td><img src="${pageContext.request.contextPath}/resources/upload/${entry.productFilename}" width="50" height="50"/></td>
                                                <td>${entry.productName}</td>
                                                <td>${entry.productPrice}</td>
                                                <td>
                                                    <span class="buttonFuc"><a href="#" id="modify" class="${entry.no}">수정</a></span>
                                                    <span class="buttonFuc"><a href="#" id="delete" class="${entry.no}">삭제</a></span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <%-- 상품 등록 영역 --%>
                            <div class="tbWrapRt">
                                <ul class="tabA clfix mgb15">
                                    <li class="over"><a href="#info1">01. 상품등록</a></li>
                                </ul>
                                <form id="frm" method="post" enctype="multipart/form-data">
                                    <div id="info1" class="tbWrapCnt" style="display: block;">
                                        <table class="bbsWrite mgb10">
                                            <caption></caption>
                                            <colgroup>
                                                <col width="95"/>
                                                <col/>
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th>상품명</th>
                                                    <td>
                                                        <input type="text" style="border:1px solid #ddd; height:20px;" name="productName" id="productName" class="inputText" size="50"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>원산지</th>
                                                    <td>
                                                        <input type="text" style="border:1px solid #ddd; height:20px;" name="productOrigin" id="productOrigin" class="inputText" size="50"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>상품가격</th>
                                                    <td>
                                                        <input type="text" style="border:1px solid #ddd; height:20px;" name="productPrice" id="productPrice" class="inputText" size="50"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>카테고리</th>
                                                    <td>
                                                        <select style="width: 200px;" name="productCategory" id="productCategory">
                                                            <option selected="selected" value="select">선택하세요</option>
                                                            <option value="과일">과일</option>
                                                            <option value="채소">채소</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>도매법인</th>
                                                    <td>
                                                        <input type="text" style="border:1px solid #ddd; height:20px;" name="companyName" id="companyName" class="inputText" size="50"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>상품이미지1</th>
                                                    <td class="alignM">
                                                        <input type="file" name="file" id="productFilename" class="inputText" size="10"/>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </form>
                            </div>

                            <p class="agr">
                                <span class="button">
                                    <a href="#" id="btn_save">저장</a>
                                    <a href="#" id="btn_modify" style="display: none">수정</a>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Footer-->

        <!--END Footer-->
    </div>
</body>
</html>