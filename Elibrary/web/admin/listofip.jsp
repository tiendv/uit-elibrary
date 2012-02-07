<%-- 
    Document   : listofip
    Created on : Feb 5, 2012, 12:24:13 AM
    Author     : Nguyen Hoang Tan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
boolean allow=false;
if(session.getAttribute("username")!=null)
{    
    if((Integer)session.getAttribute("group") ==1)//admin
    {
        allow=true; 
%>
<div id="divTable" ></div>
<script type="text/javascript">
    function init()
    {     
        changeTable();          
    }      
    function deleteResource()
    {
        var ip="";
        var listSize = document.getElementById("listSize").value;
        for(var i=0;i<listSize;i++)
        {
            if((document.getElementById(i).checked == true))
            {
                ip=ip+"'"+document.getElementById(i).value+"'"+",";
            }
        }
        $.ajax({
            type: "POST",
            url: "DeleteIP.do",
            data: "ip="+ip
        }).done(function(){
            changeTable();
        });          
    }
    function changeTable()
    {
        $.ajax({
            type: "POST",
            url: "LoadIPTable.do"
        }).done(function(msg){
            document.getElementById("divTable").innerHTML=msg;
        });          
    }    
    function editIP(ip)
    {
        window.location = "LoadEditIP.do?ip="+ip;
    }
</script>
<%}}%>
<%if(allow==false){%>
<jsp:include page="../jsp/wrongpage.jsp" flush="true"/>
<%}%>