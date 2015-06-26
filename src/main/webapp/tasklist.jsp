<%@ page import="java.security.Principal" %>
<!DOCTYPE html>
<html>
<head>

    <title>Red Hat BPM Suite 6.1</title>
    <!-- proper charset -->
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8"/>
    <link rel="stylesheet" type="text/css" href="eap.css"/>
    <link rel="shortcut icon" href="favicon.ico"/>
    <script src="js/jquery-2.1.4.min.js"></script>
</head>

<body>

<div id="container" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px;">

    <!-- header -->
    <div class="header-panel">
        <div class="header-line">&nbsp;</div>
        <div class="header-top">
            <img class="prod-title" src="images/product_title.png"/><span class="prod-version">6</span>
        </div>
        <div class="header-bottom">&nbsp;</div>
    </div>


    <!-- main content -->
    <div id="content">

        <% Principal principal = request.getUserPrincipal(); %>
        <%  if (principal != null){ %>
        <p style="margin-right: 200px;;text-align:right">User: <strong><%= principal.getName() %></strong> | <a href="index.html">home</a> | <a href="logout">logout</a></p>
        <%  } %>

        <div class="section">

            <h1>Task list</h1>

            <p>

            <table>
                <thead>
                    <tr>
                        <th>#ID</th><th>Task</th><th>Description</th>
                    </tr>
                </thead>
                <tbody id="taskList">
                    <tr>
                        <td></td><td></td><td></td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="3">&nbsp;</th>
                    </tr>
                </tfoot>
            </table>

            <form id="frmConfirm" style="display:none" method="POST" action="confirm.jsp">
                    <input type="hidden" name="taskId" id="taskId">
            </form>
            </p>

        </div>

    </div>


    <div id="footer">&nbsp;</div>

</div>

<script type="application/javascript">

    $(document).ready(function(){
        var theUrl = '/business-central/rest/task/query?potentialOwner=<%= principal.getName() %>';

        $.ajax({
            url: theUrl,
            type: 'GET',
            data: {},
            dataType: 'json',
            complete: function(response, status, xhr){
                var data = jQuery.parseJSON(response.responseText);
                alert(data);
                populateTaskList(data);
            }
        })

    });

    function populateTaskList(data) {
        $.each(data.taskSummaryList, function (index, task) {
            var rowColor = "#ffffff"
            if (index % 2 == 0) {
                rowColor = "#999999"
            }
            $('#taskList').append('<tr style="background-color: ' + rowColor +';" onclick="claim('+task.id+');"><td>'+task.id+'</td><td>'+task.name+'</td><td>'+task.description+'</td></tr>');
        });
    }

    function claim(taskId) {
        $.post( "/business-central/rest/task/" + taskId + "/claim", function() {
            alert( "success" );
            $("#taskId").val(taskId);
            $("#frmConfirm").submit();
        })
        .done(function() {
//            alert( "second success" );
        })
        .fail(function() {
//            alert( "error" );
        })
        .always(function() {
//            alert( "finished" );
        });
    }

</script>
</body>
</html>
