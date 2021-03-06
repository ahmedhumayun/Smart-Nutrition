<!--Imports for Database Connection -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!-- Get Connection -->
<!-- 10.0.0.37 or 138.47.200.54 -->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://138.47.200.54:3306/LTR_Fridgedb?zeroDateTimeBehavior=convertToNull&autoReconnect=true&characterEncoding=UTF-8&characterSetResults=UTF-8"
     user="jdo028"  password="Z98S"/>
<!-- Build the Query  -->   
<sql:query dataSource="${snapshot}" var="result">
SELECT * from ShoppingList;
</sql:query>

	<c:forEach var="row" items="${result.rows}">
		<tr>
		   <td><c:out value="${row.SName}"/></td>
		   <td><c:out value="${row.Type}"/></td>
		   <td class="amount-num"><c:out value="${row.Quant_curr}"/></td>
		   <td><c:out value="${row.MName}"/></td>
		   <td><c:out value="${row.Owner}"/></td>
		   <td><input type="checkbox" name="toInventory" id="toInventory" value=<c:out value="${row.SID}"/>></td>
		</tr>
	</c:forEach>
	<button  class="btn btn-success" name="add_to_inventory" onClick="return windowConfirm()" type="submit"> Add to Inventory</button>
	