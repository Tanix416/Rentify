<%@ include file="connect.jsp" %>
<%
    String owner_email=(String)session.getAttribute("email");
     //out.println(request.getParameter("email"));
     //out.println(owner_email);
     PreparedStatement pst=con.prepareStatement("select * from Renter_DB where RenterEmail like ? and OwnerEmail like ?");
     pst.setString(1,request.getParameter("email"));
     pst.setString(2,owner_email);
     ResultSet rs=pst.executeQuery();
     if(rs.next())
     {
%>
1
<%
     }
     else
     {
%>
0
<%
     }
    con.close();
%>