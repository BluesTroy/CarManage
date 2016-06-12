<div class="box box-primary">
    <div class="box-body table-responsive no-padding">
        <table id="purchaseOrderTable" class="table table-hover table-bordered table-striped table-condensed">
            <thead>
            <tr>
                <th>订单编号</th>
                <th>汽车编号</th>
                <th>进货单价</th>
                <th>汽车数量</th>
                <th>进货总价</th>
                <th>订单时间</th>
                <th>供应商</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="domainTableTbody">
            <g:each in="${purchaseOrderList}">
                <tr id="tr_${it.id}" onclick="showPurchaseOrder('${it.id}')" class="cursorPointer">
                    <td id="td_orderCode_${it.id}">${it.orderCode}</td>
                    <td>${it.carInfo.carCode}</td>
                    <td>${it.singPrice}</td>
                    <td>${it.carNumber}</td>
                    <td>${it.totalPrice}</td>
                    <td>${it.orderTime}</td>
                    <td>${it.supplier.supplierName}</td>
                    <td id="td_dateCreated_${it.id}">${it.dateCreated}</td>
                    <td id="td_operate_${it.id}" width="100px">
                        <button class="btn btn-default btn-xs" type="button"
                                onclick="delPurchaseOrder('${it.id}')">删除</button>
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
                    <g:paginate controller="purchaseOrder" action="index" total="${total}"
                                params='[order: "desc", sort: "dateCreated"]'/>
                </div>
            </div>
        </div>
    </div>
</div><!-- /.box -->
