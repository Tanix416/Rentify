<%@include file = "connect.jsp" %>
<%
try{

String owner_email=(String)session.getAttribute("email");
String renter_email = request.getParameter("renter_email");
String phno = request.getParameter("phno");
String roomNo = request.getParameter("roomNo");
String amt = request.getParameter("amt");
PreparedStatement pst = con.prepareStatement("update Renter_DB set PhoneNo = ?, RoomNumber = ?, Amount = ? where OwnerEmail = ? and RenterEmail = ?");
pst.setString(1,phno);
pst.setString(2,roomNo);
pst.setString(3,amt);
pst.setString(4,owner_email);
pst.setString(5,renter_email);
int t = pst.executeUpdate();
con.close();
response.sendRedirect("dashboard.jsp");
}
catch(Exception e){
  out.println(e);
}
%>