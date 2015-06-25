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

            <form method="POST" action="curl -X GET -H 'Accept: application/json' -uandrea 'http://bpm.local:8080/business-central/rest/task/query?potentialOwner=andrea">
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
                    <input type="hidden" name="potentialOwner" value="<%=request.getUserPrincipal().getName()%>">
                    <input type="reset" value="Reset">
                    <input type="submit" value="Send">
                </fieldset>
            </form>
            </p>

        </div>

    </div>


    <div id="footer">&nbsp;</div>

</div>

<script type="application/javascript">

    /*
     $.get( "/business-central/rest/task/query?potentialOwner=<%=request.getUserPrincipal().getName()%>", function( data ) {
         alert(data);
         populateTaskList(data);
     }, "json" );
     */

    data = {"status":null,"url":null,"index":null,"commandName":null,"taskSummaryList":[{"@class":"org.kie.services.client.serialization.jaxb.impl.task.JaxbTaskSummary","id":1,"name":"Revision","subject":"","description":"","status":"Ready","priority":0,"skipable":false,"actualOwnerId":null,"createdById":null,"createdOn":1435225345890,"activationTime":1435225345890,"expirationTime":null,"processInstanceId":3,"processId":"provisioning.richiesta_hw","processSessionId":0,"deploymentId":"it.sogei.bpm:provisioning:1.0-SNAPSHOT","quickTaskSummary":false,"parentId":-1,"potentialOwners":null},{"@class":"org.kie.services.client.serialization.jaxb.impl.task.JaxbTaskSummary","id":2,"name":"Revision","subject":"","description":"","status":"Ready","priority":0,"skipable":false,"actualOwnerId":null,"createdById":null,"createdOn":1435225355804,"activationTime":1435225355804,"expirationTime":null,"processInstanceId":4,"processId":"provisioning.richiesta_hw","processSessionId":0,"deploymentId":"it.sogei.bpm:provisioning:1.0-SNAPSHOT","quickTaskSummary":false,"parentId":-1,"potentialOwners":null},{"@class":"org.kie.services.client.serialization.jaxb.impl.task.JaxbTaskSummary","id":3,"name":"Revision","subject":"","description":"","status":"Ready","priority":0,"skipable":false,"actualOwnerId":null,"createdById":null,"createdOn":1435225366845,"activationTime":1435225366845,"expirationTime":null,"processInstanceId":5,"processId":"provisioning.richiesta_hw","processSessionId":0,"deploymentId":"it.sogei.bpm:provisioning:1.0-SNAPSHOT","quickTaskSummary":false,"parentId":-1,"potentialOwners":null}],"pageNumber":null,"pageSize":null}
    populateTaskList(data);


    function populateTaskList(data) {
        $.each(data.taskSummaryList, function (index, task) {
            $('#taskList').append('<tr onclick="claim('+task.id+');"><td>'+task.id+'</td><td>'+task.name+'</td><td>'+task.description+'</td></tr>');
        });
    }

    function claim(taskId) {
        $.post( "/business-central/rest/task/" + taskId + "/claim", function() {
            alert( "success" );
            edit(taskId);
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

    function edit(taskId) {

    }

</script>
</body>
</html>
