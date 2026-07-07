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

{ #category : 'inicializadores' }
TurnoTratamiento >> inicializarTurnoTratamiento: unTratamiento [
tratamiento := unTratamiento.
]

{ #category : 'visualizadores' }
TurnoTratamiento >> tratamiento [
^tratamiento 
]
