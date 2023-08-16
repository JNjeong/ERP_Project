<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<%@include file="/WEB-INF/views/layout/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/httpRequest.js"></script>

<link href="/webdesign/assets/css/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/css/a/a_company.css" />
<style type="text/css">
.notosanskr * { 
 font-family: 'Noto Sans KR', sans-serif;
 font-size:10px;
}

.A31 input{
	width:
}

.divform1 {
	width: 100%;
	height: 20%;
}

.divform2 {
	float: left;
	margin-left: 5%; 
	width:35%;
}

.divform3 {
	float: left;
	margin-left: 5%; 
	width:45%;
}

.divform4 {
	float: left;
	margin-left: 5%;
}

.hr {
	height: 100vh;
	width: 0.1vw;
	border-width: 0;
	color: rgba(160, 160, 160, 0.3);
	background-color: rgba(160, 160, 160, 0.3);
	
}

input#search {
background:url(/image/search-glass.png);
background-repeat: no-repeat;
width:20px;
height:20px;
border: 0;
}
</style>
<script type="text/javascript" charset="UTF-8">

function surf(v, code){
	var type = document.getElementsByName("type")[0].value;
	if(v == ''){
		v = null;
	}
	var url = "${pageContext.request.contextPath}/a/a4/a41/loanAjax";
	var param = "comcode_code="+code+"&word="+v+"&type="+type;
	
	sendRequest(url,param,getlist,"POST");
}
function getlist(){
	if(xhr.readyState==4 && xhr.status==200) {	
		var data = xhr.response;
		let procode = document.getElementById("procode");
		let newTr = document.createElement("tr");
		let newTd = document.createElement("td");
		procode.innerHTML = '';
		procode.innerHTML += '<tr><td>코드</td><td>금액</td><td>적요</td></tr>';
		if(data != ""){
			var data2 = JSON.parse(data);
			data2.forEach(function(map){
				newTr = document.createElement("tr");
				procode.appendChild(newTr);
				newTd = document.createElement("td");
				newTd.innerHTML = map.client_name;
				newTr.appendChild(newTd);
				newTd = document.createElement("td");
				newTd.innerHTML = map.client_registeredno;
				newTr.appendChild(newTd);
				newTd = document.createElement("td");
				newTd.innerHTML = map.client_businesstype;
				newTr.appendChild(newTd);
			});
		}else {
			procode.innerHTML += '<tr><td colspan="3">목록이 없습니다.</td></tr>';
		}
	}
}


//전체목록조회 > 새창으로
function ctlist(){
	let openWin = window.open("${pageContext.request.contextPath}/c/c2/c21/ctlist", "_blank", "scrollbars=yes, top=150, left=300, width=300, height=300");
}
function cslist(){
	let openWin = window.open("${pageContext.request.contextPath}/c/c2/c21/cslist", "_blank", "scrollbars=yes, top=150, left=300, width=300, height=300");
}
function btname(){
	let openWin = window.open("${pageContext.request.contextPath}/c/c2/c21/btname", "_blank", "scrollbars=yes, top=150, left=300, width=300, height=300");
}
function btsubctgr(){
	let openWin = window.open("${pageContext.request.contextPath}/c/c2/c21/btsubctgr", "_blank", "scrollbars=yes, top=150, left=300, width=700, height=700");
}

//자동완성 > AJAX
function country(e, name){
	if(e.keyCode == 13){
		if(name == ""){		
			alert("국가를 입력해주세요.");
			document.getElementById("country_name").focus();
			return;	
		}
		var url = "${pageContext.request.contextPath}/c/c2/c21/country";		
		var param = "country_name=" + encodeURIComponent(name);		
		
		sendRequest(url, param, countryname, "POST");	
	}
}
function countryname(){	
	if(xhr.readyState==4 && xhr.status==200) {
		var data = xhr.response;	
		if(data != ""){			
			var data2 = JSON.parse(data);		
			document.getElementById("country_name").value = data2.country_name;	
			document.getElementById("country_no").value = data2.country_no;
		}else {
			document.getElementById("country_name").value = '';
			alert("조회된 국가가 없습니다. 조회 버튼을 클릭하여 목록에서 국가를 선택해주세요.");
		}
	}
}

function clientsort(e, name){
	if(e.keyCode == 13){
		if(name == ""){
			alert("종류를 입력해주세요.");
			document.getElementById("clientsort_name").focus();
			return;
		}
		var url = "${pageContext.request.contextPath}/c/c2/c21/clientsort";
		var param = "clientsort_name=" + encodeURIComponent(name);
		
		sendRequest(url, param, clientsortname, "POST");
	}
}
function clientsortname(){
	if(xhr.readyState==4 && xhr.status==200) {
		var data = xhr.response;
		if(data != ""){
			var data2 = JSON.parse(data);
			document.getElementById("clientsort_name").value = data2.clientsort_name;
			document.getElementById("clientsort_no").value = data2.clientsort_no;
		}else {
			document.getElementById("clientsort_name").value = '';
			alert("중복된 종류입니다. 조회 버튼을 클릭하여 목록에서 종류를 선택해주세요.");
		}
	}
}
</script>

	<div class="notosanskr">
		<div align="center">
			<h1 style="font-size: 20pt;">자금 조달</h1>
		</div>
		<div class="divform2">
			<div>
				<table>
					<tr>
						<td>
							<select name="type">
								<option value="all" ${param.type == 'all' ? 'selected' : '' }>전체</option>
								<option value="client_name" ${param.type == 'client_name' ? 'selected' : '' }>거래처</option>
								<option value="clientsort_name" ${param.type == 'clientsort_name' ? 'selected' : '' }>종류</option>
								<option value="client_businesstype" ${param.type == 'client_businesstype' ? 'selected' : '' }>구분</option>
								<option value="businesstype_name" ${param.type == 'businesstype_name' ? 'selected' : '' }>업태</option>
								<option value="businesstype_subctgr" ${param.type == 'businesstype_subctgr' ? 'selected' : '' }>업종</option>
								<option value="country_name" ${param.type == 'country_name' ? 'selected' : '' }>국가</option>
							</select>
						</td>
						<td>
							<input type="text" name="word" placeholder="검색어를 입력하세요" value="${param.word }" autocomplete="off" onkeyup="surf(this.value, '${comcode_code}')">
							<input type="button" value="전체목록" onclick="surf('', '${comcode_code}')">
						</td>
					</tr>
				</table>
			</div>
			
			<div style="overflow: scroll;">
				<table id="procode">
				<c:if test="${list != null }">
					<tr>
						<td>거래처</td>
						<td>사업자등록번호</td>
						<td>구분</td>
					</tr>
					<c:forEach var="map" items="${list }">
					<tr onclick="selectForm(${map.client_no})" class="filter" id="filter">
						<td class="code">${map.client_name }</td>
						<td class="price">${map.client_registeredno }</td>
						<td class="cont">${map.client_businesstype }</td>
					</tr>
					</c:forEach>
				</c:if>
				<c:if test="${list == null }">
					<tr><td>목록이 비어있습니다</td></tr>
				</c:if>
				</table>
			</div>
			<div align="right">
				<input type="button" onclick="location.href='${pageContext.request.contextPath }/a/a4/a41?comcode_code=${comcode_code }'" value="add">
			</div>
	
	<!-- 리스트 클릭 시 url 데이터 숨기기 위한 form태그 -->	
			<form action="${pageContext.request.contextPath }/c/c2/c21/updateForm" id="content" method="post">
				<input type="hidden" name="client_no">
				<input type="hidden" name="comcode_code" value="${comcode_code }">
			</form>
		
		</div>
		
		<div class="divform4">
			<hr class="hr">
		</div>
		
		<div id="add" class="divform3">
			<c:choose>
				<c:when test="${inmap != null }">
					<form action="${pageContext.request.contextPath }/c/c2/c21/update" method="POST" id="update">
						<input type="hidden" name="comcode_code" value="${comcode_code }">
						<input type="hidden" name="country_no" value="${inmap.country_no }">
						<input type="hidden" name="clientsort_no" id="clientsort_no" value="${inmap.clientsort_no }">
						<input type="hidden" name="client_no" id="client_no" value="${inmap.client_no }">
						<input type="hidden" name="businesstype_no" id="businesstype_no" value="${inmap.businesstype_no }">
						<div class="warning_box">
							<span class="red bigger">* </span>
							<div class="yellow_box"></div>
							<span class="red">는 필수 입력란입니다.</span>
						</div>
							
						<div>
							<label>거래처명 </label>
							<input type="text" name="client_name" id="client_name" value="${inmap.client_name }" maxlength="30" class="required">
						</div>
						
						<div>
							<label>국가 </label>
							<input type="text" name="country_name" id="country_name" value="${inmap.country_name }" onkeypress="country(event, this.value)">
							<input type="button" onclick="ctlist()" value="조회">
						</div>
						
						<div>
							<label>종류 </label>
							<input type="text" name="clientsort_name" id="clientsort_name" value="${inmap.clientsort_name }" onkeypress="clientsort(event, this.value)">
							<input type="button" onclick="cslist()" value="조회">
						</div>
						
						<div>
							<label>사업자 등록번호 </label>
							<input type="text" name="client_registeredno" id="client_registeredno" value="${inmap.client_registeredno }" maxlength="30" class="required">
						</div>
						
						<div>
							<label>법인 등록번호</label>
							<input type="text" name="client_corporatedno" id="client_corporatedno" value="${inmap.client_corporatedno }" maxlength="30">
						</div>
						
						<div>
							<label>대표자 </label>
							<input type="text" name="client_representative" id="client_representative" value="${inmap.client_representative }">
						</div>				
						
						<div>
							<label>사업형태 </label>
							<input type="text" name="client_businesstype" id="client_businesstype" value="${inmap.client_businesstype }">
						</div>	
							
						<div>
							<label>업태 </label>
							<input type="text" name="businesstype_name" id="businesstype_name" readonly="readonly" value="${inmap.businesstype_name }" onclick="btname()">
							<label>업종 </label>
							<input type="text" name="businesstype_subctgr" id="businesstype_subctgr" readonly="readonly" value="${inmap.businesstype_subctgr }" onclick="btsubctgr()">
						</div>	
						
						<div>
							<label>사업장 </label>
							<input type="text" name="client_addr1" id="client_addr1" value="${inmap.client_addr1 }">
						</div>
						
						<div>
							<label>상세 주소</label>
							<input type="text" name="client_addr2" id="client_addr2" value="${inmap.client_addr2 }">
							<input type="button" onclick="searchim()" value="조회">
						</div>
						
						<div>
							<label>우편 번호 </label>
							<input type="text" name="client_postal" id="client_postal" value="${inmap.client_postal }">
						</div>
						
						<div>
							<label>담당자 </label>
							<input type="text" name="client_manager" id="client_manager" value="${inmap.client_manager }">
						</div>
						<div>
							<label>담당자번호 </label>
							<input type="text" name="client_contact" id="client_contact" value="${inmap.client_contact }">
						</div>
						
						<div>
							<label>대표 번호 </label>
							<input type="text" name="client_directno" id="client_directno" value="${inmap.client_directno }">
						</div>
						
						<div>
							<label>fax </label>
							<input type="text" name="client_fax" id="client_fax" value="${inmap.client_fax }">
						</div>		
						
						<div>
							<label>이메일 </label>
							<input type="text" name="client_email" id="client_email" value="${inmap.client_email }">
						</div>	
						
						<div align="right">
							<input type="button" value="update" onclick="sub(this.form)">
							<input type="button" value="delete" onclick="deletei(${inmap.client_no }, '${comcode_code }')">
						</div>
					</form>
				</c:when>
				<c:otherwise>
					<form action="${pageContext.request.contextPath }/a/a4/a41/createLoan" method="POST" id="create">
						<input type="hidden" name="comcode_code" value="${comcode_code }">
						<input type="hidden" name="country_no" value="26">
						<input type="hidden" name="clientsort_no" id="clientsort_no" value="3">
						<input type="hidden" name="businesstype_no" id="businesstype_no" value="1">
							<h3>차입 등록 사항</h3>
						<div>
							<label>코드 </label>
							<input type="text" name="investment_code" id="investment_code" onblur="imcode(this.value)" maxlength="30" class="required">
							<h6 id="imcodecheck" style="color:red;"></h6>
						</div>
						
						<div>
							<label>기간 </label>
							<input type="date" name="investment_start" id="investment_start"> ~ <input type="date" name="investment_end" id="investment_end">
						</div>
						
						<div>
							<label>금액 </label>
							<input type="text" name="investment_price" id="investment_price">
						</div>				
						
						<div>
							<label>거래처 </label>
							<input type="text" name="client_name" id="client_name" onkeypress="searchcl(event, '${comcode_code}')">
							<input type="button" onclick="clList('${comcode_code}')" value="조회">
						</div>	
							
						<div>
							<label>사업자등록번호 </label>
							<input type="text" name="client_registeredno" id="client_registeredno" readonly="readonly">
						</div>	
						
						<div>
							<label>담당자 </label>
							<input type="text" name="client_manager" id="client_manager" readonly="readonly">
						</div>
						
						<div>
							<label>투자 종류</label>
							<input type="text" name="imkind_name" id="imkind_name" onkeypress="imkind(event, this.value)">
							<input type="button" onclick="searchim()" value="조회">
						</div>
						
						<div>
							<label>적요 </label>
							<input type="text" name="investment_content" id="investment_content" maxlength="500">
						</div>
						
						<div>
							<label>은행 </label>
							<input type="text" name="account_bank" id="account_bank" onclick="acList('${comcode_code}', '${map.team_code }')" readonly="readonly">
							<input type="button" onclick="acList('${comcode_code}', '${map.team_code }')" value="조회">
						</div>
						
						<div>
							<label>계좌번호 </label>
							<input type="text" name="account_num" id="account_num" readonly="readonly">
						</div>
						
						<div>
							<label>차변 </label>
							<select name="debtor_no" id="debtor_no" onchange="check1()" class="required">
								<c:forEach var="vo1" items="${dlist }">
									<option value="${vo1.debtor_no }" id="${vo1.bs3_no }" selected>${vo1.bs3_ctgr }</option>
								</c:forEach>
							</select>
						</div>	
						
						<div>
							<label>대변</label> 
							<select name="creditor_no" id="creditor_no" onchange="check2()" class="required">
								<c:forEach var="vo2" items="${clist }">
									<option value="${vo2.creditor_no }" id="${vo2.bs3_no }" selected>${vo2.bs3_ctgr }</option>
								</c:forEach>
							</select>
						</div>
						
						<div>
							<label>담당팀 </label>
							<input type="text" name="team_name" id="team_name" onkeypress="team(event, this.value)">
							<input type="button" onclick="searcht()" value="조회">
						</div>		
						
						<div>
							<label>비고 </label>
							<input type="text" name="investment_note" id="investment_note" maxlength="500">
						</div>	
						<div>
							<input type="button" id="register" value="save" onclick="sub(this.form)" disabled="disabled">
							<input type="reset" value="reset">
						</div>
					</form>
				</c:otherwise>
			</c:choose>
			
		</div>
	
</div>
<script type="text/javascript">

// 삭제버튼 경로 및 넘길 parameter 설정
function deletei(no1, no2, ino, code){
	location.href='${pageContext.request.contextPath }/a/a4/a41/delete?investment_no='+ino+'&bs3_no1='+no1+'&bs3_no2='+no2+'&comcode_code='+code;
}


// 코드 UNIQUE 검사 AJAX
function imcode(v){
	var url = "${pageContext.request.contextPath }/a/a4/imcode";	// controller mapping 지정
	var param = "investment_code="+encodeURIComponent(v);			// parameter로 넘길 데이터 인코드해서 설정
	
	sendRequest(url,param,imcodecheck,"POST");		// httpRequest.js파일에 있는 sendRequest메소드 실행 > (경로, 데이터, 콜벡함수, 방식)
}
function imcodecheck(){		// imcode의 sendRequest에서 지정한 콜벡함수
	if(xhr.readyState==4 && xhr.status==200) {		// 신호가 정상인지 판단
		var data = xhr.responseText;				// controller에서 넘어온 데이터
		if(data != ""){		// 데이터가 정상적으로 넘어왔는 지 판단
			if(data == "사용 가능한 코드입니다."){		// 데이터값 판단
				document.getElementById("imcodecheck").innerText = data;	// imcodecheck라는 id의 text에 넘어온 data 저장
				document.getElementById("imcodecheck").style.color = "blue";
				document.getElementById("register").disabled = false;		// register 라는 id의 태그 활성화 > 버튼 활성화
			}else {
				document.getElementById("imcodecheck").innerText = data;
				document.getElementById("register").disabled = true;		// 버튼 비활성화
				document.getElementById("investment_code").focus();			// investment_code에 커서 지정
			}
		}
	}
}


//	bs3_no 세팅
	function check1(){
		let t = document.getElementById("debtor_no");	// debtor_no 불러옴
		let arr = document.querySelectorAll("#debtor_no > option");	// debtor_no의 옵션 태그들 nodelist로 불러옴
		let bs3_no1 = document.getElementById("bs3_no1");	// bs3_no1 불러옴
		arr.forEach(function(e, i, array) {
			if(t.value == e.value){		// 위에서 선언한 debtor_no를 불러온 값과 option태그들의 value값을 for문으로 전부 검사
				bs3_no1.value = e.id;	// value가 같으면 해당 옵션태그의 id를 bs3_no1에 저장
			}					// check 메소드 전부 동일
		});
	}
	function check2(){
		let t = document.getElementById("creditor_no");
		let arr = document.querySelectorAll("#creditor_no > option");
		let bs3_no2 = document.getElementById("bs3_no2");
		arr.forEach(function(e, i, array) {
			if(t.value == e.value){
				bs3_no2.value = e.id;
			}
		});
	}
	
	function check12(){
		let t = document.getElementById("debtor_no");
		let arr = document.querySelectorAll("#debtor_no > option");
		let bs3_no1 = document.getElementById("bs3_no12");
		arr.forEach(function(e, i, array) {
			if(t.value == e.value){
				bs3_no1.value = e.id;
			}
		});
	}
	function check22(){
		let t = document.getElementById("creditor_no");
		let arr = document.querySelectorAll("#creditor_no > option");
		let bs3_no2 = document.getElementById("bs3_no22");
		arr.forEach(function(e, i, array) {
			if(t.value == e.value){
				bs3_no2.value = e.id;
			}
		});
	}

	
// submit 유효성 검사
function sub(f){
	var pat = /^[0-9]{0,8}$/;		// 정규식 > 1의 자리부터 9자리까지가 숫자인지 판단, 0도 입력 가능
	if(f.investment_code.value == ""){
		f.investment_code.focus();
		return;
	}else if(f.debtor_no.value == 0){
		f.debtor_no.focus();
		return;
	}else if(f.creditor_no.value == 0){
		f.creditor_no.focus();
		return;
	}else if(f.creditor_no.value == f.debtor_no.value){
		alert("계정과목이 같습니다. 다시 선택해주세요.");
		f.debtor_no.focus();
		return;
	}else if(f.investment_price.value == ""){
		var ch = confirm("금액이 입력되지 않았습니다. 등록하시겠습니까?");	// 확인 true, 취소 false
		if(ch){
			f.investment_price.value = 0;
			f.submit();
		}else{
			f.investment_price.focus();
			return;
		}
	}else if(!pat.test(f.investment_price.value)){
		alert("100,000,000미만, 숫자만 입력 가능합니다.");
		f.investment_price.focus();
		return;
	}else if(f.investment_start.value == "" || f.investment_end.value == ""){
		var ch = confirm("기간이 입력되지 않았습니다. 등록하시겠습니까?");
		if(ch){
			f.submit();
		}else {
			f.investment_end.focus();
			return;
		}
	}else if(f.client_name.value == ""){
		var ch = confirm("거래처가 입력되지 않았습니다. 등록하시겠습니까?");
		if(ch){
			f.submit();
		}else {
			f.client_name.focus();
			return;
		}
	}else if(f.imkind_name.value == ""){
		var ch = confirm("종류가 입력되지 않았습니다. 등록하시겠습니까?");
		if(ch){
			f.submit();
		}else {
			f.imkind_name.focus();
			return;
		}
	}else if(f.investment_content.value == ""){
		var ch = confirm("적요가 입력되지 않았습니다. 등록하시겠습니까?");
		if(ch){
			f.submit();
		}else {
			f.investment_content.focus();
			return;
		}
	}else if(f.account_bank.value == ""){
		var ch = confirm("계좌가 입력되지 않았습니다. 등록하시겠습니까?");
		if(ch){
			f.submit();
		}else {
			f.account_bank.focus();
			return;
		}
	}else if(f.team_name.value == ""){
		var ch = confirm("담당팀이 입력되지 않았습니다. 등록하시겠습니까?");
		if(ch){
			f.submit();
		}else {
			f.team_name.focus();
			return;
		}
	}else if(f.investment_note.value == ""){
		var ch = confirm("비고가 입력되지 않았습니다. 등록하시겠습니까?");
		if(ch){
			f.submit();
		}else {
			f.investment_note.focus();
			return;
		}
	}else {
		var ch = confirm("등록하시겠습니까?");
		if(ch){
			f.submit();
		}else {
			return;
		}
	}
}


// 거래처 자동완성 AJAX
function searchcl(e, code){
	if(e.keyCode == 13){
		var clname = document.getElementById("client_name").value;
		if(clname == ""){
			alert("조회할 거래처명을 입력해주세요.");
			document.getElementById("client_name").focus();
			return;
		}
		var url = "${pageContext.request.contextPath}/a/a4/searchcl";
		var param = "comcode_code="+encodeURIComponent(code)+"&client_name="+encodeURIComponent(clname);
		
		sendRequest(url, param, clName, "POST");
	}
}
function clName(){
	if(xhr.readyState==4 && xhr.status==200) {
		var data = xhr.response;
		if(data != ""){
			var data2 = JSON.parse(data);	// ajax로 받아온 데이터를 json으로 변형
			document.getElementById("client_no").value = data2.client_no;
			document.getElementById("client_name").value = data2.client_name;
			document.getElementById("client_registeredno").value = data2.client_registeredno;
			document.getElementById("client_manager").value = data2.client_manager;
		}else {
			document.getElementById("client_name").value = '';
			document.getElementById("client_registeredno").value = '';
			document.getElementById("client_manager").value = '';
			alert("조회된 거래처가 없거나 중복된 이름입니다. 조회 버튼을 클릭하여 거래처를 선택해주세요.");
		}
	}
}


// 리스트에서 글 선택 시 넘어가는 form
function selectForm(no){
	document.getElementsByName("client_no")[0].value = no;
	
	document.getElementById("content").submit(); // content라는 id의 form태그 submit
}


</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>