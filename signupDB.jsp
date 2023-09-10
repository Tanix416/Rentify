<%@include file = "connect.jsp" %>

<%
try{
PreparedStatement pst = con.prepareStatement("insert into Owner_DB values(?,?,?,?)");
String name = request.getParameter("name");
String email = request.getParameter("email");
String phno = request.getParameter("phno");
String passwd = request.getParameter("passwd");

pst.setString(1,name);
pst.setString(3,email);
pst.setString(2,phno);
pst.setString(4,passwd);

int t = pst.executeUpdate();
if (t>0)
{
response.sendRedirect("login.html");
}
}
catch(Exception e){
  out.println(e);
}
con.close();
%>