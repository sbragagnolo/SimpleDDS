query
findServiceByName: aServiceName ifNone: aBlockClosure
	^ self findServiceByName: aServiceName ifFound: [  ] ifNone: aBlockClosure