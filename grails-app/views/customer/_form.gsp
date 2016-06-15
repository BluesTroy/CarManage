<div class="container-fluid">
    <g:form name="customerForm" url="[controller: 'customer', action: 'save']" useToken="true">
        <g:hiddenField name="id" value="${customer?.id}"/>
        <g:hiddenField id="domainAction" name="domainAction" value="${action}"/>

        <div class="row">

            <div class="form-group col-md-3">
                <label for="name">姓名</label>
                <input id="name" class="form-control" type="text" placeholder="必填项"
                       name="name" value="${customer?.name}">
            </div>

            <div class="form-group col-md-3">
                <label for="sex">性别</label>
                <g:radioGroup id="sex" name="sex" values="[true, false]" labels="['男','女']"
                    value="${customer?.sex}">
                  <span>${it.label} ${it.radio}</span>
                </g:radioGroup>
            </div>

            <div class="form-group col-md-3">
                <label for="identityCard">身份证号</label>
                <input id="identityCard" class="form-control" type="text" placeholder="必填项"
                       name="identityCard" value="${customer?.identityCard}">
            </div>

            <div class="form-group col-md-3">
                <label for="birthday">出生年月</label>
                <g:datePicker id="birthday" name="birthday" class="form-control" value="${customer.birthday}"
                    precision="day" />
            </div>
            <div class="form-group col-md-3">
                <label for="telephone">手机</label>
                <input id="telephone" class="form-control" type="text" placeholder="必填项"
                       name="telephone" value="${customer?.telephone}">
            </div>
            <div class="form-group col-md-3">
                <label for="email">工作邮箱</label>
                <input id="email" class="form-control" type="email" placeholder="123@163.com"
                       name="email" value="${customer?.email}">
            </div>
            <div class="form-group col-md-3">
                <label for="address">地址</label>
                <input id="address" class="form-control" type="text" placeholder="选填项"
                       name="address" value="${customer?.address}">
            </div>
            <div class="form-group col-md-3">
                <label for="education">学历</label>
                <input id="education" class="form-control" type="text" placeholder="选填项"
                       name="education" value="${customer?.education}">
            </div>

            <div class="form-group col-md-3">
                <label for="isMember">会员</label>
                <g:radioGroup id="isMember" name="isMember" values="[true, false]" labels="['是','否']"
                              value="${customer?.isMember}">
                    <span>${it.label} ${it.radio}</span>
                </g:radioGroup>
            </div>

        </div>
    </g:form>
</div>