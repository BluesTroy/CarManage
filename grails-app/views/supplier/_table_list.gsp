<div class="box box-primary">
    <div class="box-body table-responsive no-padding">
        <table id="supplierTable" class="table table-hover table-bordered table-striped table-condensed">
            <thead>
            <tr>
                <th>商户代码</th>
                <th>商户名称</th>
                <th>电话</th>
                <th>联系人姓名</th>
                <th>联系人电话</th>
                <th>联系人邮箱</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="domainTableTbody">
            <g:each in="${supplierList}">
                <tr id="tr_${it.id}" onclick="showSupplier('${it.id}')" class="cursorPointer">
                    <td id="td_supplierCode_${it.id}">${it.supplierCode}</td>
                    <td id="td_supplierName_${it.id}">${it.supplierName}</td>
                    <td>${it.telephone}</td>
                    <td>${it.contactsName}</td>
                    <td>${it.contactsTelephone}</td>
                    <td>${it.contactsEmail}</td>
                    <td id="td_dateCreated_${it.id}">${it.dateCreated}</td>
                    <td id="td_operate_${it.id}" width="100px">
                        <button class="btn btn-default btn-xs" type="button"
                                onclick="delSupplier('${it.id}')">删除</button>
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
                    <g:paginate controller="supplier" action="index" total="${total}"
                                params='[order: "desc", sort: "dateCreated"]'/>
                </div>
            </div>
        </div>
    </div>
</div><!-- /.box -->
