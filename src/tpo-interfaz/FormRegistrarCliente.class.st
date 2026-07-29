Class {
	#name : 'FormRegistrarCliente',
	#superclass : 'BorderedMorph',
	#instVars : [
		'campoDni',
		'campoNombre',
		'campoApellido',
		'campoDomicilio',
		'campoTelefono',
		'campoEmail',
		'campoTipo',
		'tipoSeleccionado',
		'botonAceptar',
		'botonCancelar'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'inicializadores' }
FormRegistrarCliente >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 800).
	origen := self innerBounds origin.

	campoDni := LabelConCampo label: 'Ingrese su DNI: '.
	campoDni position: origen + (50 @ 30).
	campoDni ancho: self width - 100.

	campoNombre := LabelConCampo label: 'Ingrese su nombre: '.
	campoNombre position: campoDni position + (0 @ 100).
	campoNombre ancho: self width - 100.

	campoApellido := LabelConCampo label: 'Ingrese su apellido: '.
	campoApellido position: campoNombre position + (0 @ 100).
	campoApellido ancho: self width - 100.

	campoDomicilio := LabelConCampo label: 'Ingrese su domicilio: '.
	campoDomicilio position: campoApellido position + (0 @ 100).
	campoDomicilio ancho: self width - 100.

	campoTelefono := LabelConCampo label: 'Ingrese su telefono: '.
	campoTelefono position: campoDomicilio position + (0 @ 100).
	campoTelefono ancho: self width - 100.

	campoEmail := LabelConCampo label: 'Ingrese su email: '.
	campoEmail position: campoTelefono position + (0 @ 100).
	campoEmail ancho: self width - 100.

	campoTipo := BotonAccion new.
	campoTipo label: 'Tipo: (elegir)'.
	campoTipo ancho: self width - 100 alto: 40.
	campoTipo position: campoEmail position + (0 @ 100).

	campoTipo mouseAction: [
		| opciones indice |
		opciones := #( 'Particular' 'Institucional' ).
		indice := UIManager default
			          chooseFrom: opciones
			          title: 'Tipo de cliente'.
		indice > 0 ifTrue: [
			tipoSeleccionado := opciones at: indice.
			campoTipo label: 'Tipo: ' , tipoSeleccionado.
			campoTipo ancho: self width - 100 alto: 40 ] ].
	
	botonCancelar := BotonAccion new.
	botonCancelar label: 'Cancelar'.
	botonCancelar color: (Color fromHexString: 'B08968').
	botonCancelar position: campoTipo position + (0@80).	
	botonCancelar ancho: 150 alto: 40.
	
	botonAceptar := BotonAccion new.
	botonAceptar label: 'Aceptar'.
	botonAceptar color: (Color fromHexString: '6A994E').
	botonAceptar position: botonCancelar position + (350@0).	
	botonAceptar ancho: 150 alto: 40.
		
	

	self addMorph: campoDni.
	self addMorph: campoNombre.
	self addMorph: campoApellido.
	self addMorph: campoDomicilio.
	self addMorph: campoTelefono.
	self addMorph: campoEmail.
	self addMorph: campoTipo.
	self addMorph: botonCancelar .
	self addMorph: botonAceptar .

]
