<%@ page import="carmanage.Warehouse" %>
<div class="container-fluid">
    <g:form name="carInfoForm" url="[controller: 'carInfo', action: 'save']" useToken="true">
        <g:hiddenField name="id" value="${carInfo?.id}"/>
        <g:hiddenField id="domainAction" name="domainAction" value="${action}"/>

    %{--<g:domainError model="${systemRole}"/>--}%
        <div class="row">

            <div class="form-group col-md-3">
                <label for="carBrand">汽车品牌</label>
                <input id="carBrand" class="form-control" type="text" placeholder="必填项"
                       name="carBrand" value="${carInfo?.carBrand}">
            </div>
            <div class="form-group col-md-3">
                <label for="carType">型号</label>
                <input id="carType" class="form-control" type="text" placeholder="必填项"
                       name="carType" value="${carInfo?.carType}">
            </div>
            <div class="form-group col-md-3">
                <label for="carColor">颜色</label>
                <input id="carColor" class="form-control" type="text" placeholder="必填项"
                       name="carColor" value="${carInfo?.carColor}">
            </div>
            <div class="form-group col-md-3">
                <label for="fuelConsumption">平均油耗</label>
                <input id="fuelConsumption" class="form-control" type="text" placeholder="必填项"
                       name="fuelConsumption" value="${carInfo?.fuelConsumption}">
            </div>
            <div class="form-group col-md-3">
                <label for="price">售价</label>
                <input id="price" class="form-control" type="text" placeholder="必填项"
                       name="price" value="${carInfo?.price}">
            </div>
            <div class="form-group col-md-3">
                <label for="inventory">库存数量</label>
                <input id="inventory" class="form-control" type="text" placeholder="必填项"
                       name="inventory" value="${carInfo?.inventory}">
            </div>
            <div class="form-group col-md-3">
                <label for="fuelConsumption">仓库</label>
                <g:select name="warehouse" class="form-control" from="${carmanage.Warehouse.list()}" noSelection="['':'请选择...']" optionKey="id"
                        optionValue="warehouseName" />
            </div>
        </div>
    </g:form>
</div>