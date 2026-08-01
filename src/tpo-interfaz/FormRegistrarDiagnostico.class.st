Class {
	#name : 'FormRegistrarDiagnostico',
	#superclass : 'BorderedMorph',
	#instVars : [
		'campoFecha',
		'campoDescripcion',
		'campoMedico',
		'campoMascota',
		'botonAceptar',
		'botonCancelar'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'inicializadores' }
FormRegistrarDiagnostico >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 800).
	origen := self innerBounds origin.

	campoFecha := LabelConCampo label: 'Ingrese la fecha: '.
	campoFecha position: origen + (50 @ 30).
	campoFecha ancho: self width - 100.

	campoDescripcion := LabelConCampo label: 'Ingrese su nombre: '.
	campoDescripcion position: campoFecha position + (0 @ 100).
	campoDescripcion ancho: self width - 100.

	campoMedico := LabelConCampo label: 'Ingrese su apellido: '.
	campoMedico position: campoDescripcion position + (0 @ 100).
	campoMedico ancho: self width - 100.

	campoMascota := LabelConCampo label: 'Ingrese su domicilio: '.
	campoMascota position: campoMedico position + (0 @ 100).
	campoMascota ancho: self width - 100.

	botonCancelar := BotonAccion new.
	botonCancelar label: 'Cancelar'.
	botonCancelar color: (Color fromHexString: 'B08968').
	botonCancelar position: campoMascota position + (0 @ 80).
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
	"
	botonAceptar mouseAction: [
		self validarFormulario
			ifFalse: [
				(CuadroConMensaje conMensaje: 'Complete todos los campos')
					openInWorld ]
			ifTrue: [
				| form |
				form := FormRegistrarMascota new.
				form openInWorld.
				form accionAceptar: [ :unaMascota |
					| unCliente |
					unCliente := Cliente
						             crearClienteConDni: campoDni texto
						             nombre: campoNombre texto
						             apellido: campoApellido texto
						             domicilio: campoDomicilio texto
						             telefono: campoTelefono texto
						             email: campoEmail texto
						             tipo: tipoSeleccionado
						             mascota: unaMascota.
					accionAceptar value: unCliente ].
				self delete ] ].
"


	self addMorph: campoFecha .
	self addMorph: campoDescripcion .
	self addMorph: campoMedico .
	self addMorph: campoMascota .
	self addMorph: botonCancelar.
	self addMorph: botonAceptar



]
