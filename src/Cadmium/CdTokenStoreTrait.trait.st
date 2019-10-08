Trait {
	#name : #CdTokenStoreTrait,
	#category : #'Cadmium-token'
}

{ #category : #acccessing }
CdTokenStoreTrait classSide >> tokenDelegate [
	^ CdTokenStore default.
]
