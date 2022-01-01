<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	String dbConnVar = "BAKESHACk";
	try {
%>
<head>
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/navbar.jsp"></jsp:include>

<script type="text/javascript"
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/jspdf.min.js"></script>

<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
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
<body id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack003.jpg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed subheader-enabled page-loading">
	
	<jsp:include page="/form/common/mobile-header.jsp"></jsp:include>
	<!--end::Header Mobile-->
	<!--Start Show Session Expire Warning Popup here -->

    <div class="modal fade" id="session-expire-warning-modal" aria-hidden="true" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">

        <div class="modal-dialog" role="document">

            <div class="modal-content">

                <div class="modal-header">                 

                    <h4 class="modal-title">Session Expire Warning</h4>

                </div>

                <div class="modal-body">

                    Your session will expire in <span id="seconds-timer"></span> seconds. Do you want to extend the session?

                </div>

                <div class="modal-footer">

                    <button id="btnOk" type="button" class="btn btn-default" style="padding: 6px 12px; margin-bottom: 0; font-size: 14px; font-weight: normal; border: 1px solid transparent; border-radius: 4px;  background-color: #428bca; color: #FFF;">Ok</button>

                    <button id="btnSessionExpiredCancelled" type="button" class="btn btn-default" data-dismiss="modal" style="padding: 6px 12px; margin-bottom: 0; font-size: 14px; font-weight: normal; border: 1px solid transparent; border-radius: 4px; background-color: #428bca; color: #FFF;">Cancel</button>

                    <button id="btnLogoutNow" type="button" class="btn btn-default" style="padding: 6px 12px; margin-bottom: 0; font-size: 14px; font-weight: normal; border: 1px solid transparent; border-radius: 4px;  background-color: #428bca; color: #FFF;">Logout now</button>

                </div>

            </div>

        </div>

    </div>

    <!--End Show Session Expire Warning Popup here -->

    <!--Start Show Session Expire Popup here -->

    <div class="modal fade" id="session-expired-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">

        <div class="modal-dialog" role="document">

            <div class="modal-content">

                <div class="modal-header">

                    <h4 class="modal-title">Session Expired</h4>

                </div>

                <div class="modal-body">

                    Your session is expired.

                </div>

                <div class="modal-footer">

                    <button id="btnExpiredOk" onclick="sessionExpiredRedirect()" type="button" class="btn btn-primary" data-dismiss="modal" style="padding: 6px 12px; margin-bottom: 0; font-size: 14px; font-weight: normal; border: 1px solid transparent; border-radius: 4px; background-color: #428bca; color: #FFF;">Ok</button>

                </div>

            </div>

        </div>

    </div>


	<!--begin::Scrolltop-->
	<div id="kt_scrolltop" class="scrolltop">
		<span class="svg-icon"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Navigation/Up-2.svg-->
			<svg xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
				height="24px" viewBox="0 0 24 24" version="1.1">
					<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
						<polygon points="0 0 24 0 24 24 0 24" />
						<rect fill="#000000" opacity="0.3" x="11" y="10" width="2"
					height="10" rx="1" />
						<path
					d="M6.70710678,12.7071068 C6.31658249,13.0976311 5.68341751,13.0976311 5.29289322,12.7071068 C4.90236893,12.3165825 4.90236893,11.6834175 5.29289322,11.2928932 L11.2928932,5.29289322 C11.6714722,4.91431428 12.2810586,4.90106866 12.6757246,5.26284586 L18.6757246,10.7628459 C19.0828436,11.1360383 19.1103465,11.7686056 18.7371541,12.1757246 C18.3639617,12.5828436 17.7313944,12.6103465 17.3242754,12.2371541 L12.0300757,7.38413782 L6.70710678,12.7071068 Z"
					fill="#000000" fill-rule="nonzero" />
					</g>
				</svg> <!--end::Svg Icon-->
		</span>
	</div>

<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/features/custom/spinners.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/main.js"></script>


	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';

	var sessServerAliveTime = 10 * 60 * 200;
	var sessionTimeout = 19 * 60000;

	
	var sessServerAliveTime = 10 * 60 * 2;
	var sessionTimeout = 1 * 60000;
	var sessLastActivity;
	var idleTimer, remainingTimer;
	var isTimout = false;

	var sess_intervalID, idleIntervalID;
	var sess_lastActivity;
	var timer;
	var isIdleTimerOn = false;
	localStorage.setItem('sessionSlide', 'isStarted');

	function sessPingServer() {
	    if (!isTimout) {
	        //$.ajax({
	        //    url: '/Admin/SessionTimeout',
	        //    dataType: "json",
	        //    async: false,
	        //    type: "POST"
	        //});

	        return true;
	    }
	}

	function sessServerAlive() {
	    sess_intervalID = setInterval('sessPingServer()', sessServerAliveTime);
	}

	function initSessionMonitor() {
	    $(document).bind('keypress.session', function (ed, e) {
	        sessKeyPressed(ed, e);
	    });
	    $(document).bind('mousedown keydown', function (ed, e) {

	        sessKeyPressed(ed, e);
	    });
	    sessServerAlive();
	    startIdleTime();
	}

	$(window).scroll(function (e) {
	    localStorage.setItem('sessionSlide', 'isStarted');
	    startIdleTime();
	});

	function sessKeyPressed(ed, e) {
	    var target = ed ? ed.target : window.event.srcElement;
	    var sessionTarget = $(target).parents("#session-expire-warning-modal").length;

	    if (sessionTarget != null && sessionTarget != undefined) {
	        if (ed.target.id != "btnSessionExpiredCancelled" && ed.target.id != "btnSessionModal" && ed.currentTarget.activeElement.id != "session-expire-warning-modal" && ed.target.id != "btnExpiredOk"
	             && ed.currentTarget.activeElement.className != "modal fade modal-overflow in" && ed.currentTarget.activeElement.className != 'modal-header'
	    && sessionTarget != 1 && ed.target.id != "session-expire-warning-modal") {
	            localStorage.setItem('sessionSlide', 'isStarted');
	            startIdleTime();
	        }
	    }
	}

	function startIdleTime() {
	    stopIdleTime();
	    localStorage.setItem("sessIdleTimeCounter", $.now());
	    idleIntervalID = setInterval('checkIdleTimeout()', 1000);
	    isIdleTimerOn = false;
	}

	var sessionExpired = document.getElementById("session-expired-modal");
	function sessionExpiredClicked(evt) {
	    window.location = "Logout.html";
	}

	sessionExpired.addEventListener("click", sessionExpiredClicked, false);
	function stopIdleTime() {
	    clearInterval(idleIntervalID);
	    clearInterval(remainingTimer);
	}

	function checkIdleTimeout() {
	     // $('#sessionValue').val() * 60000;
	    var idleTime = (parseInt(localStorage.getItem('sessIdleTimeCounter')) + (sessionTimeout)); 
	    if ($.now() > idleTime + 60000) {
	        $("#session-expire-warning-modal").modal('hide');
	        $("#session-expired-modal").modal('show');
	        clearInterval(sess_intervalID);
	        clearInterval(idleIntervalID);

	        $('.modal-backdrop').css("z-index", parseInt($('.modal-backdrop').css('z-index')) + 100);
	        $("#session-expired-modal").css('z-index', 2000);
	        $('#btnExpiredOk').css('background-color', '#428bca');
	        $('#btnExpiredOk').css('color', '#fff');

	        isTimout = true;

	        sessLogOut();

	    }
	    else if ($.now() > idleTime) {
	        ////var isDialogOpen = $("#session-expire-warning-modal").is(":visible");
	        if (!isIdleTimerOn) {
	            ////alert('Reached idle');
	            localStorage.setItem('sessionSlide', false);
	            countdownDisplay();

	            $('.modal-backdrop').css("z-index", parseInt($('.modal-backdrop').css('z-index')) + 500);
	            $('#session-expire-warning-modal').css('z-index', 1500);
	            $('#btnOk').css('background-color', '#428bca');
	            $('#btnOk').css('color', '#fff');
	            $('#btnSessionExpiredCancelled').css('background-color', '#428bca');
	            $('#btnSessionExpiredCancelled').css('color', '#fff');
	            $('#btnLogoutNow').css('background-color', '#428bca');
	            $('#btnLogoutNow').css('color', '#fff');

	            $("#seconds-timer").empty();
	            $("#session-expire-warning-modal").modal('show');

	            isIdleTimerOn = true;
	        }
	    }
	}

	$("#btnSessionExpiredCancelled").click(function () {
	    $('.modal-backdrop').css("z-index", parseInt($('.modal-backdrop').css('z-index')) - 500);
	});

	$("#btnOk").click(function () {
	    $("#session-expire-warning-modal").modal('hide');
	    $('.modal-backdrop').css("z-index", parseInt($('.modal-backdrop').css('z-index')) - 500);
	    startIdleTime();
	    clearInterval(remainingTimer);
	    localStorage.setItem('sessionSlide', 'isStarted');
	});

	$("#btnLogoutNow").click(function () {
	    localStorage.setItem('sessionSlide', 'loggedOut');
	    window.location = "Logout.html";
	    sessLogOut();
	    $("#session-expired-modal").modal('hide');

	});
	$('#session-expired-modal').on('shown.bs.modal', function () {
	    $("#session-expire-warning-modal").modal('hide');
	    $(this).before($('.modal-backdrop'));
	    $(this).css("z-index", parseInt($('.modal-backdrop').css('z-index')) + 1);
	});

	$("#session-expired-modal").on("hidden.bs.modal", function () {
	    window.location = "Logout.html";
	});
	$('#session-expire-warning-modal').on('shown.bs.modal', function () {
	    $("#session-expire-warning-modal").modal('show');
	    $(this).before($('.modal-backdrop'));
	    $(this).css("z-index", parseInt($('.modal-backdrop').css('z-index')) + 1);
	});

	function countdownDisplay() {

	    var dialogDisplaySeconds = 60;

	    remainingTimer = setInterval(function () {
	        if (localStorage.getItem('sessionSlide') == "isStarted") {
	            $("#session-expire-warning-modal").modal('hide');
	            startIdleTime();
	            clearInterval(remainingTimer);
	        }
	        else if (localStorage.getItem('sessionSlide') == "loggedOut") {         
	            $("#session-expire-warning-modal").modal('hide');
	            $("#session-expired-modal").modal('show');
	        }
	        else {

	            $('#seconds-timer').html(dialogDisplaySeconds);
	            dialogDisplaySeconds -= 1;
	        }
	    }
	    , 1000);
	};

	function sessLogOut() {
	   // $.ajax({
	   //     url: 'Logout.html',
	   //     dataType: "json",
	  //      async: false,
	  //      type: "POST"
	 //   });
	    
	    window.location = "Logout.html";
	}
	</script>
</body>
</html>

<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>