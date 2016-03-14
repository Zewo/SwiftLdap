# SwiftLdap
libldap wrapper for swift, early beginning

Implemented:
* initialize
* bind
* unbind

###Example

```swift
let l = try Ldap("ldap://griffin.domain.com:389")

try l.set_option(.Timeout, value: 3)
try l.set_option(.NetworkTimeout, value: 2)
try l.set_option(.ProtocolVersion, value: 3)
try l.set_option(.Referrals, value: 0)

print(try l.simple_bind_s("user2@domain.com", passwd: "user2"))
```

Waiting for PRs

Libldap docs here http://www.openldap.org/software/man.cgi?query=ldap
