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
Medico class >> crearMedicoConfechaNacimiento: unaFecha cuil: elCuil matriculas: lasMatriculas [
| m |
m := self new.
m inicializarMedicoNacido: unaFecha cuil: elCuil matriculas: lasMatriculas .
^m
]

{ #category : 'propios del tipo' }
Medico >> agregarMatricula: unaMatricula [
colMatriculas add: unaMatricula 
]

{ #category : 'visualizadores' }
Medico >> cuil [
^cuil 
]

{ #category : 'visualizadores' }
Medico >> fechaNacimiento [
^fechaNacimiento 
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
