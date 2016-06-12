package carmanage

import grails.transaction.Transactional

@Transactional
class SystemRoleService {

    def save(systemRole) {
        if(!systemRole.validate()){
//            throw new ValidationException("保存失败", systemRole.errors)
        }else {
            systemRole.save()
        }
    }
}
