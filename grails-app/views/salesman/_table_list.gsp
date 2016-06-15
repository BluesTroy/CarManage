<div class="box box-primary">
    <div class="box-body table-responsive no-padding">
        <table id="salesmanTable" class="table table-hover table-bordered table-striped table-condensed">
            <thead>
            <tr>
                <th>工号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>手机</th>
                <th>工作电话</th>
                <th>工作邮箱</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="domainTableTbody">
            <g:each in="${salesmanList}">
                <tr id="tr_${it.id}" onclick="showSalesman('${it.id}')" class="cursorPointer">
                    <td id="td_staffCode_${it.id}">${it.staffCode}</td>
                    <td>${it.realName}</td>
                    <td><g:sexToString key="${it.sex}"/></td>
                    <td>${it.telephone}</td>
                    <td>${it.phone}</td>
                    <td>${it.email}</td>
                    <td id="td_dateCreated_${it.id}">${it.dateCreated}</td>
                    <td id="td_operate_${it.id}" width="100px">
                        <button class="btn btn-default btn-xs" type="button"
                                onclick="delSalesman('${it.id}')">删除</button>
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
                    <g:paginate controller="salesman" action="index" total="${total}"
                                params='[order: "desc", sort: "dateCreated"]'/>
                </div>
            </div>
        </div>
    </div>
</div><!-- /.box -->
