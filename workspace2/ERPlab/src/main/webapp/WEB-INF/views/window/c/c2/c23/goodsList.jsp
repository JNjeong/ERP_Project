<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/httpRequest.js"></script>
</head>
<body>
<div>
	<select name="btype">
		<option value="all">전체검색</option>
		<option value="goodslot_lot">로트번호</option>
		<option value="goods_name">상품명</option>
		<option value="goods_barcode">바코드</option>
		<option value="goodssort_name">분류</option>
		<option value="goodskind_name">종류</option>
		<option value="goodsst_spec">사양</option>
		<option value="client_name">제조사</option>
	</select>
	<input type="text" name="bnword" id="bnword" onkeyup="bnajax(this.value, '${comcode_code}')" onblur="bnajax(this.value, '${comcode_code}')">
	<input type="button" onclick="bnajax('', '${comcode_code}')" value="전체목록">
	<table id="procode">
		<tr>
			<td>로트</td>
			<td>바코드</td>
			<td>품명</td>
			<td>제조사</td>
			<td>분류</td>
			<td>종류</td>
			<td>사양</td>
		</tr>
		<c:if test="${list == null }">
			<tr>
				<td>정보가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="vo" items="${list }">
				<tr onclick="setParentText(${vo.goodslot_no}, '${vo.goods_name}', '${vo.goodslot_lot }', '${vo.goods_barcode }', '${vo.goodslot_total }', '${vo.client_name }')">
					<td>${vo.goodslot_lot}</td>
					<td>${vo.goods_barcode}</td>
					<td>${vo.goods_name}</td>
					<td>${vo.client_name}</td>
					<td>${vo.goodssort_name}</td>
					<td>${vo.goodskind_name}</td>
					<td>${vo.goodsst_spec}</td>
				</tr>
		</c:forEach>
	</table>
</div>

<script type="text/javascript">
	function setParentText(no, name, lot, barcode, total, cname){
    	opener.document.getElementById("goodslot_no").value = no;
    	opener.document.getElementById("goods_name").value = name;
    	opener.document.getElementById("goodslot_lot").value = lot;
    	opener.document.getElementById("goodslot_total").value = total;
    	opener.document.getElementById("goods_barcode").value = barcode;
    	opener.document.getElementById("client_name").value = cname;
    	window.close();
    }
	
	function bnajax(v, code){
		var type = document.getElementsByName("btype")[0].value;
		if(v == ''){
			type = null;
			v = null;
		}
		var url = "${pageContext.request.contextPath}/c/c2/c23/goodsreturnajax";
		var param = "bnword="+v+"&btype="+type+"&comcode_code="+code;
		
		sendRequest(url,param,getlist,"POST");
	}
	function getlist(){
		if(xhr.readyState==4 && xhr.status==200) {	
			var data = xhr.response;
			let procode = document.getElementById("procode");
			let newTr = document.createElement("tr");
			let newTd = document.createElement("td");
			procode.innerHTML = '';
			procode.innerHTML += '<tr><td>로트</td><td>바코드</td><td>품명</td><td>제조사</td><td>분류</td><td>종류</td><td>사양</td><td>';
			if(data != ""){
				var data2 = JSON.parse(data);
				data2.forEach(function(map){
					newTr = document.createElement("tr");
					newTr.setAttribute("onclick", "setParentText("+map.goodslot_no+",'"+map.goods_name+"','"+map.goodslot_lot+"','"+map.goods_barcode+"','"+map.goodslot_total+"','"+map.client_name+"')");
					procode.appendChild(newTr);
					newTd = document.createElement("td");
					newTd.innerHTML = map.goodslot_lot;
					newTr.appendChild(newTd);
					newTd = document.createElement("td");
					newTd.innerHTML = map.goods_barcode;
					newTr.appendChild(newTd);
					newTd = document.createElement("td");
					newTd.innerHTML = map.goods_name;
					newTr.appendChild(newTd);
					newTd = document.createElement("td");
					newTd.innerHTML = map.client_name;
					newTr.appendChild(newTd);
					newTd = document.createElement("td");
					newTd.innerHTML = map.goodssort_name;
					newTr.appendChild(newTd);
					newTd = document.createElement("td");
					newTd.innerHTML = map.goodskind_name;
					newTr.appendChild(newTd);
					newTd = document.createElement("td");
					newTd.innerHTML = map.goodsst_spec;
					newTr.appendChild(newTd);
				});
			}else {
				procode.innerHTML += '<tr><td colspan="5">목록이 없습니다.</td></tr>';
			}
		}
	}
</script>
</body>
</html>