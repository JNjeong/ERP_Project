<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<br><br>
<!-- 각각의 버튼 누르면 페이지 이동 -->
<h2>물류팀</h2>
<br>
	<input type="button" value="재고관리" onclick="fetch('test/ruddud').then(function(response){
					response.text().then(function(text){
						document.querySelector('article').innerHTML = text;
					})
					})">
	<input type="button" value="입출고관리" onclick="fetch('test/ruddud').then(function(response){
					response.text().then(function(text){
						document.querySelector('article').innerHTML = text;
					})
					})">
	<input type="button" value="폐기/물류 감소" onclick="fetch('test/ruddud').then(function(response){
					response.text().then(function(text){
						document.querySelector('article').innerHTML = text;
					})
					})">
</div>
</body>
</html>