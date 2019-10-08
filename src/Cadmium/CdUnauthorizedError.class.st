Class {
	#name : #CdUnauthorizedError,
	#superclass : #Error,
	#category : #'Cadmium-auth'
}

{ #category : #converting }
CdUnauthorizedError class >> asZnResponse [
	^ (ZnResponse statusLine: (ZnStatusLine code: 401))
	entity: (ZnEntity 
		with: (NeoJSONWriter toString: (Dictionary new
		  at: #code put: 401;
		  at: #message put: 'You are unauthorized!';
		  yourself))
		type: ZnMimeType applicationJson setCharSetUTF8).
]

{ #category : #converting }
CdUnauthorizedError >> znErrorCode [
	^ 401
]

{ #category : #converting }
CdUnauthorizedError >> znErrorMessage [
	^ 'Unauthorized'
]
