Class {
	#name : 'BotonAccion',
	#superclass : 'SimpleButtonMorph',
	#instVars : [
		'bloque',
		'bloqueAccion'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'inicializadores' }
BotonAccion >> initialize [

	super initialize.
	self color: (Color fromHexString: '386641')
]

{ #category : 'propios del tipo' }
BotonAccion >> mouseAction: unBloque [
bloqueAccion := unBloque 
]

{ #category : 'propios del tipo' }
BotonAccion >> mouseUp: unEvento [
super mouseUp: unEvento .
bloqueAccion value
]
