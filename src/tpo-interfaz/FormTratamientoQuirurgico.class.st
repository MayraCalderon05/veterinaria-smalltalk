Class {
	#name : 'FormTratamientoQuirurgico',
	#superclass : 'BorderedMorph',
	#instVars : [
		'accionAceptar',
		'campoMotivo',
		'campoNombreProcedimiento',
		'botonNivelRiesgo',
		'nivelRiesgoSeleccionado',
		'botonTipoAnestesia',
		'tipoAnestesiaSeleccionado',
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
FormTratamientoQuirurgico >> accionAceptar: unBloque [
	accionAceptar := unBloque
]

{ #category : 'inicializadores' }
FormTratamientoQuirurgico >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 650 @ 600).
	origen := self innerBounds origin.

	campoMotivo := LabelConCampo label: 'Motivo: '.
	campoMotivo position: origen + (50 @ 30).
	campoMotivo ancho: self width - 100.

	campoNombreProcedimiento := LabelConCampo label: 'Procedimiento: '.
	campoNombreProcedimiento position: campoMotivo position + (0 @ 90).
	campoNombreProcedimiento ancho: self width - 100.

	botonNivelRiesgo := BotonAccion new.
	botonNivelRiesgo label: 'Elegir nivel de riesgo'.
	botonNivelRiesgo extent: self width - 100 @ 40.
	botonNivelRiesgo position: campoNombreProcedimiento position + (0 @ 90).
	nivelRiesgoSeleccionado := nil.

	botonTipoAnestesia := BotonAccion new.
	botonTipoAnestesia label: 'Elegir tipo de anestesia'.
	botonTipoAnestesia extent: self width - 100 @ 40.
	botonTipoAnestesia position: botonNivelRiesgo position + (0 @ 90).
	tipoAnestesiaSeleccionado := nil.

	campoDia := LabelConCampo label: 'Día: '.
	campoDia position: botonTipoAnestesia position + (0 @ 90).
	campoDia ancho: 150.

	campoMes := LabelConCampo label: 'Mes: '.
	campoMes position: campoDia position + (180 @ 0).
	campoMes ancho: 150.

	campoAnio := LabelConCampo label: 'Año: '.
	campoAnio position: campoMes position + (180 @ 0).
	campoAnio ancho: 150.

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
	
	botonNivelRiesgo mouseAction: [
	| niveles textos elegido |
	niveles := Quirurgico tablaDeRiesgo keys asSortedCollection asOrderedCollection.
	textos := niveles collect: [:n | n printString].
	elegido := UIManager default
		chooseFrom: textos
		values: niveles
		title: 'Seleccione el nivel de riesgo'.
	elegido ifNotNil: [
		nivelRiesgoSeleccionado := elegido.
		botonNivelRiesgo label: 'Nivel de riesgo: ', elegido printString.
		botonNivelRiesgo extent: self width - 100 @ 40 ] ].

botonTipoAnestesia mouseAction: [
	| tipos elegido |
	tipos := Quirurgico tablaDeAnestesia keys asOrderedCollection.
	elegido := UIManager default
		chooseFrom: tipos
		values: tipos
		title: 'Seleccione el tipo de anestesia'.
	elegido ifNotNil: [
		tipoAnestesiaSeleccionado := elegido.
		botonTipoAnestesia label: 'Anestesia: ', elegido.
		botonTipoAnestesia extent: self width - 100 @ 40 ] ].

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
	(campoMotivo texto isEmpty or: [
		campoNombreProcedimiento texto isEmpty or: [
		nivelRiesgoSeleccionado isNil or: [
		tipoAnestesiaSeleccionado isNil ] ] ])
		ifTrue: [
			(CuadroConMensaje conMensaje: 'Complete todos los campos') openInWorld ]
		ifFalse: [
			| unaFecha unTratamiento |
			unaFecha := Date
				newDay: campoDia texto asInteger
				month: campoMes texto asInteger
				year: campoAnio texto asInteger.
			unTratamiento := Quirurgico
				crearTratQuirurgicoConFecha: unaFecha
				motivo: campoMotivo texto
				nombreProcedimiento: campoNombreProcedimiento texto
				nivelRiesgo: nivelRiesgoSeleccionado
				tipoAnestesia: tipoAnestesiaSeleccionado.
			accionAceptar value: unTratamiento.
			self delete ] ].

	self addMorph: campoMotivo.
	self addMorph: campoNombreProcedimiento.
	self addMorph: botonNivelRiesgo .
	self addMorph: botonTipoAnestesia .
	self addMorph: campoDia.
	self addMorph: campoMes.
	self addMorph: campoAnio.
	self addMorph: botonCancelar.
	self addMorph: botonAceptar
]
