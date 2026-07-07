Class {
	#name : 'Medico',
	#superclass : 'Persona',
	#instVars : [
		'fechaNacimiento',
		'cuil',
		'colMatriculas'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Medico class >> crearMedicoConDni: unDni nombre: unNombre apellido: unApellido domicilio: unDomicilio fechaNacimiento: unaFecha cuil: elCuil matricula: unaMatricula [

	| m |
	m := self new.
	m inicializarPersonaConDni: unDni nombre: unNombre apellido: unApellido domicilio: unDomicilio .
	m
		inicializarMedicoNacido: unaFecha
		cuil: elCuil
		matricula: unaMatricula.
	^ m
]

{ #category : 'constructores' }
Medico class >> crearMedicoConDni: unDni nombre: unNombre apellido: unApellido domicilio: unDomicilio fechaNacimiento: unaFecha cuil: elCuil matriculas: lasMatriculas [

	| m |
	m := self new.
	m
		inicializarPersonaConDni: unDni
		nombre: unNombre
		apellido: unApellido
		domicilio: unDomicilio.
	m
		inicializarMedicoNacido: unaFecha
		cuil: elCuil
		matriculas: lasMatriculas.
	^ m
]

{ #category : 'propios del tipo' }
Medico >> agregarMatricula: unaMatricula [
colMatriculas add: unaMatricula 
]

{ #category : 'visualizadores' }
Medico >> cuil [
^cuil 
]

{ #category : 'propios del tipo' }
Medico >> equals: otroVeterinario [
^ cuil = otroVeterinario cuil .
]

{ #category : 'visualizadores' }
Medico >> fechaNacimiento [
^fechaNacimiento 
]

{ #category : 'inicializadores' }
Medico >> inicializarMedicoNacido: laFechaNacimiento cuil: elCuil matricula: unaMatricula [

	fechaNacimiento := laFechaNacimiento.
	cuil := elCuil.
	colMatriculas := OrderedCollection  new .
	colMatriculas add: unaMatricula
]

{ #category : 'inicializadores' }
Medico >> inicializarMedicoNacido: laFechaNacimiento cuil: elCuil matriculas: lasMatriculas [
fechaNacimiento := laFechaNacimiento .
cuil := elCuil .
colMatriculas := lasMatriculas .
]

{ #category : 'visualizadores' }
Medico >> matriculas [
^colMatriculas 
]
