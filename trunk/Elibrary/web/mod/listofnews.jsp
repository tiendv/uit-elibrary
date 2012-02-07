<%--
    Document   : listofnews
    Created on : Jan 25, 2012, 13:27:36 PM
    Author     : Nguyen Hoang Tan
--%>

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
        var newsID="";
        var listSize = document.getElementById("listSize").value;
        for(var i=0;i<listSize;i++)
        {
            if((document.getElementById(i).checked == true))
            {
                newsID=newsID+document.getElementById(i).value+",";
            }
        }
        $.ajax({
            type: "POST",
            url: "DeleteNews.do",
            data: "newsID="+newsID
        }).done(function(){
            changeTable();
        });          
    }
    function changeTable()
    {
        $.ajax({
            type: "POST",
            url: "LoadNewsTable.do"
        }).done(function(msg){
            document.getElementById("divTable").innerHTML=msg;
        });          
    }    
    function editNews(newsID)
    {
        window.location = "LoadEditNews.do?newsID="+newsID;
    }
</script>