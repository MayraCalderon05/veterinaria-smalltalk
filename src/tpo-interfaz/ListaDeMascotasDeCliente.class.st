Class {
	#name : 'ListaDeMascotasDeCliente',
	#superclass : 'BorderedMorph',
	#instVars : [
		'cliente',
		'tituloNombreCli',
		'contenedorMascotas',
		'botonAtras',
		'contenedorScrolleable',
		'contenidoScroll',
		'lista'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'constructor' }
ListaDeMascotasDeCliente class >> deCliente: unCliente [

	| l |
	l := self new.
	l cliente: unCliente.
	^l
]

{ #category : 'acceso' }
ListaDeMascotasDeCliente >> cliente: unCliente [

	| fuente |
	cliente := unCliente.
	fuente := LogicalFont familyName: 'Source Sans Pro' pointSize: 13.

	tituloNombreCli contents:
		(('  Cliente: ' , cliente nombre asString , ' '
		  , cliente apellido asString , ' ') asText addAttribute:
			 (TextFontReference toFont: fuente)).
	
	self imprimirMascotas.
	self openInWorld
]

{ #category : 'propios del tipo' }
ListaDeMascotasDeCliente >> imprimirMascotas [

	| contenedor contenido botonVacunar botonVerVacunas mascotas y fuente |
	mascotas := cliente mascotas.
	y := lista position y.

	mascotas do: [ :masc |
		contenedor := BorderedMorph new.
		contenedor color: Color white.
		contenedor position: lista position x @ y.
		contenedor extent: lista width @ 160.

		"armo lo que va a tener adentro"
		contenido := TextMorph new.
		contenido width: contenedor width - 10.
		contenido position: contenedor position + (5 @ 5).
		fuente := LogicalFont familyName: 'Source Sans Pro' pointSize: 12.
		contenido contents: (masc descripcionTextual asText addAttribute:
				 (TextFontReference toFont: fuente)).
		contenido backgroundColor: Color white.


		botonVacunar := BotonAccion new.
		botonVacunar label: 'Vacunar'.
		botonVacunar extent: 120 @ 40.
		botonVacunar position:
			contenedor position + (contenedor width - 140 @ 30).

		botonVerVacunas := BotonAccion new.
		botonVerVacunas label: 'Vacunaciones'.
		botonVerVacunas extent: 120 @ 40.
		botonVerVacunas position: botonVacunar position + (0 @ 60).


		"armo el contenedor con los componentes"
		contenedor addMorph: contenido.
		contenedor addMorph: botonVacunar.
		contenedor addMorph: botonVerVacunas.

		"lo agrego al contenedor principal"

		lista addMorph: contenedor.
		y := y + (contenedor height + 20) ].

	contenidoScroll addMorph: lista
]

{ #category : 'inicializadores' }
ListaDeMascotasDeCliente >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 650).
	origen := self innerBounds origin.

	tituloNombreCli := TextMorph new.
	tituloNombreCli backgroundColor: Color white.
	tituloNombreCli position: origen + (20 @ 50).


	contenedorMascotas := BorderedMorph new.
	contenedorMascotas extent: self width - 40 @ 400.
	contenedorMascotas color: Color transparent.
	contenedorMascotas borderWidth: 1.
	contenedorMascotas borderColor: Color black.
	contenedorMascotas position: tituloNombreCli position + (0 @ 50).

	"para que se pueda scrollear si hay muchas mascotas"
	contenedorScrolleable := ScrollPane new.
	contenedorScrolleable position: contenedorMascotas position + (5 @ 5).
	contenedorScrolleable extent:
		contenedorMascotas width - 10 @ (contenedorMascotas height - 10).

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
		contenedorMascotas position + (0 @ (contenedorMascotas height + 20)).
		
	botonAtras mouseAction: [ self delete. ].

	self addMorph: tituloNombreCli.
	self addMorph: contenedorMascotas.
	contenedorMascotas addMorph: contenedorScrolleable.
	self addMorph: botonAtras 
]
