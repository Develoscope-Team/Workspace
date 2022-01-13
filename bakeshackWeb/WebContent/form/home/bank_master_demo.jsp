
<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String dbConnVar = "BAKESHACk";
try {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>

<link href="assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
		<link href="assets/plugins/custom/prismjs/prismjs.bundle.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
		
		<link rel="shortcut icon" href="assets/media/logos/favicon.ico" />
<style>
table, th, td {
	border: 1px solid white;
	border-collapse: collapse;
	background-color: #ffffff;
}
</style>
<style>
table.a {
	table-layout: auto;
	width: 100%;
}
</style>
</head>


 
 
 
 
  <script type="text/javascript">
  
	var url = "logout.jsp" ; 
  var KTIdleTimerDemo = function() {
	    var _init = function() {
	        //Define default
	        var docTimeout = 50000;

	        /*
	        Handle raised idle/active events
	        */
	        $(document).on("idle.idleTimer", function(event, elem, obj) {
	            $("#docStatus")
	                .val(function(i, v) {
	                    return v + "Idle @ " + moment().format() + " \n";
	                })
	               
	           // alert("alert 1");
	            Swal.fire({
			        title: "You Want To Logout!?",
			        text: "our System idle from 50 sec!",
			        icon: "warning",
			        showCancelButton: true,
			        confirmButtonText: "Yes, Logout!",
			        cancelButtonText: "No, Continue!",
			        reverseButtons: true
			    }).then(function(result) {
			        if (result.value) {
			        	window.location.assign(url);
			        } else if (result.dismiss === "cancel") {
				        	 window.location.reload();
				        }
				    }); 
	            setTimeout(function(){
	            	window.location.assign(url);
			           },50000);
	        });
	      /*   $(document).on("active.idleTimer", function(event, elem, obj, e) {
	            $("#docStatus")
	                .val(function(i, v) {
	                    return v + "Active [" + e.type + "] [" + e.target.nodeName + "] @ " + moment().format() + " \n";
	                })
	                .addClass("alert-success")
	                .removeClass("alert-warning")
	                .scrollTop($("#docStatus")[0].scrollHeight);
	           // alert("alert 2");
	        }); */

	        /*
	        Handle button events
	        */
	       /*  $("#btPause").click(function() {
	            $(document).idleTimer("pause");
	            $("#docStatus")
	                .val(function(i, v) {
	                    return v + "Paused @ " + moment().format() + " \n";
	                })
	                .scrollTop($("#docStatus")[0].scrollHeight);
	            $(this).blur();
	            return false;
	        }); */
	        /* $("#btResume").click(function() {
	            $(document).idleTimer("resume");
	            $("#docStatus")
	                .val(function(i, v) {
	                    return v + "Resumed @ " + moment().format() + " \n";
	                })
	                .scrollTop($("#docStatus")[0].scrollHeight);
	            $(this).blur();
	            return false;
	        }); */
	       /*  $("#btElapsed").click(function() {
	            $("#docStatus")
	                .val(function(i, v) {
	                    return v + "Elapsed (since becoming active): " + $(document).idleTimer("getElapsedTime") + " \n";
	                })
	                .scrollTop($("#docStatus")[0].scrollHeight);
	            $(this).blur();
	            return false;
	        }); */
	       /*  $("#btDestroy").click(function() {
	            $(document).idleTimer("destroy");
	            $("#docStatus")
	                .val(function(i, v) {
	                    return v + "Destroyed: @ " + moment().format() + " \n";
	                })
	                .removeClass("alert-success")
	                .removeClass("alert-warning")
	                .scrollTop($("#docStatus")[0].scrollHeight);
	            alert("alert 3");
	            $(this).blur();
	            return false;
	        }); */
	      /*   $("#btInit").click(function() {
	            // for demo purposes show init with just object
	            $(document).idleTimer({
	                timeout: docTimeout
	            });
	            $("#docStatus")
	                .val(function(i, v) {
	                    return v + "Init: @ " + moment().format() + " \n";
	                })
	                .scrollTop($("#docStatus")[0].scrollHeight);

	            //Apply classes for default state
	            if ($(document).idleTimer("isIdle")) {
	                $("#docStatus")
	                    .removeClass("alert-success")
	                    .addClass("alert-warning");
	                alert("alert 4");
	            } else {
	                $("#docStatus")
	                    .addClass("alert-success")
	                    .removeClass("alert-warning");
	                alert("alert 5");
	            }
	            $(this).blur();
	            return false;
	        }); */

	        //Clear old statuses
	    /*     $("#docStatus").val(""); */

	        //Start timeout, passing no options
	        //Same as $.idleTimer(docTimeout, docOptions);
	        $(document).idleTimer(docTimeout);

	        //For demo purposes, style based on initial state
	       /*  if ($(document).idleTimer("isIdle")) {
	            $("#docStatus")
	                .val(function(i, v) {
	                    return v + "Initial Idle State @ " + moment().format() + " \n";
	                })
	                .removeClass("alert-success")
	                .addClass("alert-warning")
	                .scrollTop($("#docStatus")[0].scrollHeight);
	            alert("alert 6");
	        } else {
	            $("#docStatus")
	                .val(function(i, v) {
	                    return v + "Initial Active State @ " + moment().format() + " \n";
	                })
	                .addClass("alert-success")
	                .removeClass("alert-warning")
	                .scrollTop($("#docStatus")[0].scrollHeight);
	            alert("alert 7");
	        } */


	        //For demo purposes, display the actual timeout on the page
	        $("#docTimeout").text(docTimeout / 1000);
	    }

	    return {
	        //main function to initiate the module
	        init: function() {
	            _init();
	        }
	    };
	}();

	jQuery(document).ready(function() {
	    KTIdleTimerDemo.init();
	});
  </script>
 </head>

 <body >
  <div class="btn-group mb-10">
    <a href="javascript:;" id="btPause" class="btn btn-outline-secondary">Pause</a>
    <a href="javascript:;" id="btResume" class="btn btn-outline-secondary">Resume</a>
    <a href="javascript:;" id="btElapsed" class="btn btn-outline-secondary">Elapsed</a>
    <a href="javascript:;" id="btInit" class="btn btn-outline-secondary">Init</a>
    <a href="javascript:;" id="btDestroy" class="btn btn-outline-secondary">Destroy</a>
</div>
<textarea id="docStatus" class="form-control"></textarea><br />
 </body>

</html>
<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>