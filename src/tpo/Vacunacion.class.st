Class {
	#name : 'Vacunacion',
	#superclass : 'Object',
	#instVars : [
		'vacuna'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Vacunacion class >> crearVacunacionConVacuna: unaVacuna [
| v |
v := self new.
v inicializarVacunacionConUnaVacuna: unaVacuna .
^v 
]

{ #category : 'inicializadores' }
Vacunacion >> inicializarVacunacionConUnaVacuna: unaVacuna [
vacuna := unaVacuna .
]

{ #category : 'visualizadores' }
Vacunacion >> vacuna [
^vacuna 
]
