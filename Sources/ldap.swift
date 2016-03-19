
import ldap



public enum Errors:ErrorProtocol {
    case SetOptionError, GetOptionError, BindError(code: ApiErrorCode),
    InitializeError(code: ApiErrorCode), NotInitialized
}



public class Ldap {
    var ld: OpaquePointer? = nil
    public init(_ uri: String) throws {
        var ld : OpaquePointer = nil
        let status = ldap_initialize(&ld, uri)
        if let error = ApiErrorCode(status: status) {
            throw Errors.InitializeError(code: error)
        }
        self.ld = ld
    }
    public func setOption<T>(optionType: OptionType, value: T) throws {
        var value = value
        let status = ldap_set_option(ld!, optionType.rawValue, &value)
        guard status==LDAP_OPT_SUCCESS else {
            throw Errors.SetOptionError
        }
    }
    public func getOption<T>(optionType: OptionType, bytesToAlloc: Int=1) throws -> T {
        let resultP = UnsafeMutablePointer<Void>(allocatingCapacity: bytesToAlloc)
        let status = ldap_get_option(ld!, optionType.rawValue, resultP)
        guard status==LDAP_OPT_SUCCESS else {
            throw Errors.GetOptionError
        }
        let value: T = UnsafeMutablePointer<T>(resultP).pointee
        resultP.deallocateCapacity(bytesToAlloc)
        resultP.deinitialize()
        return value
    }
    deinit {
        unbind()
    }
    private func unbind() {
        guard let ld = ld else {
            return
        }
        let status = ldap_unbind(ld)
    }
    public func simpleBindSync(who: String, password: String = "") throws -> ResultCode {
        let result = ldap_simple_bind_s(ld!, who, password)
        if let error = ApiErrorCode(status: result) {
            throw Errors.BindError(code: error)
        }
        return ResultCode(status: result)!
    }
}

