<%-- 
    Document   : listOfGroup
    Created on : Jan 28, 2012, 8:26:17 AM
    Author     : HERO
--%>
<%@page import="java.util.List"%>
<%@page import="javax.mail.FetchProfile.Item"%>
<%@page import="org.apache.struts.Globals"%>
<%@page import="uit.elib.dto.Group" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<link href="<html:rewrite page='/css/uit.css'/>" rel="stylesheet" type="text/css" />


<%
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
        language = 2; // VietNamese
    List<Group> listGroup = (List <Group>)request.getAttribute("listGroup");
    int color=1;
%>
<input type="hidden" id="listSize" value="<%=listGroup.size()%>"/>
<input style="margin-left: 15px" class="btn" type="submit" value="<bean:message key="text.buttoncreate"/>" onclick="creategroup()"/>
<table class="resource_table">
    <tr class=color_title_table>
        <td class="td1">
            <bean:message key="text.ordernumber"/>
        </td>
        <td class="td2">
            <bean:message key="text.group"/>
        </td>
        <td class="td3">
            <bean:message key="text.delete"/>
        </td>
        <td class="td4">
            <bean:message key="text.buttonedit"/>
        </td>
    </tr>
    <%for(int i=0; i<listGroup.size();i++) {%>
    <tr>
        <%if(color%2==0) {%>
            <td class="color_table2">
        <%} else{%>
            <td>
        <%}%>
                <%=i+1%>
            </td>
        <%if(color%2==0) {%>
            <td class="color_table2">
        <%} else{%>
            <td>
        <%}%>
                <%if(language==1){%>
                    <%=listGroup.get(i).getGroupNameEn()%>
                <%}else{%>
                <%= listGroup.get(i).getGroupNameVn()%>
                <%}%>    
            </td>
        <%if(color%2==0) {%>
            <td class="color_table2">
        <%} else{%>
            <td>
        <%}%>
        <input type="checkbox" id="<%=i%>" value="<%=listGroup.get(i).getGroupId()%>"/>
            </td>
        <%if(color%2==0) {%>
            <td class="color_table2">
        <%} else{%>
            <td>
        <%}%>
        <input type="submit" value=<bean:message key="text.buttonedit"/>>
            </td>
    </tr>
    <%color++; %>
    <%}%>
</table>
    <div class="divdelete"> <input class="btn" type="submit" value="<bean:message key="text.delete"/>" name="divdelete" onclick="deletegroup()"/></div>
<script type="text/javascript">

function deletegroup()
            {
                var listSize=document.getElementById("listSize").value;
                var groupsID = "";
                for(var i = 0; i<listSize;i++)
                    {
                        if((document.getElementById(i).checked== true))
                            {
                            groupsID= groupsID + document.getElementById(i).value+",";
                        }
                    }
                    $.ajax({
                        type: "POST",
                        url: "DeleteGroup.do",
                        data: "groupsID="+groupsID
                    }).done(function(msg){
                        window.location = "LoadListOfGroup.do";
                    })
             }
function creategroup()
{
    window.location ="LoadCreateGroup.do";
}
</script>