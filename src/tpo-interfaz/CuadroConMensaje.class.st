Class {
	#name : 'CuadroConMensaje',
	#superclass : 'BorderedMorph',
	#instVars : [
		'mensaje',
		'panelMensaje',
		'botonIzq',
		'botonDer'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'constructor' }
CuadroConMensaje class >> conMensaje: unString [

	| c |
	c := self new.
	c mensaje: unString.

	^ c
]

{ #category : 'propios del tipo' }
CuadroConMensaje >> accionAceptar: unBloque [
	botonDer mouseAction: unBloque .
]

{ #category : 'propios del tipo' }
CuadroConMensaje >> agregarBotonCancelar: unBloque [

	botonIzq := BotonAccion new.
	botonIzq label: 'Cancelar'.
	botonIzq color: (Color fromHexString: 'B08968').
	botonIzq mouseAction: unBloque.
	botonIzq extent: 80 @ 35.
	botonIzq position: self position + (20 @ (self height - 50)).
	self addMorph: botonIzq
]

{ #category : 'inicializadores' }
CuadroConMensaje >> initialize [

	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self extent: 300 @ 150.

	panelMensaje := Morph new.
	panelMensaje color: Color transparent.
	panelMensaje layoutPolicy: TableLayout new.
	panelMensaje cellPositioning: #center.
	panelMensaje extent: 280 @ 60.
	panelMensaje position: self position + (10 @ 30).

	mensaje := TextMorph new.
	mensaje contents: ''.
	mensaje color: Color black.
	mensaje wrapFlag: true.
	mensaje autoFit: false.
	"rellena el contenedor"
	mensaje hResizing: #spaceFill.
	mensaje vResizing: #spaceFill.
	panelMensaje addMorphBack: mensaje.


	botonDer := BotonAccion new.
	botonDer label: 'Aceptar'.
	botonDer extent: 80 @ 35.
	botonDer mouseAction: [ self delete ].
	botonDer position:
		self position + (self width - 100 @ (self height - 50)).


	self addMorph: panelMensaje.
	self addMorph: botonDer
]

{ #category : 'propios del tipo' }
CuadroConMensaje >> mensaje: unString [

	| textoCentrado |
	textoCentrado := unString asText.
	textoCentrado addAttribute: TextAlignment centered.
	textoCentrado addAttribute: TextEmphasis bold.
	mensaje contents: textoCentrado.
	mensaje wrapFlag: true.
]
