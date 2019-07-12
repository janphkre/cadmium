"
I am a trait that rejects authorization on any REST resource.
This means that I reject any incoming request.
"
Trait {
	#name : #CdRejectingAuthTrait,
	#category : #cadmium
}

{ #category : #accessing }
CdRejectingAuthTrait >> authorize: request [
	CdUnauthorizedError signal.
]
