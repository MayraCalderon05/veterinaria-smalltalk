Class {
	#name : 'BuscadorDiagnostico',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'accionAceptar',
		'labelBuscador',
		'inputBuscador',
		'botonBuscar',
		'clienteEncontrado',
		'mascotaSeleccionada',
		'labelResultado',
		'botonElegirMascota',
		'botonElegirDiagnostico',
		'botonCancelar'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'propios del tipo' }
BuscadorDiagnostico >> acceso: unaVeterinaria [
	veterinaria := unaVeterinaria.
	self openInWorld
]

{ #category : 'propios del tipo' }
BuscadorDiagnostico >> accionAceptar: unBloque [
	accionAceptar := unBloque
]

{ #category : 'inicializadores' }
BuscadorDiagnostico >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 500 @ 300).
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

	botonElegirDiagnostico := BotonAccion new.
	botonElegirDiagnostico label: 'Elegir diagnóstico'.
	botonElegirDiagnostico extent: 150 @ 30.
	botonElegirDiagnostico position:
		botonElegirMascota position + (0 @ 40).

	botonCancelar := BotonAccion new.
	botonCancelar label: 'Cancelar'.
	botonCancelar color: (Color fromHexString: 'B08968').
	botonCancelar extent: 150 @ 30.
	botonCancelar position: botonElegirDiagnostico position + (0 @ 40).

	botonBuscar mouseAction: [
		clienteEncontrado := veterinaria buscarClientePorDni: inputBuscador text asString.
		clienteEncontrado
			ifNil: [
				labelResultado contents: ''.
				(CuadroConMensaje conMensaje: 'Cliente no encontrado') openInWorld ]
			ifNotNil: [
				labelResultado contents:
					'Cliente: ' , clienteEncontrado nombre , ' - '
					, clienteEncontrado mascotas size printString , ' mascota(s)' ] ].

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
					mascotaSeleccionada := elegida.
					botonElegirMascota label: 'Mascota: ' , elegida nombre.
					botonElegirMascota extent: 150 @ 30 ] ] ].

	botonElegirDiagnostico mouseAction: [
		mascotaSeleccionada
			ifNil: [
				(CuadroConMensaje conMensaje: 'Primero elija una mascota')
					openInWorld ]
			ifNotNil: [
				| diagnosticosDeLaMascota textos elegido |
				diagnosticosDeLaMascota := veterinaria diagnosticos
				select: [:d | d mascota equals: mascotaSeleccionada].
				diagnosticosDeLaMascota isEmpty
					ifTrue: [
						(CuadroConMensaje conMensaje:
							 'Esa mascota no tiene diagnósticos') openInWorld ]
					ifFalse: [
						textos := diagnosticosDeLaMascota collect: [:d | d 					fechaDiagnostico printString, ' - ', d descripcion].
						elegido := UIManager default
							           chooseFrom: textos
							           values: diagnosticosDeLaMascota
							           title: 'Seleccione un diagnóstico'.
						elegido ifNotNil: [
							accionAceptar value: elegido.
							self delete ] ] ] ].

	botonCancelar mouseAction: [
		| adv |
		adv := CuadroConMensaje conMensaje:
			       '¿Está seguro de que desea cancelar la búsqueda?'.
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
	self addMorph: botonElegirDiagnostico.
	self addMorph: botonCancelar
]
