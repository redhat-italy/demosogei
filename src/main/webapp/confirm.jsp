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

        <% String taskId = request.getParameter("taskId"); %>
        <% Principal principal = request.getUserPrincipal(); %>
        <%  if (principal != null){ %>
        <p style="margin-right: 200px;;text-align:right">User: <strong><%= principal.getName() %></strong> | <a href="index.html">home</a> | <a href="logout">logout</a></p>
        <%  } %>

        <div class="section">

            <h1>Confirm before proceed</h1>

            <p>
            <div id="responseMessage">
            </div>

            <div id="frmConfirm">
            <form action="#">
                <fieldset>
                    <legend>Confirm</legend>
                    <table>
                        <tr><td width="170"><p>Task Id: </p></td><td><p><b><%= taskId %></b></p></td></tr>
                        <tr><td width="170"><label for="note">Add a note: </label></td><td><textarea rows="4" cols="50"  name="note" id="note" type=”text”></textarea></td></tr>
                        <tr><td width="170" align="right"><input type="reset" value="Reset"></td><td><input type="button" value="Send" id="btnSubmit"></td></tr>
                    </table>
                </fieldset>
            </form>
            </div>
            </p>

        </div>

    </div>


    <div id="footer">&nbsp;</div>

</div>

<script type="application/javascript">

    $(document).ready(function(){
        $("#btnSubmit").click(function() {
            var baseUrl = '/business-central/rest/task/<%= taskId %>/';
            var cmplUrl = baseUrl + 'complete?map_note_by_revisor=' + $("#note").val();
            var strtUrl = baseUrl + 'start';

            $.ajax({
                url: strtUrl,
                type: 'POST',
                data: {},
                dataType: 'json',
                complete: function(response, status, xhr){
                }
            });

            $.ajax({
                url: cmplUrl,
                type: 'POST',
                data: {},
                dataType: 'json',
                complete: function(response, status, xhr){
                    var data = jQuery.parseJSON(response.responseText);
                    //alert('Request id: '+data.id);
                    $("#frmConfirm").hide();
                    $("#responseMessage").html('<span style="color: #33aa33; font-size:14pt;">Task successfully completed.<br/>Transaction ID #' + <%= taskId %> + ' is now running over.</span><br><a href="tasklist.jsp">go back to task list</a>');
                }
            });

        })
    });

</script>

</body>
</html>
