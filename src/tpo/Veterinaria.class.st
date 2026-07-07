Class {
	#name : 'Veterinaria',
	#superclass : 'Object',
	#instVars : [
		'nombre',
		'cuit',
		'colDiagnosticos',
		'colTurnos',
		'colStockMedicamentos',
		'colMedicos',
		'colClientes',
		'colFacturas',
		'colVacunaciones'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
Veterinaria class >> crearVeterinariaConNombre: unNombre cuit: unCuit [

|v|
v := self new.
v
	inicializarVeterinariaConNombre: unNombre 
	cuit: unCuit.
^v
]

{ #category : 'propios del tipo' }
Veterinaria >> armarResultado: colFacturasPendientes [
| colResultado |

colResultado := colFacturasPendientes collect: [:factura | | arreglo |
									arreglo := Array new: 3.
									arreglo at: 1 put: factura;
											at: 2 put: (factura cliente);
											at: 3 put: (factura obtenerSaldoPendiente).
											arreglo ].

^colResultado .
]

{ #category : 'visualizadores' }
Veterinaria >> clientes [

	^ colClientes 
]

{ #category : 'visualizadores' }
Veterinaria >> cuit [
^cuit 
]

{ #category : 'visualizadores' }
Veterinaria >> diagnosticos [

	^ colDiagnosticos 
]

{ #category : 'visualizadores' }
Veterinaria >> facturas [

	^ colFacturas 
]

{ #category : 'propios del tipo' }
Veterinaria >> facturasPendientes [
| colPendientes colFacturasPendientes |
colFacturasPendientes := OrderedCollection new.

colPendientes := self obtenerFacturasPendientes .

( colPendientes ) ifNotEmpty: [ colFacturasPendientes := self armarResultado: colPendientes ].

^colFacturasPendientes 
]

{ #category : 'propios del tipo' }
Veterinaria >> generarFactura: unDiagnostico [

	| facturaGenerada hoy mascotaDiagnostico elCliente montoAbonar |
	hoy := Date today.

	colFacturas
		detect: [ :factura |
		factura buscarFactura: unDiagnostico enDia: hoy ]
		ifNone: [ mascotaDiagnostico := unDiagnostico mascota ]
		"pendiente"
]

{ #category : 'inicializadores' }
Veterinaria >> inicializarVeterinariaConNombre: unNombre cuit: unCuit [
nombre := unNombre.
cuit := unCuit.
colDiagnosticos := OrderedCollection new.
colTurnos := OrderedCollection new.
colStockMedicamentos := OrderedCollection new.
colMedicos := OrderedCollection new.
colClientes := OrderedCollection new.
colFacturas := OrderedCollection new.
colVacunaciones := OrderedCollection new.
]

{ #category : 'visualizadores' }
Veterinaria >> medicos [

	^ colMedicos 
]

{ #category : 'visualizadores' }
Veterinaria >> nombre [
^nombre 
]

{ #category : 'modificadores' }
Veterinaria >> nombre: unNombre [
nombre := unNombre.
]

{ #category : 'propios del tipo' }
Veterinaria >> obtenerFacturasPendientes [

	| colPendientes |
	colPendientes := colFacturas reject: [ :factura |
		                 factura verificarPago ].
	^ colPendientes
]

{ #category : 'visualizadores' }
Veterinaria >> stockMedicamento [

	^ colStockMedicamentos 
]

{ #category : 'visualizadores' }
Veterinaria >> turnos [

	^ colTurnos 
]

{ #category : 'visualizadores' }
Veterinaria >> vacunaciones [

	^ colVacunaciones 
]
