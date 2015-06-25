<!DOCTYPE html>
<html>
<head>

    <title>Red Hat BPM Suite 6.1</title>
    <!-- proper charset -->
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8"/>
    <link rel="stylesheet" type="text/css" href="eap.css"/>
    <link rel="shortcut icon" href="favicon.ico"/>
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

            <form method="POST" action="/business-central/rest/runtime/it.sogei.bpm:provisioning:1.0-SNAPSHOT/process/provisioning.richiesta_hw/start?map_days=s4&map_number=s2&map_size=s3&map_user=andrea">
                <fieldset>
                    <legend>HWR</legend>
                    <label for="days">Days: </label><input id="days" type=”text”><br/>
                    <label for="numberOfHost">Number of hosts: </label><input id="numberOfHost" type=”text”><br/>
                    <label for="hostSize">Host size: </label><select id="hostSize">
                        <option value="S">Small</option>
                        <option value="M">Medium</option>
                        <option value="L">Large</option>
                        <option value="XL">Extra Large</option>
                    </select><br/>
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
