package carmanage

class Supplier {

    String id
    Date dateCreated
    Date lastUpdate
    String createUser
    String updateUser

    String supplierCode
    String supplierName
    String telephone
    String address
    String zipcode
    String description
    String licenceNumber
    String contactsName
    String contactsTelephone
    String contactsEmail
    String memo

    static constraints = {
        supplierCode nullable: false, maxSize: 20
        supplierName nullable: false, maxSize: 50
        telephone nullable: false, maxSize: 16
        address nullable: false,maxSize: 100
        zipcode nullable: true, maxSize: 8
        description nullable: true, maxSize: 500
        licenceNumber nullable: true, maxSize: 15
        contactsName nullable: false, maxSize: 20
        contactsTelephone nullable: false, maxSize: 16
        contactsEmail nullable: true, maxSize: 50
        memo nullable: true, maxSize: 100

    }

    static mapping = {
        id generator: 'uuid.hex'
    }
}
