<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ page isErrorPage="true" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
    <head>
    <meta charset ="utf-8">
    <meta name ="viewport" content="width=device-width, intial-scale=1">
    <title>7StringError</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
      <c:url value="/resources/css" var="a"></c:url>
    <link rel="stylesheet" href="${a}/errorpage.css" >
     <style>
      </style>
    </head>
    <body>
  <div class="error">404</div>
<br /><br />
<span class="info">File not found</span>
  </body>
</html>