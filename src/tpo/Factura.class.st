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
Factura class >> crearFacturaConCliente: unCliente cuitVeterinaria: unCuitVeterinaria diagnostico: unDiagnostico montoTotal: unMontoTotal fechaGeneracion: unaFechaGeneracion [

	| f |
	f := self new.
	f
		inicializarFacturaConCliente: unCliente
		cuitVeterinaria: unCuitVeterinaria
		diagnostico: unDiagnostico
		montoTotal: unMontoTotal 
		fechaGeneracion: unaFechaGeneracion.
	^ f
]

{ #category : 'visualizadores' }
Factura >> cliente [
^cliente 
]

{ #category : 'visualizadores' }
Factura >> colPagos [   

	^ colPagos 
]

{ #category : 'visualizadores' }
Factura >> cuitVeterinaria [ 

	^ cuitVeterinaria 
]

{ #category : 'visualizadores' }
Factura >> diagnostico [  

	^ diagnostico 
]

{ #category : 'visualizadores' }
Factura >> fechaGeneracion [  

	^ fechaGeneracion 
]

{ #category : 'modificadores' }
Factura >> fechaGeneracion: unaFechaGeneracion [
fechaGeneracion := unaFechaGeneracion 
]

{ #category : 'inicializadores' }
Factura >> inicializarFacturaConCliente: unCliente cuitVeterinaria: unCuitVeterinaria diagnostico: unDiagnostico montoTotal: unMontoTotal fechaGeneracion: unaFechaGeneracion [

	cliente := unCliente.
	cuitVeterinaria := unCuitVeterinaria.
	diagnostico := unDiagnostico.
	montoTotal := unMontoTotal .
	fechaGeneracion := unaFechaGeneracion.
	colPagos := OrderedCollection new
]

{ #category : 'visualizadores' }
Factura >> montoTotal [ 

	^ montoTotal 
]
