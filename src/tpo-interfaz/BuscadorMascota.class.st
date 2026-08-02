Class {
	#name : 'BuscadorMascota',
	#superclass : 'BorderedMorph',
	#instVars : [
		'clientesDisponibles',
		'accionAceptar',
		'labelBuscador',
		'inputBuscador',
		'botonBuscar',
		'clienteEncontrado',
		'labelResultado',
		'botonElegirMascota',
		'botonCancelar'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'propios del tipo' }
BuscadorMascota >> accionAceptar: unBloque [
	accionAceptar := unBloque
]

{ #category : 'propios del tipo' }
BuscadorMascota >> clientesDisponibles: unaColeccion [
	clientesDisponibles := unaColeccion
]

{ #category : 'inicializadores' }
BuscadorMascota >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 500 @ 250).
	origen := self innerBounds origin.

	labelBuscador := TextMorph new.
	labelBuscador contents: 'Ingrese DNI del dueño:'.
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
	botonBuscar position: inputBuscador position + (0 @ 40).

	labelResultado := TextMorph new.
	labelResultado contents: ''.
	labelResultado color: Color black.
	labelResultado position: botonBuscar position + (0 @ 40).

	botonElegirMascota := BotonAccion new.
	botonElegirMascota label: 'Elegir mascota'.
	botonElegirMascota extent: 150 @ 30.
	botonElegirMascota position: labelResultado position + (0 @ 40).

	botonBuscar mouseAction: [
		| dniIngresado |
		dniIngresado := inputBuscador text asString.
		"busca que cliente tiene ese dni"
		clienteEncontrado := clientesDisponibles
			                     detect: [ :c | c dni = dniIngresado ]
			                     ifNone: [ nil ].

		clienteEncontrado
			ifNil: [ "si encontro el cliente, muestra al cliente"
				labelResultado contents: ''.
				(CuadroConMensaje conMensaje: 'Cliente no encontrado') openInWorld ]
			ifNotNil: [
				labelResultado contents:
					'Cliente: ' , clienteEncontrado nombre , ' - '
					, clienteEncontrado mascotas size printString , ' mascota(s)' ]
		"si no encontro el cliente le avisa" ].
	"aca aparecen las masoctas de ese cliente para poder seleccionar alguna"
	botonElegirMascota mouseAction: [
		clienteEncontrado
			ifNil: [
				(CuadroConMensaje conMensaje: 'Primero busque un cliente')
					openInWorld ]
			ifNotNil: [
				| nombres elegida |
				nombres := clienteEncontrado mascotas collect: [ :m | m nombre ].
				elegida := UIManager default
					           chooseFrom: nombres
					           values: clienteEncontrado mascotas
					           title: 'Seleccione una mascota'.
				elegida ifNotNil: [
					accionAceptar value: elegida.
					self delete ] ] ].
		
		
	botonCancelar := BotonAccion new.
	botonCancelar label: 'Cancelar'.
	botonCancelar color: (Color fromHexString: 'B08968').
	botonCancelar extent: 150 @ 30.
	botonCancelar position: botonElegirMascota position + (170 @ 0).
	
	botonCancelar mouseAction: [
	| adv |
	adv := CuadroConMensaje conMensaje: '¿Está seguro de que desea cancelar la búsqueda?'.
	adv agregarBotonCancelar: [ adv delete ].
	adv accionAceptar: [
		adv delete.
		self delete ].
	adv openInWorld ].

	self addMorph: labelBuscador.
	self addMorph: inputBuscador.
	self addMorph: botonBuscar.
	self addMorph: labelResultado.
	self addMorph: botonElegirMascota.
	self addMorph: botonCancelar
]
