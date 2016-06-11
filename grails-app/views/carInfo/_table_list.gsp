<div class="box box-primary">
    <div class="box-body table-responsive no-padding">
        <table id="carInfoTable" class="table table-hover table-bordered table-striped table-condensed">
            <thead>
            <tr>
                <th>汽车编号</th>
                <th>品牌</th>
                <th>型号</th>
                <th>颜色</th>
                <th>平均油耗</th>
                <th>售价</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="domainTableTbody">
            <g:each in="${carInfoList}">
                <tr id="tr_${it.id}" onclick="showCarInfo('${it.id}')" class="cursorPointer">
                    <td id="td_carCode_${it.id}">${it.carCode}</td>
                    <td>${it.carBrand}</td>
                    <td>${it.carType}</td>
                    <td>${it.carColor}</td>
                    <td>${it.fuelConsumption}</td>
                    <td>${it.price}</td>
                    <td id="td_dateCreated_${it.id}">${it.dateCreated}</td>
                    <td id="td_operate_${it.id}" width="100px">
                        <button class="btn btn-default btn-xs" type="button"
                                onclick="delCarInfo('${it.id}')">删除</button>
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
                    <g:paginate controller="carInfo" action="index" total="${total}"
                                params='[order: "desc", sort: "dateCreated"]'/>
                </div>
            </div>
        </div>
    </div>
</div><!-- /.box -->
