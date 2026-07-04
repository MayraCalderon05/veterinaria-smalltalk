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
Cliente class >> crearClienteCon: arg1 nombre: arg2 apellido: arg3 domicilio: arg4 telefono: arg5 email: arg6 tipo: arg7 [

	| tmp1 |
	tmp1 := self new.
	tmp1
		inicializarPersonaConDni: arg1
		nombre: arg2
		apellido: arg3
		domicilio: arg4;
		inicializarClienteConTelefono: arg5
		email: arg6
		tipo: arg7
		mascotas: OrderedCollection new.
	^ tmp1
]

{ #category : 'constructores' }
Cliente class >> crearClienteCon: arg1 nombre: arg2 apellido: arg3 domicilio: arg4 telefono: arg5 email: arg6 tipo: arg7 conMascotas: arg8 [

	| tmp1 |
	tmp1 := self new.
	tmp1
		inicializarPersonaConDni: arg1
		nombre: arg2
		apellido: arg3
		domicilio: arg4;
		inicializarClienteConTelefono: arg5
		email: arg6
		tipo: arg7
		mascotas: arg8.
	^ tmp1
]

{ #category : 'inicializadores' }
Cliente >> inicializarClienteConTelefono: arg1 email: arg2 tipo: arg3 mascotas: arg4 [

	telefono := arg1.
	email := arg2.
	tipo := arg3.
	colMascotas := arg4
]

{ #category : 'visualizadores' }
Cliente >> telefono [
^telefono 
]
