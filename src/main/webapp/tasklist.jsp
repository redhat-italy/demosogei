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

        <div class="section">

            <h1>Request new hardware</h1>

            <p>

            <form method="POST" action="/business-central/rest/runtime/it.sogei.bpm:provisioning:1.0-SNAPSHOT/process/provisioning.richiesta_hw/start">
                <fieldset>
                    <legend>HWR</legend>
                    <label for="days">Days: </label><input name="map_days" id="days" type=”text”><br/>
                    <label for="numberOfHost">Number of hosts: </label><input name="map_number" id="numberOfHost" type=”text”><br/>
                    <label for="hostSize">Host size: </label><select name="map_size" id="hostSize">
                        <option value="1">Small</option>
                        <option value="2">Medium</option>
                        <option value="3">Large</option>
                        <option value="4">Extra Large</option>
                    </select><br/>
                    <input type="hidden" name="map_user" value="<%=request.getUserPrincipal().getName()%>">
                    <input type="reset" value="Reset">
                    <input type="submit" value="Send">
                </fieldset>
            </form>
            </p>

        </div>

    </div>


    <div id="footer">&nbsp;</div>

</div>

</body>
</html>
