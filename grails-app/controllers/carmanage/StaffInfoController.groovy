package carmanage

import grails.converters.JSON

class StaffInfoController {

    static layout = "main"

    def staffInfoService

    def loadPage() {
        def result = search(params)
        render(template: "/${controllerName}/table_list",
                model:[staffInfoList:result.staffInfoList, total: result.total])
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
            if (params.description) {
                like('realName', "%${params.realName}%")
            }
        }

        def c = StaffInfo.createCriteria()
        def staffInfoList = c.list(params,searchClosure)
        [staffInfoList:staffInfoList, total: staffInfoList.totalCount]


    }

    def index() {
        search(params)
    }

    def create(){
        def staffInfo = new StaffInfo()
        render(template: "/${controllerName}/form",
                model:[staffInfo: staffInfo, action:actionName])
    }

    def edit() {
        render(template: "/${controllerName}/form",
                model: [staffInfo: StaffInfo.get(params.id), action: actionName])
    }

    def save() {
        def haserror = false
        def message = new StringBuffer()
        def staffInfo

        log.error(params)
        println(actionName)
        println(params.domainAction)
        if (params.domainAction == 'edit') {
            staffInfo = StaffInfo.get(params.id)
            staffInfo.properties = params
        } else if (params.domainAction == 'create') {
            staffInfo = new StaffInfo(params)
        }
        if (!staffInfo.validate()) {
            haserror = true
            message.append(g.domainError([model:staffInfo]))
        } else {
            staffInfoService.save(staffInfo)
            message.append('操作成功')
        }
        render(contentType: "application/json", encoding: "UTF-8") {
            def result = ["status" : haserror ? "failed" : "success",
                          "message": message]
            render result as JSON

        }

    }

    def delete() {
        def staffInfo = StaffInfo.get(params.id)
        staffInfo.delete(flush:true)
        render(contentType:'application/json'){
            def result=['status':'success','message':'操作成功']
            render result as JSON
        }

    }
}
