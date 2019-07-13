Class {
	#name : #NoAccess,
	#superclass : #Object,
	#category : #'cadmium-token'
}

{ #category : #testing }
NoAccess >> canAccess: request [
	^ false
]
