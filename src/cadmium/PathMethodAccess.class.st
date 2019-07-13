Class {
	#name : #PathMethodAccess,
	#superclass : #PathAccess,
	#instVars : [
		'callMethod'
	],
	#category : #'cadmium-token'
}

{ #category : #'instance creation' }
PathMethodAccess class >> for: method on: pathSegments [
	^ (self new) callMethod: method;
		callSegments: pathSegments;
		yourself.
]

{ #category : #accessing }
PathMethodAccess >> callMethod [
	^ callMethod
]

{ #category : #accessing }
PathMethodAccess >> callMethod: aString [
	callMethod := aString.
]

{ #category : #testing }
PathMethodAccess >> canAccess: request [
	^ (request method = callMethod) ifFalse: [ false ]
	ifTrue: [ super canAccess: request ].
]
