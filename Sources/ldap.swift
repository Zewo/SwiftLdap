
import ldap



public enum Errors:ErrorType {
    case SetOptionError, GetOptionError, BindError(code: ApiErrorCode)
}



public class Ldap {
    var ld: COpaquePointer = COpaquePointer()
    
    public init(_ uri: String) throws {
        let status = ldap_initialize(&ld, uri)
        if let error = ApiErrorCode(status: status) {
            throw error
        }
    }
    public func set_option<T>(optType: OptionType, value: T) throws {
        var value = value
        let status = ldap_set_option(ld, optType.rawValue, &value)
        guard status==LDAP_OPT_SUCCESS else {
            throw Errors.SetOptionError
        }
    }
    public func get_option<T>(optType: OptionType, allocBytes: Int=1) throws -> T {
        let resultP = UnsafeMutablePointer<Void>.alloc(allocBytes)
        let status = ldap_get_option(ld, optType.rawValue, resultP)
        guard status==LDAP_OPT_SUCCESS else {
            throw Errors.GetOptionError
        }
        let r = UnsafeMutablePointer<T>(resultP)
        let value: T = r.memory
        resultP.dealloc(allocBytes)
        resultP.destroy()
        return value
    }
    public func search_s(){
        
    }
    deinit {
        unbind()
    }
    private func unbind() {
        let status = ldap_unbind(ld)
        print(status)
    }
    public func simple_bind_s(who: String, passwd: String = "") throws -> ResultCode {
        let result = ldap_simple_bind_s(ld, who, passwd)
        if let error = ApiErrorCode(status: result) {
            throw Errors.BindError(code: error)
        }
        return ResultCode(status: result)!
    }
}

