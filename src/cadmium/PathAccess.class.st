Class {
	#name : #PathAccess,
	#superclass : #NoAccess,
	#instVars : [
		'callSegments'
	],
	#category : #'cadmium-token'
}

{ #category : #'instance creation' }
PathAccess class >> for: aCollection [
	^ (self new) callSegments: aCollection;
		yourself.
]

{ #category : #accessing }
PathAccess >> callSegments [
	^ callSegments
]

{ #category : #accessing }
PathAccess >> callSegments: aCollection [
	callSegments := aCollection
]

{ #category : #testing }
PathAccess >> canAccess: request [
	| requestPath |
	requestPath := request uri segments.
	(requestPath size = callSegments size)
		ifFalse: [ ^ false ].
	requestPath with: callSegments do: [ :requestPathSegment : callPathSegment |
		(callPathSegment first = ${)
			ifFalse: [ 
				(callPathSegment  = requestPathSegment )
					ifFalse: [ ^ false ] ]
			].
	^ true.
]
