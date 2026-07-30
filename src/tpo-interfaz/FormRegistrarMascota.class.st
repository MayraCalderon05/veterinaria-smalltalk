Class {
	#name : 'FormRegistrarMascota',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'campoNombreMascota',
		'campoEspecie',
		'campoRaza',
		'campoDia',
		'campoMes',
		'campoAnio',
		'campoPeso',
		'botonAceptar',
		'accionAceptar',
		'botonCancelar'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'accessing' }
FormRegistrarMascota >> accionAceptar: unBloque [
	accionAceptar := unBloque .
]

{ #category : 'propios del tipo' }
FormRegistrarMascota >> generarFechaNacimiento [

	| f |
	f := Date
		     newDay: campoDia texto asInteger 
		     month: campoMes texto asInteger 
		     year: campoAnio texto asInteger .
	^ f
]

{ #category : 'inicializadores' }
FormRegistrarMascota >> initialize [

	| origen aDia aMes aAnio espacios |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 800).
	origen := self innerBounds origin.

	campoNombreMascota := LabelConCampo label:
		                      'Ingrese el nombre de la mascota: '.
	campoNombreMascota position: origen + (50 @ 30).
	campoNombreMascota ancho: self width - 100.

	campoEspecie := LabelConCampo label: 'Ingrese la especie: '.
	campoEspecie position: campoNombreMascota position + (0 @ 100).
	campoEspecie ancho: self width - 100.

	campoRaza := LabelConCampo label: 'Ingrese la raza: '.
	campoRaza position: campoEspecie position + (0 @ 100).
	campoRaza ancho: self width - 100.

	aDia := 130.
	aMes := 130.
	aAnio := 200.
	espacios := 19.


	campoDia := LabelConCampo label: 'Día de nacimiento: '.
	campoDia position: campoRaza position + (0 @ 100).
	campoDia ancho: aDia.

	campoMes := LabelConCampo label: 'Mes de nacimiento: '.
	campoMes position: campoDia position + (aDia + espacios @ 0).
	campoMes ancho: aMes.

	campoAnio := LabelConCampo label: 'Año de nacimiento: '.
	campoAnio position: campoMes position + (aMes + espacios @ 0).
	campoAnio ancho: aAnio.

	campoPeso := LabelConCampo label: 'Ingrese el peso: '.
	campoPeso position: campoDia position + (0 @ 100).
	campoPeso ancho: self width - 100.


	botonCancelar := BotonAccion new.
	botonCancelar label: 'Cancelar'.
	botonCancelar color: (Color fromHexString: 'B08968').
	botonCancelar position: campoPeso position + (0 @ 120).
	botonCancelar ancho: 150 alto: 40.
	botonCancelar mouseAction: [
		| adv |
		adv := CuadroConMensaje conMensaje:
			       '¿Está seguro de que desea cancelar el registro de la mascota?'.
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
			ifTrue: [
				| unaMascota fechaNac |
				fechaNac := self generarFechaNacimiento.
				unaMascota := Mascota
					              crearMascotaConNombre: campoNombreMascota texto
					              especie: campoEspecie texto
					              raza: campoRaza texto
					              fechaNacimiento: fechaNac
					              peso: campoPeso texto asNumber.
				accionAceptar value: unaMascota.
				self delete ]
			ifFalse: [
				(CuadroConMensaje conMensaje: 'Complete todos los campos')
					openInWorld ] ].




	self addMorph: campoNombreMascota.
	self addMorph: campoEspecie.
	self addMorph: campoRaza.
	self addMorph: campoDia.
	self addMorph: campoMes.
	self addMorph: campoAnio.
	self addMorph: campoPeso.
	self addMorph: botonCancelar.
	self addMorph: botonAceptar
]

{ #category : 'propios del tipo' }
FormRegistrarMascota >> validarFormulario [

	| valores completo |
	completo := true.
	valores := OrderedCollection new.
	valores add: campoNombreMascota texto.
	valores add: campoEspecie texto.
	valores add: campoRaza texto.
	valores add: campoPeso texto.
	valores add: campoDia texto.
	valores add: campoMes texto.
	valores add: campoAnio texto .
	
	(valores detect: [ :c | c isEmpty ] ifNone: [ nil ]) ifNotNil: [
		completo := false ].
	^ completo
]
