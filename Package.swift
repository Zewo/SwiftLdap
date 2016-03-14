import PackageDescription

#if os(OSX)
	
#else
 //waiting for new SPM to include c lib in same project
#endif




let package = Package(
	name: "SwiftLdap",
	dependencies: [
		// .Package(url: "../cldap", majorVersion: 0, minor: 1),
	]
)