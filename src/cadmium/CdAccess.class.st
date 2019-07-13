Class {
	#name : #CdAccess,
	#superclass : #Object,
	#category : #'cadmium-token'
}

{ #category : #'instance creation' }
CdAccess class >> from: aDict [
	| type |
		type := aDict at: 'type'.
		(type = CdPathAccess asString) ifTrue: [ ^ CdPathAccess on: (aDict at: 'path') ].
		(type = CdPathMethodAccess asString) ifTrue: [ ^ CdPathMethodAccess for: (aDict at: 'method') asSymbol on: (aDict at: 'path') ].
		NotFoundError signal: type, ' is not supported as a access type'.
]

{ #category : #testing }
CdAccess >> canAccess: request [
	^ false
]

{ #category : #accessing }
CdAccess >> to: aDictionary [
	aDictionary at: 'type' put: (self class asString).
	^ aDictionary
]
