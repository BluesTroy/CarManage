<div class="box box-primary">
    <div class="box-body table-responsive no-padding">
        <table id="orderInfoTable" class="table table-hover table-bordered table-striped table-condensed">
            <thead>
            <tr>
                <th>订单编号</th>
                <th>下单时间</th>
                <th>出库时间</th>
                <th>销售总数</th>
                <th>总价格</th>
                <th>订单状态</th>
                <th>销售员</th>
                <th>客户</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="domainTableTbody">
            <g:each in="${orderInfoList}">
                <tr id="tr_${it.id}" onclick="showOrderInfo('${it.id}')" class="cursorPointer">
                    <td id="td_orderCode_${it.id}">${it.orderCode}</td>
                    <td>${it.orderTime}</td>
                    <td>${it.outTime}</td>
                    <td>${it.saleNumber}</td>
                    <td>${it.totalPrice}</td>
                    <td><g:statusToString key="${it.status}"/></td>
                    <td>${it.salesman.realName}</td>
                    <td>${it.customer.name}</td>
                    <td id="td_operate_${it.id}" width="100px">
                        <button class="btn btn-default btn-xs" type="button"
                                onclick="delOrderInfo('${it.id}')">删除</button>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div><!-- /.box-body -->
    <div class="box-footer">
        <div class="row">
            <div class="col-md-3 pull-left paginatation-total">
                共有 <span id="domainTotalCount">${total}</span> 条记录
            </div>

            <div class="col-md-9">
                <div class="pagination pull-right">
                    <g:paginate controller="orderInfo" action="index" total="${total}"
                                params='[order: "desc", sort: "dateCreated"]'/>
                </div>
            </div>
        </div>
    </div>
</div><!-- /.box -->
