Class {
	#name : 'Tratamiento',
	#superclass : 'Object',
	#instVars : [
		'fechaTratamiento',
		'motivo',
		'estado'
	],
	#classInstVars : [
		'costoBase'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'visualizadores' }
Tratamiento class >> costoBase [

	^ costoBase ifNil: [ costoBase := 5000 ]
]

{ #category : 'visualizadores' }
Tratamiento >> estado [
^estado 
]

{ #category : 'modificadores' }
Tratamiento >> estado: unEstado [
estado := unEstado 
]

{ #category : 'visualizadores' }
Tratamiento >> fechaTratamiento [
^fechaTratamiento .
]

{ #category : 'modificadores' }
Tratamiento >> fechaTratamiento: unaFecha [
fechaTratamiento := unaFecha 
]

{ #category : 'inicializadores' }
Tratamiento >> inicializarTratamientoConFecha: unaFecha motivo: unMotivo [ 

	fechaTratamiento := unaFecha.
	motivo := unMotivo.
	estado := 'Pendiente'
]

{ #category : 'visualizadores' }
Tratamiento >> motivo [
^motivo 
]

{ #category : 'modificadores' }
Tratamiento >> motivo: unMotivo [
motivo := unMotivo 
]

{ #category : 'propios del tipo' }
Tratamiento >> obtenerMonto [

	| monto |
	monto := self class costoBase.

	^ monto
]
