Trait {
	#name : #CdTokenStoreTrait,
	#category : #'cadmium-token'
}

{ #category : #acccessing }
CdTokenStoreTrait classSide >> tokenDelegate [
	^ TokenStore default.
]
