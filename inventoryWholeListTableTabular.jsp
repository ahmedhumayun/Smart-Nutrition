<!--Imports for Database Connection -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!-- Get Connection -->
<%@ page import="com.laTechProject2.Main" %> 
<!-- 10.0.0.37 or 138.47.200.54 -->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://138.47.200.54:3306/LTR_Fridgedb?zeroDateTimeBehavior=convertToNull&autoReconnect=true&characterEncoding=UTF-8&characterSetResults=UTF-8"
     user="jdo028"  password="Z98S"/>
<!-- Build the Query  -->   
<sql:query dataSource="${snapshot}" var="result">
SELECT I.SName as SName, 
I.Type as Type, I.Quant_curr as Quant_curr,
I.Calories as Calories,
datediff(I.Expiration_date, CURDATE()) as Days_Left,
I.MName as MName, I.Owner as Owner
from Inventory I;
</sql:query>

<style type="text/css">
tr.bad{
color: red;
}

tr.good{
color: black;

}
</style>

	<c:forEach var="row" items="${result.rows}">
	<tr class = "${row.Days_Left < 4 ? 'bad' : 'good'}">
		   <td><c:out value="${row.SName}"/></td>
		   <td><c:out value="${row.Type}"/></td>
		   <td class="amount-num"><c:out value="${row.Quant_curr}"/></td>
		   <td><c:out value="${row.MName}"/></td>
		   <td><c:out value="${row.Days_Left}"/> day(s)</td>
		   <td><c:out value="${row.Calories}"/></td>
	   	   <td><c:out value="${row.Owner}"/></td>
		</tr>
		</c:forEach>
	