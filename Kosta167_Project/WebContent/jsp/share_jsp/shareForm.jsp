<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String str = (String) request.getAttribute("c_id");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<ht"C:/Users/baewo/git/Kosta167_Korail/Kosta167_Project"ml>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공유글쓰기</title>
<script type="text/javascript">
	function gotoshareInsert() {
		location.href = "shareForm.jsp";
	}
	
	/* 입력안된 곳 입력하라는 경고창 */
	function writeCheck(){
		
		var form = document.wirteform;	
		
		if( !form.sh_pw.value){
			alert("비밀번호를 입력해주세요.");
			form.sh_pw.focus();
			return;
		}
		if( !form.sh_title.value) {
			alert("제목을 입력해주세요.")
			form.sh_title.focus();
			return;
		}
		if( !form.sh_content.value) {
			alert("내용을 입력해주세요.")
			form.sh_content.focus();
			return;
		}
		
		
		form.submit();
	} 
</script>

</head>
<body>
<center>
	 <table>
		<form name=wirteform method="post" action="shareinsertOk.jsp">
			<tr>
				<td>
					
					<table width="150%" cellpadding="0"
						cellspacing="0" border="0" >
						
					<tr  style="background:url('../../images/share_images/table_mid.gif') repeat-x; text-align: center;">
							<td width="5"><img src="../../imgages/share_images/table_left.gif" width="5"
								height="30" /></td> 
							
							<h3 align="center"> 글 쓰 기<h3>
							</tr>
							<td width="5"><img src="../../imgages/share_images/table_right.gif" width="5"
								height="30" /></td> 
					</tr>
					<tr style="font-size: 5px" align="left"> (*)는 필수입력 </tr>
					</table>
					<table>
					<tr height="3" bgcolor="#82B5DF">
						<td colspan="3"></td>
					<tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="3"></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="3"></td>
					</tr>
					<tr>
							<td>&nbsp;</td>
							<td align="center">말머리</td>
							<td>
							<select name="sh_subject">
								<option value="  ">여행기간 선택</option>
								<option value="[5일]" >[5일]</option>
								<option value="[7일]">[7일]</option>
							</select></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						
						<tr>
							<td>&nbsp;</td>
							<td align="center">제목(*)</td>
							<td><input name="sh_title" size="130" maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">작성자</td>
							<td><input type="hidden" name="m_name" size="50" maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">비밀번호(*)</td>
							<td><input type="password" name="sh_pw" size="130"
								maxlength="50"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">코스</td>
							<td><textarea name="c_id" cols="130" rows="13" style="resize : none; overflow: scoll;"></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr> 
						<tr>
							<td>&nbsp;</td>
							<td align="center">내용(*)</td>
							<td><textarea name="sh_content" cols="130" rows="13" style="resize: none; overflow: scoll;"></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr height="1" bgcolor="#82B5DF">
							<td colspan="4"></td>
						</tr>
						<tr align="right">
							<br>
							<td>&nbsp;</td>
							<td colspan="2">
							<input type="button" value="SNS등록" onclick=""> 
							<input type="button" value="등록"
								onclick="writeCheck();"> <input type="reset"
								value="취소" >
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</table> 
</center>


</body>
</html>