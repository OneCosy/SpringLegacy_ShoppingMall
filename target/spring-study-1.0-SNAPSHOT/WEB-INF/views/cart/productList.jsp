<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!--  관리자페이지 구현 X  -->

    <title>관리자</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=7"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- <link href="../css/contents.css" rel="stylesheet" type="text/css" /> -->
    <link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css"/>

    <style>
        #infoSelect:hover {
            cursor: pointer;
        }

        .bbsList tbody tr:hover {
            background-color: lightgray;
        }
    </style>

    <script type="text/javascript">
        function rowMouseOver(row) {  // 각 행에 마우스 올렸을 때 색 변경
            row.style.backgroundColor = '#D3D3D3';
        }

        function rowMouseOut(row) {
            row.style.backgroundColor = '';
        }

        function rowClick(no) {
            document.location.href = '${pageContext.request.contextPath}/productInfo/'+no;
        }

        $(function () {
            if ('${sessionScope.id}' == '') {
                $('span#insert').hide();
            } else {
                $('span#login').children('a').text("로그아웃");
            }

            // 검색
            $("a#search").click(function() {
                $("#searchForm").submit();  // 폼 전송
            });

            // 새로고침
            $("a#reload").click(function() {
                $("select#selectCompany").val('select').prop("select", true);
                $("select#selectCol").val('select').prop("select", true);
                $("input#inputText").val('');
            });


        });


    </script>
</head>

<body>
    <div id="wrap">
        <!-- header -->

        <div id="sub_container">
            <div id="contentsWrap" class="sub_con5">
                <div class="board_form">
                    <div class="con_title">
                        <p>상품 등록/보기/수정</p>
                    </div>

                    <div class="contents">
                        <div class="btnSet clfix mgb15">
                            <span class="fr">
                                <span class="button" id="login">
                                    <a href="${pageContext.request.contextPath}/login">로그인</a>
                                </span>
                                <span class="button" id="list"><a href="loginProductList">목록</a></span>
                                <span class="button" id="insert"><a href="${pageContext.request.contextPath}/productAdd">등록</a></span>
                            </span>
                        </div>
                        <form action="${pageContext.request.contextPath}/searchListProcess" method="post" id="searchForm">
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
                                            <select id="selectCompany" name="company" style="width: 200px;">
                                                <option selected="selected" value="select">선택하세요</option>
                                                <option value="농협">농협</option>
                                                <option value="동부청과">동부청과</option>
                                                <option value="부산중앙청과">부산중앙청과</option>
                                            </select>
                                        </td>
                                        <th>
                                            <select id="selectCol" name="column">
                                                <option selected="selected" value="select">선택하세요</option>
                                                <option value="productName">상품명</option>
                                                <option value="productOrigin">원산지</option>
                                                <option value="productCategory">종류</option>
                                            </select>
                                        </th>
                                        <td>
                                            <input type="text" name="inputText" style="border:1px solid #ddd; height:20px;" id="inputText" class="inputText" size="30"/>
                                            <span class="button"><a href="#" id="search">검색</a></span>
                                            <span class="button"><a href="#" id="reload">새로고침</a></span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <table class="bbsList">
                            <colgroup>
                                <col width="80"/>
                                <col width="170"/>
                                <col width="170"/>
                                <col width="170"/>
                                <col width="170"/>
                                <col width="170"/>
                                <col width="170"/>
                                <col width="170"/>
                            </colgroup>

                            <thead>
                                <tr>
                                    <th scope="col">NO.</th>
                                    <th scope="col">상품명</th>
                                    <th scope="col">이미지</th>
                                    <th scope="col">원산지</th>
                                    <th scope="col">가격</th>
                                    <th scope="col">종류</th>
                                    <th scope="col">날짜</th>
                                    <th scope="col">판매자</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="entry" items="${productList}">
                                    <tr id="infoSelect" onclick="rowClick(${entry.no})" onmouseover="rowMouseOver(this)" onmouseout="rowMouseOut(this)">
                                        <td>${entry.no}</td>
                                        <td>${entry.productName}</td>
                                        <td><img src="${pageContext.request.contextPath}/resources/upload/${entry.productFilename}" width="50" height="50"/></td>
                                        <td>${entry.productOrigin}</td>
                                        <td>${entry.productPrice}</td>
                                        <td>${entry.productCategory}</td>
                                        <td>${entry.today}</td>
                                        <td>${entry.seller}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!--Footer-->

        <!--END Footer-->
    </div>
</body>
</html>