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
	<p>목록에 없는 제품은 물류팀에 문의해서 추가해주세요.</p>
	<select name="type">
		<option value="all">전체검색</option>
		<option value="goods_code">상품코드</option>
		<option value="goods_name">상품명</option>
		<option value="goods_barcode">바코드</option>
		<option value="goodssort_name">분류</option>
		<option value="goodskind_name">종류</option>
		<option value="goodsst_spec">사양</option>
		<option value="client_name">제조사</option>
	</select>
	<input type="text" name="word" id="word" onkeyup="bnajax(this.value, '${comcode_code}')" onblur="bnajax(this.value, '${comcode_code}')">
	<input type="button" onclick="bnajax('', '${comcode_code}')" value="전체목록">
	<table id="procode">
		<tr>
			<td>상품코드</td>
			<td>바코드</td>
			<td>품명</td>
			<td>제조사</td>
			<td>분류</td>
			<td>종류</td>
			<td>사양</td>
		</tr>
		<c:if test="${list == null }">
			<tr>
				<td colspan="7">상품이 존재하지 않습니다. <br>물류관리에서 상품을 추가해주세요.</td>
			</tr>
		</c:if>
		<c:forEach var="vo" items="${list }">
				<tr onclick="setParentText('${i}',${vo.goods_no },'${vo.goods_code}', '${vo.goods_barcode }', '${vo.goods_name }', ${vo.goodslot_total }, '${vo.goods_description }', '${vo.goodsst_unit }', '${vo.goodsst_size }', '${vo.client_name1 }', '${vo.client_name2 }', '${vo.goodssort_name }', '${vo.goodskind_name }', ${vo.goods_stockqty }, '${vo.goodslev_grade }')">
					<td>${vo.goods_code}</td>
					<td>${vo.goods_barcode}</td>
					<td>${vo.goods_name}</td>
					<td>${vo.client_name1}</td>
					<td>${vo.goodssort_name}</td>
					<td>${vo.goodskind_name}</td>
					<td>${vo.goodsst_spec}</td>
				</tr>
		</c:forEach>
	</table>
</div>

<script type="text/javascript">
function setParentText(h, no, code, barcode, name, ctotal, description, unit, size, cname1, cname2, sname, kname, qty, lev){
	opener.document.getElementById("goods_stockqty").value = qty;
	opener.document.getElementById("goods_code").value = code;
	opener.document.getElementById("goods_barcode").value = barcode;
	opener.document.getElementById("goods_name").value = name;
	opener.document.getElementById("goods_no").value = no;
	opener.document.getElementById("goodskind_name").value = sname + " - " + kname;
	opener.document.getElementById("goodslot_total").value = ctotal;
	opener.document.getElementById("goodsst_unit").value = unit;
	opener.document.getElementById("goodsst_size").value = size;
	opener.document.getElementById("client_name1").value = cname1;
	opener.document.getElementById("client_name2").value = cname2;
	opener.document.getElementById("goods_description").value = description;
	opener.document.getElementById("goodslev_grade").value = lev;
	window.close();
}
	
	function bnajax(v, code){
		var type = document.getElementsByName("type")[0].value;
		if(v == ''){
			type = null;
			v = null;
		}
		var url = "${pageContext.request.contextPath}/d/d1/d18/itemListAjaxF";
		var param = "word="+v+"&type="+type+"&comcode_code="+code;
		
		sendRequest(url,param,getlist,"POST");
	}
	function getlist(){
		if(xhr.readyState==4 && xhr.status==200) {	
			var data = xhr.response;
			let procode = document.getElementById("procode");
			let newTr = document.createElement("tr");
			let newTd = document.createElement("td");
			procode.innerHTML = '';
			procode.innerHTML += '<tr><td>상품코드</td><td>바코드</td><td>품명</td><td>제조사</td><td>분류</td><td>종류</td><td>사양</td><td>';
			if(data != ""){
				var data2 = JSON.parse(data);
				data2.forEach(function(map){
					newTr = document.createElement("tr");
					newTr.setAttribute("onclick", "setParentText('${param.i}',"+map.goods_no+",'"+map.goods_code+"','"+map.goods_barcode+"','"+map.goods_name+"',"+map.goodslot_total+", '"+map.goods_description+"', '"+map.goodsst_unit+"','"+map.goodsst_size+"','"+map.client_name1+"','"+map.client_name2+"','"+map.goodssort_name+"','"+map.goodskind_name+"',"+map.goods_stockqty+",'"+map.goodslev_grade+"')");
					procode.appendChild(newTr);
					newTd = document.createElement("td");
					newTd.innerHTML = map.goods_codet;
					newTr.appendChild(newTd);
					newTd = document.createElement("td");
					newTd.innerHTML = map.goods_barcode;
					newTr.appendChild(newTd);
					newTd = document.createElement("td");
					newTd.innerHTML = map.goods_name;
					newTr.appendChild(newTd);
					newTd = document.createElement("td");
					newTd.innerHTML = map.client_name1;
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