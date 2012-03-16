<%--
    Document   : createresource
    Created on : Nov 26, 2011, 14:14:35 PM
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
<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.Locale"%>
<%@page import="uit.elib.dto.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-tiles"  prefix="tiles"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <link href="<html:rewrite page='/css/uit.css'/>" rel="stylesheet" type="text/css" />

<form id="createResource" method="post" action="CreateResource.do"  enctype="multipart/form-data">
<%
    List listResourceCategory = (List)request.getAttribute("listResourceCategory");
    List listSubject = (List)request.getAttribute("listSubject");
    List listFaculty = (List)request.getAttribute("listFaculty");
    List listLevel = (List)request.getAttribute("listLevel");                            
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vi_VN"))
        language = 2; // VietNamese
%>
<h2> <bean:message key="text.insertnewresource"/></h2>
<div class="resource2" >
    <div class="resource_left"><bean:message key="text.typeofresource"/></div>
    <div class="resource_left">
        <select class="combobox" id="dropResourceCategory" name="dropResourceCategory" onchange="changeResourceCategory()">
            <%if(language==1) {%>
                <c:forEach items="${listResourceCategory}" var="item">
                    <option value="${item.resourceCategoryId}">${item.resourceCategoryNameEn}</option>
                </c:forEach>
            <%}%>
            <%if(language==2) {%>
                <c:forEach items="${listResourceCategory}" var="item">
                    <option value="${item.resourceCategoryId}">${item.resourceCategoryNameVn}</option>
                </c:forEach>
            <%}%>
        </select>
    </div>                    
</div>
<div class="cleared"></div>        
<%-- Resource Name --%>
<div id="divResourceName" class="none">   
    <div class="resource1" >
         <div class="resource_left"><bean:message key="text.resourcenameen" /></div>
         <div class="resource_left"><input class="textbox" id="txtResourceNameEN" name="txtResourceNameEN" type="text" maxlength="255"/></div>
         <div class="resource_left"><bean:message key="text.resourcenamevn"/></div>
         <div class="resource_left"><input class="textbox" id="txtResourceNameVN" name="txtResourceNameVN" type="text" maxlength="255"/></div>
    </div>
</div>     
<div class="cleared"></div>           
<%-- Add resource with resource category is thesis (ID =2) --%>
<div  id="divThesis" class="none">
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.level"/></div>
        <div class="resource_left">
            <select class="combobox" id="dropLevel" name="dropLevel" >
                <%if(language==1) {%>
                    <c:forEach items="${listLevel}" var="item">
                        <option value="${item.levelId}">${item.levelNameEn}</option>
                    </c:forEach>
                <%}%>
                <%if(language==2) {%>
                    <c:forEach items="${listLevel}" var="item">
                        <option value="${item.levelId}">${item.levelNameVn}</option>
                    </c:forEach>
                <%}%>
            </select>
        </div>
        <div class="resource_left"><bean:message key="text.faculty"/></div>
        <div class="resource_left">
            <select class="combobox" id="dropFaculty" name="dropFaculty" >
                <%if(language==1) {%>
                    <c:forEach items="${listFaculty}" var="item">
                        <option value="${item.facultyId}">${item.facultyNameEn}</option>
                    </c:forEach>
                <%}%>
                <%if(language==2) {%>
                    <c:forEach items="${listFaculty}" var="item">
                        <option value="${item.facultyId}">${item.facultyNameVn}</option>
                    </c:forEach>
                <%}%>
            </select>
        </div>
    </div>
    <div class="cleared"></div>              
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.author"/></div>
        <div class="resource_left"><input class="textbox" id="txtThesisAuthor" name="txtThesisAuthor" type="text"  maxlength="255"/></div>
        <div class="resource_left"><bean:message key="text.teacher"/></div>
        <div class="resource_left"><input class="textbox" id="txtTeacher" name="txtTeacher" type="text"  maxlength="255"/></div>                    
    </div>
    <div class="cleared"></div>     
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.class"/></div>
        <div class="resource_left"><input class="textbox" id="txtClass" name="txtClass" type="text" maxlength="45"/></div>
        <div class="resource_left"><bean:message key="text.school"/></div>
        <div class="resource_left"><input class="textbox" id="txtSchool" name="txtSchool" type="text" maxlength="255"/></div>                    
    </div>
    <div class="cleared"></div>     
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.year"/></div>
        <div class="resource_left"><input class="textbox" id="txtYear" name="txtYear" type="text" maxlength="4"/></div>
        <div class="resource_left"><bean:message key="text.schoolyear"/></div>
        <div class="resource_left"><input class="textbox" id="txtSchoolYear" name="txtSchoolYear" type="text" maxlength="45"/></div>                    
    </div>
    <div class="cleared"></div>     
    <div class="resource2">
        <div class="resource_left"><bean:message key="text.uploadfile"/></div>
        <div class="resource_left"><input id="fileThesis" type="file" name="fileThesis" size="27"/></div>
    </div>       
    <div class="cleared"></div>    
    <h2><bean:message key="text.thesissummaryvn"/></h2>
    <FCK:editor  instanceName="fckThesisSummaryVN" height="300px" width="757px">
        <jsp:attribute name="value">
        </jsp:attribute>
    </FCK:editor>
    <hr>
    <h2><bean:message key="text.thesissummaryen"/></h2>
    <FCK:editor  instanceName="fckThesisSummaryEN" height="300px" width="757px">
        <jsp:attribute name="value">
        </jsp:attribute>
    </FCK:editor>                          
</div>
<%-- Add resource with resource category is project (ID =6) --%>
<div id="divProject" class="none">
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.subject"/></div>
        <div class="resource_left">
            <select class="combobox" id="dropSubjectInProject" name="dropSubjectInProject" >
                <%if(language==1) {%>     
                    <c:forEach items="${listSubject}" var="item">
                        <option value="${item.subjectId}">${item.subjectNameEn}</option>
                    </c:forEach>                   
                <%}%>
                <%if(language==2) {%>
                    <c:forEach items="${listSubject}" var="item">
                        <option value="${item.subjectId}">${item.subjectNameVn}</option>
                    </c:forEach>
                <%}%>
            </select>
        </div>                
        <div class="resource_left"><bean:message key="text.projectauthor"/></div>
        <div class="resource_left"><input class="textbox" id="txtProjectAuthor" name="txtProjectAuthor" type="text" maxlength="255"/></div>
    </div>
    <div class="cleared"></div>         
    <div class="resource2">
        <div class="resource_left"><bean:message key="text.uploadfile"/></div>
        <div class="resource_left"><input type="file" id="fileProject" name="fileProject" size="27"/></div>
    </div>
    <div class="cleared"></div>     
</div>            
<%-- Add resource with resource category is chapter (ID =7) --%>
<div  id="divChapter" class="none">
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.subject"/></div>       
        <div class="resource_left">
            <select class="combobox" id="dropSubjectInChapter" name="dropSubjectInChapter" >
                <%if(language==1) {%>                               
                    <c:forEach items="${listSubject}" var="item">
                        <option value="${item.subjectId}">${item.subjectNameEn}</option>
                    </c:forEach>
                <%}%>
                <%if(language==2) {%>
                    <c:forEach items="${listSubject}" var="item">
                        <option value="${item.subjectId}">${item.subjectNameVn}</option>
                    </c:forEach>
                <%}%>
            </select>
        </div>
        <div class="resource_left"><bean:message key="text.orderchapter"/></div>
        <div class="resource_left"><input class="textbox" id="txtOrderChapter" name="txtOrderChapter" type="text" maxlength="2"/></div>                    
    </div>
    <div class="cleared"></div>      
    <h2><bean:message key="text.chaptersummaryvn"/></h2>
    <FCK:editor  instanceName="fckChapterSummaryVN" height="300px" width="757px">
        <jsp:attribute name="value">
        </jsp:attribute>
    </FCK:editor>
    <hr>
    <h2><bean:message key="text.chaptersummaryen"/></h2>
    <FCK:editor  instanceName="fckChapterSummaryEN" height="300px" width="757px">
        <jsp:attribute name="value">
        </jsp:attribute>
    </FCK:editor>
</div>
<%-- Add resource with resource category is Picture, Reading (ID =8,9) --%>
<div id="divPictureandReading" class="none">
    <div class="resource2">
        <div class="resource_left"><bean:message key="text.subject"/></div>
        <div class="resource_left">
            <select class="combobox" id="dropSubjectInReadingAndPicture" name="dropSubjectInReadingAndPicture" >
                <%if(language==1) {%>
                    <c:forEach items="${listSubject}" var="item">
                        <option value="${item.subjectId}">${item.subjectNameEn}</option>
                    </c:forEach>                           
                <%}%>
                <%if(language==2) {%>
                    <c:forEach items="${listSubject}" var="item">
                        <option value="${item.subjectId}">${item.subjectNameVn}</option>
                    </c:forEach>                        
                <%}%>
            </select>
        </div>
    </div>
    <div class="cleared"></div>        
    <div class="resource2">
        <div class="resource_left"><bean:message key="text.uploadfile"/></div>
        <div class="resource_left"><input type="file" id="filePictureReading" name="filePictureReading" size="27"/></div>
    </div>
    <div class="cleared"></div>    
</div>
<%-- Add resource with resource category is assignments,example,lecture note,video (ID =4,5,10,11) --%>
<div id="divResourceChapter" class="none">
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.subject"/></div>
        <div class="resource_left">
            <select class="combobox" id="dropSubjectInResourceChapter" name="dropSubjectInResourceChapter" onchange="changeSubject(this.value)" >
                <%if(language==1) {%>
                    <c:forEach items="${listSubject}" var="item">
                        <option value="${item.subjectId}">${item.subjectNameEn}</option>
                    </c:forEach>
                <%}%>
                 <%if(language==2) {%>
                    <c:forEach items="${listSubject}" var="item">
                        <option value="${item.subjectId}">${item.subjectNameVn}</option>
                    </c:forEach>
                <%}%>
            </select>
        </div>
        <div class="resource_left"><bean:message key="text.orderchapter"/></div>
        <div class="resource_left">
            <div id ="chapter"></div>            
        </div>
    </div>
    <div class="cleared"></div>    
    <div class="resource2">
        <div class="resource_left"><bean:message key="text.uploadfile"/></div>
        <div class="resource_left"><input type="file" id="fileResourceChapter" name="fileResourceChapter" size="27"/></div>
    </div>
    <div class="cleared"></div>    
</div>
<%-- Add resource with resource category is Syllabus (ID =12) --%>
<div id="divResourceSyllabus" class="none">
    <div class="resource2">
        <div class="resource_left"><bean:message key="text.subject"/></div>
        <div class="resource_left">
            <select class="combobox" id="dropSubjectInSyllabus" name="dropSubjectInSyllabus" >
                <%if(language==1) {%>
                    <c:forEach items="${listSubject}" var="item">
                        <option value="${item.subjectId}">${item.subjectNameEn}</option>
                    </c:forEach>
                <%}%>
                 <%if(language==2) {%>   
                    <c:forEach items="${listSubject}" var="item">
                        <option value="${item.subjectId}">${item.subjectNameVn}</option>
                    </c:forEach>
                <%}%>
            </select>
        </div>
    </div>
    <div class="cleared"></div>        
    <div class="resource2">
        <div class="resource_left"><bean:message key="text.uploadfile"/></div>
        <div class="resource_left"><input type="file" id="fileSyllabus" name="fileSyllabus" size="27"/></div>
    </div>
    <div class="cleared"></div>    
</div>                            
</form>                   
<div id="divButtonCreate" class="none">
 <input type="submit"  value=<bean:message key="text.buttoncreate" /> onclick="validate()" />
</div>
<div class="cleared"></div>
<script type="text/javascript">
    function init(){
        changeResourceCategory();
    }
    // Resource Name is not null
    function validateResourceName()
    {
        var alertString = "";
        if($("#txtResourceNameEN").val().trim(" ").length==0)
            alertString ="<bean:message key="text.resourcenameen" /> <bean:message key="text.required" />";
        if($("#txtResourceNameVN").val().trim(" ").length==0)    
            alertString =alertString+"\r\n<bean:message key="text.resourcenamevn" /> <bean:message key="text.required" />";
        return alertString;
    }
    function validate(){
        var chosenoption=document.getElementById("dropResourceCategory");
        if (chosenoption.value=="2"){ // thesis
            var alertString =validateResourceName();
            if($("#fileThesis").val().trim(" ").length==0) // file
                alertString =alertString+"\r\n<bean:message key="text.donotchoose" /> <bean:message key="text.uploadfile" />";
            if($("#txtThesisAuthor").val().trim(" ").length==0) // author
                alertString =alertString+"\r\n<bean:message key="text.author" /> <bean:message key="text.required" />";
            if($("#txtTeacher").val().trim(" ").length==0) // teacher
                alertString =alertString+"\r\n<bean:message key="text.teacher" /> <bean:message key="text.required" />";
            if($("#txtClass").val().trim(" ").length==0) // class
                alertString =alertString+"\r\n<bean:message key="text.class" /> <bean:message key="text.required" />";
            if($("#txtSchool").val().trim(" ").length==0) // school
                alertString =alertString+"\r\n<bean:message key="text.school" /> <bean:message key="text.required" />";
            if($("#txtYear").val().trim(" ").length==0) // year
                alertString =alertString+"\r\n<bean:message key="text.year" /> <bean:message key="text.required" />";
            if($("#txtSchoolYear").val().trim(" ").length==0) // school year
                alertString =alertString+"\r\n<bean:message key="text.schoolyear" /> <bean:message key="text.required" />";
            if(FCKeditorAPI.GetInstance("fckThesisSummaryVN").GetXHTML().length==0) // ThesisSummaryVN
                alertString =alertString+"\r\n<bean:message key="text.thesissummaryvn" /> <bean:message key="text.required" />";
            if(FCKeditorAPI.GetInstance("fckThesisSummaryEN").GetXHTML().length==0) // ThesisSummaryEN
                alertString =alertString+"\r\n<bean:message key="text.thesissummaryen" /> <bean:message key="text.required" />";
            if(FCKeditorAPI.GetInstance("fckThesisSummaryVN").GetXHTML().length>65535) // ThesisSummaryVN
                alertString =alertString+"\r\n<bean:message key="text.thesissummaryvn" /> <bean:message key="text.greatthan" /> 65535 <bean:message key="text.chars" />";
            if(FCKeditorAPI.GetInstance("fckThesisSummaryEN").GetXHTML().length>65535) // ThesisSummaryEN
                alertString =alertString+"\r\n<bean:message key="text.thesissummaryen" /> <bean:message key="text.greatthan" /> 65535 <bean:message key="text.chars" />";             
            if(alertString!="")
                alert(alertString);
            if(alertString=="")
            {   
                if(isNaN($("#txtYear").val())) // year is number
                   alert("<bean:message key="text.year" /> <bean:message key="text.isnotnumber" />");
                if(!isNaN($("#txtYear").val()))
                    document.forms["createResource"].submit(); //submit
            }
        }
        if (chosenoption.value=="6"){ // project
            var alertString =validateResourceName();
            if($("#txtProjectAuthor").val().trim(" ").length==0) // chapter
                alertString =alertString+"\r\n<bean:message key="text.projectauthor" /> <bean:message key="text.required" />";
            if($("#fileProject").val().trim(" ").length==0) // file
                alertString =alertString+"\r\n<bean:message key="text.donotchoose" /> <bean:message key="text.uploadfile" />";
            if(alertString!="")
                alert(alertString);
            if(alertString=="")
                document.forms["createResource"].submit();            
        }       
        if (chosenoption.value=="7"){ //chapter
            var alertString =validateResourceName();
            if($("#txtOrderChapter").val().trim(" ").length==0) // chapter
                alertString =alertString+"\r\n<bean:message key="text.orderchapter" /> <bean:message key="text.required" />";
            if(FCKeditorAPI.GetInstance("fckChapterSummaryVN").GetXHTML().length==0) //
                alertString =alertString+"\r\n<bean:message key="text.chaptersummaryvn" /> <bean:message key="text.required" />";
            if(FCKeditorAPI.GetInstance("fckChapterSummaryEN").GetXHTML().length==0) //
                alertString =alertString+"\r\n<bean:message key="text.chaptersummaryen" /> <bean:message key="text.required" />";
            if(FCKeditorAPI.GetInstance("fckChapterSummaryVN").GetXHTML().length>65535) //
                alertString =alertString+"\r\n<bean:message key="text.chaptersummaryvn" />  <bean:message key="text.greatthan" /> 65535 <bean:message key="text.chars" />";
            if(FCKeditorAPI.GetInstance("fckChapterSummaryEN").GetXHTML().length>65535) //
                alertString =alertString+"\r\n<bean:message key="text.chaptersummaryen" />  <bean:message key="text.greatthan" /> 65535 <bean:message key="text.chars" />";             
            if(alertString!="")
                alert(alertString);
            if(alertString=="")
            {                
                if(isNaN($("#txtOrderChapter").val())) // chapter is number
                   alert("<bean:message key="text.orderchapter" /> <bean:message key="text.isnotnumber" />");
                if(!isNaN($("#txtOrderChapter").val()))
                    document.forms["createResource"].submit();
            }    
        }
        if (chosenoption.value=="8"||chosenoption.value=="9"){
            if(chosenoption.value=="8") // picture
            {
                var alertString = "";
                if($("#filePictureReading").val().trim(" ").length==0) // file
                    alertString =alertString+"\r\n<bean:message key="text.donotchoose" /> <bean:message key="text.imagegallery" />";
                if(alertString!="")
                    alert(alertString);
                if(alertString=="")
                {
                    var id = document.getElementById("dropSubjectInReadingAndPicture").value;
                    $.ajax({
                        type: "POST",
                        url: "CheckSyllabusImage.do",
                        data: "id="+id +"&resourceCategoryID="+chosenoption.value
                    }).done(function( msg ) {
                        if(msg=="")
                            document.forms["createResource"].submit();
                        if(msg!="")
                            alert("<bean:message key="text.subject"/> <bean:message key="text.exist"/> <bean:message key="text.imagegallery"/>");
                    });             
                }     
            }
            if(chosenoption.value=="9") //reading
            {
                var alertString = validateResourceName();
                if($("#filePictureReading").val().trim(" ").length==0) // file
                    alertString =alertString+"\r\n<bean:message key="text.donotchoose" /> <bean:message key="text.uploadfile" />";
                if(alertString!="")
                    alert(alertString);
                if(alertString=="")
                    document.forms["createResource"].submit();
            }            
        }
        if (chosenoption.value=="4"||chosenoption.value=="5"||chosenoption.value=="10"||chosenoption.value=="11") //assignments,example,lecture note,video
        {
            var alertString = validateResourceName();
            if($("#fileResourceChapter").val().trim(" ").length==0) // file
                alertString =alertString+"\r\n<bean:message key="text.donotchoose" /> <bean:message key="text.uploadfile" />";
            if(alertString!="")
                alert(alertString);
            if(alertString=="")
                document.forms["createResource"].submit();     
        }  
        if (chosenoption.value=="12") //Syllabus
        {
            var alertString = "";
            if($("#fileSyllabus").val().trim(" ").length==0) // file
                alertString =alertString+"\r\n<bean:message key="text.donotchoose" /> <bean:message key="text.uploadfile" />";
            if(alertString!="")
                alert(alertString);
            if(alertString=="")
            {
                var id = document.getElementById("dropSubjectInSyllabus").value;
                $.ajax({
                    type: "POST",
                    url: "CheckSyllabusImage.do",
                    data: "id="+id +"&resourceCategoryID="+chosenoption.value
                }).done(function( msg ) {
                    if(msg=="")
                        document.forms["createResource"].submit();
                    if(msg!="")
                        alert("<bean:message key="text.subject"/> <bean:message key="text.exist"/> <bean:message key="text.syllabus"/>");
                });  
            }
        }
    }    
    function changeResourceCategory(){
        //run some code when "onchange" event fires
        document.getElementById("divButtonCreate").style.display = "block";
        var chosenoption=document.getElementById("dropResourceCategory");
         if (chosenoption.value=="2"){
            document.getElementById("divThesis").style.display = "block";            
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
            document.getElementById("divResourceName").style.display = "block";
        }
        if (chosenoption.value=="6"){
            document.getElementById("divProject").style.display = "block";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
            document.getElementById("divThesis").style.display = "none";
            document.getElementById("divResourceName").style.display = "block";
        }        
        if (chosenoption.value=="7"){
            document.getElementById("divChapter").style.display = "block";
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
            document.getElementById("divThesis").style.display = "none";
            document.getElementById("divResourceName").style.display = "block";
        }
        if (chosenoption.value=="8"||chosenoption.value=="9"){
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "block";
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
            document.getElementById("divThesis").style.display = "none";
            if (chosenoption.value=="8")
                document.getElementById("divResourceName").style.display = "none";
            if (chosenoption.value=="9")
                document.getElementById("divResourceName").style.display = "block";
        }
        if (chosenoption.value=="4"||chosenoption.value=="5"||chosenoption.value=="10"||chosenoption.value=="11"){
            document.getElementById("divResourceChapter").style.display = "block";
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
            document.getElementById("divThesis").style.display = "none";
            document.getElementById("divResourceName").style.display = "block";
            var id = document.getElementById("dropSubjectInResourceChapter").value;
            $.ajax({
                type: "POST",
                url: "LoadChapter.do",
                data: "id="+id
            }).done(function( msg ) {
                document.getElementById("chapter").innerHTML = msg;
            });            
        }  
        if (chosenoption.value=="12"){
            document.getElementById("divResourceSyllabus").style.display = "block";
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divResourceName").style.display = "none";
            document.getElementById("divThesis").style.display = "none";
        }
        if (chosenoption.value=="1" ||chosenoption.value=="3")
        {
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
            document.getElementById("divButtonCreate").style.display = "none";
            document.getElementById("divResourceName").style.display = "none";
            document.getElementById("divThesis").style.display = "none";
        }
        setContent();          
    }
        
    function changeSubject(subjectID){ //run some code when "onchange" event fires
    var id = subjectID;
    $.ajax({
        type: "POST",
        url: "LoadChapter.do",
        data: "id="+id
    }).done(function( msg ) {
        document.getElementById("chapter").innerHTML = msg;
    });
}
</script>
<%}}%>
<%if(allow==false){%>
<jsp:include page="../jsp/wrongpage.jsp" flush="true"/>
<%}%>