Class {
	#name : 'ListaHistorialDeMascota',
	#superclass : 'BorderedMorph',
	#instVars : [
		'mascota',
		'colHistorial',
		'tituloNombreMascota',
		'contenedorHistorial',
		'contenedorScrolleable',
		'contenidoScroll',
		'lista',
		'botonAtras'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'acceso' }
ListaHistorialDeMascota >> deMascota: unaMascota conHistorial: colHis [

	| fuente |
	colHistorial := colHis.
	mascota := unaMascota.

	fuente := LogicalFont familyName: 'Source Sans Pro' pointSize: 13.

	tituloNombreMascota contents:
		(('  Mascota: ' , mascota nombre asString , ' ') asText
			 addAttribute: (TextFontReference toFont: fuente)).
	self imprirHistorial .

	self openInWorld
]

{ #category : 'acciones' }
ListaHistorialDeMascota >> imprirHistorial [

	| contenedor contenido y fuente |
	y := lista position y.

	colHistorial do: [ :hist |
		contenedor := BorderedMorph new.
		contenedor color: Color white.
		contenedor position: lista position x @ y.
		contenedor extent: lista width @ 120.

		"armo lo que va a tener adentro"
		contenido := TextMorph new.
		contenido width: contenedor width - 10.
		contenido position: contenedor position + (5 @ 5).
		fuente := LogicalFont familyName: 'Source Sans Pro' pointSize: 12.
		contenido contents: (hist descripcionTextual asText addAttribute:
				 (TextFontReference toFont: fuente)).
		contenido backgroundColor: Color white.


		"armo el contenedor con los componentes"
		contenedor addMorph: contenido.

		"lo agrego al contenedor principal"

		lista addMorph: contenedor.
		y := y + (contenedor height + 20) ].

	contenidoScroll addMorph: lista
]

{ #category : 'inicializadores' }
ListaHistorialDeMascota >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 650).
	origen := self innerBounds origin.

	tituloNombreMascota := TextMorph new.
	tituloNombreMascota backgroundColor: Color white.
	tituloNombreMascota position: origen + (20 @ 50).


	contenedorHistorial := BorderedMorph new.
	contenedorHistorial extent: self width - 40 @ 400.
	contenedorHistorial color: Color transparent.
	contenedorHistorial borderWidth: 1.
	contenedorHistorial borderColor: Color black.
	contenedorHistorial position: tituloNombreMascota position + (0 @ 50).

	"para que se pueda scrollear si hay muchas mascotas"
	contenedorScrolleable := ScrollPane new.
	contenedorScrolleable position: contenedorHistorial position + (5 @ 5).
	contenedorScrolleable extent:
		contenedorHistorial width - 10 @ (contenedorHistorial height - 10).

	contenidoScroll := contenedorScrolleable scroller.

	lista := BorderedMorph new.
	lista position: 0 @ 0.
	lista color: Color transparent.
	lista borderWidth: 0.
	lista width: contenedorScrolleable width.

	botonAtras := BotonAccion new.
	botonAtras label: 'Volver'.
	botonAtras extent: 100 @ 40.
	botonAtras position:
		contenedorHistorial position + (0 @ (contenedorHistorial height + 20)).

	botonAtras mouseAction: [ self delete ].

	self addMorph: tituloNombreMascota.
	self addMorph: contenedorHistorial.
	contenedorHistorial addMorph: contenedorScrolleable.
	self addMorph: botonAtras
]
