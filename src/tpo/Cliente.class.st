Class {
	#name : 'Cliente',
	#superclass : 'Persona',
	#instVars : [
		'telefono',
		'email',
		'tipo',
		'colMascotas'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Cliente class >> crearClienteCon: unDni nombre: unNombre apellido: unApellido domicilio: unDomicilio telefono: unTelefono email: unEmail tipo: unTipo mascotas: lasMascotas [

	| c |
	c := self new.
	c
		inicializarPersonaConDni: unDni
		nombre: unNombre
		apellido: unApellido
		domicilio: unDomicilio.
	c
		inicializarClienteConTelefono: unTelefono
		email: unEmail
		tipo: unTipo
		mascotas: lasMascotas .
	^ c
]

{ #category : 'propios del tipo' }
Cliente >> agregarMascota: unaMascota [
colMascotas add: unaMascota 
]

{ #category : 'visualizadores' }
Cliente >> email [
^email 
]

{ #category : 'modificadores' }
Cliente >> email: unEmail [
email := unEmail 
]

{ #category : 'inicializadores' }
Cliente >> inicializarClienteConTelefono: unTelefono email: unEmail tipo: unTipo mascotas: lasMascotas [

	telefono := unTelefono .
	email := unEmail .
	tipo := unTipo.
	colMascotas := lasMascotas .
]

{ #category : 'visualizadores' }
Cliente >> mascotas [
^colMascotas 
]

{ #category : 'visualizadores' }
Cliente >> telefono [
^telefono 
]

{ #category : 'modificadores' }
Cliente >> telefono: unTelefono [
telefono := unTelefono 
]

{ #category : 'visualizadores' }
Cliente >> tipo [
^tipo 
]

{ #category : 'modificadores' }
Cliente >> tipo: elTipo [
tipo := elTipo 
]
