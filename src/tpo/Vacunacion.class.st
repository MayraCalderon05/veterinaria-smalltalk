Class {
	#name : 'Vacunacion',
	#superclass : 'Object',
	#instVars : [
		'fechaVacunacion',
		'veterinario',
		'mascota',
		'vacuna'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Vacunacion class >> crearVacunacionConFecha: unaFecha veterinario: unMedico mascota: unaMascota vacuna: unaVacuna [

	| v |
	v := self new.
	v inicializarVacunacionConFecha: unaFecha veterinario: unMedico mascota: unaMascota unaVacuna: unaVacuna .
	^ v
]

{ #category : 'visualizadores' }
Vacunacion >> fechaVacunacion [
^fechaVacunacion 
]

{ #category : 'inicializadores' }
Vacunacion >> inicializarVacunacionConFecha: unaFecha veterinario: unMedico mascota: unaMascota unaVacuna: unaVacuna [

fechaVacunacion := unaFecha .
veterinario := unMedico .
mascota := unaMascota .
	vacuna := unaVacuna
]

{ #category : 'visualizadores' }
Vacunacion >> mascota [

	^ mascota
]

{ #category : 'visualizadores' }
Vacunacion >> vacuna [
^vacuna 
]

{ #category : 'visualizadores' }
Vacunacion >> veterinario [ 
^veterinario 
]
