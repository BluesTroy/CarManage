package carmanage

import grails.transaction.Transactional

@Transactional
class CarInfoService {

    def save(carInfo) {
        if(!carInfo.validate()){
//            throw new ValidationException("保存失败", carInfo.errors)
        }else {
            carInfo.save()
        }
    }
}
