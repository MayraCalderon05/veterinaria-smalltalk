Class {
	#name : 'LabelConCampo',
	#superclass : 'BorderedMorph',
	#instVars : [
		'label',
		'campoTexto'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'constructores' }
LabelConCampo class >> label: unTexto [

	| c |
	c := self new.
	c label: unTexto.
	^ c
]

{ #category : 'propios del tipo' }
LabelConCampo >> ancho: unAncho [
	self extent: unAncho @ self height .
	campoTexto extent: (unAncho - 20) @ campoTexto height .
]

{ #category : 'propios del tipo' }
LabelConCampo >> initialize [

	super initialize.
	self color: (Color fromHexString: 'A7C957').
	self bounds: (0 @ 0 extent: 150 @ 70).

	label := TextMorph new.
	label contents: ''.
	label color: Color black .
	label position: self position + (5 @ 5).

	"Texto editable"
	campoTexto := RubTextFieldMorph new.
	campoTexto borderColor: Color black .
	campoTexto borderWidth: 1.
	campoTexto position: label position + (5 @ 20).
	campoTexto extent: self width - 20 @ 20.


	self addMorph: label.
	self addMorph: campoTexto
]

{ #category : 'propios del tipo' }
LabelConCampo >> label: unTexto [

	label contents: unTexto
]

{ #category : 'propios del tipo' }
LabelConCampo >> texto [

	^ campoTexto text asString.
]
