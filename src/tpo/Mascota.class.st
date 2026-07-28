Class {
	#name : 'Mascota',
	#superclass : 'Object',
	#instVars : [
		'idMascota',
		'nombre',
		'especie',
		'raza',
		'fechaNacim',
		'peso',
		'colVacunaciones'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Mascota class >> crearMascotaConId: unIdMascota nombre: unNombre especie: unaEspecie raza: unaRaza fechaNacimiento: unaFechaNacim peso: unPeso [

	| m |
	m := self new.
	m
		inicializarMascotaConId: unIdMascota
		nombre: unNombre
		especie: unaEspecie
		raza: unaRaza
		fechaNacimiento: unaFechaNacim
		peso: unPeso.
	^ m
]

{ #category : 'propios del tipo' }
Mascota >> agregarVacunacion: unaVacunacion [
colVacunaciones add: unaVacunacion 
]

{ #category : 'propios del tipo' }
Mascota >> buscarUltimaAplicacion: colVacunacionesDeVacuna [
| vacunacionMasReciente |
vacunacionMasReciente := nil.

colVacunaciones do: [ :v | (v esMasRecienteQue: vacunacionMasReciente) ifTrue: [ vacunacionMasReciente := v ] ].

^vacunacionMasReciente 
]

{ #category : 'propios del tipo' }
Mascota >> equals: otraMascota [
^idMascota = otraMascota idMascota .
]

{ #category : 'visualizadores' }
Mascota >> especie [ 

	^ especie 
]

{ #category : 'visualizadores' }
Mascota >> fechaNacim [ 

	^fechaNacim 
]

{ #category : 'propios del tipo' }
Mascota >> filtrarVacunacionesPorVacuna: unaVacuna [
"m"
	| vacunacionesDeVacuna |
	vacunacionesDeVacuna := colVacunaciones select: [ :v |
		                        v contieneVacuna: unaVacuna ].
	^ vacunacionesDeVacuna
]

{ #category : 'visualizadores' }
Mascota >> idMascota [
^idMascota 
]

{ #category : 'inicializadores' }
Mascota >> inicializarMascotaConId: unIdMascota nombre: unNombre especie: unaEspecie raza: unaRaza fechaNacimiento: unaFechaNacim peso: unPeso [

	idMascota := unIdMascota.
	nombre := unNombre.
	especie := unaEspecie.
	raza := unaRaza.
	fechaNacim := unaFechaNacim.
	peso := unPeso.
	colVacunaciones := OrderedCollection new.
]

{ #category : 'visualizadores' }
Mascota >> nombre [ 

	^ nombre 
]

{ #category : 'visualizadores' }
Mascota >> peso [ 

	^peso 
]

{ #category : 'modificadores' }
Mascota >> peso: unPeso [
peso := unPeso 

]

{ #category : 'visualizadores' }
Mascota >> raza [

	^ raza 
]

{ #category : 'propios del tipo' }
Mascota >> ultimaAplicacion: unaVacuna [
| ultimaVacunacion colVacunacionesAux |
ultimaVacunacion := nil.

colVacunacionesAux := self filtrarVacunacionesPorVacuna: unaVacuna .
colVacunacionesAux ifNotEmpty: [ 
	ultimaVacunacion := self buscarUltimaAplicacion: colVacunacionesAux  ].

^ultimaVacunacion 
]

{ #category : 'visualizadores' }
Mascota >> vacunaciones [

	^ colVacunaciones 
]
