<%@ include file = "connect.jsp" %>

<%
try{
PreparedStatement pst = con.prepareStatement("select * from Owner_DB where EmailID=? and Password = ?");
pst.setString(1,request.getParameter("email"));
pst.setString(2,request.getParameter("passwd"));
ResultSet rs = pst.executeQuery();
if(rs.next())
{
  session.setAttribute("email",rs.getString(3));
  response.sendRedirect("update_rent_inf.jsp");
}
else
{
  response.sendRedirect("login.html");
}
}
catch(Exception e){
  out.println(e);
}
con.close();
%>
