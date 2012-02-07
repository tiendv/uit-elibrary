<%--
    Document   : header
    Created on : Nov 14, 2011, 1:59:03 PM
    Author     : tiendv
--%>

<%@page import="uit.elib.utility.CheckGroup"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<!DOCTYPE html>
<div  class="divheader">      
    <div class="divtitle">
        <bean:message key="text.webtitle.resource"/>
        <br/>
        <bean:message key="text.webtitle.resource1"/>
    </div>
    <div class="divtitleright">
        <div id="divLogin">
            <%
                int group =2; //visitor 
                if(session.getAttribute("username")!=null){ 
                     CheckGroup checkGroup = new CheckGroup();
                     group = checkGroup.Group((String)session.getAttribute("username"));
                     if(group==-1) // account has just been locked while users are accessing or  account has just expired while users are accessing
                     {   
                         session.removeAttribute("username");
                         session.removeAttribute("group");
                     }
                     if(group!=-1)
                         session.setAttribute("group", group);
                 }
            %>
            <%   if(session.getAttribute("username")!=null){ 
            %>
                    <div class="divlogout">
                        <div class="divheaderlogout"><%=session.getAttribute("username")%> <a href="Logout.do" > <bean:message key="text.logout"/> </a></div> 
                        <div class="divheaderwelcome"><bean:message key="text.welcome"/></div>
                    </div>
            <%}%>              
            <%  
                if(session.getAttribute("username")==null){
            %>
                    <div class="divlogin">
                        <div class="divlabellogin"><bean:message key="text.username"/></div><div class="divtxtlogin"><input type="text" class="textbox" id="txtUsername" size="20"  value="" /></div>
                    </div>
                    <div class="divlogin"> 
                        <div class="divlabellogin"><bean:message key="text.password"/></div><div class="divtxtlogin"><input type="password" class="textbox" id="txtPassword" size="20"  value="" /></div>
                    </div>
                    <div class="divlogin">
                        <div class="divbuttonlogin"><input type="button"  value="<bean:message key="text.login"/>" onclick="login()" /></div>
                    </div>
            <%} %>           
        </div>        
            
        <!-- VIETNAMESE LOCALE-->
        <div class="vietnamflag" >
            <form method="post" action="./Locale.do" id="Vietnamese_Form">
            <input type="hidden" name="method" value="vietnamese"/>
            <script language="javscript" type="text/javascript">
            document.write('<input type="hidden" name="page" value='+ document.location.href +'>');
            </script>
            <a href="#" onclick='document.forms["Vietnamese_Form"].submit();'>
            <img src="<bean:message key="image.vn"/>" alt="<bean:message key="image.vn.alttext"/>"/>
            </a>
            </form>
        </div>
        
        <!-- END VIETNAMESE LOCALE-->             
        <!-- ENGLISH LOCALE-->
        <div class="englandflag" >
            <form method="post" action="./Locale.do" id="English_Form">
            <input type="hidden" name="method" value="english"/>
            <script language="javscript" type="text/javascript">
            document.write('<input type="hidden" name="page" value='+ document.location.href +'>');
            </script>
            <a href="#" onclick='document.forms["English_Form"].submit();'>
            <img src="<bean:message key="image.en"/>" alt="<bean:message key="image.en.alttext"/>"/>
            </a>
            </form>
        </div>
        <!-- END ENGLISH LOCALE-->
    </div>   
</div>
<script language="JavaScript" type="text/javascript">
function hideLoadingPage() {
    if (document.getElementById) { // DOM3 = IE5, NS6
        document.getElementById('hidepage').style.visibility = 'hidden';
    }
    else {
        if (document.layers) { // Netscape 4
            document.hidepage.visibility = 'hidden';
        }
        else { // IE 4
            document.all.hidepage.style.visibility = 'hidden';
        }
    }
}
function showLoadingPage() {
    if (document.getElementById) { // DOM3 = IE5, NS6
        document.getElementById('hidepage').style.visibility = 'visible';
    }
    else {
        if (document.layers) { // Netscape 4
            document.hidepage.visibility = 'show';
        }
        else { // IE 4
            document.all.hidepage.style.visibility = 'visible';
        }
    }
}
function login()
{   var username = $("#txtUsername").val();
    var password = $("#txtPassword").val();
    var alertString = "";
    if(username.trim(" ").length==0)
        alertString =alertString+"\r\n<bean:message key="text.username" /> <bean:message key="text.required" />";
    if(password.trim(" ").length==0)
        alertString =alertString+"\r\n<bean:message key="text.password" /> <bean:message key="text.required" />";
    if(alertString!="")
        alert(alertString);
    if(alertString=="")
    {
        $.ajax({
            type: "POST",
            url: "Login.do",
            data: "username="+username+ "&password="+password
        }).done(function(msg){
            if(msg.trim(" ")=="0")
                alert("<bean:message key="text.youraccounthasbeenlocked"/>");           
            if(msg.trim(" ")=="1")
                window.location.reload();
            if(msg.trim(" ")=="2")
                alert("<bean:message key="text.youraccounthasexpired"/>");            
            if(msg.trim(" ")=="")
                alert("<bean:message key="text.wronguserpass"/>");
        }); 
    }
}
</script>            