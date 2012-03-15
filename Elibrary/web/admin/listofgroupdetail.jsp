<%-- 
    Document   : listofgroupdetail
    Created on : Feb 8, 2012, 10:24:08 PM
    Author     : HERO
--%>
<%
boolean allow=false;
if(session.getAttribute("username")!=null)
{    
    if((Integer)session.getAttribute("group") ==1)//admin
    {
        allow=true; 
%>
<%@page import="java.util.List"%>
<%@page import="javax.mail.FetchProfile.Item"%>
<%@page import="org.apache.struts.Globals"%>
<%@page import="uit.elib.dto.Resourcecategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<jsp:useBean id="groupBO" class="uit.elib.bo.GroupBO" scope="page"/>
<link href="<html:rewrite page='/css/uit.css'/>" rel="stylesheet" type="text/css" />
<%
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vi_VN"))
        language = 2; // VietNamese
    List<Resourcecategory> listResourceCategory = (List <Resourcecategory>)request.getAttribute("listResourceCategory");
%>
<div style="margin-left: 10px; margin-bottom: 5px;"> 
    <bean:message key="text.selectgroup"/>
    <select id="dropGroup"  name="dropGroup" onchange="cbb_group_changed()">
            <c:forEach items="${groupBO.getUser()}" var="item">
                <%if(language==2){%>
                    <option value="${item.groupId}">${item.groupNameVn}</option>
                <%}else{%>
                    <option value="${item.groupId}">${item.groupNameEn}</option>
                <%}%>
            </c:forEach>
        </select>
</div>
<div id="divResult"></div>
<div style="text-align: right;">
    <input type="button" style="margin-top: 3px;" onclick="editgroupdetail()" value="<bean:message key="text.buttonedit"/>"/>
</div>
<input type="hidden" id="language" value="<%=language%>"/>
<script type="text/javascript">
    
    function editgroupdetail()
    {
        var listSize=document.getElementById("listSize").value;
        var view = ""; // nếu view chỉ có gtri -1 thì ko có checkbox nào dc check
        var download = ""; //nếu download chỉ có gtri -1 thì ko có checkbox nào dc check
        var groupID = document.getElementById("dropGroup").value;
        for (var i = 0; i < listSize; i++) {
            if(document.getElementById(i).checked==true)          // khi checkbox xem dc check
                view+=document.getElementById(i).value+","; 
            if(document.getElementById(i+listSize).checked==true)           // khi checkbox tải dc check
                download+=document.getElementById(i+listSize).value+","; 
        }
        $.ajax({
            type: "POST",
            url: "EditGroupDetail.do",
            data: "view="+view+"&download="+download+"&groupID="+groupID
        })
        .done()
        {
            window.location ="EditListOfGroupDetail.do";
        }
    }
    function cbb_group_changed()
    {
        var groupID = document.getElementById("dropGroup").value;
        var language = document.getElementById("language").value;
        $.ajax({
            type: "POST",
            url: "LoadGroupDetailTable.do",
            data: "groupID="+groupID+"&language="+language
        })
        .done(function(msg)
        {
            document.getElementById("divResult").innerHTML =msg;
        })
    }
    function init()
    {
        var groupID = document.getElementById("dropGroup").value;
        var language = document.getElementById("language").value;
        $.ajax({
            type: "POST",
            url: "LoadGroupDetailTable.do",
            data: "groupID="+groupID+"&language="+language
        })
        .done(function(msg)
        {
            document.getElementById("divResult").innerHTML =msg;
        })
    }
</script>
<%}}%>
<%if(allow==false){%>
<jsp:include page="../jsp/wrongpage.jsp" flush="true"/>
<%}%>