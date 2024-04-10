<%@page import="kr.or.ddit.utill.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PalDDack</title>
    <!-- css 넣기 -->
    <link rel="stylesheet" href="/css/reset.css">
    <!-- 부트스트랩 -->
    <link rel = "stylesheet" type ="text/css" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" >
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/main.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
li{
    list-style: none;
}
a{
    text-decoration: none;
}
.header {
  border-bottom: 1px solid #E0E0E0;
} 

.header_detail {
  width: 1073px;
  height: 150px;
  margin: auto;
  /* background-color: gray; */
  /* border: 1px solid black; */
}
.header_detail img {
  width: 143px;
  margin: auto;
  display: block;
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  z-index: 9999;
  margin-top: 21px;
}
.header_detail .logout_li {
  font-size: 14px;
  float: left;
  margin-left: 20px;
  list-style: none;
  position: relative;
  left: 65%;
  color: navy;
  font-weight: 600;
  margin-top: 15px;
}
.header_detail .login_li {
  font-size: 14px;
  float: left;
  margin-left: 20px;
  list-style: none;
  position: relative;
  left: 73%;
  color: navy;
  font-weight: 600;
  margin-top: 15px;
}
.category  ul li{
  font-size: 20px;
  display: inline-block;
  padding: 19px;
  color: #004393;
  font-weight: 600;
  cursor: pointer; 
}
.category {
  width: 1073px;
  margin: 15px auto;
}
.category ul{
  display: flex;
  justify-content: space-between;
}

.allList {
  width: 23px;
  height: 23px;
  vertical-align: -3px;
}
.search {
  position: relative;
  width: 300px;
}
.search input {
  width: 68%;
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 8px 8px;
  font-size: 12px;
  position: relative;
  left: 814px;
  top: 20px;
}
.search img {
  position : relative;
  width: 25px;
  top: -10px;
  left: 1060px;
  margin: 0;
}
.jjim, .cart {
  width: 35px;
/*   left: 600px; */
/*   margin-bottom:10px; */
}
a:link {
  text-decoration: none;
  color: black;
}
a:visited, a:active {
  color: black;
}
.menu {
  width: 80px;
  left: 17px;
  padding-left: 0;
  margin-top:10px;
}
.menu > a {
  color: #004393
}
.foot {
    background-color: #f8fcfe;
    text-align: center;
    padding: 10px 10px 30px 10px;
    margin-top: 50px;
}
.fon {
    font-size: 13px;
}
#searchButton {
  cursor: pointer;
}
<%
	MemberVO mv = (MemberVO)session.getAttribute("mv");
	
%>
    </style>
</head>
<body>
    <div class="header">
        <div class="header_detail">
            <a href="<%=request.getContextPath()%>/main.do"><img src="<%=request.getContextPath()%>/img/로고후보6.jpg" alt=""></a>
            <ul>
            <%
            	if(mv ==null){
            %>
                <li class="login_li"><a href="logincontroller.do">로그인</a></li>
                <li class="login_li"><a href="join.do">회원가입</a></li>
                <li class="login_li"><a href="logincontroller.do">마이페이지</a></li>
                <li class="login_li"><a href="#">고객센터</a></li>
            <% 
            	}else{ //로그인되면
            	
            %>
             	<li class="logout_li"><%=mv.getMemName() %>&nbsp;님 환영합니다</li>
		        <li class="logout_li"><a href="#" id="logout" onclick="fn_logout(this)">로그아웃</a></li>
<%-- 		        <li class="logout_li"><a href="<%=request.getContextPath()%>/logoutController.do" id="logout" onclick="fn_logout(this)">로그아웃</a></li> --%>
		        <li class="logout_li"><a href="#">마이페이지</a></li>
		        <li class="logout_li"><a href="#">고객센터</a></li>
            <%
            	}
            %>
            </ul>
            <form action="" method="post" id="searchForm">
                <div class="search">
                    <input type="text" name="searchName" id="searchName" placeholder="검색어 입력">
                    <img src="<%=request.getContextPath()%>/img/search.png" alt="검색아이콘" id="searchButton">
                </div>
            </form>
        </div>
        <div class="category">
                <form action="" method="post" id="">
                    <ul>
                        <li>생선</li>
                        <li>패류</li>
                        <li>연체/갑각류</li>
                        <li>건어물</li>
                        <li>해조류</li>
                        <li>전갈/액젓</li>
                        <li>가공식품</li>
                        <li>
                            <a href="#">제철 수산물</a>
                        </li>
                        <li>
                            <a href="#"><img src="" alt="" class="cart"></a>
                        </li>
                        <li>
                            <a href="">
                                <img src="" alt="" class="jjim">
                            </a>
                        </li>
                    </ul>
                </form>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type="text/javascript">
    function fn_logout(pthis){
//     	e.preventDefault(); //기본링크동작  왜 하지?
    	//confirm 대화상자
    	if(confirm('정말로 로그아웃하시겠습니까?')){
    		$.ajax({
    			url:'/logoutController.do',
    			type: 'GET',
    			success:function(response){
//     				console.log(response);
    				alert('로그아웃 되었습니다');
    				location.href='main.do';
    			},
    			error:function(){
    				alert('로그아웃 실패했습니다.');
    			}
    		});
    	}
    }
    </script>
