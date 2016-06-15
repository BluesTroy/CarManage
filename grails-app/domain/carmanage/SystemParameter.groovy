package carmanage

class SystemParameter {

    String id
    Date dateCreated
    Date lastUpdate
    String createUser
    String updateUser

    String parameterName
    String parameterValue
    String description


    static constraints = {
        parameterName nullable: false, maxSize: 20
        parameterValue nullable: false, maxSize: 50
        description nullable: false, maxSize: 100

    }

    static mapping = {
        id generator: 'uuid.hex'
    }
}
