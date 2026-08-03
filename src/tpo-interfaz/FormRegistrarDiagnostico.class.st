Class {
	#name : 'FormRegistrarDiagnostico',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'medicosDisponibles',
		'clientesDisponibles',
		'accionAceptar',
		'campoDia',
		'campoMes',
		'campoAnio',
		'campoDescripcion',
		'botonMedico',
		'botonMascota',
		'mascotaSeleccionada',
		'medicoSeleccionado',
		'botonAceptar',
		'botonCancelar'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'propios del tipo' }
FormRegistrarDiagnostico >> acceso: unaVeterinaria [
	veterinaria := unaVeterinaria.
	self openInWorld
]

{ #category : 'propios del tipo' }
FormRegistrarDiagnostico >> accionAceptar: unBloque [
	accionAceptar := unBloque
]

{ #category : 'propios del tipo' }
FormRegistrarDiagnostico >> generarFechaDiagnostico [

	| f |
	f := Date
		     newDay: campoDia texto asInteger
		     month: campoMes texto asInteger
		     year: campoAnio texto asInteger.
	^ f
]

{ #category : 'inicializadores' }
FormRegistrarDiagnostico >> initialize [

	| origen aDia aMes aAnio espacios |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 800).
	origen := self innerBounds origin.

	campoDescripcion := LabelConCampo label: 'Ingrese una descripcion: '.
	campoDescripcion position: origen + (50 @ 30).
	campoDescripcion ancho: self width - 100.

	aDia := 130.
	aMes := 130.
	aAnio := 200.
	espacios := 19.


	campoDia := LabelConCampo label: 'Día del diagnostico: '.
	campoDia position: campoDescripcion position + (0 @ 100).
	campoDia ancho: aDia.

	campoMes := LabelConCampo label: 'Mes del diagnostico: '.
	campoMes position: campoDia position + (aDia + espacios @ 0).
	campoMes ancho: aMes.

	campoAnio := LabelConCampo label: 'Año del diagnostico: '.
	campoAnio position: campoMes position + (aMes + espacios @ 0).
	campoAnio ancho: aAnio.


	botonMascota := BotonAccion new.
	botonMascota label: 'elegir Mascota: '.
	botonMascota ancho: self width - 100 alto: 40.
	botonMascota position: campoDia position + (0 @ 100).

	mascotaSeleccionada := ''.
	botonMascota mouseAction: [
		| buscador |
		"llama al buscador de mascota"
		buscador := BuscadorMascota new.
		"le manda los clientes que tiene la veterinaria y abre el mundo"
		buscador acceso: veterinaria.
		"si el cliente selecciona una mascota, se guarda en mascotaSeleccionada"
		buscador accionAceptar: [ :unaMascota |
			mascotaSeleccionada := unaMascota.
			botonMascota label: 'Mascota: ' , unaMascota nombre.
			botonMascota extent: self width - 100 @ 40 ] ].


	botonMedico := BotonAccion new.
	botonMedico label: 'elegir Medico: '.
	botonMedico ancho: self width - 100 alto: 40.
	botonMedico position: botonMascota position + (0 @ 100).

	medicoSeleccionado := ''.
	botonMedico mouseAction: [
		| textos elegido |
		textos := veterinaria medicos collect: [ :m |
			          m dni , ' - ' , m nombre , ' ' , m apellido ].
		"UIManager es un objeto propio de pharo, en este caso usamos chooseFrom para seleccionar un medico de la coleccion de medicos"
		elegido := UIManager default
			           chooseFrom: textos
			           values: veterinaria medicos
			           title: 'Seleccione un médico'.
		elegido ifNotNil: [
			medicoSeleccionado := elegido.
			botonMedico label: 'Médico: ' , elegido dni.
			botonMedico extent: self width - 100 @ 40 ] ].
	
	botonCancelar := BotonAccion new.
	botonCancelar label: 'Cancelar'.
	botonCancelar color: (Color fromHexString: 'B08968').
	botonCancelar position: botonMedico position + (0 @ 100).
	botonCancelar ancho: 150 alto: 40.
	botonCancelar mouseAction: [
		| adv |
		adv := CuadroConMensaje conMensaje: '¿Está seguro de que desea cancelar 	el registro?'.
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
		(campoDescripcion texto isEmpty or: [
			 mascotaSeleccionada isNil or: [ medicoSeleccionado isNil ] ])
			ifTrue: [
				(CuadroConMensaje conMensaje: 'Complete todos los campos')
					openInWorld ]
			ifFalse: [
				| unaFecha unDiagnostico |
				unaFecha := self generarFechaDiagnostico.
				unDiagnostico := Diagnostico
					                 crearDiagnosticoConFecha: unaFecha
					                 descripcion: campoDescripcion texto
					                 veterinario: medicoSeleccionado
					                 mascota: mascotaSeleccionada.
				accionAceptar value: unDiagnostico.
				self delete ] ].

	self addMorph: campoDescripcion.
	self addMorph: campoDia.
	self addMorph: campoMes.
	self addMorph: campoAnio.
	self addMorph: botonMascota.
	self addMorph: botonMedico.
	self addMorph: botonCancelar.
	self addMorph: botonAceptar
]

{ #category : 'propios del tipo' }
FormRegistrarDiagnostico >> validarFormulario [

	| valores completo |
	completo := true.
	valores := OrderedCollection new.
	valores add: campoDescripcion texto.
	valores add: campoDia texto.
	valores add: campoMes texto.
	valores add: campoAnio texto.
	valores add: mascotaSeleccionada texto.
	valores add: medicoSeleccionado texto.

	(valores detect: [ :c | c isEmpty ] ifNone: [ nil ]) ifNotNil: [
		completo := false ].
	^ completo
]
