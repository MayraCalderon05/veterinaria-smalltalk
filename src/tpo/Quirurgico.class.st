Class {
	#name : 'Quirurgico',
	#superclass : 'Tratamiento',
	#instVars : [
		'nombreProcedimiento',
		'nivelRiesgo',
		'tipoAnestesia'
	],
	#classInstVars : [
		'tablaDeRiesgo',
		'tablaDeAnestesia'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Quirurgico class >> crearTratQuirurgicoConFecha: unaFecha motivo: unMotivo nombreProcedimiento: unNombre nivelRiesgo: unNivel tipoAnestesia: unTipo [
| t |
t := self new.
t inicializarTratamientoConFecha: unaFecha motivo: unMotivo .
t inicializarQuirurgicoConNombreProcedimiento: unNombre nivelRiesgo: unNivel tipoAnestesia: unTipo .
^t
]

{ #category : 'propios del tipo' }
Quirurgico class >> tablaAnestesia [
	
	tablaDeAnestesia ifNil: [ 
		tablaDeAnestesia := Dictionary new.
		tablaDeAnestesia at: 'Local' put: 30000; 
			at: 'Regional' put: 60000;
			at: 'General' put: 100000. ].
		^tablaDeAnestesia 
]

{ #category : 'propios del tipo' }
Quirurgico class >> tablaDeRiesgo [

tablaDeRiesgo ifNil: [ 
	tablaDeRiesgo := Dictionary new.
	tablaDeRiesgo 
		at: 1 put: 10;
		at: 2 put: 20.].
	^tablaDeRiesgo 
]

{ #category : 'inicializadores' }
Quirurgico >> inicializarQuirurgicoConNombreProcedimiento: unNombre nivelRiesgo: unNivel tipoAnestesia: elTipoAnestesia [
nombreProcedimiento := unNombre .
nivelRiesgo := unNivel .
tipoAnestesia := elTipoAnestesia .
]

{ #category : 'visualizadores' }
Quirurgico >> nivelRiesgo [
^nivelRiesgo 
]

{ #category : 'modificadores' }
Quirurgico >> nivelRiesgo: elNivel [
nivelRiesgo := elNivel .
]

{ #category : 'visualizadores' }
Quirurgico >> nombreProcedimiento [
^nombreProcedimiento 
]

{ #category : 'modificadores' }
Quirurgico >> nombreProcedimiento: elNombre [
nombreProcedimiento := elNombre 
]

{ #category : 'visualizadores' }
Quirurgico >> tipoAnestesia [
^tipoAnestesia 
]

{ #category : 'modificadores' }
Quirurgico >> tipoAnestesia: elTipo [
tipoAnestesia := elTipo 
]
