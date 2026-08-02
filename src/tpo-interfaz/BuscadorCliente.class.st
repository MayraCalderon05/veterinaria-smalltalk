Class {
	#name : 'BuscadorCliente',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'labelBuscador',
		'inputBuscador',
		'botonBuscar',
		'contenedorResultado',
		'labelResultado',
		'botonAgregarMascota',
		'botonVerMascotas',
		'botonHistorialTurnos',
		'clienteEncontrado',
		'botonMenuPrincipal'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'asignaciones' }
BuscadorCliente >> acceso: unaVeterinaria [

	veterinaria := unaVeterinaria.
	self openInWorld
]

{ #category : 'inicializadores' }
BuscadorCliente >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 400).
	origen := self innerBounds origin.

	labelBuscador := TextMorph new.
	labelBuscador contents: 'Ingrese DNI a buscar:'.
	labelBuscador color: Color black.
	labelBuscador position: origen + (25 @ 25).

	inputBuscador := RubTextFieldMorph new.
	inputBuscador width: self width - 150.
	inputBuscador borderColor: Color black.
	inputBuscador borderWidth: 1.
	inputBuscador position: labelBuscador position + (0 @ 25).

	botonBuscar := BotonAccion new.
	botonBuscar label: 'Buscar'.
	botonBuscar extent: 90 @ 25.
	botonBuscar position: inputBuscador position + (470 @ 0).

	"armo el contenedor aca porque no lo voy a reusar"
	contenedorResultado := BorderedMorph new.
	contenedorResultado position: inputBuscador position + (0 @ 60).
	"tiene de ancho: 550"
	contenedorResultado extent: self width - 50 @ 180.
	contenedorResultado color: Color transparent.

	labelResultado := RubScrolledTextMorph new.
	labelResultado position: contenedorResultado position + (10 @ 10).
	labelResultado extent:
		contenedorResultado width - 150 @ (contenedorResultado height - 20).
	labelResultado beWrapped. "Activa el salto de línea automático"
	labelResultado beReadOnly. "Para que actúe como label y no como editor"
	labelResultado color: Color transparent.
	labelResultado setText: ''.

	botonAgregarMascota := BotonAccion new.
	botonAgregarMascota label: 'Agregar mascota'.
	botonAgregarMascota extent: 120 @ 40.
	botonAgregarMascota position: labelResultado position + (410 @ 0).

	botonVerMascotas := BotonAccion new.
	botonVerMascotas label: 'Ver mascotas'.
	botonVerMascotas extent: 120 @ 40.
	botonVerMascotas position: botonAgregarMascota position + (0 @ 60).

	botonHistorialTurnos := BotonAccion new.
	botonHistorialTurnos label: 'Historial Turnos'.
	botonHistorialTurnos extent: 120 @ 40.
	botonHistorialTurnos position: botonVerMascotas position + (0 @ 60).

	botonMenuPrincipal := BotonAccion new.
	botonMenuPrincipal label: 'Volver'.
	botonMenuPrincipal extent: 120 @ 40.
	botonMenuPrincipal position: botonVerMascotas position + (0 @ 150).

	contenedorResultado addMorph: labelResultado.
	contenedorResultado addMorph: botonAgregarMascota.
	contenedorResultado addMorph: botonVerMascotas.
	contenedorResultado addMorph: botonHistorialTurnos.

	botonMenuPrincipal mouseAction: [ self delete ].

	botonBuscar mouseAction: [
		clienteEncontrado := veterinaria buscarClientePorDni:
			                     inputBuscador text asString.
		clienteEncontrado
			ifNil: [
				contenedorResultado hide.
				(CuadroConMensaje conMensaje: 'Cliente no encontrado') openInWorld ]
			ifNotNil: [
				labelResultado setText: clienteEncontrado descripcionTextual.
				contenedorResultado show ] ].

	botonAgregarMascota mouseAction: [
		| form registrada |
		form := FormRegistrarMascota new.
		form openInWorld.
		form accionAceptar: [ :unaMascota |
			registrada := clienteEncontrado agregarMascota: unaMascota.
			registrada
				ifTrue: [
					(CuadroConMensaje conMensaje: 'Mascota registrada correctamente')
						openInWorld ]
				ifFalse: [
					(CuadroConMensaje conMensaje:
						 'Ha ocurrido un error al registrar el cliente') openInWorld ] ] ].

	botonVerMascotas mouseAction: [
		ListaDeMascotasDeCliente deCliente: clienteEncontrado ].
	
	botonHistorialTurnos mouseAction: [ 
		(ListaHistorialTurnosDeCliente new) 
		turnos: (veterinaria historialDeTurnosDe: clienteEncontrado ) de: clienteEncontrado. 
		 ].

	self addMorph: labelBuscador.
	self addMorph: inputBuscador.
	self addMorph: botonBuscar.
	self addMorph: contenedorResultado.
	contenedorResultado hide.
	self addMorph: botonMenuPrincipal
]
