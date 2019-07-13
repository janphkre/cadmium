Class {
	#name : #CdTokenStore,
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
CdTokenStore class >> default [
	defaultInstance ifNil: [ 
		defaultInstance := self new. ].
	^ defaultInstance
]

{ #category : #public }
CdTokenStore >> clearPermissions [
	self initialize.
]

{ #category : #public }
CdTokenStore >> for: token grant: permissions [
	dictionary at: token put: permissions
]

{ #category : #'private-initialization' }
CdTokenStore >> initialize [
	dictionary := Dictionary new.
]

{ #category : #accessing }
CdTokenStore >> permissions [
	^ dictionary
]

{ #category : #public }
CdTokenStore >> permissionsFor: anIdentifier check: request [
	^ (dictionary at: anIdentifier ifAbsent: [ ^ false ])
		detect: [ :constraint | constraint canAccess: request ]
		ifFound: [ true ]
		ifNone: [ false ]
]
