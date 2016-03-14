# SwiftLdap
libldap wrapper for swift, early beginning

Implemented:
* initialize
* bind
* unbind

###Example

```swift
let l = try Ldap("ldap://griffin.domain.com:389")

try l.setOption(.Timeout, value: 3)
try l.setOption(.NetworkTimeout, value: 2)
try l.setOption(.ProtocolVersion, value: 3)
try l.setOption(.Referrals, value: 0)

print(try l.simpleBindSync("user2@domain.com", password: "user2"))
```

Waiting for PRs

Libldap docs here http://www.openldap.org/software/man.cgi?query=ldap
