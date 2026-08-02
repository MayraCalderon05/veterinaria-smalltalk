Class {
	#name : 'TurnoTratamiento',
	#superclass : 'Turno',
	#instVars : [
		'tratamiento'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
TurnoTratamiento class >> crearTurnoTratamientoConFecha: unaFechaTurno hora: unaHoraTurno motivo: unMotivo cliente: unCliente mascota: unaMascota veterinario: unMedico tratamiento: unTratamiento [

	| tt |
	tt := self new.
	tt
		inicializarTurnoConFecha: unaFechaTurno
		hora: unaHoraTurno
		motivo: unMotivo
		cliente: unCliente
		mascota: unaMascota
		veterinario: unMedico.
	tt inicializarTurnoTratamiento: unTratamiento.
	^ tt
]

{ #category : 'propios del tipo' }
TurnoTratamiento >> atender [

	super atender.
	tratamiento atenderTratamiento.
]

{ #category : 'propios del tipo' }
TurnoTratamiento >> descripcionTextual [

	| tipo |
	tipo := tratamiento esFarmacologico
		        ifTrue: [ 'Farmacológico' ]
		        ifFalse: [ 'Quirúgico' ].
	^ super descripcionTextual , 'Tratamiento: ' , tipo asString, String lf
]

{ #category : 'propios del tipo' }
TurnoTratamiento >> esTurnoTratamiento [ 
^true
]

{ #category : 'propios del tipo' }
TurnoTratamiento >> esValidoTratamiento [
^ tratamiento esValido 
]

{ #category : 'propios del tipo' }
TurnoTratamiento >> estaPendienteTratamiento [

	| rta|
	rta := false.
	rta := (tratamiento estadoPendiente) ifTrue: [ true ].
	^ rta
]

{ #category : 'inicializadores' }
TurnoTratamiento >> inicializarTurnoTratamiento: unTratamiento [
tratamiento := unTratamiento.
]

{ #category : 'visualizadores' }
TurnoTratamiento >> tratamiento [
^tratamiento 
]
