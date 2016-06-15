package carmanage

import grails.transaction.Transactional

@Transactional
class SystemParameterService {

    def save(systemParameter) {
        if(!systemParameter.validate()){
//            throw new ValidationException("保存失败", systemParameter.errors)
        }else {
            systemParameter.save()
        }
    }
}
