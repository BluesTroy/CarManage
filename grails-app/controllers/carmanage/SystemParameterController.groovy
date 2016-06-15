package carmanage

import grails.converters.JSON

class SystemParameterController {

    static layout = "main"

    def systemParameterService

    def loadPage() {
        def result = search(params)
        render(template: "/${controllerName}/table_list",
                model:[systemParameterList:result.systemParameterList, total: result.total])
    }

    protected def search(params) {
        if (!params.max) params.max = 2
        if (!params.offset) params.offset = 0
        if (!params.order) params.order = 'desc'
        if (!params.sort) params.sort = 'dateCreated'

        def searchClosure = {
            if (params.parameterName) {
                like('parameterName', "%${params.parameterName}%")
            }
            if (params.description) {
                like('description', "%${params.description}%")
            }
        }

        def c = SystemParameter.createCriteria()
        def systemParameterList = c.list(params,searchClosure)
        [systemParameterList:systemParameterList, total: systemParameterList.totalCount]


    }

    def index() {
        search(params)
    }

    def create(){
        def systemParameter = new SystemParameter()
        render(template: "/${controllerName}/form",
                model:[systemParameter: systemParameter, action:actionName])
    }

    def edit() {
        render(template: "/${controllerName}/form",
                model: [systemParameter: SystemParameter.get(params.id), action: actionName])
    }

    def save() {
        def haserror = false
        def message = new StringBuffer()
        def systemParameter

        log.error(params)
        println(actionName)
        println(params.domainAction)
        if (params.domainAction == 'edit') {
            systemParameter = SystemParameter.get(params.id)
            systemParameter.properties = params
        } else if (params.domainAction == 'create') {
            systemParameter = new SystemParameter(params)
        }
        if (!systemParameter.validate()) {
            haserror = true
            message.append(g.domainError([model:systemParameter]))
        } else {
            systemParameterService.save(systemParameter)
            message.append('操作成功')
        }
        render(contentType: "application/json", encoding: "UTF-8") {
            def result = ["status" : haserror ? "failed" : "success",
                          "message": message]
            render result as JSON

        }

    }

    def delete() {
        def systemParameter = SystemParameter.get(params.id)
        systemParameter.delete(flush:true)
        render(contentType:'application/json'){
            def result=['status':'success','message':'操作成功']
            render result as JSON
        }

    }
}
