<%-- 
    Document   : admin
    Created on : Jan 26, 2012, 6:46:33 PM
    Author     : Nguyen Hoang Tan
--%>
<%
boolean allow=false;
if(session.getAttribute("username")!=null)
{    
    if((Integer)session.getAttribute("group") ==1||(Integer)session.getAttribute("group") ==3)//admin or mod
    {
        allow=true; 
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%}}%>
<%if(allow==false){%>
<jsp:include page="../jsp/wrongpage.jsp" flush="true"/>
<%}%>


