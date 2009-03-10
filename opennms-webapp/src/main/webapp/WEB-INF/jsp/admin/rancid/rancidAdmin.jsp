<%--

//
// This file is part of the OpenNMS(R) Application.
//
// OpenNMS(R) is Copyright (C) 2002-2003 The OpenNMS Group, Inc.  All rights reserved.
// OpenNMS(R) is a derivative work, containing both original code, included code and modified
// code that was published under the GNU General Public License. Copyrights for modified 
// and included code are below.
//
// OpenNMS(R) is a registered trademark of The OpenNMS Group, Inc.
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
//
// For more information contact:
//      OpenNMS Licensing       <license@opennms.org>
//      http://www.opennms.org/
//      http://www.opennms.com///

--%>

<%@page language="java"
	contentType="text/html"
	session="true"%>
<%@page language="java" contentType="text/html" session="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/includes/header.jsp" flush="false" >
  <jsp:param name="title" value="Rancid" />
  <jsp:param name="headTitle" value="${model.id}" />
  <jsp:param name="headTitle" value="Rancid" />
  <jsp:param name="breadcrumb" value="<a href='element/index.jsp'>Search</a>" />
  <jsp:param name="breadcrumb" value="<a href='element/node.jsp?node=${model.db_id}'>Node</a>" />
  <jsp:param name="breadcrumb" value="Rancid" />
</jsp:include>

<h2>Node: ${model.id} </h2>

<div class="TwoColLeft">
    <!-- general info box -->
    <h3>General (Status: ${model.status_general})</h3>
    <table>
		<tr>
			<th>Node</th>
	  		<th><a href="element/node.jsp?node=${model.db_id}">${model.id}</a></th>
	  	</tr>
	</table>
  
	<h3>Rancid info</h3>
	<table>
		<tr>
			<th>Device Name</th>
			<th>${model.id}</th>
		</tr>	
		<tr>
			<th>Device Type</th>
			<th>${model.devicetype}</th>
		</tr>
		<tr>
			<th>Comment</th>
			<th>${model.comment}</th>
		</tr>
	
		<form id="newUserForm2" method="post" name="newUserForm2">	
		<tr>
			<th>Status</th>
			<th>${model.status}
				<input name="newStatus" id="doOKStatus" type="submit" value="Switch" onClick="validateFormInputStatus()">
			</th>
		</tr>
		<INPUT TYPE="hidden" NAME="statusName" VALUE="${model.status}">
		<INPUT TYPE="hidden" NAME="groupName" VALUE="${model.groupname}"> 
		<INPUT TYPE="hidden" NAME="deviceName" VALUE="${model.id}"> 
		</form>
	</table> 

	<h3>Clogin info</h3>
	<form id="newUserForm" method="post" name="newUserForm">
		<table>
			<tr>
			    <th><label id="userIDLabel" for="userID">User:</label></th>
			    <th><input id="userID" type="text" name="userID" value="${model.cloginuser}"></th>
			 </tr>
		
			 <tr>
			 	<th><label id="pass1Label" for="password">Password:</label></th>
			 	<th><input id="pass" type="text" name="pass" value="${model.cloginpassword}" ></th>
			 </tr>
			 <tr>
			 	<th><label id="enpass1Label" for="enpassword">Enable password:</label></th>
			 	<th><input id="enpass" type="text" name="enpass" value="${model.cloginenablepass}" ></th>
			 </tr>
			 <tr>
				 <th><label id="loginMethodLabel" for="loginMethod">Connection Method:</label></th>
				 <th>
					  <select name="loginM" size="1">
					  <option value="${model.cloginconnmethod}">${model.cloginconnmethod}</option>
					  <option value="ssh">ssh</option>
					  <option value="telnet">telnet</option>
					  </select>
				 </th>
			 </tr>
			 <tr>
			 	<th><label id="autoEnableLabel" for="autoEnable">AutoEnable:</label></th>
			 	<th>
				  <select name="autoE" size="1">
				  <option value="${model.cloginautoenable}">${model.cloginautoenable}</option>
				  <option value="1">1</option>
				  <option value="0">0</option>
				  </select>
				</th>
			 </tr>
		
			 <tr>
			 	<th></th>
			 	<th><input id="doCancel" type="button" value="Cancel" onClick="cancelUser()">
			 		<input id="doOK" type="submit" value="OK" onClick="validateFormInput()">
			 	</th>
			 </tr>
	
			 <INPUT TYPE="hidden" NAME="groupName" VALUE="${model.groupname}"> 
			 <INPUT TYPE="hidden" NAME="deviceName" VALUE="${model.id}"> 
		 </table>
	 </form>
</div>

<jsp:include page="/includes/footer.jsp" flush="false" />

<script language="JavaScript">
function validateFormInput() 
{
	  
  if (document.newUserForm.userID.value == "") {
	  alert("The user field cannot be empty");
	  return;
  }
  if (document.newUserForm.pass.value == "") {
	  alert("The password field cannot be empty");
	  return;
  }
  if (document.newUserForm.loginM.value == "") {
	  alert("The login method field cannot be empty");
	  return;
  }
  document.newUserForm.action="admin/rancid/rancidClogin.htm?node=${model.db_id}";
  document.newUserForm.submit();
}    
function cancelUser()
{
    document.newUserForm.action="admin/rancid/rancidAdmin.jsp?node=${model.db_id}";
    document.newUserForm.submit();
}
function validateFormInputStatus() {
	  document.newUserForm2.action="admin/rancid/rancidStatus.htm?node=${model.db_id}";
	  document.newUserForm2.submit();
}

</script>

