<div class="container-fluid">
    <g:form name="salesmanForm" url="[controller: 'salesman', action: 'save']" useToken="true">
        <g:hiddenField name="id" value="${salesman?.id}"/>
        <g:hiddenField id="domainAction" name="domainAction" value="${action}"/>

    %{--<g:domainError model="${systemRole}"/>--}%
        <div class="row">

            <div class="form-group col-md-3">
                <label for="staffCode">工号</label>
                <g:if test="${action=='edit'}">
                    <span>${salesman?.staffCode}</span>
                </g:if>
                <g:else>
                <input id="staffCode" class="form-control" type="text" placeholder="必填项"
                       name="staffCode" value="${salesman?.staffCode}">
                </g:else>
            </div>
            <div class="form-group col-md-3">
                <label for="realName">姓名</label>
                <input id="realName" class="form-control" type="text" placeholder="必填项"
                       name="realName" value="${salesman?.realName}">
            </div>
            <div class="form-group col-md-3">
                <label for="sex">性别</label>
                <g:radioGroup id="sex" name="sex" values="[true, false]" labels="['男','女']"
                    value="${salesman?.sex}">
                  <span>${it.label} ${it.radio}</span>
                </g:radioGroup>
            </div>
            <div class="form-group col-md-3">
                <label for="birthday">出生年月</label>
                <g:datePicker id="birthday" name="birthday" class="form-control" value="${salesman.birthday}"
                    precision="day" />
            </div>
            <div class="form-group col-md-3">
                <label for="telephone">手机</label>
                <input id="telephone" class="form-control" type="text" placeholder="必填项"
                       name="telephone" value="${salesman?.telephone}">
            </div>
            <div class="form-group col-md-3">
                <label for="phone">工作电话</label>
                <input id="phone" class="form-control" type="text" placeholder="必填项"
                       name="phone" value="${salesman?.phone}">
            </div>
            <div class="form-group col-md-3">
                <label for="email">工作邮箱</label>
                <input id="email" class="form-control" type="email" placeholder="123@163.com"
                       name="email" value="${salesman?.email}">
            </div>
        </div>
    </g:form>
</div>