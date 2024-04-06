<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/include/top.jsp"/> 
     <link rel="stylesheet" href="/css/join.css">
            <h3><strong>01. 로그인정보</strong></h3>
                <hr class="blue-hr">
                <form action="#" method="post">
                            <div id="memIddiv">
						        <label for="">*회원아이디</label>
						        <input type="text" placeholder="아이디입력" name="memId" id="memId" required>
						        <button type="button" onclick="fn_idCk(this)">ID중복</button>
						        <div id="disp"></div>
						        <br>
						    </div>
						    <div id="memPw">
						        <label for="">*비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
						        <input type="password" name="mempw"  placeholder="비밀번호 입력" required pattern="(?=.*\d)(?=.*[a-zA-Z])(?=.*\W).{8,}">
						        <span>영문+숫자 8자리 이상</span>
						    </div>
						    <br>
						    <div id="memPwck">
						        <label for="">*비밀번호확인</label>
						        <input type="password" name="memPwck"  placeholder="비밀번호 입력" required pattern="(?=.*\d)(?=.*[a-zA-Z])(?=.*\W).{8,}">
						    </div>
                    <br>
                    <h3><strong>02.개인정보</strong></h3>
                        <hr class="blue-hr">
                                <div id="memName">
					        <label for="">*이름</label>
					        <input type="text" name="memName" id="memName" placeholder="이름입력" required pattern="">
					    </div>
					        <br><br>
					    <div id="memTel">
					        <label for="">*휴대폰번호</label>
					        <select name="memTel" id="memTel">
					            <option value="010">010</option>
					            <option value="">직접입력</option>
					        </select>
					        <span>-</span>
					        <input type="text" name="memTel2" required onkeyup="chknum(event)">
					        <span>-</span>
					        <input type="text" name="memTel3"required onkeyup="chknum(event)" >
					    </div>
					    <div id="memEmail">
					        <label for="">이메일</label>
					        <input type="text" name="memEmail" id="memEmail" placeholder="">@
					        <select name="domainSelector" id="domainSelector">
					            <option value="">직접 입력</option>
					            <option value="@gmail.com">gmail.com</option>
					            <option value="@naver.com">naver.com</option>
					            <option value="@daum.net">daum.net</option>
					            <option value="@hotmail.com">hotmail.com</option>
					        </select>
					    </div>
					    <br><br>
					    <div id="memAddr">
					        <div class="addName">
					            <label for="orderName" class="blue-background">이름</label>
					            <input type="text" class="wid" id="memName" name="memName" placeholder="이름입력" required>
					        </div>
					        <div class="addName">
					            <label for="orderTel" class="blue-background">휴대폰</label>
					            <input type="text" class="wid" id="orderTel" name="memTel" placeholder="휴대폰입력" required>
					        </div>
					        <div class="post">
					            <label for="orderPost" class="blue-background">우편번호</label>
					            <input type="text" class="widOrd" id="sample4_postcode" name="deliPostNo" placeholder="우편번호" required>
					            <input type="button" class="btn btn-outline-primary btn-sm" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					        </div>
					        <label for="orderAdd" class="blue-background">배송주소</label>
					        <input type="text" class="wid" id="sample4_roadAddress" name="deliAddr" placeholder="도로명주소" required><br>
					        <span id="guide" style="color:#999;display:none"></span>
					        <label for="orderAddr" class="blue-background">상세주소</label>
					        <input type="text" class="wid" id="sample4_detailAddress" name="deliAddrD" placeholder="상세주소" required>
					        <div class="addMame">
					            <label for="orderReq" class="blue-background">배송메모</label>
					            <input type="text" class="wid" id="orderReq" name="deliReq" placeholder="배송메모" required>
					        </div>
					        </div>
					    <br><br><br>
					    <div class="col-sm-3 text-center">
			                <button type="button" class="btn btn-primary btn-wide" id="box1" onclick="check()">확인</button>
							<a href="#" 	class="btn btn-default btn-wide" id="box2" role="button">취소</a>
            			</div>
					    </form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>					    
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function fn_idCk(pThis){
	console.log(pThis)
	let sel = document.querySelector('#memId').value;
	let disp =  document.querySelector('#disp');
	let memId = sel.trim();
	console.log(memId);
	
	if(memId == '') return;
	
	$.ajax({
		type:'post',
		url:'/idchk.do',
		data:{memId:memId},
		success:function(data,textStatus){
			console.log(">>>>>>>",data)
			if(data ==0){
				console.log('0')
				console.log("사용가능");
				console.log(disp);
				disp.innerHTML='사용가능'
				
			}else{
				console.log('1')
				console.log("사용불가능");
				disp.innerHTML='사용불가능'
			}
		},
		error:function(data,textStatus){
			alert('오류');
		}
	});
}

function chknum(event){
	const regExp = /[^0-9]/g;
	const ele = event.target;
	if(regExp.test(ele.value)){
		ele.value=ele.value.replace(regExp,'');
	}
}


function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;

            var guideTextBox = document.getElementById("guide");
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
            
            
            console.log('도착');
        }
    }).open();
}
</script>
    <jsp:include page="/include/footer.jsp"/>