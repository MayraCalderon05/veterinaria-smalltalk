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

{ #category : 'propios del tipo' }
Pago class >> agregarMedioPago: unMedio conRecargo: unNumero [
|exito|
exito := false.
	(self existeMedioPago: unMedio) ifFalse: [
		tablaMedioPago at: unMedio asString put: unNumero.
		exito := true].
	^exito 
]

{ #category : 'propios del tipo' }
Pago class >> agregarMedioPagoSinRecargo: unMedio [
|exito|
exito := false.
	(self existeMedioPago: unMedio) ifFalse: [
		tablaMedioPago at: unMedio asString put: 0 .
		exito := true].
	^exito 
]

{ #category : 'constructores' }
Pago class >> crearPagoConFecha: unaFechaPago montoAbonado: unMontoAbonado medioPago: unMedioPago [

	| p |
	self inicializarTablaPago.
	p := self new.
	
	p
		inicializarPagoConFecha: unaFechaPago
		montoAbonado: unMontoAbonado
		medioPago: unMedioPago.

	^ p
]

{ #category : 'propios del tipo' }
Pago class >> eliminarMedioPago: unMedio [ 
|exito|
exito := false.
	(self existeMedioPago: unMedio) ifTrue: [
		tablaMedioPago removeKey: unMedio asString.
		exito := true].
	^exito 
]

{ #category : 'propios del tipo' }
Pago class >> existeMedioPago: unMedio [

	^ tablaMedioPago includesKey: unMedio asString.
]

{ #category : 'inicializadores' }
Pago class >> inicializarTablaPago [

	tablaMedioPago ifNil: [
		tablaMedioPago := Dictionary new.
		tablaMedioPago
			at: 'Credito' put: 10;
			at: 'Billetera virtual' put: 5;
			at: 'Efectivo' put: 0;
			at: 'Transferencia bancaria' put: 0;
			at: 'Tarjeta de debito' put: 0  ]
]

{ #category : 'modificadores' }
Pago class >> modificarRecargoDe: unMedio nuevoValor: unNumero [
    (self existeMedioPago: unMedio) ifTrue: [
        tablaMedioPago at: unMedio asString put: unNumero
    ]
]

{ #category : 'visualizadores' }
Pago class >> tablaMedioPago [
^tablaMedioPago 
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
