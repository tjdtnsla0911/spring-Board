<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">
	$j(document).ready(function() {
	});
</script>
<body>
	<table align="center">
		<tr>
			<td align="right">total : ${totalCnt}</td>
		</tr>
		<tr>
			<td>
				<table id="boardTable" border="1">
					<tr>
						<td width="80" align="center">Type</td>
						<td width="40" align="center">No</td>
						<td width="300" align="center">Title</td>
					</tr>
					<c:forEach items="${boardList}" var="list">
						<tr>
							<td align="center">${list.boardType}</td>
							<td>${list.boardNum}</td>
							<td><a
								href="/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
								<button style="float: right;" type="button"
									onclick="boardDelete(${list.boardNum})">삭제</button></td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right"><a href="/board/boardWrite.do">글쓰기</a></td>
		</tr>
	</table>

</body>
<script>
//삭제 , 추후에 아이디랑 게시글 비교해서 동일한애들만 보이게할꺼임
function boardDelete(board_Num){
let board = {boardNum : board_Num};
console.log(board.boardNum);
	
	$j.ajax({
	    url: "/board/delete.do",
	    type: "GET",
	    data: board, //http Body데이터를 보냅니당 뀨
	    contentType: "application/json; charset=utf-8",
	    dataType: "JSON"
	})
	.done(function (data) { 
		alert('삭제성공');
		location.href="/board/boardList.do";
	

		
	}).fail(function (jqXHR, textStatus, errorThrown) {
		alert('삭제실패');
		});
	
}
</script>
</html>