package carmanage

import grails.transaction.Transactional

@Transactional
class StaffInfoService {

    def save(staffInfo) {
        if(!staffInfo.validate()){
//            throw new ValidationException("保存失败", staffInfo.errors)
        }else {
            staffInfo.save()
        }
    }
}
