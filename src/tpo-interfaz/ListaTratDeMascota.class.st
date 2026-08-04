Class {
	#name : 'ListaTratDeMascota',
	#superclass : 'BorderedMorph',
	#instVars : [
		'mascota',
		'tituloNombreMascota',
		'colTratamientos',
		'contenedorPrincipal',
		'botonAtras',
		'contenedorScrolleable',
		'contenidoScroll',
		'lista',
		'tratamientoSeleccionado'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'acciones' }
ListaTratDeMascota >> imprimirTratamientos [

	| contenedor contenido y fuente botonElegir |
	lista removeAllMorphs.
	y := lista position y.

	colTratamientos do: [ :arr |
		| nomD trat |
		nomD := arr at: 1.
		trat := arr at: 2.
		contenedor := BorderedMorph new.
		contenedor color: Color white.
		contenedor position: lista position x @ y.
		contenedor extent: lista width @ 220.

		"armo lo que va a tener adentro"
		contenido := TextMorph new.
		contenido width: contenedor width - 10.
		contenido position: contenedor position + (5 @ 5).
		fuente := LogicalFont familyName: 'Source Sans Pro' pointSize: 11.
		contenido contents: ((String streamContents: [ :stream |
				  stream nextPutAll: nomD asString.
				  stream nextPut: Character lf.
				  stream nextPutAll: trat descripcionTextual ]) asText
				 addAttribute: (TextFontReference toFont: fuente)).
		contenido backgroundColor: Color white.


		"armo el contenedor con los componentes"
		contenedor addMorph: contenido.


		botonElegir := BotonAccion new.
		botonElegir label: 'Seleccionar'.
		botonElegir extent: 120 @ 40.
		botonElegir position:
			contenido position + (contenido width + 180 @ 0).

		botonElegir mouseAction: [
			tratamientoSeleccionado := trat.
			self changed: #tratSelect.
			self delete ].


		"lo agrego al contenedor principal"
		contenedor addMorph: botonElegir.
		lista addMorph: contenedor.
		y := y + (contenedor height + 20) ].




	contenidoScroll addMorph: lista
]

{ #category : 'inicializadores' }
ListaTratDeMascota >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 650).
	origen := self innerBounds origin.

	tituloNombreMascota := TextMorph new.
	tituloNombreMascota backgroundColor: Color white.
	tituloNombreMascota position: origen + (20 @ 50).


	contenedorPrincipal := BorderedMorph new.
	contenedorPrincipal extent: self width - 40 @ 400.
	contenedorPrincipal color: Color transparent.
	contenedorPrincipal borderWidth: 1.
	contenedorPrincipal borderColor: Color black.
	contenedorPrincipal position: tituloNombreMascota position + (0 @ 50).

	"para que se pueda scrollear si hay muchas mascotas"
	contenedorScrolleable := ScrollPane new.
	contenedorScrolleable position:
		contenedorPrincipal position + (5 @ 5).
	contenedorScrolleable extent:
		contenedorPrincipal width - 10 @ (contenedorPrincipal height - 10).

	contenidoScroll := contenedorScrolleable scroller.

	lista := BorderedMorph new.
	lista position: 0 @ 0.
	lista color: Color transparent.
	lista borderWidth: 0.
	lista width: contenedorScrolleable width - 10.


	botonAtras := BotonAccion new.
	botonAtras label: 'Volver'.
	botonAtras extent: 100 @ 40.
	botonAtras position:
		contenedorPrincipal position
		+ (0 @ (contenedorPrincipal height + 20)).

	botonAtras mouseAction: [ self delete ].

	self addMorph: tituloNombreMascota.
	self addMorph: contenedorPrincipal.
	contenedorPrincipal addMorph: contenedorScrolleable.
	self addMorph: botonAtras
]

{ #category : 'propios del tipo' }
ListaTratDeMascota >> tratamientoSeleccionado [
^tratamientoSeleccionado 
]

{ #category : 'asignaciones' }
ListaTratDeMascota >> tratamientos: tratamientos deMascota: unaMascota [ 

	| fuente |
	mascota := unaMascota.
	colTratamientos := tratamientos .

	fuente := LogicalFont familyName: 'Source Sans Pro' pointSize: 12.
	tituloNombreMascota contents:
		((' Mascota ' , mascota nombre asString , ' ') asText addAttribute:
			 (TextFontReference toFont: fuente)).
	self imprimirTratamientos.

	self openInWorld
]
