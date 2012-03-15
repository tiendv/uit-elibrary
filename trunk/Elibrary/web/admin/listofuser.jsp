<%-- 
    Document   : listofuser
    Created on : Feb 2, 2012, 7:43:48 PM
    Author     : Nguyen Hoang Tan
--%>
<%
boolean allow=false;
if(session.getAttribute("username")!=null)
{    
    if((Integer)session.getAttribute("group") ==1)//admin
    {
        allow=true; 
%>
<%@page import="uit.elib.dto.News"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.struts.Globals"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<div id="divTable" ></div>
<script type="text/javascript">
    function init()
    {     
        changeTable();          
    }      
    function deleteResource()
    {
        var username="";
        var listSize = document.getElementById("listSize").value;
        for(var i=0;i<listSize;i++)
        {
            if((document.getElementById(i).checked == true))
            {
                username=username+"'"+document.getElementById(i).value+"'"+",";
            }
        }
        $.ajax({
            type: "POST",
            url: "DeleteUser.do",
            data: "username="+username
        }).done(function(){
            changeTable();
        });          
    }
    function changeTable()
    {
        $.ajax({
            type: "POST",
            url: "LoadUserTable.do"
        }).done(function(msg){
            document.getElementById("divTable").innerHTML=msg;
        });          
    }    
    function editUser(username)
    {
        window.location = "LoadEditUser.do?username="+username;
    }
</script>
<%}}%>
<%if(allow==false){%>
<jsp:include page="../jsp/wrongpage.jsp" flush="true"/>
<%}%>