Class {
	#name : #CdPathMethodAccess,
	#superclass : #CdPathAccess,
	#instVars : [
		'callMethod'
	],
	#category : #'Cadmium-token'
}

{ #category : #'instance creation' }
CdPathMethodAccess class >> for: method on: pathSegments [
	^ (self new) callMethod: method;
		callSegments: pathSegments;
		yourself.
]

{ #category : #accessing }
CdPathMethodAccess >> callMethod [
	^ callMethod
]

{ #category : #accessing }
CdPathMethodAccess >> callMethod: aString [
	callMethod := aString.
]

{ #category : #testing }
CdPathMethodAccess >> canAccess: request [
	^ (request method = callMethod) ifFalse: [ false ]
	ifTrue: [ super canAccess: request ].
]

{ #category : #testing }
CdPathMethodAccess >> to: aDictionary [
	super to: aDictionary.
	aDictionary at: 'method' put: callMethod.
	^ aDictionary.
]
