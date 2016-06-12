<div class="container-fluid">
    <g:form name="systemRoleForm" url="[controller: 'systemRole', action: 'save']" useToken="true">
        <g:hiddenField name="id" value="${systemRole?.id}"/>
        <g:hiddenField id="domainAction" name="domainAction" value="${action}"/>

        <div class="row">

            <div class="form-group col-md-3">
                <label for="roleName">角色名</label>
                <input id="roleName" class="form-control" type="text" placeholder="必填项"
                       name="roleName" value="${systemRole?.roleName}">
            </div>


            <div class="form-group col-md-8 col-md-offset-1">
                <label for="description">角色描述</label>
                <input id="description" class="form-control" type="text" placeholder="必填项"
                       name="description" value="${systemRole?.description}">
            </div>
        </div>
    </g:form>
</div>