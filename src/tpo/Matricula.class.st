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
Matricula class >> crearMatriculaConNumero: unNumMatricula colegioEmisor: unColegioEmisor fechaInscripcion: unaFechaInscripcion fechaLimite: unaFechaLimite tipo: unTipo [

	| m |
	m := self new.
	m
		inicializarrMatriculaConNumero: unNumMatricula
		colegioEmisor: unColegioEmisor
		fechaInscripcion: unaFechaInscripcion
		fechaLimite: unaFechaLimite
		tipo: unTipo.
	^ m
]

{ #category : 'visualizadores' }
Matricula >> colegioEmisor [

	^ colegioEmisor 
]

{ #category : 'visualizadores' }
Matricula >> fechaInscripcion [ 

	^ fechaInscripcion 
]

{ #category : 'visualizadores' }
Matricula >> fechaLimite [ 

	^ fechaLimite 
]

{ #category : 'inicializadores' }
Matricula >> inicializarrMatriculaConNumero: unNumMatricula colegioEmisor: unColegioEmisor fechaInscripcion: unaFechaInscripcion fechaLimite: unaFechaLimite tipo: unTipo [

	numMatricula := unNumMatricula.
	colegioEmisor := unColegioEmisor.
	fechaInscripcion := unaFechaInscripcion.
	fechaLimite := unaFechaLimite.
	tipo := unTipo
]

{ #category : 'visualizadores' }
Matricula >> numMatricula [
^numMatricula 
]

{ #category : 'visualizadores' }
Matricula >> tipo [

	^ tipo 
]
