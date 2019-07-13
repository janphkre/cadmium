Class {
	#name : #TokenStore,
	#superclass : #Object,
	#instVars : [
		'dictionary',
		'defaultPermissions',
		'defaultPermssions'
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

{ #category : #accessing }
TokenStore >> defaultPermissions [
	defaultPermissions ifNil: [ 
		defaultPermssions := TokenPermissions new. ].
	^ defaultPermissions
]

{ #category : #'private-initialization' }
TokenStore >> initialize [
	dictionary := Dictionary new.
]

{ #category : #public }
TokenStore >> permissionsFor: anIdentifier [
	^ dictionary at: anIdentifier ifAbsent: [ self defaultPermissions ].
]
