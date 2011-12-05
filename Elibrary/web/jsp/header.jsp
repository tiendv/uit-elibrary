<%-- 
    Document   : header
    Created on : Nov 14, 2011, 1:59:03 PM
    Author     : tiendv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<script language="JavaScript" type="text/javascript">
    <!--
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
    // End -->
</script>
<!DOCTYPE html>

 <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                  <bean:message key="text.webtitle.resource"/>
                  <br/> 
                  <bean:message key="text.webtitle.resource1"/>
            </td>   
            <td class="language" style="width: 50%;height: 90px;text-align: right" valign="center">
                    <script language="javscript" type="text/javascript">
                        document.write('<a href="./Locale.do?method=english&page='+ document.location.href +'">');
                    </script>
                    <img src="<bean:message key="image.en"/>" alt="<bean:message key="image.en.alttext"/>"/>
                    <script language="javscript" type="text/javascript">
                        document.write('</a>');
                    </script>
                    <script language="javscript" type="text/javascript">
                        document.write('<a href="./Locale.do?method=vietnamese&page='+ document.location.href +'">');
                    </script>
                    <img src="<bean:message key="image.vn"/>" alt="<bean:message key="image.vn.alttext"/>"/>
                    <script language="javscript" type="text/javascript">
                        document.write('</a>');
                    </script>
             </td> 
        </tr>
  </table>
