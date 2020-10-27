<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<body>

	<table align="center">
		<tr>
			<td>
				<table border="1">

					<tr>
						<td width="120" align="center">Title</td>
						<td width="400"><input type="text"
							value="${board.boardTitle}" id="boardTitle"></td>
					</tr>
					<tr>
						<td height="300" align="center">Comment</td>
						<td><input type="text" id="boardComment"
							value="${board.boardComment}" /></td>
					</tr>
					<tr>
						<td align="center">Writer</td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td></td>
			<td align="right"><a href="/board/boardList.do">List</a></td>
			<td align="right"><a href="javascript:;" onclick="updateBoard()">update</a></td>

		</tr>
	</table>
	<input type="text">
</body>
<script>
//update하는곳입니다
function updateBoard(){
	let board ={
	 boardTitle : $j("#boardTitle").val(),
	 boardComment : $j("#boardComment").val(),
	 boardNum  : "${board.boardNum}"
	}
	console.log('다받은 board',board);

	$j.ajax({
	    url: "/board/update.do",
	    type: "POST",
	    data: JSON.stringify(board), //http Body데이터를 보냅니당 뀨
	    contentType: "application/json; charset=utf-8",
	    dataType: "text"
	})
	.done(function (data) { 
		alert('업데이트성공');
		location.href="/board/boardList.do";

		
	}).fail(function (jqXHR, textStatus, errorThrown) {
		alert('업데이트 실패');
		});
	
}
</script>
</html>