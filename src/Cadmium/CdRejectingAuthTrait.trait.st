"
I am a trait that rejects authorization on any REST resource.
This means that I reject any incoming request.
"
Trait {
	#name : #CdRejectingAuthTrait,
	#category : #'Cadmium-auth'
}

{ #category : #public }
CdRejectingAuthTrait >> authorize: aRequest [
	CdUnauthorizedError signal.
]
