<%--
    Document   : listofresource
    Created on : Dec 15, 2011, 19:52:23 PM
    Author     : Nguyen Hoang Tan
--%>
<%@page import="uit.elib.dto.Subject"%>
<%@page import="uit.elib.bo.SubjectBO"%>
<%@page import="java.util.Locale"%>
<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<%
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
        language = 2; // VietNamese
%>

<jsp:useBean id="resourceCategoryBO" class="uit.elib.bo.ResourceCategoryBO" scope="page"/>
<jsp:useBean id="subjectBO" class="uit.elib.bo.SubjectBO" scope="page"/>

<table>
    <tr>
        <td>
            <bean:message key="text.typeofresource"/>
        </td>
        <td>
            <select class="combobox" id="dropResourceCategory" onchange="changeChapter()">
                <c:forEach items="${resourceCategoryBO.allResourcecategory}" var="item">
                    <%if(language==1) {%>
                        <option value="${item.resourceCategoryId}">${item.resourceCategoryNameEn}</option>
                    <%}%>
                    <%if(language==2) {%>
                        <option value="${item.resourceCategoryId}">${item.resourceCategoryNameVn}</option>
                    <%}%>    
                </c:forEach>
            </select>            
        </td>        
    </tr>
    <tr>
        <td>
            <div id="divsubject"><bean:message key="text.subject"/></div>
        </td>
        <td>
            <div id="divDropSubject">
                <select class="combobox" id="dropSubject" onchange="changeChapter()">
                    <c:forEach items="${subjectBO.allSubject}" var="item">
                        <%if(language==1){%>
                            <option value="${item.subjectId}" >${item.subjectNameEn}</option>
                        <%}%>
                        <%if(language==2){%>
                            <option value="${item.subjectId}" >${item.subjectNameVn}</option>
                        <%}%>
                    </c:forEach>    
                </select>
            </div>    
        </td>        
    </tr>
    <tr>
        <td>
            <div id="divChapter"><bean:message key="text.orderchapter"/>    </div>
        </td>
        <td>
            <div id="divDropChapter" onchange="changeTable()"></div>
        </td>        
    </tr>
</table>
<div id="divTable" ></div>

<script type="text/javascript">
 
    function init()
    {     
        changeChapter();          
    }    
    function changeChapter()
    {
        var resourceCategoryID = document.getElementById("dropResourceCategory").value;
        if(resourceCategoryID==2)
        {
            document.getElementById("divsubject").style.display="none";
            document.getElementById("divDropSubject").style.display="none";
        }    
        else
        {
            document.getElementById("divsubject").style.display="block";
            document.getElementById("divDropSubject").style.display="block";
        }    
        if(resourceCategoryID==4 || resourceCategoryID==5 || resourceCategoryID==10 || resourceCategoryID==11)
        {
            var subjectID = document.getElementById("dropSubject").value;
            $.ajax({
                type: "POST",
                url: "LoadChapter.do",
                data: "id="+subjectID
            }).done(function(msg){
                document.getElementById("divChapter").style.display="block";
                document.getElementById("divDropChapter").style.display="block";
                document.getElementById("divDropChapter").innerHTML=msg;
                changeTable();
            });
        }
        else
        {
            document.getElementById("divDropChapter").style.display="none";
            document.getElementById("divChapter").style.display="none";
            changeTable();
        }
    }
    function changeTable()
    {
        var resourceCategoryID = document.getElementById("dropResourceCategory").value;
        var subjectID = document.getElementById("dropSubject").value;        
        if(resourceCategoryID==4 || resourceCategoryID==5 || resourceCategoryID==10 || resourceCategoryID==11)
        {
            var chapterID = document.getElementById("dropOrderChapterSubject").value;
            $.ajax({
                type: "POST",
                url: "LoadResourceTable.do",
                data: "chapterID="+chapterID +"&resourceCategoryID="+resourceCategoryID + "&subjectID="+subjectID
            }).done(function(msg){
                document.getElementById("divTable").innerHTML=msg;
            });              
        }
        else
        {
            $.ajax({
                type: "POST",
                url: "LoadResourceTable.do",
                data: "resourceCategoryID="+resourceCategoryID + "&subjectID="+subjectID
            }).done(function(msg){
                document.getElementById("divTable").innerHTML=msg;
            });         
        
        }
      
    }
    function deleteResource()
    {
        var listSize = document.getElementById("listSize").value;
        var resourcesID="";
        for(var i=0;i<listSize;i++)
        {
            if((document.getElementById(i).checked == true))
            {
                resourcesID=resourcesID+document.getElementById(i).value+",";
            }
        }
        $.ajax({
            type: "POST",
            url: "DeleteResource.do",
            data: "resourcesID="+resourcesID
        }).done(function(){
            changeTable();
        });          
    }
    
    function editResource(resourcesID)
    {
        window.location = "LoadEditResource.do?resourceID="+resourcesID;
    }
</script>