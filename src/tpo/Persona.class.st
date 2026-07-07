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
^apellido 
]

{ #category : 'modificadores' }
Persona >> apellido: unApellido [
apellido := unApellido 
]

{ #category : 'visualizadores' }
Persona >> dni [ 
^dni
]

{ #category : 'visualizadores' }
Persona >> domicilio [

^domicilio
]

{ #category : 'modificadores' }
Persona >> domicilio: unDomicilio [
domicilio := unDomicilio 
]

{ #category : 'inicializadores' }
Persona >> inicializarPersonaConDni: unDni nombre: unNombre apellido: unApellido domicilio: unDomicilio [
dni := unDni .
nombre := unNombre .
apellido := unApellido .
domicilio := unDomicilio .
]

{ #category : 'visualizadores' }
Persona >> nombre [
^nombre 
]

{ #category : 'modificadores' }
Persona >> nombre: unNombre [
nombre := unNombre 
]
