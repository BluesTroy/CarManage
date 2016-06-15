package carmanage

class Warehouse {
    String id
    Date dateCreated
    Date lastUpdate
    String createUser
    String updateUser

    String warehouseCode
    Integer maxInventory
    Integer nowInventory
    String warehouseName
    String warehouseAddress
    String memo

    static constraints = {
        warehouseCode nullable: false,maxSize: 20
        maxInventory nullable: false
        nowInventory nullable: false
        warehouseName nullable: false, maxSize: 20
        warehouseAddress nullable: false, maxSize: 100
        memo nullable: true, maxSize: 100
    }

    static mapping = {
        id generator: 'uuid.hex'
    }
}
