Class {
	#name : 'FormRegistrarPago',
	#superclass : 'BorderedMorph',
	#instVars : [
		'factura',
		'accionAceptar',
		'campoMonto',
		'botonMedioPago',
		'medioPagoSeleccionado',
		'campoDia',
		'campoMes',
		'campoAnio',
		'botonCancelar',
		'botonAceptar'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'propios del tipo' }
FormRegistrarPago >> acceso: unaFactura [
	factura := unaFactura.
	self openInWorld
]

{ #category : 'propios del tipo' }
FormRegistrarPago >> accionAceptar: unBloque [
	accionAceptar := unBloque
]

{ #category : 'inicializadores' }
FormRegistrarPago >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 500 @ 500).
	origen := self innerBounds origin.

	campoMonto := LabelConCampo label: 'Monto a abonar: '.
	campoMonto position: origen + (50 @ 30).
	campoMonto ancho: self width - 100.

	botonMedioPago := BotonAccion new.
	botonMedioPago label: 'Elegir medio de pago'.
	botonMedioPago extent: self width - 100 @ 40.
	botonMedioPago position: campoMonto position + (0 @ 90).
	medioPagoSeleccionado := nil.

	campoDia := LabelConCampo label: 'Día: '.
	campoDia position: botonMedioPago position + (0 @ 90).
	campoDia ancho: 120.

	campoMes := LabelConCampo label: 'Mes: '.
	campoMes position: campoDia position + (140 @ 0).
	campoMes ancho: 120.

	campoAnio := LabelConCampo label: 'Año: '.
	campoAnio position: campoMes position + (140 @ 0).
	campoAnio ancho: 120.

	botonCancelar := BotonAccion new.
	botonCancelar label: 'Cancelar'.
	botonCancelar color: (Color fromHexString: 'B08968').
	botonCancelar extent: 150 @ 40.
	botonCancelar position: campoDia position + (0 @ 90).

	botonAceptar := BotonAccion new.
	botonAceptar label: 'Aceptar'.
	botonAceptar color: (Color fromHexString: '6A994E').
	botonAceptar extent: 150 @ 40.
	botonAceptar position: botonCancelar position + (230 @ 0).

	botonMedioPago mouseAction: [
		| opciones elegido |
		opciones := #( 'Credito' 'Billetera virtual' 'Efectivo' 'Transferencia bancaria'
		               'Tarjeta de debito' ).
		elegido := UIManager default
			           chooseFrom: opciones
			           title: 'Seleccione el medio de pago'.
		elegido > 0 ifTrue: [
			medioPagoSeleccionado := opciones at: elegido.
			botonMedioPago label: 'Medio de pago: ' , medioPagoSeleccionado.
			botonMedioPago extent: self width - 100 @ 40 ] ].

	botonCancelar mouseAction: [
		| adv |
		adv := CuadroConMensaje conMensaje:
			       '¿Está seguro de que desea cancelar?'.
		adv agregarBotonCancelar: [ adv delete ].
		adv accionAceptar: [
			adv delete.
			self delete ].
		adv openInWorld ].

	botonAceptar mouseAction: [
		(campoMonto texto isEmpty or: [
			 medioPagoSeleccionado isNil or: [ campoMonto texto asNumber isNil ] ])
			ifTrue: [
				(CuadroConMensaje conMensaje:
					 'Complete todos los campos correctamente') openInWorld ]
			ifFalse: [
				| unaFecha unPago exito |
				unaFecha := Date
					            newDay: campoDia texto asInteger
					            month: campoMes texto asInteger
					            year: campoAnio texto asInteger.
				unPago := Pago
					          crearPagoConFecha: unaFecha
					          montoAbonado: campoMonto texto asNumber
					          medioPago: medioPagoSeleccionado.
				exito := factura registrarPago: unPago.
				exito
					ifTrue: [
						(CuadroConMensaje conMensaje: 'Pago registrado correctamente')
							openInWorld ]
					ifFalse: [
						(CuadroConMensaje conMensaje:
							 'No se pudo registrar el pago (verifique el monto)')
							openInWorld ].
				self delete ] ].

	self addMorph: campoMonto.
	self addMorph: botonMedioPago.
	self addMorph: campoDia.
	self addMorph: campoMes.
	self addMorph: campoAnio.
	self addMorph: botonCancelar.
	self addMorph: botonAceptar
]
