package carmanage

class StaffInfo {
    String id
    Date dateCreated
    Date lastUpdate
    String createUser
    String updateUser

    String staffCode
    String password
    String realName
    String telephone
    String phone
    String email
    SystemRole systemRole

    static constraints = {
        staffCode nullable: false,maxSize: 20
        password nullable: false, maxSize: 50
        realName nullable: false, maxSize: 50
        telephone nullable: false, maxSize: 11
        phone nullable: false, maxSize: 16
        email nullable: false, maxSize: 50

    }

    static mapping = {
        id generator: 'uuid.hex'
    }
}
