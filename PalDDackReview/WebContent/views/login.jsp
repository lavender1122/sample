<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    
	<jsp:include page="/include/top.jsp"/> 
    <h3 class="title">로그인</h3>
        <form action="<%=request.getContextPath()%>/logincontroller.do" method="post">
            <div class="container-fluid">
                <div class="col-xs-12">
                    <input type="text" id="memId" name="memId" class="form-control a memId" placeholder="아이디">
                </div>
                <div class="col-xs-12">
                    <input type="password" name="memPw" id="memPw" class="form-control a memPw" placeholder="비밀번호">
                </div>
                <div class="col-xs-12">
                    <input type="submit" id="loginAjax" class="btn btn-primary col-xs-12" value="로그인">
                </div>
                <div class="col-xs-12">
                    <a href="#" class="btn col-xs-12 btn btn-default" id="register" >회원가입</a>
                </div>
                <div class="col-xs-12">
                    <a href="#"><img src="/img/파비콘.jpg" id="image" alt="관라자 로그인"></a>
					<a href="#" class="btn col-xs-4 btn btn-default" id="loginR">아이디 / 비밀번호 찾기</a> 
                </div>
            </div>
        </form>
        <jsp:include page="/include/footer.jsp"/>
