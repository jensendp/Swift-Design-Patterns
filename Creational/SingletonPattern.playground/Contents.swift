class Configuration {
    var connectionString: String = "Some fancy connection string"
    var timeout: Int = 1000
    
    static let instance = Configuration()
    
    private init() {}
    
}

Configuration.instance.connectionString
Configuration.instance.timeout

Configuration.instance.connectionString = "Something else!"

Configuration.instance.connectionString