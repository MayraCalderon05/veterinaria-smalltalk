Class {
	#name : 'FormRegistrarCliente',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
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

	tipoSeleccionado := ''.
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
	botonCancelar position: campoTipo position + (0 @ 80).
	botonCancelar ancho: 150 alto: 40.
	botonCancelar mouseAction: [
		| adv |
		adv := CuadroConMensaje conMensaje:
			       '¿Está seguro de que desea cancelar el registro?'.
		adv agregarBotonCancelar: [ adv delete ].
		adv accionAceptar: [
			adv delete.
			self delete ].
		adv openInWorld ].

	botonAceptar := BotonAccion new.
	botonAceptar label: 'Aceptar'.
	botonAceptar color: (Color fromHexString: '6A994E').
	botonAceptar position: botonCancelar position + (350 @ 0).
	botonAceptar ancho: 150 alto: 40.
	botonAceptar mouseAction: [
		self validarFormulario
			ifFalse: [
				(CuadroConMensaje conMensaje: 'Complete todos los campos')
					openInWorld ]
			ifTrue: [
				| form |
				form := FormRegistrarMascota new.
				form accionAceptar: [ :unaMascota |
					| unCliente registrado |
					unCliente := Cliente
						             crearClienteConDni: campoDni texto
						             nombre: campoNombre texto
						             apellido: campoApellido texto
						             domicilio: campoDomicilio texto
						             telefono: campoTelefono texto
						             email: campoEmail texto
						             tipo: tipoSeleccionado
						             mascota: unaMascota.
					registrado := veterinaria agregarCliente: unCliente.
					registrado
						ifTrue: [
							(CuadroConMensaje conMensaje:
								 'Cliente registrado correctamente') openInWorld ]
						ifFalse: [
							(CuadroConMensaje conMensaje:
								 'Ya existe un cliente con ese DNI') openInWorld ] ].
				form openInWorld.
				self delete ] ].


	self addMorph: campoDni.
	self addMorph: campoNombre.
	self addMorph: campoApellido.
	self addMorph: campoDomicilio.
	self addMorph: campoTelefono.
	self addMorph: campoEmail.
	self addMorph: campoTipo.
	self addMorph: botonCancelar.
	self addMorph: botonAceptar
]

{ #category : 'propios del tipo' }
FormRegistrarCliente >> validarFormulario [

	| valores completo |
	completo := true.
	valores := OrderedCollection new.
	valores add: campoDni texto.
	valores add: campoNombre texto.
	valores add: campoApellido texto.
	valores add: campoDomicilio texto.
	valores add: campoTelefono texto.
	valores add: campoEmail texto.
	valores add: tipoSeleccionado.

	(valores detect: [:c | (c isEmpty )] ifNone: [nil]) ifNotNil: [ completo:= false ].
	^ completo
]

{ #category : 'propios del tipo' }
FormRegistrarCliente >> veterinaria: unaVet [

	veterinaria := unaVet
]
