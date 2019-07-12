"
I am a trait that allows wildcard authorization on any REST resource.
This means that I accept any request.
I should not be used as a auth trait of the root call as this is a
potential security flaw when creating new resources.
"
Trait {
	#name : #CdWildcardAuthTrait,
	#category : #cadmium
}

{ #category : #accessing }
CdWildcardAuthTrait >> authorize: request [
]
