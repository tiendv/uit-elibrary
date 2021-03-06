<%-- 
    Document   : faculty
    Created on : Dec 6, 2011, 4:44:10 AM
    Author     : Nguyen Hoang Tan
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.List"%>
<%@page import="uit.elib.dto.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="title_h1"><bean:message key="text.optional"/></div>
<div class="af_legends">
    <ul class="legendList">
    <li class="lectureNotes" alt="Lecture notes"
        title="<bean:message key="text.lecturenote"/>"><bean:message key="text.lecturenote"/></li>
    <li class="multimediaContent"
        alt="Video"
        title="<bean:message key="text.video"/>"><bean:message key="text.video"/></li>
    <li class="assignmentsSolutions"
        alt="Assignments"
        title="<bean:message key="text.assignments"/>"><bean:message key="text.assignments"/></li>
    <li class="examsSolutions"
        alt="Example"
        title="<bean:message key="text.example"/>"><bean:message key="text.example"/></li>
</div>
<% 
    List<Subjectdetail> listSubjectDetail;
    listSubjectDetail = (List<Subjectdetail>)request.getAttribute("listSubjectDetail");
    List<Subject> listSubject =  (List<Subject>)request.getAttribute("listSubject"); 
    HashMap  hashMap =    (HashMap)request.getAttribute("hashMap");             
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vi_VN"))
        language=2; // VietNamese
%>            
<% 
    List<Faculty> listFaculty;
    listFaculty = (List<Faculty>)request.getAttribute("listFaculty");
    int s=0; 
    boolean haveSubject;                       
    for(int f=0;f<listFaculty.size();f++){
        String subjectID="";
        haveSubject=true; 
%>    
<% if(language==1) { %>
    <div class="title_h1"><%=listFaculty.get(f).getFacultyNameEn() %></div>  <!--English Faculty Name-->
<% } %> 
<% if(language==2) {%>
    <div class="title_h1"><%=listFaculty.get(f).getFacultyNameVn() %></div> <!--Vietnamese Faculty Name-->
<% } %>         
<%
   if(listSubjectDetail.get(s).getFaculty().getFacultyId()!=listFaculty.get(f).getFacultyId()){
       haveSubject=false;
%>
    <div class="updatesubject">
        <img src="image/black-arrow.gif" class="image_black_arrow" alt="black-arrow"/>
        <bean:message key="text.updating"/>
    </div>
<% } %> 
<table class="subjecttable"> 
    <%                 
        for(int i=s;i<listSubjectDetail.size();i=i+2) {
            if(listSubjectDetail.get(i).getFaculty().getFacultyId()!=listFaculty.get(f).getFacultyId())
                break;
            subjectID = subjectID+"F"+listFaculty.get(f).getFacultyId()+"S"+listSubjectDetail.get(i).getSubject().getSubjectId()+",";
    %>
    <tr>      
    <td class="subjectname">              
        <img src="image/black-arrow.gif" class="image_black_arrow" alt="black-arrow"/>
        <%
            int position = Integer.parseInt(hashMap.get(listSubjectDetail.get(i).getSubject().getSubjectId()).toString());
        %>
        <% if(language==1) { %>
        <a href ="#F<%=listFaculty.get(f).getFacultyId()%>S<%=listSubjectDetail.get(i).getSubject().getSubjectId()%>" class="href_subject" onclick="displayDetail('F<%=listFaculty.get(f).getFacultyId()%>S<%=listSubjectDetail.get(i).getSubject().getSubjectId()%>')"> <%=listSubject.get(position).getSubjectNameEn()%>  </a> <!--English Subject Name-->
        <% } %> 
        <% if(language==2) {%>
            <a href ="#F<%=listFaculty.get(f).getFacultyId()%>S<%=listSubjectDetail.get(i).getSubject().getSubjectId()%>" class="href_subject" onclick="displayDetail('F<%=listFaculty.get(f).getFacultyId()%>S<%=listSubjectDetail.get(i).getSubject().getSubjectId()%>')"><%=listSubject.get(position).getSubjectNameVn()%> </a> <!--Vietnamese Subject Name-->
        <% } %>                         
    </td>
    <td class="subjectname">
        <% if(i+1<listSubjectDetail.size() && (listSubjectDetail.get(i+1).getFaculty().getFacultyId()==listFaculty.get(f).getFacultyId())){ %>
            <%
                position = Integer.parseInt((String)hashMap.get(listSubjectDetail.get(i+1).getSubject().getSubjectId()).toString());
            %>            
            <img src="image/black-arrow.gif" class="image_black_arrow" alt="black-arrow"/>
            <% if(language==1) {%>
                <a href ="#F<%=listFaculty.get(f).getFacultyId()%>S<%=listSubjectDetail.get(i+1).getSubject().getSubjectId()%>" class="href_subject" onclick="displayDetail('F<%=listFaculty.get(f).getFacultyId()%>S<%=listSubjectDetail.get(i+1).getSubject().getSubjectId()%>')"> <%=listSubject.get(position).getSubjectNameEn()%> </a> <!--English Subject Name-->
            <% } %> 
            <% if(language==2) {%>
                <a href ="#F<%=listFaculty.get(f).getFacultyId()%>S<%=listSubjectDetail.get(i+1).getSubject().getSubjectId()%>" class="href_subject" onclick="displayDetail('F<%=listFaculty.get(f).getFacultyId()%>S<%=listSubjectDetail.get(i+1).getSubject().getSubjectId()%>')"> <%=listSubject.get(position).getSubjectNameVn()%> </a> <!--Vietnamese Subject Name-->
            <% } %>
            <%subjectID = subjectID+"F"+listFaculty.get(f).getFacultyId()+"S"+listSubjectDetail.get(i+1).getSubject().getSubjectId()+",";%>
        <% } %>    
    </td>
    </tr>
    <% } %>
</table><br/>
<% if(haveSubject) {%>
<div class="seealldetail" id="seealldetail<%=f%>"  onclick="seeAllDetail('seealldetail<%=f%>','closealldetail<%=f%>','<%=subjectID%>')"><a class="href_subject"><bean:message key="text.seealldetail"/></a></div>
<div class="closealldetail" id="closealldetail<%=f%>"  onclick="closeAllDetail('seealldetail<%=f%>','closealldetail<%=f%>','<%=subjectID%>')"><a class="href_subject"><bean:message key="text.closealldetail"/></a></div>   
<% } %>
<% 
    List<List<Resource>> arrayListResource = (List<List<Resource>>) request.getAttribute("arrayListResource");
%> 
<%  
    for(int i=s;i<listSubjectDetail.size();i++) {
        int position = Integer.parseInt(hashMap.get(listSubjectDetail.get(i).getSubject().getSubjectId()).toString());
        String href="./SubjectIntroduction.do?subjectID="+listSubjectDetail.get(i).getSubject().getSubjectId();
        if(listSubjectDetail.get(i).getFaculty().getFacultyId()!=listFaculty.get(f).getFacultyId())
        {     
            s=i;
            break;
        }
%>
<div id="F<%=listFaculty.get(f).getFacultyId()%>S<%=listSubjectDetail.get(i).getSubject().getSubjectId()%>" class="none">
<% if(language==1) {%>
    <div class="subject">
        <a href =<%=href%> name= "F<%=listFaculty.get(f).getFacultyId()%>S<%=listSubjectDetail.get(i).getSubject().getSubjectId()%>" ><%=listSubject.get(position).getSubjectNameEn()%></a> <!--English Subject Name-->
    </div>    
<% } %> 
<% if(language==2) {%>
    <div class="subject">
        <a href =<%=href%> name= "F<%=listFaculty.get(f).getFacultyId()%>S<%=listSubjectDetail.get(i).getSubject().getSubjectId()%>"  ><%=listSubject.get(position).getSubjectNameVn()%></a> <!--Vietnamese Subject Name-->
    </div>    
<% } %>
<table class="table_chapter" >
    <tr class="color_title_table">
        <td class="td_chapter_1"><bean:message key="text.orderchapter"/></td>
        <td class="td_chapter_2"><bean:message key="text.chaptertitle"/></td>
        <td class="td_chapter_3"></td>                
        <td class="td_chapter_4"></td>                
    </tr>
    <% int color =0;
       Boolean haveAnyChapter =false;
       List<Resource> listResource = arrayListResource.get(i);
    %>  
    <% for(int j=0;j<listResource.size();j++) {%>
         <%
            int numberOfResource=0;
            int newestPosition=-1;
            int chapterID =-1;
            int []arrayIcon = new int[11] ;
            for(int a=0;a<11;a++)
                arrayIcon[a]=0;
            int chapter = listResource.get(j).getOrderChapter();
            if(!listSubjectDetail.get(i).getSubject().getSubjectId().equals(listResource.get(j).getSubject().getSubjectId()))
            {
                break;
            }
            while(chapter==listResource.get(j).getOrderChapter()&&(listSubjectDetail.get(i).getSubject().getSubjectId().equals(listResource.get(j).getSubject().getSubjectId()))){
                if(numberOfResource==0)
                {
                    int rCID = listResource.get(j).getResourcecategory().getResourceCategoryId();
                        if(rCID==4||rCID==5||rCID==10||rCID==11)
                            numberOfResource=1;
                }                         
                if(newestPosition==-1)
                    newestPosition=j;
                if(listResource.get(j).getResourcecategory().getResourceCategoryId()==7)
                    chapterID=j;
                else
                    arrayIcon[listResource.get(j).getResourcecategory().getResourceCategoryId()-1]=1;
                j++;
                if(j>=listResource.size())
                    break;
            }
                j--;
       %>
        <%if(chapterID>=0){%>                            
        <tr>
        <% Date date = new Date(); 
           boolean oneMonth = false;

           if(listResource.get(newestPosition).getPostDate()!=null)
           {
               long time= date.getTime()- listResource.get(newestPosition).getPostDate().getTime(); // time = today - postdate
               if(time<=((long)30*24*60*60*1000)) // time <= 30 days
                   oneMonth=true;
           }
          %>
        <% if(listSubjectDetail.get(i).getSubject().getSubjectId().equals(listResource.get(j).getSubject().getSubjectId()))  // if resource belong to subject
           {    haveAnyChapter=true; 
        %> 
        <td <% if(color%2==0){ %>class="td_chapter_1_content_even"<%}%> 
            <% if(color%2!=0){ %>class="td_chapter_1_content_odd"<%}%> >
            <%=listResource.get(chapterID).getOrderChapter() %> <!--Chapter-->
        </td>  
        <% if(language==1) {%>                              
            <td <% if(color%2==0){ %>class="td_chapter_2_content_even"<%}%> 
                <% if(color%2!=0){ %>class="td_chapter_2_content_odd"<%}%> >
                <%=listResource.get(chapterID).getResourceNameEn() %> <!--English Resource Name-->
            </td>
        <% } %> 
        <% if(language==2) {%>                               
            <td <% if(color%2==0){ %>class="td_chapter_2_content_even"<%}%> 
                <% if(color%2!=0){ %>class="td_chapter_2_content_odd"<%}%> >
                <%=listResource.get(chapterID).getResourceNameVn() %> <!--Vietnamese Resource Name-->
            </td>
        <% } %>
            <td <% if(color%2==0){ %>class="td_chapter_3_content_even"<%}%> 
                <% if(color%2!=0){ %>class="td_chapter_3_content_odd"<%}%> >
            <% if(numberOfResource==1){%>
                <div class="displayIcon">
                <%
                for(int a=0;a<11;a++){
                    int resourceCategoryId = -1;
                    if(arrayIcon[a]==1)
                    resourceCategoryId=a+1 ;
                %>                           
                <% if(resourceCategoryId==4 ){ %>
                    <a  href = <%="./SubjectCategory.do?subjectID="+ listSubjectDetail.get(i).getSubject().getSubjectId()+"&"+"resourceCategoryID="+4+"&"+"orderChapter="+listResource.get(chapterID).getOrderChapter() %> alt="<bean:message key="text.assignments"/>" class="assignmentsSolutions" title="<bean:message key="text.assignments"/>"></a><% } %>
                <% if(resourceCategoryId==5 ){ %>
                    <a  href = <%="./SubjectCategory.do?subjectID="+ listSubjectDetail.get(i).getSubject().getSubjectId()+"&"+"resourceCategoryID="+5+"&"+"orderChapter="+listResource.get(chapterID).getOrderChapter() %> alt="<bean:message key="text.example"/>" class="examsSolutions" title="<bean:message key="text.example"/>"></a>  <% } %>
                <% if(resourceCategoryId==10 ){ %>
                    <a  href = <%="./SubjectCategory.do?subjectID="+ listSubjectDetail.get(i).getSubject().getSubjectId()+"&"+"resourceCategoryID="+10+"&"+"orderChapter="+listResource.get(chapterID).getOrderChapter() %> alt="<bean:message key="text.lecturenote"/>" class="lectureNotes" title="<bean:message key="text.lecturenote"/>"></a><% } %>                           
                <% if(resourceCategoryId==11 ){ %>
                    <a  href = <%="./SubjectCategory.do?subjectID="+ listSubjectDetail.get(i).getSubject().getSubjectId()+"&"+"resourceCategoryID="+11+"&"+"orderChapter="+listResource.get(chapterID).getOrderChapter() %> alt="<bean:message key="text.video"/>" class="multimediaContent" title="<bean:message key="text.video"/>"></a>   <% } %>
                <%}%>       
                </div>
            <%}%>  
        </td>
        <td <% if(color%2==0){ %>class="td_chapter_4_content_even"<%}%> 
            <% if(color%2!=0){ %>class="td_chapter_4_content_odd"<%}%> >
            <% if(oneMonth==true) {%>
                <img src="image/new-icon.gif" class="image_newicon" alt="new-icon"/> <!-- new icon  -->
            <% } %>
        </td>                
        <% } %>              
        <% color ++; %>
    </tr >
    <% }} %>
    <%if(haveAnyChapter==false){%>
        <tr><td/><td><bean:message key="text.updating"/></td><td/><td/></tr>
    <%}%>         
</table>
</div>          
<%}}%>
<input type="hidden" id="currentSubjectID" value="-1"/>
<script type="text/javascript">
    function displayDetail(subjectID)
    {
        var s= document.getElementById("currentSubjectID").value;
        if(s!=subjectID)
        {
            document.getElementById(subjectID).style.display = "block";
            if(s!=-1)
                document.getElementById(s).style.display = "none";
            document.getElementById("currentSubjectID").value=subjectID;
        }
        setContent();             
    }
    function seeAllDetail(seealldetail,closealldetail,manySubjectID)
    {
        var subjectID = manySubjectID.split(',');
        for(var i=0;i<subjectID.length-1;i++)
            document.getElementById(subjectID[i]).style.display = "block";
        document.getElementById(seealldetail).style.display = "none";  
        document.getElementById(closealldetail).style.display = "block";
        document.getElementById("currentSubjectID").value=-1;
        setContent();  
    }
    function closeAllDetail(seealldetail,closealldetail,manySubjectID)
    {
        var subjectID = manySubjectID.split(',');
        for(var i=0;i<subjectID.length-1;i++)
            document.getElementById(subjectID[i]).style.display = "none";
        document.getElementById(seealldetail).style.display = "block";  
        document.getElementById(closealldetail).style.display = "none";
        setContent();          
    }    
</script>
