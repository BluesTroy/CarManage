<div class="container-fluid">
    <g:form name="systemParameterForm" url="[controller: 'systemParameter', action: 'save']" useToken="true">
        <g:hiddenField name="id" value="${systemParameter?.id}"/>
        <g:hiddenField id="domainAction" name="domainAction" value="${action}"/>

        <div class="row">

            <div class="form-group col-md-3">
                <label for="parameterName">参数名</label>
                <input id="parameterName" class="form-control" type="text" placeholder="必填项"
                       name="parameterName" value="${systemParameter?.parameterName}">
            </div>

            <div class="form-group col-md-3">
                <label for="parameterValue">参数值</label>
                <input id="parameterValue" class="form-control" type="text" placeholder="必填项"
                       name="parameterValue" value="${systemParameter?.parameterValue}">
            </div>

            <div class="form-group col-md-6">
                <label for="description">参数描述</label>
                <input id="description" class="form-control" type="text" placeholder="必填项"
                       name="description" value="${systemParameter?.description}">
            </div>
        </div>
    </g:form>
</div>