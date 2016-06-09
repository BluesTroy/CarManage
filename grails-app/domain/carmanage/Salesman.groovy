package carmanage

class Salesman {

    String id
    String dateCreated
    String lastUpdate
    String createUser
    String updateUser

    String staffCode
    String realName
    short sex
    java.sql.Date birthday
    String telephone
    String phone
    String email

    static constraints = {
        staffCode nullable: false, maxSize: 20
        realName nullable: false, maxSize: 20
        sex nullable: false
        birthday nullable: true
        telephone nullable: false, maxSize: 11
        phone nullable: true, maxSize: 16
        email nullable: false, maxSize: 50

    }

    static mapping = {
        id generator: 'uuid.hex'
    }
}
