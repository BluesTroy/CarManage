package carmanage

class Customer {

    String id
    String dateCreated
    String lastUpdate
    String createUser
    String updateUser

    String name
    String identityCard
    short sex
    java.sql.Date birthday
    String telephone
    String email
    String address
    short education
    Boolean isMember
    String memo

    static constraints = {
        name nullable: false, maxSize: 50
        identityCard nullable: false, maxSize: 18
        sex nullable: false
        birthday nullable: true
        telephone nullable: false, maxSize: 11
        email nullable: false, maxSize:50
        address nullable: true, maxSize: 100
        education nullable: true
        isMember nullable: false
        memo nullable: false, maxSize: 100

    }

    static mapping = {
        id generator: 'uuid.hex'
    }
}
