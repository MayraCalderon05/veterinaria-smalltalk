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

{ #category : 'propios del tipo' }
BotonAccion >> ancho: unAncho alto: unAlto [

	self extent: unAncho @ unAlto 
]

{ #category : 'inicializadores' }
BotonAccion >> initialize [

	super initialize.
	self color: (Color fromHexString: '386641').
	self borderColor: Color white.
	self borderWidth: 2.
]

{ #category : 'propios del tipo' }
BotonAccion >> label: aString [
    super label: aString.
    
    self submorphs ifNotEmpty: [ :submorphs | | textoMorph |
        textoMorph := submorphs first.
        textoMorph emphasis: 1. "1 es el código para Negrita"
        textoMorph color: Color white ].

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
