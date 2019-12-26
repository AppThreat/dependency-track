<%@page import="alpine.Config" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%!
    private static final String BUILD_ID = Config.getInstance().getApplicationBuildUuid();
    private static final String VERSION_PARAM = "?v=" + BUILD_ID;
%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="context-path" content="<c:out value="${pageContext.servletContext.contextPath}"/>/">
<link rel="apple-touch-icon" sizes="180x180" href="<c:url value="/images/favicons/apple-touch-icon.png"/>">
<link rel="icon" type="image/png" href="<c:url value="/images/favicons/favicon.ico"/>" sizes="32x32">
<link rel="icon" type="image/png" href="<c:url value="/images/favicons/favicon.ico"/>" sizes="16x16">
<link rel="manifest" href="<c:url value="/images/favicons/manifest.json"/>">
<link rel="mask-icon" href="<c:url value="/images/favicons/safari-pinned-tab.svg"/>" color="#5bbad5">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/><%=VERSION_PARAM%>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/bootstrap-table/bootstrap-table.min.css"/><%=VERSION_PARAM%>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/bootstrap-toggle/css/bootstrap-toggle.min.css"/><%=VERSION_PARAM%>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/bootstrap-tagsinput/bootstrap-tagsinput.css"/><%=VERSION_PARAM%>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/bootstrap-select/css/bootstrap-select.min.css"/><%=VERSION_PARAM%>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/bootstrap-daterangepicker/daterangepicker.css"/><%=VERSION_PARAM%>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/bootstrap3-editable/css/bootstrap-editable.css"/><%=VERSION_PARAM%>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/fonts/opensans/opensans.css"/><%=VERSION_PARAM%>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/fonts/dotfont/dotfont.css"/><%=VERSION_PARAM%>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/font-awesome/css/font-awesome.min.css"/><%=VERSION_PARAM%>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/d3/radar-chart.css"/><%=VERSION_PARAM%>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/d3/nv.d3.min.css"/><%=VERSION_PARAM%>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/toastr/toastr.min.css"/><%=VERSION_PARAM%>">
<link rel="stylesheet" type="text/css" href="<c:url value="/style.css"/><%=VERSION_PARAM%>">
<script type="text/javascript">
    (function() {
        if (!sessionStorage.length) {
            // Ask other tabs for session storage
            localStorage.setItem('getSessionStorage', Date.now());
        };
        window.addEventListener('storage', function (event) {
            if (event.key == 'getSessionStorage') {
                // Some tab asked for the sessionStorage -> send it
                localStorage.setItem('sessionStorage', JSON.stringify(sessionStorage));
                localStorage.removeItem('sessionStorage');
            } else if (event.key == 'sessionStorage' && !sessionStorage.length) {
                // sessionStorage is empty -> fill it
                var data = JSON.parse(event.newValue), value;
                for (key in data) {
                    sessionStorage.setItem(key, data[key]);
                }
            } else if (event.key == 'sessionInvalidate') {
                // clearing out session in the event a user clicks the logout button
                sessionStorage.clear();
                location.reload();
            }
        });
    })();
</script>
