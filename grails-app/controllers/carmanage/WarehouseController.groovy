package carmanage

import grails.converters.JSON

class WarehouseController {

    static layout = "main"

    def warehouseService

    def loadPage() {
        def result = search(params)
        render(template: "/${controllerName}/table_list",
                model:[warehouseList:result.warehouseList, total: result.total])
    }

    protected def search(params) {
        if (!params.max) params.max = 2
        if (!params.offset) params.offset = 0
        if (!params.order) params.order = 'desc'
        if (!params.sort) params.sort = 'dateCreated'

        def searchClosure = {
            if (params.warehouseCode) {
                like('warehouseCode', "%${params.warehouseCode}%")
            }
            if (params.warehouseName) {
                like('warehouseName', "%${params.warehouseName}%")
            }
        }

        def c = Warehouse.createCriteria()
        def warehouseList = c.list(params,searchClosure)
        [warehouseList:warehouseList, total: warehouseList.totalCount]


    }

    def index() {
        search(params)
    }

    def create(){
        def warehouse = new Warehouse()
        render(template: "/${controllerName}/form",
                model:[warehouse: warehouse, action:actionName])
    }

    def edit() {
        render(template: "/${controllerName}/form",
                model: [warehouse: Warehouse.get(params.id), action: actionName])
    }

    def save() {
        def haserror = false
        def message = new StringBuffer()
        def warehouse

        log.error(params)
        println("testttttttttttttttttttttttttttt")
        println(actionName)
        println(params.domainAction)
        if (params.domainAction == 'edit') {
            warehouse = Warehouse.get(params.id)
            warehouse.properties = params
        } else if (params.domainAction == 'create') {
            warehouse = new Warehouse(params)
            warehouse.warehouseCode = new Date().getTime().toString()
            println(".....cccccccccccccccccc")
        }
        if (!warehouse.validate()) {
            haserror = true
            message.append(g.domainError([model:warehouse]))
        } else {
            warehouseService.save(warehouse)
            message.append('操作成功')
        }
        render(contentType: "application/json", encoding: "UTF-8") {
            def result = ["status" : haserror ? "failed" : "success",
                          "message": message]
            render result as JSON

        }

    }

    def delete() {
        def warehouse = Warehouse.get(params.id)
        warehouse.delete(flush:true)
        render(contentType:'application/json'){
            def result=['status':'success','message':'操作成功']
            render result as JSON
        }

    }
}
