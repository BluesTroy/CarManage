<div class="container-fluid">
    <g:form name="warehouseForm" url="[controller: 'warehouse', action: 'save']" useToken="true">
        <g:hiddenField name="id" value="${warehouse?.id}"/>
        <g:hiddenField id="domainAction" name="domainAction" value="${action}"/>

    %{--<g:domainError model="${systemRole}"/>--}%
        <div class="row">

            <div class="form-group col-md-3">
                <label for="warehouseName">仓库名</label>
                <input id="warehouseName" class="form-control" type="text" placeholder="必填项"
                       name="warehouseName" value="${warehouse?.warehouseName}">
            </div>
            <div class="form-group col-md-3">
                <label for="warehouseAddress">仓库地址</label>
                <input id="warehouseAddress" class="form-control" type="text" placeholder="必填项"
                       name="warehouseAddress" value="${warehouse?.warehouseAddress}">
            </div>
            <div class="form-group col-md-3">
                <label for="maxInventory">最大库存量</label>
                <input id="maxInventory" class="form-control" type="text" placeholder="必填项"
                       name="maxInventory" value="${warehouse?.maxInventory}">
            </div>
            <div class="form-group col-md-3">
                <label for="nowInventory">现存量</label>
                <input id="nowInventory" class="form-control" type="text" placeholder="必填项"
                       name="nowInventory" value="${warehouse?.nowInventory}">
            </div>
        </div>
    </g:form>
</div>