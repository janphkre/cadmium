Trait {
	#name : #CdTokenAuthTrait,
	#category : #'cadmium-auth'
}

{ #category : #public }
CdTokenAuthTrait >> authorize: request [
	[ ((self class tokenDelegate permissionsFor: (self tokenFrom: request))
		checkPermission: request) ifFalse: [ CdUnauthorizedError signal ]
	] onError: Exception 
 do: [ CdUnauthorizedError signal ]
]

{ #category : #private }
CdTokenAuthTrait >> tokenFrom: request [
	^ (request authorization) ifNil: [ CdUnauthorizedError signal ]
]
