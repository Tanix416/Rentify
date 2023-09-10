<%@include file = "connect.jsp" %>

<%
try{
String owner_email=(String)session.getAttribute("email");
java.time.LocalDate currdate = java.time.LocalDate.now();
java.time.Month currMonth = currdate.getMonth();
String month = currMonth.toString();
PreparedStatement pst = con.prepareStatement("insert into Renter_DB values(?,?,?,?,?,?,?,?,?,?)");
String name = request.getParameter("name");
String renter_email = request.getParameter("renter_email");
String phno = request.getParameter("phno");
String roomNo = request.getParameter("roomNo");
String amt = request.getParameter("amt");
String photo = "dummy.png";
pst.setString(1,name);
pst.setString(2,photo);
pst.setString(3,roomNo);
pst.setString(4,phno);
pst.setString(5,owner_email);
pst.setString(6,renter_email);
pst.setString(7,month);
pst.setString(8,"1");
pst.setString(9,"");
pst.setString(10,amt);
int t = pst.executeUpdate();
if (t>0)
{
response.sendRedirect("dashboard.jsp");
}
}
catch(Exception e){
  out.println(e);
}
con.close();
%>