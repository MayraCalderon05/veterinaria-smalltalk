Class {
	#name : 'Mascota',
	#superclass : 'Object',
	#instVars : [
		'idMascota',
		'nombre',
		'especie',
		'raza',
		'fechaNacim',
		'peso'
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
