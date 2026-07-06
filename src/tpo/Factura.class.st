Class {
	#name : 'Factura',
	#superclass : 'Object',
	#instVars : [
		'cliente',
		'cuitVeterinaria',
		'diagnostico',
		'montoTotal',
		'fechaGeneracion',
		'colPagos'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Factura class >> CrearFacturaConCliente: unCliente cuitVeterinaria: unCuitVeterinaria diagnostico: unDiagnostico montoTotal: unMontoTotal fechaGeneracion: unaFechaGeneracion [
|f|
f := self new.
f
inicializarFacturaConCliente: unCliente 
cuitVeterinaria: unCuitVeterinaria 
diagnostico: unDiagnostico 
montoTotal: unMontoTotal 
fechaGeneracion: unaFechaGeneracion.
^f
]

{ #category : 'inicializadores' }
Factura >> inicializarFacturaConCliente: unCliente cuitVeterinaria: unCuitVeterinaria diagnostico: unDiagnostico montoTotal: unMontoTotal fechaGeneracion: unaFechaGeneracion [
cliente := unCliente.
cuitVeterinaria := unCuitVeterinaria.
diagnostico := unDiagnostico.
montoTotal := unMontoTotal.
fechaGeneracion := unaFechaGeneracion.
colPagos := OrderedCollection new.

]
