package carmanage

class PurchaseOrder {
    String id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String orderCode
    Integer carNumber
    Double singlePrice
    Double totalPrice
    Date orderTime
    short storageStatus
    Date storageTime
    String memo
    Supplier supplier



    static constraints = {
        orderCode nullable: false, maxSize: 20
        carNumber nullable: false
        singlePrice nullable: false, scale: 2
        totalPrice nullable: false, scale: 2
        orderTime nullable: false
        storageStatus nullable: false
        storageTime nullable: true
        memo nullable: true
    }


    static mapping = {
        id generator: 'uuid.hex'
    }
}
