Class {
	#name : 'Matricula',
	#superclass : 'Object',
	#instVars : [
		'numMatricula',
		'colegioEmisor',
		'fechaInscripcion',
		'fechaLimite',
		'tipo'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Matricula class >> CrearMatriculaConNumMatricula: unNumMatricula colegioEmisor: unColegioEmisor fechaInscripcion: unaFechaInscripcion fechaLimite: unaFechaLimite tipo: unTipo [
|m|
m := self new.
m 
inicializarrMatriculaConNumMatricula: unNumMatricula 
colegioEmisor: unColegioEmisor 
fechaInscripcion: unaFechaInscripcion 
fechaLimite: unaFechaLimite 
tipo: unTipo.
^m


]

{ #category : 'inicializadores' }
Matricula >> inicializarrMatriculaConNumMatricula: unNumMatricula colegioEmisor: unColegioEmisor fechaInscripcion: unaFechaInscripcion fechaLimite: unaFechaLimite tipo: unTipo [
numMatricula := unNumMatricula.
colegioEmisor := unColegioEmisor.
fechaInscripcion := unaFechaInscripcion.
fechaLimite := unaFechaLimite.
tipo := unTipo.
]
