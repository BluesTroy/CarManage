<%@ page import="carmanage.Supplier; carmanage.CarInfo" %>
<div class="container-fluid">
    <g:form name="purchaseOrderForm" url="[controller: 'purchaseOrder', action: 'save']" useToken="true">
        <g:hiddenField name="id" value="${purchaseOrder?.id}"/>
        <g:hiddenField id="domainAction" name="domainAction" value="${action}"/>

        <div class="row">

            <div class="form-group col-md-3">
                <label for="orderCode">订单编号</label>
                <g:if test="${action == 'edit'}">
                    <span id="orderCode">${purchaseOrder?.orderCode}</span>
                </g:if>
                <g:else>
                    <input id="orderCode" class="form-control" type="text" placeholder="必填项"
                           name="orderCode" value="${purchaseOrder?.orderCode}">
                </g:else>
            </div>

            <div class="form-group col-md-3">
                <label for="carInfo">汽车编号</label>
                <g:select id="carInfo" name="carInfo" class="form-control" from="${carmanage.CarInfo.list()}"
                    noSelection="['':'请选择...']" optionKey="id" optionValue="carCode" value="${purchaseOrder?.carInfo.id}"/>
            </div>

            <div class="form-group col-md-3">
                <label for="carNumber">汽车数量</label>
                <input id="carNumber" class="form-control" type="text" placeholder="必填项"
                       name="carNumber" value="${purchaseOrder?.carNumber}">
            </div>

            <div class="form-group col-md-3">
                <label for="singlePrice">进货单价</label>
                <input id="singlePrice" class="form-control" type="text" placeholder="必填项"
                       name="singlePrice" value="${purchaseOrder?.singlePrice}">
            </div>

            <div class="form-group col-md-3">
                <label for="totalPrice">进货总价</label>
                <input id="totalPrice" class="form-control" type="text" placeholder="必填项"
                       name="totalPrice" value="${purchaseOrder?.totalPrice}">
            </div>

            <div class="form-group col-md-3">
                <label for="orderTime">订单时间</label>
                <g:datePicker id="orderTime" name="orderTime" class="form-control" value="${purchaseOrder.orderTime}"
                              precision="minute"/>
            </div>

            <div class="form-group col-md-3">
                <label for="supplier">供应商</label>
                <g:select id="supplier" name="supplier" class="form-control" from="${carmanage.Supplier.list()}"
                          noSelection="['':'请选择...']" optionKey="id" optionValue="supplierName" value="${purchaseOrder?.supplier.id}"/>
            </div>

            <div class="form-group col-md-3">
                <label for="storageStatus">入库状态</label>
                <g:radioGroup id="storageStatus" name="storageStatus" values="[true, false]" labels="['是','否']"
                              value="${purchaseOrder?.storageStatus}">
                    <span>${it.label} ${it.radio}</span>
                </g:radioGroup>
            </div>

            <div class="form-group col-md-3">
                <label for="storageTime">入库状态</label>
                <g:datePicker id="storageTime" name="storageTime" class="form-control" value="${purchaseOrder.storageTime}"
                              precision="minute"/>
            </div>

        </div>
    </g:form>
</div>