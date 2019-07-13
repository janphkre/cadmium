Class {
	#name : #TokenStore,
	#superclass : #Object,
	#instVars : [
		'dictionary',
		'defaultPermissions'
	],
	#classInstVars : [
		'defaultInstance'
	],
	#category : #'cadmium-token'
}

{ #category : #accessing }
TokenStore class >> default [
	defaultInstance ifNil: [ 
		defaultInstance := self new. ].
	^ defaultInstance
]

{ #category : #public }
TokenStore >> clearPermissions [
	self initialize.
]

{ #category : #public }
TokenStore >> for: token grant: permissions [
	dictionary at: token put: permissions
]

{ #category : #'private-initialization' }
TokenStore >> initialize [
	dictionary := Dictionary new.
]

{ #category : #public }
TokenStore >> permissionsFor: anIdentifier check: request [
	^ (dictionary at: anIdentifier ifAbsent: [ ^ false ])
		detect: [ :constraint | constraint canAccess: request ]
		ifFound: [ true ]
		ifNone: [ false ]
]
