Class {
	#name : 'ListaHistorialTurnosDeCliente',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'cliente',
		'tituloNombreCli',
		'colTurnos',
		'contenedorDeTurnos',
		'botonAtras',
		'contenedorScrolleable',
		'contenidoScroll',
		'lista',
		'botonAgendarTurno'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'acciones' }
ListaHistorialTurnosDeCliente >> imprirHistorial [

	| contenedor contenido y fuente botonAtenderTurno botonCancelarTurno |
	lista removeAllMorphs.
	y := lista position y.

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
	y := y + (contenedor height + 20).
].
	contenidoScroll addMorph: lista
]

{ #category : 'inicializadores' }
ListaHistorialTurnosDeCliente >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 650).
	origen := self innerBounds origin.

	tituloNombreCli := TextMorph new.
	tituloNombreCli backgroundColor: Color white.
	tituloNombreCli position: origen + (20 @ 50).


	contenedorDeTurnos := BorderedMorph new.
	contenedorDeTurnos extent: self width - 40 @ 400.
	contenedorDeTurnos color: Color transparent.
	contenedorDeTurnos borderWidth: 1.
	contenedorDeTurnos borderColor: Color black.
	contenedorDeTurnos position: tituloNombreCli position + (0 @ 50).

	"para que se pueda scrollear si hay muchas mascotas"
	contenedorScrolleable := ScrollPane new.
	contenedorScrolleable position: contenedorDeTurnos position + (5 @ 5).
	contenedorScrolleable extent:
		contenedorDeTurnos width - 180 @ (contenedorDeTurnos height - 10).

	contenidoScroll := contenedorScrolleable scroller.

	lista := BorderedMorph new.
	lista position: 0 @ 0.
	lista color: Color transparent.
	lista borderWidth: 0.
	lista width: contenedorScrolleable width - 10.

	botonAgendarTurno := BotonAccion new.
	botonAgendarTurno label: 'Agendar nuevo turno'.
	botonAgendarTurno extent: 140 @ 40.
	botonAgendarTurno position: contenedorScrolleable position
		+ (contenedorScrolleable width + 20 @ 0).

	botonAgendarTurno mouseAction: [
		| form |
		form := FormAgendarTurno new.
		form deCliente: cliente deVet: veterinaria.
		form accionAceptar: [ :unTurno |
			(veterinaria agendarTurno: unTurno)
				ifTrue: [
					(CuadroConMensaje conMensaje: 'Turno agendado correctamente')
						openInWorld.
					 ]
				ifFalse: [
					(CuadroConMensaje conMensaje:
						 'Ha ocurrido un error al agendar el turno') openInWorld ] ].

		form openInWorld ].



	botonAtras := BotonAccion new.
	botonAtras label: 'Volver'.
	botonAtras extent: 100 @ 40.
	botonAtras position:
		contenedorDeTurnos position + (0 @ (contenedorDeTurnos height + 20)).

	botonAtras mouseAction: [ self delete ].

	self addMorph: tituloNombreCli.
	self addMorph: contenedorDeTurnos.
	contenedorDeTurnos addMorph: contenedorScrolleable.
	self addMorph: botonAtras.
	self addMorph: botonAgendarTurno
]

{ #category : 'asignaciones' }
ListaHistorialTurnosDeCliente >> turnosDe: unCliente desde: unaVeterinaria [

	| fuente |
	veterinaria := unaVeterinaria.
	cliente := unCliente.
	colTurnos := veterinaria historialDeTurnosDe: cliente.

	fuente := LogicalFont familyName: 'Source Sans Pro' pointSize: 12.
	tituloNombreCli contents:
		((' Cliente: ' , cliente nombre asString , ' '
		  , cliente apellido asString , ' ') asText addAttribute:
			 (TextFontReference toFont: fuente)).
	self imprirHistorial.
	veterinaria addDependent: self.
	self openInWorld
]

{ #category : 'acciones' }
ListaHistorialTurnosDeCliente >> update: unObjeto [

	unObjeto = #turnos ifTrue: [ 
		colTurnos := veterinaria historialDeTurnosDe: cliente.
		self imprirHistorial ] ifFalse: [  ]
]
