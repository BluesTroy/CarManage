<%@ page import="carmanage.Customer; carmanage.Salesman" %>
<div class="container-fluid">
    <g:form name="orderInfoForm" url="[controller: 'orderInfo', action: 'save']" useToken="true">
        <g:hiddenField name="id" value="${orderInfo?.id}"/>
        <g:hiddenField id="domainAction" name="domainAction" value="${action}"/>

    %{--<g:domainError model="${systemRole}"/>--}%
        <div class="row">
            <g:if test="${action == 'edit'}">
                <div class="form-group col-md-3">
                    <label for="orderCode">订单编号</label>
                    <span id="orderCode">${orderInfo?.orderCode}</span>
                </div>
            </g:if>
            <div class="form-group col-md-3">
                <label for="orderTime">下单时间</label>
                <g:datePicker id="orderTime" name="orderTime" class="form-control" value="${orderInfo.orderTime}"
                              precision="minute"/>
            </div>

            <div class="form-group col-md-3">
                <label for="outTime">出库时间</label>
                <g:datePicker id="outTime" name="outTime" class="form-control" value="${orderInfo.outTime}"
                              precision="minute"/>
            </div>

            <div class="form-group col-md-3">
                <label for="saleNumber">销售总数</label>
                <input id="saleNumber" class="form-control" type="text" placeholder="必填项"
                       name="saleNumber" value="${orderInfo?.saleNumber}">
            </div>

            <div class="form-group col-md-3">
                <label for="totalPrice">总价格</label>
                <input id="totalPrice" class="form-control" type="text" placeholder="必填项"
                       name="totalPrice" value="${orderInfo?.totalPrice}">
            </div>

            <div class="form-group col-md-3">
                <label for="status">订单状态</label>
                <g:select id="status" name="status" class="form-control"
                          noSelection="['': '请选择...']" from="${['未付款', '已付款', '待出库', '已结单', '已退货', '已退款']}"
                          keys="['1', '2', '3', '4', '5', '6']"/>
            </div>

            <div class="form-group col-md-3">
                <label for="payTime">支付时间</label>
                <g:datePicker id="payTime" name="payTime" class="form-control" value="${orderInfo.payTime}"
                              precision="minute"/>
            </div>

            <div class="form-group col-md-3">
                <label for="finishTime">完成时间</label>
                <g:datePicker id="finishTime" name="finishTime" class="form-control" value="${orderInfo.finishTime}"
                              precision="minute"/>
            </div>

            <div class="form-group col-md-3">
                <label for="salesman">销售员</label>
                <g:select id="salesman" name="salesman" class="form-control" from="${carmanage.Salesman.list()}"
                          noSelection="['': '请选择...']" optionKey="id" optionValue="realName"/>
            </div>

            <div class="form-group col-md-3">
                <label for="customer">客户</label>
                <g:select id="customer" name="customer" class="form-control" from="${carmanage.Customer.list()}"
                          noSelection="['': '请选择...']" optionKey="id" optionValue="name"/>
            </div>

        </div>
    </g:form>
    <g:if test="${action != 'create'}">
        <div id="orderDetailContainer">
            <g:render template="orderDetail_list"/>
        </div>
    </g:if>
</div>