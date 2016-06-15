package carmanage

import grails.converters.JSON

class OrderInfoController {

    static layout = "main"

    def orderInfoService

    def loadPage() {
        def result = search(params)
        render(template: "/${controllerName}/table_list",
                model: [orderInfoList: result.orderInfoList, total: result.total])
    }

    protected def search(params) {
        if (!params.max) params.max = 2
        if (!params.offset) params.offset = 0
        if (!params.order) params.order = 'desc'
        if (!params.sort) params.sort = 'dateCreated'

        def searchClosure = {
            if (params.orderCode) {
                like('orderCode', "%${params.orderCode}%")
            }
        }

        def c = OrderInfo.createCriteria()
        def orderInfoList = c.list(params, searchClosure)
        [orderInfoList: orderInfoList, total: orderInfoList.totalCount]


    }

    def index() {
        search(params)
    }

    def create() {
        def orderInfo = new OrderInfo()
        render(template: "/${controllerName}/form",
                model: [orderInfo: orderInfo, action: actionName])
    }

    def edit() {
        render(template: "/${controllerName}/form",
                model: [orderInfo: OrderInfo.get(params.id), action: actionName])
    }

    def save() {
        def haserror = false
        def message = new StringBuffer()
        def orderInfo

        log.error(params)
        println(actionName)
        println(params.domainAction)
        if (params.domainAction == 'edit') {
            orderInfo = OrderInfo.get(params.id)
            orderInfo.properties = params
        } else if (params.domainAction == 'create') {
            orderInfo = new OrderInfo(params)
            orderInfo.orderCode=new Date().getTime().toString()
        }
        if (!orderInfo.validate()) {
            haserror = true
            message.append(g.domainError([model: orderInfo]))
        } else {
            orderInfoService.save(orderInfo)
            message.append('操作成功')
        }
        render(contentType: "application/json", encoding: "UTF-8") {
            def result = ["status" : haserror ? "failed" : "success",
                          "message": message]
            render result as JSON

        }

    }

    def saveOrderDetail() {
        def haserror = false
        def message = new StringBuffer()
        def orderInfo
        def orderDetail

        log.error(params)


        orderInfo = OrderInfo.get(params.orderInfoId)
        orderDetail = new OrderDetail(params)
        orderDetail.singlePrice=orderDetail?.carInfo?.price
        orderDetail.totalPrice = orderDetail.singlePrice*Integer.valueOf(params.number)
        orderDetail.orderInfo = orderInfo

        if (!orderDetail.validate()) {
            haserror = true
            message.append(g.domainError([model: orderDetail]))
        } else {
            orderInfoService.saveOrderDetail(orderDetail)
            message.append('操作成功')
        }
        render(contentType: "application/json", encoding: "UTF-8") {
            def result = ["status" : haserror ? "failed" : "success",
                          "message": message, "id":orderInfo.id]
            render result as JSON

        }

    }

    def deleteOrderDetail(){
        def orderDetail = OrderDetail.get(params.id)
        def orderInfo = orderDetail.orderInfo
        orderDetail.delete(flush: true)
        render(contentType: 'application/json') {
            def result = ['status': 'success', 'message': '操作成功',id:orderInfo.id]
            render result as JSON
        }
    }

    def delete() {
        def orderInfo = OrderInfo.get(params.id)
        orderInfo.delete(flush: true)
        render(contentType: 'application/json') {
            def result = ['status': 'success', 'message': '操作成功']
            render result as JSON
        }

    }
}
