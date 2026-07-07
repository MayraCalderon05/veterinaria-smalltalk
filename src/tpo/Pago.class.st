Class {
	#name : 'Pago',
	#superclass : 'Object',
	#instVars : [
		'fechaPago',
		'montoAbonado',
		'medioPago'
	],
	#classInstVars : [
		'tablaMedioPago'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Pago class >> crearPagoConFecha: unaFechaPago montoAbonado: unMontoAbonado medioPago: unMedioPago [

	| p |
	p := self new.
	p
		inicializarPagoConFecha: unaFechaPago
		montoAbonado: unMontoAbonado
		medioPago: unMedioPago.

	^ p
]

{ #category : 'visualizadores' }
Pago >> fechaPago [
^fechaPago 
]

{ #category : 'inicializadores' }
Pago >> inicializarPagoConFecha: unaFechaPago montoAbonado: unMontoAbonado medioPago: unMedioPago [

	fechaPago := unaFechaPago.
	montoAbonado := unMontoAbonado.
	medioPago := unMedioPago
]

{ #category : 'visualizadores' }
Pago >> medioPago [  

	^ medioPago 
]

{ #category : 'visualizadores' }
Pago >> montoAbonado [ 

	^ montoAbonado 
]
