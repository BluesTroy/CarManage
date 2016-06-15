package carmanage

import grails.converters.JSON

class SalesmanController {

    static layout = "main"

    def salesmanService

    def loadPage() {
        def result = search(params)
        render(template: "/${controllerName}/table_list",
                model:[salesmanList:result.salesmanList, total: result.total])
    }

    protected def search(params) {
        if (!params.max) params.max = 2
        if (!params.offset) params.offset = 0
        if (!params.order) params.order = 'desc'
        if (!params.sort) params.sort = 'dateCreated'

        def searchClosure = {
            if (params.staffCode) {
                like('staffCode', "%${params.staffCode}%")
            }
            if (params.realName) {
                like('realName', "%${params.realName}%")
            }
        }

        def c = Salesman.createCriteria()
        def salesmanList = c.list(params,searchClosure)
        [salesmanList:salesmanList, total: salesmanList.totalCount]


    }

    def index() {
        search(params)
    }

    def create(){
        def salesman = new Salesman()
        render(template: "/${controllerName}/form",
                model:[salesman: salesman, action:actionName])
    }

    def edit() {
        render(template: "/${controllerName}/form",
                model: [salesman: Salesman.get(params.id), action: actionName])
    }

    def save() {
        def haserror = false
        def message = new StringBuffer()
        def salesman

        log.error(params)
        println(actionName)
        println(params.domainAction)
        if (params.domainAction == 'edit') {
            salesman = Salesman.get(params.id)
            salesman.properties = params
        } else if (params.domainAction == 'create') {
            salesman = new Salesman(params)
        }
        if (!salesman.validate()) {
            haserror = true
            message.append(g.domainError([model:salesman]))
        } else {
            salesmanService.save(salesman)
            message.append('操作成功')
        }
        render(contentType: "application/json", encoding: "UTF-8") {
            def result = ["status" : haserror ? "failed" : "success",
                          "message": message]
            render result as JSON

        }

    }

    def delete() {
        def salesman = Salesman.get(params.id)
        salesman.delete(flush:true)
        render(contentType:'application/json'){
            def result=['status':'success','message':'操作成功']
            render result as JSON
        }

    }
}
