Class {
	#name : #CdPathAccess,
	#superclass : #CdAccess,
	#instVars : [
		'callSegments'
	],
	#category : #'cadmium-token'
}

{ #category : #'instance creation' }
CdPathAccess class >> on: aCollection [
	^ (self new) callSegments: aCollection;
		yourself.
]

{ #category : #accessing }
CdPathAccess >> callSegments [
	^ callSegments
]

{ #category : #accessing }
CdPathAccess >> callSegments: aCollection [
	callSegments := aCollection
]

{ #category : #testing }
CdPathAccess >> canAccess: request [
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

{ #category : #accessing }
CdPathAccess >> to: aDictionary [
	super to: aDictionary.
	aDictionary at: 'path' put: callSegments.
	^ aDictionary
]
