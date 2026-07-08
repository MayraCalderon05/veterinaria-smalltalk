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

{ #category : 'propios del tipo' }
Factura >> buscarFactura: unDiagnostico enDia: dia [

	| encontrada |
	encontrada := false.
	((diagnostico equals: unDiagnostico) & (fechaGeneracion = dia))
		ifTrue: [ encontrada := true ].

	^ encontrada
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

{ #category : 'propios del tipo' }
Factura >> obtenerMontoAbonado [
| montoRegistrado |

montoRegistrado := colPagos inject: 0 into: [ :acum :unPago | acum + unPago montoAbonado ].
^montoRegistrado 
]

{ #category : 'propios del tipo' }
Factura >> obtenerSaldoPendiente [

	| saldoPendiente montoRegistrado |
	saldoPendiente := 0.
	
	montoRegistrado := self obtenerMontoAbonado.
	
	(montoRegistrado < montoTotal) ifTrue: [
		saldoPendiente := montoTotal - montoRegistrado ].

	^ saldoPendiente
]

{ #category : 'propios del tipo' }
Factura >> registrarPago: unPago [

	| exito montoAbonado |
	exito := false.
	montoAbonado := unPago montoAbonado.
	
	(self verificarPago) ifFalse: [
		(montoAbonado > 0 & (montoAbonado <= montoTotal)) ifTrue: [
			colPagos add: unPago.
			exito := true ] ].

	^ exito
]

{ #category : 'propios del tipo' }
Factura >> verificarPago [

	| pagada |
	pagada := false.
	(self obtenerMontoAbonado >= montoTotal) ifTrue: [ pagada := true ].
	^ pagada
]
