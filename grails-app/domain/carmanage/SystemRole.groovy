package carmanage

class SystemRole {

    String id
    Date dateCreated
    Date lastUpdate
    String createUser
    String updateUser

    String roleName
    String description


    static constraints = {
        roleName nullable: false, maxSize: 20
        description nullable: false, maxSize: 100

    }

    static mapping = {
        id generator: 'uuid.hex'
    }
}
