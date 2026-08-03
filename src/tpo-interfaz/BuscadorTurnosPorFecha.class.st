Class {
	#name : 'BuscadorTurnosPorFecha',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'colTurnos',
		'labelBuscador',
		'inputDia',
		'inputMes',
		'inputAnio',
		'fechaIngresada',
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
BuscadorTurnosPorFecha >> acceso: unaVeterinaria [

	veterinaria := unaVeterinaria.
	veterinaria addDependent: self. 
	self openInWorld
]

{ #category : 'as yet unclassified' }
BuscadorTurnosPorFecha >> generarFecha [

	| f |
	f := Date
		     newDay: inputDia texto asInteger
		     month: inputMes texto asInteger
		     year: inputAnio texto asInteger.
	^ f
]

{ #category : 'as yet unclassified' }
BuscadorTurnosPorFecha >> imprimirTurnos [

	| contenedor contenido y fuente botonAtenderTurno botonCancelarTurno |
	lista removeAllMorphs.
	y := lista position y.
	colTurnos := veterinaria turnosConFecha: self generarFecha.
	
	colTurnos ifEmpty: [ 
		(CuadroConMensaje conMensaje: 'No hay turnos programados para esta fecha') openInWorld.
		contenedorResultado hide.
		 ]
		ifNotEmpty: [
	colTurnos do: [ :turno |
		contenedor := BorderedMorph new.
		contenedor color: Color white.
		contenedor position: lista position x @ y.
		contenedor extent: lista width @ 220.

		"armo lo que va a tener adentro"
		contenido := TextMorph new.
		contenido width: contenedor width - 10.
		contenido position: contenedor position + (5 @ 5).
		fuente := LogicalFont familyName: 'Source Sans Pro' pointSize: 11.
		contenido contents: (turno descripcionTextual asText addAttribute:
				 (TextFontReference toFont: fuente)).
		contenido backgroundColor: Color white.


		"armo el contenedor con los componentes"
		contenedor addMorph: contenido.

		turno estadoConfirmado ifTrue: [
			botonAtenderTurno := BotonAccion new.
			botonAtenderTurno label: 'Atender'.
			botonAtenderTurno extent: 70 @ 40.
			botonAtenderTurno position:
				contenido position + (contenido width + 115 @ 0).

			botonCancelarTurno := BotonAccion new.
			botonCancelarTurno label: 'Cancelar'.
			botonCancelarTurno extent: 70 @ 40.
			botonCancelarTurno position: botonAtenderTurno position + (0 @ 60).

			botonAtenderTurno mouseAction: [
				(veterinaria atenderTurno: turno)
					ifTrue: [
						(CuadroConMensaje conMensaje: 'Turno atendido exitosamente')
							openInWorld ]
					ifFalse: [
						(CuadroConMensaje conMensaje: 'No se ha podido atender el turno')
							openInWorld ] ].

			botonCancelarTurno mouseAction: [
				(veterinaria cancelarTurnoPendiente: turno)
					ifTrue: [
						(CuadroConMensaje conMensaje: 'Turno cancelado exitosamente')
							openInWorld ]
					ifFalse: [
						(CuadroConMensaje conMensaje:
							 'No se ha podido cancelar el turno') openInWorld ] ].

			contenedor addMorph: botonAtenderTurno.
			contenedor addMorph: botonCancelarTurno ].


		"lo agrego al contenedor principal"

		lista addMorph: contenedor.
		y := y + (contenedor height + 20) ].
	].
	contenidoScroll addMorph: lista
]

{ #category : 'inicializadores' }
BuscadorTurnosPorFecha >> initialize [

	| origen aDia aMes aAnio espacios |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 800).
	origen := self innerBounds origin.

	labelBuscador := TextMorph new.
	labelBuscador contents: ' Ingrese la fecha por la que buscar:'.
	labelBuscador color: Color black.
	labelBuscador position: origen + (25 @ 25).

	aDia := 130.
	aMes := 130.
	aAnio := 200.
	espacios := 5.

	inputDia := LabelConCampo label: 'Día: '.
	inputDia position: labelBuscador position + (0 @ 50).
	inputDia ancho: aDia.

	inputMes := LabelConCampo label: 'Mes: '.
	inputMes position: inputDia position + (aDia + espacios @ 0).
	inputMes ancho: aMes.

	inputAnio := LabelConCampo label: 'Año: '.
	inputAnio position: inputMes position + (aMes + espacios @ 0).
	inputAnio ancho: aAnio.

	botonBuscar := BotonAccion new.
	botonBuscar label: 'Buscar'.
	botonBuscar extent: 90 @ 40.
	botonBuscar position: inputAnio position + (aAnio + 10 @ 0).

	contenedorResultado := BorderedMorph new.
	contenedorResultado position:
		inputDia position + (0 @ (inputDia height + 40)).
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
		contenedorResultado position
		+ (0 @ contenedorResultado height + 50).



	botonMenuPrincipal mouseAction: [ self delete ].

	botonBuscar mouseAction: [
		self validarFormulario
			ifTrue: [
				contenedorResultado show.
				self imprimirTurnos ]
			ifFalse: [
			CuadroConMensaje conMensaje: 'Por favor complete todos los campos' ] ].



	self addMorph: labelBuscador.
	self addMorph: inputDia.
	self addMorph: inputMes.
	self addMorph: inputAnio.
	self addMorph: botonBuscar.
	self addMorph: contenedorResultado.
	contenedorResultado addMorph: contenedorScrolleable.
	contenedorResultado hide.
	self addMorph: botonMenuPrincipal
]

{ #category : 'as yet unclassified' }
BuscadorTurnosPorFecha >> update: unObjeto [

	unObjeto = #turnos
		ifTrue: [
			self imprimirTurnos ]
		ifFalse: [  ]
]

{ #category : 'propios del tipo' }
BuscadorTurnosPorFecha >> validarFormulario [

	| valores completo |
	completo := true.
	valores := OrderedCollection new.
	valores add: inputDia texto.
	valores add: inputMes texto.
	valores add: inputAnio texto.
	(valores detect: [ :c | c isEmpty ] ifNone: [ nil ]) ifNotNil: [
		completo := false ].
	^ completo
]
