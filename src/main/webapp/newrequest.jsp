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

            <h1>Request new hardware</h1>

            <p>
            <div id="responseMessage">
            </div>

            <div id="frmNewHWR">
            <form action="#">
                <fieldset>
                    <legend>HWR</legend>
                    <table>
                        <tr><td width="170"><label for="days">Days: </label></td><td><input name="map_days" id="days" type=”text”></td></tr>
                        <tr><td width="170"><label for="numberOfHost">Number of hosts: </label></td><td><input name="map_number" id="numberOfHost" type=”text”></td></tr>
                        <tr><td width="170"><label for="hostSize">Host size: </label></td><td><select name="map_size" id="hostSize">
                            <option value="1">Small</option>
                            <option value="2">Medium</option>
                            <option value="3">Large</option>
                            <option value="4">Extra Large</option>
                        </select></td></tr>
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
            var theUrl = '/business-central/rest/runtime/it.sogei.bpm:provisioning:1.0-SNAPSHOT/process/provisioning.richiesta_hw/start?';
            theUrl = theUrl + 'map_days=s' + $("#days").val();
            theUrl = theUrl + '&map_number=s' + $("#numberOfHost").val();
            theUrl = theUrl + '&map_size=s' + $("#hostSize").val();
            theUrl = theUrl + '&map_user=' + '<%= principal.getName() %>';

            $.ajax({
                url: theUrl,
                type: 'POST',
                data: {},
                dataType: 'json',
                complete: function(response, status, xhr){
                    var data = jQuery.parseJSON(response.responseText);
                    //alert('Request id: '+data.id);
                    $("#responseMessage").html('<span style="color: #33aa33; font-size:14pt;">New hardware request submitted successfully.<br/>Transaction ID #' + data.id + '</span><br><input type="button" value="Another request" onclick="anotherRequest();">');
                    $("#frmNewHWR").hide();

                }
            })

        })
    });

    function anotherRequest() {
        $("#responseMessage").html('');
        $("#frmNewHWR").show();
    }

</script>

</body>
</html>
