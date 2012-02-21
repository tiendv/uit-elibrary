<%-- 
    Document   : listofads
    Created on : Feb 20, 2012, 11:12:26 PM
    Author     : HERO
--%>

<%@page import="uit.elib.dto.Advertising"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.struts.Globals"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<!DOCTYPE html>
<link href="<html:rewrite page='/css/uit.css'/>" rel="stylesheet" type="text/css" />
<%
int language =1; // English
if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
language = 2; // VietNamese
List<Advertising> listAds = (List<Advertising>)request.getAttribute("listAds");
%>
<table class="resource_table">
    <tr class="color_title_table">
        <td style="width: 20%"><bean:message key="text.ordernumber"/></td>
        <td style="width: 60%"><bean:message key="text.adsname"/></td>
        <td style="width: 10%"><bean:message key="text.delete"/></td>
        <td style="width: 10%"><bean:message key="text.buttonedit"/></td>
    </tr>
    <%for (int i = 0; i < listAds.size(); i++) {%>
        <%if(i%2!=0){%>
            <tr class="color_table2">
        <%}else{%>
            <tr>
        <%}%>
            <td class="center"><%=i+1%></td>
            <%if(language==1){%>
                <td><a href="http://<%=listAds.get(i).getLink()%>"><%=listAds.get(i).getAdvertisingNameEn()%></a></td>
            <%}else{%>
                <td><a href="http://<%=listAds.get(i).getLink()%>"><%=listAds.get(i).getAdvertisingNameVn()%></a></td>
            <%}%>
            <td class="center"><input type="checkbox" value="<%=listAds.get(i).getAdvertisingId()%>" id=<%=i%>></td>
            <td class="center"><input type="submit" onclick="editads(<%=listAds.get(i).getAdvertisingId()%>)" value=<bean:message key="text.buttonedit"/> /></td>
        </tr>
    <%}%>
</table>
    <input type="hidden" id="listSize" value=<%=listAds.size()%> />
    <div class="divdelete"><input type="submit" onclick="deleteads()" value=<bean:message key="text.delete"/> /></div>
<script type="text/javascript">
    function deleteads()
    {
        var listSize = document.getElementById("listSize").value;
        var listAdsID ="";
        for (i = 0; i < listSize; i++) {
            if(document.getElementById(i).checked)
                listAdsID+=document.getElementById(i).value +",";
        }
        $.ajax({
            type: "POST",
            url: "DeleteAds.do",
            data: "listAdsID="+listAdsID
        })
        .done(function(msg){
            window.location ="LoadListOfAds.do"
        })
    }
    function editads(adsID)
    {
        window.location ="LoadEditAds.do?adsID="+adsID;
    }
</script>