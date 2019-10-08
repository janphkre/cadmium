Trait {
	#name : #CdTokenAuthTrait,
	#category : #'Cadmium-auth'
}

{ #category : #public }
CdTokenAuthTrait >> authorize: aRequest [
	([ (self class tokenDelegate permissionsFor: (self tokenFrom: aRequest)
		check: aRequest)
	] on: Exception 
 do: [ :exception |
	exception inspect.
	false ]) ifFalse: [ CdUnauthorizedError signal ].
]

{ #category : #private }
CdTokenAuthTrait >> tokenFrom: request [
	^ (request authorization) ifNil: [ CdUnauthorizedError signal ]
]
