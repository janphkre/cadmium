Class {
	#name : #TokenPermissions,
	#superclass : #Object,
	#instVars : [
		'constraints'
	],
	#category : #'cadmium-token'
}

{ #category : #'instance creation' }
TokenPermissions class >> with: aCollection [
	^ (self new) constraints: aCollection;
		yourself.
]

{ #category : #public }
TokenPermissions >> checkPermission: request [
	^ constraints
		detect: [ :constraint | constraint canAccess: request ]
		ifNone: [ false ]
]

{ #category : #accessing }
TokenPermissions >> constraints [
	^ constraints
]

{ #category : #accessing }
TokenPermissions >> constraints: aCollection [
	constraints := aCollection.
]
