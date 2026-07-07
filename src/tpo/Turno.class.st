Class {
	#name : 'Turno',
	#superclass : 'Object',
	#instVars : [
		'fechaTurno',
		'horaTurno',
		'estado',
		'motivo',
		'cliente',
		'mascota',
		'veterinario'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'visualizadores' }
Turno >> cliente [

	^ cliente 
]

{ #category : 'visualizadores' }
Turno >> estado [ 

	^ estado 
]

{ #category : 'modificadores' }
Turno >> estado: unEstado [

	estado := unEstado 
]

{ #category : 'visualizadores' }
Turno >> fechaTurno [
^fechaTurno 
]

{ #category : 'modificadores' }
Turno >> fechaTurno: unaFechaTurno [
fechaTurno := unaFechaTurno 
]

{ #category : 'visualizadores' }
Turno >> horaTurno [ 

	^ horaTurno 
]

{ #category : 'modificadores' }
Turno >> horaTurno: unaHoraTurno [

	horaTurno := unaHoraTurno 
]

{ #category : 'inicializadores' }
Turno >> inicializarTurnoConFecha: unaFechaTurno hora: unaHoraTurno motivo: unMotivo cliente: unCliente mascota: unaMascota veterinario: unMedico [

	fechaTurno := unaFechaTurno.
	horaTurno := unaHoraTurno.
	estado := 'pendiente'.
	motivo := unMotivo.
	cliente := unCliente.
	mascota := unaMascota.
	veterinario := unMedico
]

{ #category : 'visualizadores' }
Turno >> mascota [ 

	^ mascota 
]

{ #category : 'visualizadores' }
Turno >> motivo [

	^ motivo 
]

{ #category : 'modificadores' }
Turno >> motivo: unMotivo [

	motivo := unMotivo 
]

{ #category : 'visualizadores' }
Turno >> veterinario [ 

	^ veterinario 
]
