
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
<html>    
    <head>
        <title>Angular UI Progress Bar</title>
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular.min.js"></script>
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular-animate.min.js"></script>
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular-loader.min.js"></script>
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular-sanitize.min.js"></script>
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular-cookies.min.js"></script>
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular-touch.min.js"></script>
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular-resource.min.js"></script>
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/0.14.3/ui-bootstrap.min.js"></script>
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/0.14.3/ui-bootstrap-tpls.min.js"></script>
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.2.13/angular-ui-router.min.js"></script>
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui/0.4.0/angular-ui-ieshiv.min.js"></script>
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui/0.4.0/angular-ui.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <script type='text/javascript' src="script.js"></script>
        <script type='text/javascript' src="https://rawgit.com/long2know/angular-demos-general/master/ui-progress-bar/timerService.js"></script>
        <script type='text/javascript' src="https://rawgit.com/long2know/angular-dialog-service/master/src/dialogService.js"></script>
    </head>    
    <body ng-app="myApp">
        <div ng-include="'menu.html'"></div>              

<div ng-controller="myCtrl as vm" class="container">
    <form class="form-inline" name="vm.form" role="form" novalidate>
        <div class="form-group">
            <div class="form-group" ng-class="{ 'has-error': vm.form.progressSeconds.$error }">
                <label>Total Seconds</label>
                <input name="progressSeconds" type="number" class="form-control" ng-model="vm.progressSeconds" />
            </div>
            <div class="form-group" ng-class="{ 'has-error': vm.form.progressUpdateInterval.$error }">
                <label>Update Interval</label>
                <input name="progressUpdateInterval" type="number" class="form-control" ng-model="vm.progressUpdateInterval" />
            </div>
        </div>
        </form>
<br/>
    <uib-progressbar class="progress-striped active" animate="false" value="vm.percentage" type="success"><b>{{vm.percentage}}%</b></uib-progressbar>
    <label>Seconds</label>&nbsp;&nbsp;<span ng-bind="vm.counter"></span>
    <br/>
    <button ng-click="vm.resetCounter()">Reset Timer</button>
</div>
<style>

.modal-dialog {
    margin-top: 20px;
}

.progress {
  height: 4em !important;
}

.progress-bar b {
  line-height: 4.5em !important;
}



</style>
<script type="text/ng-template" id="modalGeneral.html">
    <div class="modal-header">
        <h3 ng-bind-html="modalHeader"></h3>
    </div>
    <div class="modal-body" ng-bind-html="modalBody"></div>
    <div class="modal-footer">
        <input class="btn" type="button" ng-show="hasCancel" data-ng-click="cancel()" value="Cancel">
        <button class="btn btn-primary" ng-click="ok()">Ok</button>
    </div>
</script>
        
        <script type="text/ng-template" id="menu.html">
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <div class="navbar-header">
                <img class="navbar-brand" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/15309/angular-logo.svg" />
                    <span class="navbar-brand">Progress Bar Demo</span>
                </div>
              </div>
            </nav>
        </script>
    </body>
</html>

<script>

(function () {
    var long2know;
    try {
        long2know = angular.module("long2know")
    } catch (err) {
        long2know = null;
    }

    if (!long2know) {
        angular.module('long2know.services', ['ngResource', 'ngAnimate']);
        angular.module('long2know.controllers', []);
        angular.module('long2know.directives', []);
        angular.module('long2know.constants', []);
        angular.module('long2know',
            [
                'long2know.services',
                'long2know.controllers',
                'long2know.directives',
                'long2know.constants'
            ]);
    }

var myCtrl = function ($scope, $sce, $timeout, $animate, $log, timerService, dialogService) {               
        var vm = this,
            myTimeout,
            max = 10, // seconds
            interval = 0.0001, // seconds
            updateSeconds,
            timestamp,
            elapsedTime,
            startCounter = function() {
                vm.counter = 0;
                vm.percentage = 0;
                timestamp = new Date() / 1000.0;
                myTimeout = $timeout(incrementCounter, updateSeconds);
                timerService.resetTimer(max);
            },
            resetCounter = function() {
                vm.progressUpdateInterval = interval = Math.max(vm.progressUpdateInterval, 0.01);                                                
                updateSeconds = interval * 1000;
                max = vm.progressSeconds;                
                $timeout.cancel(myTimeout)
                startCounter();
            },            
            incrementCounter = function() {
                vm.counter += interval;
                vm.percentage = Math.min(parseInt((vm.counter / max) * 100), 100.0);
                var currentTimestamp = new Date() / 1000.0;
                vm.counter = currentTimestamp - timestamp;
                vm.percentage = Math.min(parseInt((vm.counter / max) * 100), 100.0);
                myTimeout = $timeout(incrementCounter, updateSeconds);
            },       
            init = function() {
                vm.progressUpdateInterval = interval = Math.max(interval, 0.01);
                updateSeconds = interval * 1000;
                vm.progressSeconds = max;
                startCounter();
                vm.resetCounter = resetCounter;
                $scope.$on('timeoutExpired', function() {
                    vm.percentage = 100.0;
                    $timeout.cancel(myTimeout)
                    var modalTitle = 'Done!';
                    var modalBody = 'Your wait has ended.  Relax!';
                    dialogService.openDialog("modalGeneral.html", ['$scope', '$uibModalInstance', function ($modalScope, $uibModalInstance) {
                        $modalScope.modalHeader = $sce.trustAsHtml(modalTitle);
                        $modalScope.modalBody = $sce.trustAsHtml(dialogService.stringFormat("<p><strong>{0}</strong></p>", modalBody));
                        $modalScope.ok = function () {
                            $uibModalInstance.close();
                            makeRequest();
                        };
                        $modalScope.hasCancel = false;
                        $modalScope.cancel = function () {
                            $uibModalInstance.close();
                        };
                    }]);
                });
            },
            makeRequest = function () {
                timerService.resetTimer();
                resetCounter();
            };
        init();
    };
    
    myCtrl.$inject = ['$scope', '$sce', '$timeout', '$animate', '$log', 'timerService', 'dialogService'];
    angular
        .module('long2know.controllers')
        .controller('myCtrl', myCtrl);
        
    var myApp = angular.module('myApp', [
        'long2know.services',
        'long2know.controllers',
        'ngSanitize',
        'ui.bootstrap',
        'ui.router',
        'ui'
    ]);

    myApp.config(['$modalProvider', '$locationProvider',
        function ($modalProvider, $locationProvider) {
            $modalProvider.options = { dialogFade: true, backdrop: 'static', keyboard: false };
            $locationProvider.html5Mode(false);
        }]);

    myApp.run(['$log', function ($log) { $log.log("Start."); }]);
    
 })()





</script>




<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>