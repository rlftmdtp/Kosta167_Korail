<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/message_css/Message_sendmsg.css?ver=1" type="text/css" />

<script type="text/javascript">
     function show(obj){
          window.opener.document.fmt.addr.value = obj.innerHTML;
          //자식윈도우로 부모윈도우를 불러온다. 클릭된 text값을 부모윈도우의 fmt의 addr의 값에 넣음
           window.self.close();   //자식클래스 닫아줌
     }
</script>


</head>
<body>
   <!-- 쪽지 보내는 form  보내기 누르면 msg_insertOk.jsp로 연결-->
   <!-- 받는이는 m_id 즉, 회원 정보에 존재해야 쪽지가 보내진다 -->
   
   <form action="msg_insertOk.jsp" method="post">
   	<!--     <img class="logo" src="C:/Users/thf14/git/Kosta167_Korail/Kosta167_Project/WebContent/images/message/logo.jpg"> -->
   	<img class="logo" src="../../images/message_images/logo.jpg">
       <table class="message_table">
      	<tr class="message_table_tr1">
         <td id="table_text">받는이</td>
         <td id = "table_input">
            <input type="text" name="msg_sendid" size="30">
         </td>    
      </tr>
         
      <tr class="message_table_tr2">         
         <td colspan="2">
            <textarea rows="6" cols="40" name="msg_content"></textarea>
         </td>         
      </tr>
      <tr class="message_table_tr3">  
         <td id="table_text">보내는이</td>
         <td id = "table_input">
            <input type="text" name="m_id" size="30">
         </td>
      </tr>
      <tr id="btn_tr">
         <td colspan="2">
            <input type="submit" value="보내기">&nbsp;&nbsp;
            <input type="reset" value="취소">
         </td>         
      </tr>
   </table> 
   </form>
</body>
</html>




