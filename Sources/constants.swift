import ldap

public enum ResultCode {
    case Success, OperationsError, ProtocolError, TimelimitExceeded, SizelimitExceeded, CompareFalse, CompareTrue, AuthMethodNotSupported, StrongerAuthRequired, PartialResults, Referral, AdminlimitExceeded, UnavailableCriticalExtension, ConfidentialityRequired, SaslBindInProgress, NoSuchAttribute, UndefinedType, InappropriateMatching, ConstraintViolation, TypeOrValueExists, InvalidSyntax, NoSuchObject, AliasProblem, InvalidDnSyntax, IsLeaf, AliasDerefProblem, XProxyAuthzFailure, InappropriateAuth, InvalidCredentials, InsufficientAccess, Busy, Unavailable, UnwillingToPerform, LoopDetect, NamingViolation, ObjectClassViolation, NotAllowedOnNonleaf, NotAllowedOnRdn, AlreadyExists, NoObjectClassMods, ResultsTooLarge, AffectsMultipleDsas, VlvError, Other
    case Unknown
    init?(status: Int32) {
        switch status {
        case LDAP_SUCCESS:
            self = .Success
        case LDAP_OPERATIONS_ERROR:
            self = .OperationsError
        case LDAP_PROTOCOL_ERROR:
            self = .ProtocolError
        case LDAP_TIMELIMIT_EXCEEDED:
            self = .TimelimitExceeded
        case LDAP_SIZELIMIT_EXCEEDED:
            self = .SizelimitExceeded
        case LDAP_COMPARE_FALSE:
            self = .CompareFalse
        case LDAP_COMPARE_TRUE:
            self = .CompareTrue
        case LDAP_AUTH_METHOD_NOT_SUPPORTED, LDAP_STRONG_AUTH_NOT_SUPPORTED:
            self = .AuthMethodNotSupported
        case LDAP_STRONG_AUTH_REQUIRED, LDAP_STRONGER_AUTH_REQUIRED:
            self = .StrongerAuthRequired
        case LDAP_PARTIAL_RESULTS:
            self = .PartialResults
        case LDAP_REFERRAL:
            self = .Referral
        case LDAP_ADMINLIMIT_EXCEEDED:
            self = .AdminlimitExceeded
        case LDAP_UNAVAILABLE_CRITICAL_EXTENSION:
            self = .UnavailableCriticalExtension
        case LDAP_CONFIDENTIALITY_REQUIRED:
            self = .ConfidentialityRequired
        case LDAP_SASL_BIND_IN_PROGRESS:
            self = .SaslBindInProgress
        case LDAP_NO_SUCH_ATTRIBUTE:
            self = .NoSuchAttribute
        case LDAP_UNDEFINED_TYPE:
            self = .UndefinedType
        case LDAP_INAPPROPRIATE_MATCHING:
            self = .InappropriateMatching
        case LDAP_CONSTRAINT_VIOLATION:
            self = .ConstraintViolation
        case LDAP_TYPE_OR_VALUE_EXISTS:
            self = .TypeOrValueExists
        case LDAP_INVALID_SYNTAX:
            self = .InvalidSyntax
        case LDAP_NO_SUCH_OBJECT:
            self = .NoSuchObject
        case LDAP_ALIAS_PROBLEM:
            self = .AliasProblem
        case LDAP_INVALID_DN_SYNTAX:
            self = .InvalidDnSyntax
        case LDAP_IS_LEAF:
            self = .IsLeaf
        case LDAP_ALIAS_DEREF_PROBLEM:
            self = .AliasDerefProblem
        case LDAP_X_PROXY_AUTHZ_FAILURE:
            self = .XProxyAuthzFailure
        case LDAP_INAPPROPRIATE_AUTH:
            self = .InappropriateAuth
        case LDAP_INVALID_CREDENTIALS:
            self = .InvalidCredentials
        case LDAP_INSUFFICIENT_ACCESS:
            self = .InsufficientAccess
        case LDAP_BUSY:
            self = .Busy
        case LDAP_UNAVAILABLE:
            self = .Unavailable
        case LDAP_UNWILLING_TO_PERFORM:
            self = .UnwillingToPerform
        case LDAP_LOOP_DETECT:
            self = .LoopDetect
        case LDAP_NAMING_VIOLATION:
            self = .NamingViolation
        case LDAP_OBJECT_CLASS_VIOLATION:
            self = .ObjectClassViolation
        case LDAP_NOT_ALLOWED_ON_NONLEAF:
            self = .NotAllowedOnNonleaf
        case LDAP_NOT_ALLOWED_ON_RDN:
            self = .NotAllowedOnRdn
        case LDAP_ALREADY_EXISTS:
            self = .AlreadyExists
        case LDAP_NO_OBJECT_CLASS_MODS:
            self = .NoObjectClassMods
        case LDAP_RESULTS_TOO_LARGE:
            self = .ResultsTooLarge
        case LDAP_AFFECTS_MULTIPLE_DSAS:
            self = .AffectsMultipleDsas
        case LDAP_VLV_ERROR:
            self = .VlvError
        case LDAP_OTHER:
            self = .Other
        default:
            return nil
        }
        
    }
}




public enum ApiErrorCode: ErrorProtocol {
    case ServerDown, LocalError, EncodingError, DecodingError, Timeout, AuthUnknown, FilterError, UserCancelled, ParamError, NoMemory, ConnectError, NotSupported, ControlNotFound, NoResultsReturned, MoreResultsToReturn, ClientLoop, ReferralLimitExceeded, XConnecting
    init?(status: Int32) {
        switch status {
        case LDAP_SERVER_DOWN:
            self = .ServerDown
        case LDAP_LOCAL_ERROR:
            self = .LocalError
        case LDAP_ENCODING_ERROR:
            self = .EncodingError
        case LDAP_DECODING_ERROR:
            self = .DecodingError
        case LDAP_TIMEOUT:
            self = .Timeout
        case LDAP_AUTH_UNKNOWN:
            self = .AuthUnknown
        case LDAP_FILTER_ERROR:
            self = .FilterError
        case LDAP_USER_CANCELLED:
            self = .UserCancelled
        case LDAP_PARAM_ERROR:
            self = .ParamError
        case LDAP_NO_MEMORY:
            self = .NoMemory
        case LDAP_CONNECT_ERROR:
            self = .ConnectError
        case LDAP_NOT_SUPPORTED:
            self = .NotSupported
        case LDAP_CONTROL_NOT_FOUND:
            self = .ControlNotFound
        case LDAP_NO_RESULTS_RETURNED:
            self = .NoResultsReturned
        case LDAP_MORE_RESULTS_TO_RETURN:
            self = .MoreResultsToReturn
        case LDAP_CLIENT_LOOP:
            self = .ClientLoop
        case LDAP_REFERRAL_LIMIT_EXCEEDED:
            self = .ReferralLimitExceeded
        case LDAP_X_CONNECTING:
            self = .XConnecting
        default:
            return nil
        }
    }
}


public enum OptionType {
    case ApiInfo, Desc, Deref, Sizelimit, Timelimit, Referrals, Restart, ProtocolVersion, ServerControls, ClientControls, ApiFeatureInfo, HostName, ResultCode, ErrorNumber, DiagnosticMessage, ErrorString, MatchedDn, SspiFlags, Sign, Encrypt, SaslMethod, SecurityContext, ApiExtensionBase, DebugLevel, Timeout, Refhoplimit, NetworkTimeout, Uri, ReferralUrls, Sockbuf, Defbase, ConnectAsync, ConnectCb, SessionRefcnt, XTLS, XTLSCtx, XTLSCacertfile, XTLSCacertdir, XTLSCertfile, XTLSKeyfile, XTLSRequireCert, XTLSProtocolMin, XTLSCipherSuite, XTLSRandomFile, XTLSSslCtx, XTLSCrlcheck, XTLSConnectCb, XTLSConnectArg, XTLSDhfile, XTLSNewctx, XTLSCrlfile, XTLSPackage, XTLSIdentity, XTLSTrustedCerts, XTLSCertIdentity, XTLSPassphrase, XTLSNever, XTLSHard, XTLSDemand, XTLSAllow, XTLSTry, XTLSCrlNone, XTLSCrlPeer, XTLSCrlAll, XTLSProtocolSsl2, XTLSProtocolSsl3, XSaslMech, XSaslRealm, XSaslAuthcid, XSaslAuthzid, XSaslSsf, XSaslSsfExternal, XSaslSecprops, XSaslSsfMin, XSaslSsfMax, XSaslMaxbufsize, XSaslMechlist, XSaslNocanon, XSaslUsername, XSaslGssCreds, XGssapiDoNotFreeContext, XGssapiAllowRemotePrincipal, XKeepaliveIdle, XKeepaliveProbes, XKeepaliveInterval, PrivateExtensionBase, NoreverseLookup
    
    var rawValue: Int32 {
        switch self {
        case .ApiInfo:
            return LDAP_OPT_API_INFO
        case .Desc:
            return LDAP_OPT_DESC
        case .Deref:
            return LDAP_OPT_DEREF
        case .Sizelimit:
            return LDAP_OPT_SIZELIMIT
        case .Timelimit:
            return LDAP_OPT_TIMELIMIT
        case .Referrals:
            return LDAP_OPT_REFERRALS
        case .Restart:
            return LDAP_OPT_RESTART
        case .ProtocolVersion:
            return LDAP_OPT_PROTOCOL_VERSION
        case .ServerControls:
            return LDAP_OPT_SERVER_CONTROLS
        case .ClientControls:
            return LDAP_OPT_CLIENT_CONTROLS
        case .ApiFeatureInfo:
            return LDAP_OPT_API_FEATURE_INFO
        case .HostName:
            return LDAP_OPT_HOST_NAME
        case .ResultCode:
            return LDAP_OPT_RESULT_CODE
        case .ErrorNumber:
            return LDAP_OPT_ERROR_NUMBER
        case .DiagnosticMessage:
            return LDAP_OPT_DIAGNOSTIC_MESSAGE
        case .ErrorString:
            return LDAP_OPT_ERROR_STRING
        case .MatchedDn:
            return LDAP_OPT_MATCHED_DN
        case .SspiFlags:
            return LDAP_OPT_SSPI_FLAGS
        case .Sign:
            return LDAP_OPT_SIGN
        case .Encrypt:
            return LDAP_OPT_ENCRYPT
        case .SaslMethod:
            return LDAP_OPT_SASL_METHOD
        case .SecurityContext:
            return LDAP_OPT_SECURITY_CONTEXT
        case .ApiExtensionBase:
            return LDAP_OPT_API_EXTENSION_BASE
        case .DebugLevel:
            return LDAP_OPT_DEBUG_LEVEL
        case .Timeout:
            return LDAP_OPT_TIMEOUT
        case .Refhoplimit:
            return LDAP_OPT_REFHOPLIMIT
        case .NetworkTimeout:
            return LDAP_OPT_NETWORK_TIMEOUT
        case .Uri:
            return LDAP_OPT_URI
        case .ReferralUrls:
            return LDAP_OPT_REFERRAL_URLS
        case .Sockbuf:
            return LDAP_OPT_SOCKBUF
        case .Defbase:
            return LDAP_OPT_DEFBASE
        case .ConnectAsync:
            return LDAP_OPT_CONNECT_ASYNC
        case .ConnectCb:
            return LDAP_OPT_CONNECT_CB
        case .SessionRefcnt:
            return LDAP_OPT_SESSION_REFCNT
        case .XTLS:
            return LDAP_OPT_X_TLS
        case .XTLSCtx:
            return LDAP_OPT_X_TLS_CTX
        case .XTLSCacertfile:
            return LDAP_OPT_X_TLS_CACERTFILE
        case .XTLSCacertdir:
            return LDAP_OPT_X_TLS_CACERTDIR
        case .XTLSCertfile:
            return LDAP_OPT_X_TLS_CERTFILE
        case .XTLSKeyfile:
            return LDAP_OPT_X_TLS_KEYFILE
        case .XTLSRequireCert:
            return LDAP_OPT_X_TLS_REQUIRE_CERT
        case .XTLSProtocolMin:
            return LDAP_OPT_X_TLS_PROTOCOL_MIN
        case .XTLSCipherSuite:
            return LDAP_OPT_X_TLS_CIPHER_SUITE
        case .XTLSRandomFile:
            return LDAP_OPT_X_TLS_RANDOM_FILE
        case .XTLSSslCtx:
            return LDAP_OPT_X_TLS_SSL_CTX
        case .XTLSCrlcheck:
            return LDAP_OPT_X_TLS_CRLCHECK
        case .XTLSConnectCb:
            return LDAP_OPT_X_TLS_CONNECT_CB
        case .XTLSConnectArg:
            return LDAP_OPT_X_TLS_CONNECT_ARG
        case .XTLSDhfile:
            return LDAP_OPT_X_TLS_DHFILE
        case .XTLSNewctx:
            return LDAP_OPT_X_TLS_NEWCTX
        case .XTLSCrlfile:
            return LDAP_OPT_X_TLS_CRLFILE
        case .XTLSPackage:
            return LDAP_OPT_X_TLS_PACKAGE
        case .XTLSIdentity:
            return LDAP_OPT_X_TLS_IDENTITY
        case .XTLSTrustedCerts:
            return LDAP_OPT_X_TLS_TRUSTED_CERTS
        case .XTLSCertIdentity:
            return LDAP_OPT_X_TLS_CERT_IDENTITY
        case .XTLSPassphrase:
            return LDAP_OPT_X_TLS_PASSPHRASE
        case .XTLSNever:
            return LDAP_OPT_X_TLS_NEVER
        case .XTLSHard:
            return LDAP_OPT_X_TLS_HARD
        case .XTLSDemand:
            return LDAP_OPT_X_TLS_DEMAND
        case .XTLSAllow:
            return LDAP_OPT_X_TLS_ALLOW
        case .XTLSTry:
            return LDAP_OPT_X_TLS_TRY
        case .XTLSCrlNone:
            return LDAP_OPT_X_TLS_CRL_NONE
        case .XTLSCrlPeer:
            return LDAP_OPT_X_TLS_CRL_PEER
        case .XTLSCrlAll:
            return LDAP_OPT_X_TLS_CRL_ALL
        case .XTLSProtocolSsl2:
            return LDAP_OPT_X_TLS_PROTOCOL_SSL2
        case .XTLSProtocolSsl3:
            return LDAP_OPT_X_TLS_PROTOCOL_SSL3
        case .XSaslMech:
            return LDAP_OPT_X_SASL_MECH
        case .XSaslRealm:
            return LDAP_OPT_X_SASL_REALM
        case .XSaslAuthcid:
            return LDAP_OPT_X_SASL_AUTHCID
        case .XSaslAuthzid:
            return LDAP_OPT_X_SASL_AUTHZID
        case .XSaslSsf:
            return LDAP_OPT_X_SASL_SSF
        case .XSaslSsfExternal:
            return LDAP_OPT_X_SASL_SSF_EXTERNAL
        case .XSaslSecprops:
            return LDAP_OPT_X_SASL_SECPROPS
        case .XSaslSsfMin:
            return LDAP_OPT_X_SASL_SSF_MIN
        case .XSaslSsfMax:
            return LDAP_OPT_X_SASL_SSF_MAX
        case .XSaslMaxbufsize:
            return LDAP_OPT_X_SASL_MAXBUFSIZE
        case .XSaslMechlist:
            return LDAP_OPT_X_SASL_MECHLIST
        case .XSaslNocanon:
            return LDAP_OPT_X_SASL_NOCANON
        case .XSaslUsername:
            return LDAP_OPT_X_SASL_USERNAME
        case .XSaslGssCreds:
            return LDAP_OPT_X_SASL_GSS_CREDS
        case .XGssapiDoNotFreeContext:
            return LDAP_OPT_X_GSSAPI_DO_NOT_FREE_CONTEXT
        case .XGssapiAllowRemotePrincipal:
            return LDAP_OPT_X_GSSAPI_ALLOW_REMOTE_PRINCIPAL
        case .XKeepaliveIdle:
            return LDAP_OPT_X_KEEPALIVE_IDLE
        case .XKeepaliveProbes:
            return LDAP_OPT_X_KEEPALIVE_PROBES
        case .XKeepaliveInterval:
            return LDAP_OPT_X_KEEPALIVE_INTERVAL
        case .PrivateExtensionBase:
            return LDAP_OPT_PRIVATE_EXTENSION_BASE
        case .NoreverseLookup:
            return LDAP_OPT_NOREVERSE_LOOKUP
        }
    }
}


