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
Cliente class >> crearClienteConDni: unDni nombre: unNombre apellido: unApellido domicilio: unDomicilio telefono: unTelefono email: unEmail tipo: unTipo mascota: unaMascota [

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
		mascota: unaMascota.
	^ c
]

{ #category : 'constructores' }
Cliente class >> crearClienteConDni: unDni nombre: unNombre apellido: unApellido domicilio: unDomicilio telefono: unTelefono email: unEmail tipo: unTipo mascotas: lasMascotas [

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
		mascotas: lasMascotas.
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
Cliente >> inicializarClienteConTelefono: unTelefono email: unEmail tipo: unTipo mascota: unaMascota [

	telefono := unTelefono.
	email := unEmail.
	tipo := unTipo.
	colMascotas := OrderedCollection new.
	colMascotas add: unaMascota
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

{ #category : 'propios del tipo' }
Cliente >> tieneMascota: mascota [
|rta esIgual|

esIgual := colMascotas detect: [ :cadaMascota | cadaMascota equals: mascota ] ifNone: [ nil ].

(esIgual )ifNotNil: [ rta := true ] ifNil: [ rta:= false ].
^rta 
]

{ #category : 'visualizadores' }
Cliente >> tipo [
^tipo 
]

{ #category : 'modificadores' }
Cliente >> tipo: elTipo [
tipo := elTipo 
]
