Class {
	#name : 'FormTratamientoFarmacologico',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'accionAceptar',
		'campoMotivo',
		'campoDosis',
		'campoFrecuencia',
		'botonMedicamento',
		'medicamentoSeleccionado',
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
FormTratamientoFarmacologico >> acceso: unaVeterinaria [
	veterinaria := unaVeterinaria.
	self openInWorld
]

{ #category : 'propios del tipo' }
FormTratamientoFarmacologico >> accionAceptar: unBloque [
	accionAceptar := unBloque
]

{ #category : 'inicializadores' }
FormTratamientoFarmacologico >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 650 @ 600).
	origen := self innerBounds origin.

	campoMotivo := LabelConCampo label: 'Motivo: '.
	campoMotivo position: origen + (50 @ 30).
	campoMotivo ancho: self width - 100.

	botonMedicamento := BotonAccion new.
	botonMedicamento label: 'Elegir medicamento'.
	botonMedicamento extent: self width - 100 @ 40.
	botonMedicamento position: campoMotivo position + (0 @ 90).
	medicamentoSeleccionado := nil.

	campoDosis := LabelConCampo label: 'Dosis (numero, ej: 5): '.
	campoDosis position: botonMedicamento position + (0 @ 90).
	campoDosis ancho: self width - 100.

	campoFrecuencia := LabelConCampo label: 'Frecuencia (numero, ej: 12): '.
	campoFrecuencia position: campoDosis position + (0 @ 90).
	campoFrecuencia ancho: self width - 100.

	campoDia := LabelConCampo label: 'Día: '.
	campoDia position: campoFrecuencia position + (0 @ 90).
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

	botonMedicamento mouseAction: [
		| nombres elegido |
		nombres := (veterinaria stockMedicamento collect: [ :s |
			            s medicamento ]) collect: [ :m | m nombre ].
		elegido := UIManager default
			           chooseFrom: nombres
			           values:
			           (veterinaria stockMedicamento collect: [ :s |
				            s medicamento ])
			           title: 'Seleccione un medicamento'.
		elegido ifNotNil: [
			medicamentoSeleccionado := elegido.
			botonMedicamento label: 'Medicamento: ' , elegido nombre.
			botonMedicamento extent: self width - 100 @ 40 ] ].

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
		medicamentoSeleccionado isNil or: [
		campoDosis texto isEmpty or: [
		campoFrecuencia texto isEmpty ] ] ])
		ifTrue: [
			(CuadroConMensaje conMensaje: 'Complete todos los campos') openInWorld ]
		ifFalse: [
			(campoDosis texto asInteger isNil or: [ campoFrecuencia texto asInteger isNil ])
				ifTrue: [
					(CuadroConMensaje conMensaje: 'Dosis y frecuencia deben ser números') openInWorld ]
				ifFalse: [
					| unaFecha unTratamiento |
					unaFecha := Date
						newDay: campoDia texto asInteger
						month: campoMes texto asInteger
						year: campoAnio texto asInteger.
					unTratamiento := Farmacologico
						crearTratFarmacologicoConFecha: unaFecha
						motivo: campoMotivo texto
						monodroga: medicamentoSeleccionado
						dosis: campoDosis texto asInteger
						frecuencia: campoFrecuencia texto asInteger.
					accionAceptar value: unTratamiento.
					self delete ] ] ].

	self addMorph: campoMotivo.
	self addMorph: botonMedicamento.
	self addMorph: campoDosis.
	self addMorph: campoFrecuencia.
	self addMorph: campoDia.
	self addMorph: campoMes.
	self addMorph: campoAnio.
	self addMorph: botonCancelar.
	self addMorph: botonAceptar
]
