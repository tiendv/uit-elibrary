<%-- 
    Document   : login
    Created on : Feb 9, 2012, 12:54:49 AM
    Author     : Nguyen Hoang Tan
--%> 
<%@page import="org.apache.struts.Globals"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<% if(session.getAttribute("username")==null){%>
<%
   int language =1; // English
   if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
        language = 2; // VietNamese
%>
<%if(language==1){%>
<div id="login" class="loginen">
<%}%>
<%if(language==2){%>
<div id="login" class="loginvn">
<%}%>
    <fieldset>
        <legend></legend>
        <div>
            <label><bean:message key="text.username"/> :</label>
            <input id="txtUsername" type="text" size="20" name="txtUsername">
        </div>
        <div>
            <label><bean:message key="text.password"/> :</label>
            <input id="txtPassword" type="password" size="20" name="txtPassword">
        </div>
        <p class="buttons">
            <button 
                <%if(language==1){%>
                    id="login_buttonen"
                <%}%>
                <%if(language==2){%>
                    id="login_buttonvn"
                <%}%>                   
            class="login_button" type="submit" onclick="login()">Sign in</button>
        </p>            
    </fieldset>
</div>          
<script language="JavaScript" type="text/javascript">
function login()
{   
    var username = $("#txtUsername").val();
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
            {    
                window.location.href ="./Welcome.do" 
            }
            if(msg.trim(" ")=="2")
                alert("<bean:message key="text.youraccounthasexpired"/>");            
            if(msg.trim(" ")=="")
                alert("<bean:message key="text.wronguserpass"/>");
        }); 
    }
}
</script>
<%}%>
<%if(session.getAttribute("username")!=null){%>
<jsp:include page="../jsp/wrongpage.jsp" flush="true"/>
<%}%>