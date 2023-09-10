<%@ include file = "connect.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit | Rentify</title>
    <link rel="stylesheet" href="styles/edit.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap"
      rel="stylesheet"
    />
  </head>
<%
String owner_email=(String)session.getAttribute("email");
String renter_email = request.getParameter("renter_email");
PreparedStatement pst = con.prepareStatement("select * from Renter_DB where OwnerEmail = ? and RenterEmail = ?");
pst.setString(1,owner_email);
pst.setString(2,renter_email);
ResultSet rs = pst.executeQuery();
if(rs.next()){
String name = rs.getString(1);
String roomNo = rs.getString(3);
String phno = rs.getString(4);
String amt = rs.getString(10);
%>
  <body>
    <!--Main-->
    <section class="main">
      <!--Showcase-->
      <div class="showcase">
        <!--Title-->
        <div class="main-title">
          <h2>
            <span class="bg-text">Update</span>
            <span class="fg-text">Upd<span>ate</span></span>
          </h2>
        </div>

        <!--Form-->
        <div class="form-container">
          <form action="renter_editDB.jsp" method="post">
            <input type="text" name="name" placeholder="Name" value="<%=name%>" readonly />
            <input
              type="text"
              name="roomNo"
              placeholder="Room Number"
              value="<%=roomNo%>"
              required
            />
            <input
              type="number"
              name="phno"
              placeholder="Phone Number"
              value="<%=phno%>"
              required
            />
            <input
              type="email"
              name="renter_email"
              placeholder="Email"
              value="<%=renter_email%>"
              readonly
            />
            <input
              type="number"
              name="amt"
              placeholder="Rent Amount"
              value="<%=amt%>"
              required
            />

            <input type="submit" name="" value="Update" />
          </form>
        </div>
      </div>
    </section>
  </body>
  <%
  }
  con.close();
  %>
</html>
