Class {
	#name : 'BuscadorFactura',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'labelBuscador',
		'inputBuscador',
		'botonBuscar',
		'clienteEncontrado',
		'labelResultado',
		'botonVerDetalle',
		'botonPagar',
		'botonCancelar'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'propios del tipo' }
BuscadorFactura >> acceso: unaVeterinaria [

	veterinaria := unaVeterinaria.
	self openInWorld
]

{ #category : 'inicializadores' }
BuscadorFactura >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 500 @ 350).
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

	botonVerDetalle := BotonAccion new.
	botonVerDetalle label: 'Ver facturas pendientes'.
	botonVerDetalle extent: 220 @ 30.
	botonVerDetalle position: labelResultado position + (0 @ 40).

	botonPagar := BotonAccion new.
	botonPagar label: 'Pagar una factura'.
	botonPagar extent: 220 @ 30.
	botonPagar position: botonVerDetalle position + (0 @ 40).

	botonCancelar := BotonAccion new.
	botonCancelar label: 'Cancelar'.
	botonCancelar color: (Color fromHexString: 'B08968').
	botonCancelar extent: 150 @ 30.
	botonCancelar position: botonPagar position + (0 @ 40).

	botonBuscar mouseAction: [
		clienteEncontrado := veterinaria buscarClientePorDni:
			                     inputBuscador text asString.
		clienteEncontrado
			ifNil: [
				labelResultado contents: ''.
				(CuadroConMensaje conMensaje: 'Cliente no encontrado') openInWorld ]
			ifNotNil: [
				labelResultado contents:
					'Cliente: ' , clienteEncontrado nombre , ' - '
					,
					(veterinaria facturasPendientesDe: clienteEncontrado) size
						printString , ' factura(s) pendiente(s)' ] ].


	botonVerDetalle mouseAction: [
	| resultados texto |
	clienteEncontrado
		ifNil: [ (CuadroConMensaje conMensaje: 'Primero busque un cliente') openInWorld ]
		ifNotNil: [
			resultados := veterinaria facturasPendientesDe: clienteEncontrado.
			resultados isEmpty
				ifTrue: [ labelResultado contents: 'Ese cliente no tiene facturas pendientes.' ]
				ifFalse: [
					texto := WriteStream on: String new.
					texto nextPutAll: 'Facturas pendientes de ', clienteEncontrado nombre, ':'; cr.
					resultados do: [:r |
						texto nextPutAll: '  - Saldo: $', (r at: 2) printString; cr ].
					labelResultado contents: texto contents ] ] ].

	botonPagar mouseAction: [
		| resultados textos elegido facturaElegida |
		clienteEncontrado
			ifNil: [
				(CuadroConMensaje conMensaje: 'Primero busque un cliente')
					openInWorld ]
			ifNotNil: [
				resultados := veterinaria facturasPendientesDe: clienteEncontrado.
				resultados isEmpty
					ifTrue: [
						(CuadroConMensaje conMensaje:
							 'Ese cliente no tiene facturas pendientes') openInWorld ]
					ifFalse: [
						textos := resultados collect: [ :r |
							          'Cliente: ' , (r at: 1) nombre , ' - Saldo:$'
							          , (r at: 2) printString ].
						elegido := UIManager default
							           chooseFrom: textos
							           values: resultados
							           title: 'Seleccione una factura para pagar'.
						elegido ifNotNil: [
							facturaElegida := elegido at: 3.
							FormRegistrarPago new acceso: facturaElegida.
							self delete ] ] ] ].

	botonCancelar mouseAction: [
		| adv |
		adv := CuadroConMensaje conMensaje:
			       '¿Está seguro de que desea cancelar?'.
		adv agregarBotonCancelar: [ adv delete ].
		adv accionAceptar: [
			adv delete.
			self delete ].
		adv openInWorld ].

	self addMorph: labelBuscador.
	self addMorph: inputBuscador.
	self addMorph: botonBuscar.
	self addMorph: labelResultado.
	self addMorph: botonVerDetalle.
	self addMorph: botonPagar.
	self addMorph: botonCancelar
]
