<%@ page import="carmanage.CarInfo" %>
<div class="box">
    <div class="box-body table-responsive no-padding">
        <table id="orderInfoTable" class="table table-hover table-bordered table-striped table-condensed">
            <thead>
            <tr>
                <th>汽车编号</th>
                <th>汽车品牌</th>
                <th>订货数量</th>
                <th>单价</th>
                <th>总价</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="domainTableTbody">
            <g:each in="${orderInfo?.orderDetails}">
                <tr id="tr_${it.id}">
                    <td>${it.carInfo.carCode}</td>
                    <td>${it.carInfo.carBrand}</td>
                    <td>${it.number}</td>
                    <td>${it.singlePrice}</td>
                    <td>${it.totalPrice}</td>
                    <td id="td_operate_${it.id}" width="100px">
                        <i class="fa fa-trash" style="cursor: pointer" title="删除"
                                onclick="delOrderDetail('${it.id}')"> </i>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div><!-- /.box-body -->
    <div class="box-footer">
        <button id="addOrderDetail" type="button" class="btn btn-info btn-sm"
                onclick="javascript:startAddOrderDetail('${orderInfo?.id}')">
            <i class="fa fa-plus"></i>
            增加订单详情
        </button>
    </div>
</div><!-- /.box -->

<div class="modal fade" id="orderDetailModal" tabindex="-1" role="dialog" aria-labelledby="orderDetailModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加订单详情</h4>
            </div>

            <div class="modal-body">
                <form id="orderDetailForm">
                    <input type="hidden" name="orderInfoId" id="orderInfoId" value=""/>

                    <div class="row">
                        <div class="col-md-6">
                            汽车编号
                            <g:select id="carInfo" name="carInfo" from="${carmanage.CarInfo.list()}"
                                noSelection="['':'请选择...']" optionKey="id" optionValue="carCode" />
                        </div>

                        <div class="col-md-6">
                            订购数量 <input id="number" type="text" name="number" placeholder="订购数量"/>
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="javascript:saveOrderDetail();">添加</button>
            </div>
        </div>
    </div>
</div>
