<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><g:layoutTitle default="${g.meta(['name': 'info.app.displayName'])}"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">


    %{--css--}%
    <link rel="stylesheet" href="/common/bootstrap-3.3.6-dist/css/bootstrap.css"/>
    <link rel="stylesheet" href="/common/adminlte-2.3.0/css/AdminLTE.css"/>
    <link rel="stylesheet" href="/common/adminlte-2.3.0/css/skins/skin-green.css"/>
    <link rel="stylesheet" href="/common/font-awesome-4.6.3/css/font-awesome.css"/>

    %{--<asset:stylesheet src="application.css"/>--}%
    <link rel="stylesheet" href="/common/css/application.css"/>

    %{--js--}%
    <script type="text/javascript" src="/common/js/jQuery-2.1.4.min.js"></script>
    <script type="text/javascript" src="/common/adminlte-2.3.0/js/app.js"></script>
    <script type="text/javascript" src="/common/bootstrap-3.3.6-dist/js/bootstrap.js"></script>

    <script type="text/javascript" src="/common/js/bootbox-4.4.0.min.js"></script>



    <script type="text/javascript" src="/common/js/application.js"/>

    <asset:javascript src="application.js"/>

    <g:layoutHead/>
</head>

<body class="hold-transition skin-green sidebar-mini">
%{--<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>--}%
<div class="wrapper">
    <g:render template="/layouts/main-header"/>
    <g:render template="/layouts/main-sidebar"/>
    <g:layoutBody/>
    <g:render template="/layouts/main-footer"/>
</div>
%{--<div class="footer" role="contentinfo"></div>--}%
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
</body>
</html>
