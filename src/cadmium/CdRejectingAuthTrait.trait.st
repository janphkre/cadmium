"
I am a trait that rejects authorization on any REST resource.
This means that I reject any incoming request.
"
Trait {
	#name : #CdRejectingAuthTrait,
	#category : #'cadmium-auth'
}

{ #category : #public }
CdRejectingAuthTrait >> authorize: request [
	CdUnauthorizedError signal.
]
