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
	#classInstVars : [
		'ultimoId'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Mascota class >> CrearMascotaConId: unIdMascota nombre: unNombre especie: unaEspecie raza: unaRaza fechaNacimiento: unaFechaNacim peso: unPeso [

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

{ #category : 'constructores' }
Mascota class >> CrearMascotaConNombre: unNombre especie: unaEspecie raza: unaRaza fechaNacimiento: unaFechaNacim peso: unPeso [

	| m |
	m := self new.
	m 
	inicializarMascotaConNombre: unNombre 
	especie: unaEspecie 
	raza: unaRaza 
	fechaNacimiento: unaFechaNacim 
	peso: unPeso.
	^m
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
