<%
String renter_email = request.getParameter("renter_email");
String file_upload_url = "fileUpload.jsp?renter_email="+renter_email;
%>
<form method="post" action= "<%=file_upload_url%>" enctype="multipart/form-data">  
 Select a file to upload :  
     
        <input type="file" name="uploadfile" size="50">  
      
       
	<br>	
        <input type="submit" name="Submit" value="Upload">  
        <input type="reset" name="Reset" value="Cancel">  
        
</form>  
</body>  
</html>  