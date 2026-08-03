Class {
	#name : 'BuscadorTratPorVeterinario',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'colTratamientos',
		'colVeterinarios',
		'labelBuscador',
		'campoVeterinario',
		'veterinarioElegido',
		'botonBuscar',
		'contenedorResultado',
		'contenedorScrolleable',
		'contenidoScroll',
		'lista',
		'botonMenuPrincipal'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'asignaciones' }
BuscadorTratPorVeterinario >> acceso: unaVeterinaria [

	veterinaria := unaVeterinaria.
	colVeterinarios := veterinaria medicos .

	self openInWorld
]

{ #category : 'acciones' }
BuscadorTratPorVeterinario >> imprimirTratamientos [

	| contenedor contenido y fuente |
	colTratamientos := veterinaria tratamientosRealizadosPor:
		                   veterinarioElegido.
	lista removeAllMorphs.
	y := lista position y.

	colTratamientos
		ifEmpty: [
			(CuadroConMensaje conMensaje:
				 'No hay tratamientos realizados por '
				 , veterinarioElegido nombre asString) openInWorld.
			contenedorResultado hide ]
		ifNotEmpty: [
			colTratamientos do: [ :tratamiento |
				contenedor := BorderedMorph new.
				contenedor color: Color white.
				contenedor position: lista position x @ y.
				contenedor extent: lista width @ 180.

				"armo lo que va a tener adentro"
				contenido := TextMorph new.
				contenido width: contenedor width - 10.
				contenido position: contenedor position + (5 @ 5).
				fuente := LogicalFont familyName: 'Source Sans Pro' pointSize: 11.
				contenido contents:
					(tratamiento descripcionTextual asText addAttribute:
						 (TextFontReference toFont: fuente)).
				contenido backgroundColor: Color white.


				"armo el contenedor con los componentes"
				contenedor addMorph: contenido.

				"lo agrego al contenedor principal"

				lista addMorph: contenedor.
				y := y + (contenedor height + 20) ] ].
	contenidoScroll addMorph: lista
]

{ #category : 'inicializadores' }
BuscadorTratPorVeterinario >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 800).
	origen := self innerBounds origin.

	labelBuscador := TextMorph new.
	labelBuscador contents:
		' Seleccione el medico por el que quiere saber: '.
	labelBuscador color: Color black.
	labelBuscador position: origen + (25 @ 25).

	campoVeterinario := BotonAccion new.
	campoVeterinario label: 'Elegir Medico: '.
	campoVeterinario ancho: self width - 200 alto: 40.
	campoVeterinario position: labelBuscador position + (0 @ 50).

	botonBuscar := BotonAccion new.
	botonBuscar label: 'Buscar'.
	botonBuscar extent: 90 @ 40.
	botonBuscar position:
		campoVeterinario position + (campoVeterinario width + 10 @ 0).

	contenedorResultado := BorderedMorph new.
	contenedorResultado position:
		campoVeterinario position + (0 @ (campoVeterinario height + 40)).
	"tiene de ancho: 550"
	contenedorResultado extent: self width - 50 @ 450.
	contenedorResultado color: Color transparent.

	contenedorScrolleable := ScrollPane new.
	contenedorScrolleable position:
		contenedorResultado position + (5 @ 5).
	contenedorScrolleable extent:
		contenedorResultado width - 10 @ (contenedorResultado height - 10).

	contenidoScroll := contenedorScrolleable scroller.

	lista := BorderedMorph new.
	lista position: 0 @ 0.
	lista color: Color transparent.
	lista borderWidth: 0.
	lista width: contenedorScrolleable width - 10.



	botonMenuPrincipal := BotonAccion new.
	botonMenuPrincipal label: 'Volver'.
	botonMenuPrincipal extent: 120 @ 40.
	botonMenuPrincipal position:
		contenedorResultado position + (0 @ contenedorResultado height + 50).



	botonMenuPrincipal mouseAction: [ self delete ].

	campoVeterinario mouseAction: [
		| opciones indice |
		opciones := colVeterinarios collect: [ :m |
			            m cuil asString , ' ' , m nombre asString ].
		indice := UIManager default
			          chooseFrom: opciones
			          title: 'Medicos disponibles'.
		indice > 0 ifTrue: [
			veterinarioElegido := colVeterinarios at: indice.
			campoVeterinario label:
				'Medico: ' , veterinarioElegido nombre asString.
			campoVeterinario ancho: self width - 200 alto: 40. ] ].

	botonBuscar mouseAction: [
		self validarFormulario
			ifTrue: [
				contenedorResultado show.
				self imprimirTratamientos ]
			ifFalse: [
				(CuadroConMensaje conMensaje:
					 'Por favor seleccione un veterinario') openInWorld ] ].



	self addMorph: labelBuscador.
	self addMorph: campoVeterinario.
	self addMorph: botonBuscar.
	self addMorph: contenedorResultado.
	contenedorResultado addMorph: contenedorScrolleable.
	contenedorResultado hide.
	self addMorph: botonMenuPrincipal
]

{ #category : 'propios del tipo' }
BuscadorTratPorVeterinario >> validarFormulario [

	^ veterinarioElegido isNotNil
]
