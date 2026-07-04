Class {
	#name : 'Persona',
	#superclass : 'Object',
	#instVars : [
		'dni',
		'nombre',
		'apellido',
		'domicilio'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'visualizadores' }
Persona >> apellido [

	^ apellido
]

{ #category : 'modificadores' }
Persona >> apellido: arg1 [

	apellido := arg1
]

{ #category : 'visualizadores' }
Persona >> dni [

	^ dni
]

{ #category : 'visualizadores' }
Persona >> domicilio [

	^ domicilio
]

{ #category : 'modificadores' }
Persona >> domicilio: arg1 [

	domicilio := arg1
]

{ #category : 'inicializadores' }
Persona >> inicializarPersonaConDni: arg1 nombre: arg2 apellido: arg3 domicilio: arg4 [

	dni := arg1.
	nombre := arg2.
	apellido := arg3.
	domicilio := arg4
]

{ #category : 'visualizadores' }
Persona >> nombre [

	^ nombre
]

{ #category : 'modificadores' }
Persona >> nombre: arg1 [

	nombre := arg1
]
