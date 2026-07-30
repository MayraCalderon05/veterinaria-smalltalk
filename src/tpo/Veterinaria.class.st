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
		'colFacturas'
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
Veterinaria >> agendarTurno: unTurno [

	| rta mascota cliente nuevoEstado |
	rta := colTurnos
		       detect: [ :cadaTurno |
		       (cadaTurno validarDisponibilidad: unTurno) not ]
		       ifNone: [ nil ].

	rta ifNil: [
			mascota := unTurno mascota.
			cliente := self buscarClienteConMascota: mascota.
			rta := unTurno esElMismoDuenio: cliente.
			rta ifTrue: [
				unTurno esTurnoTratamiento ifTrue: [
					rta := unTurno estaPendienteTratamiento.
					rta ifTrue: [ rta := unTurno esValido ] ] ] ]
		ifNotNil: [ rta := false ].

	rta ifTrue: [
		nuevoEstado := 'confirmado'.
		unTurno estado: nuevoEstado.
		colTurnos add: unTurno ].

	^ rta
]

{ #category : 'propios del tipo' }
Veterinaria >> agregarCliente: unCliente [
| exito |
exito := false.
( self existeCliente: unCliente ) ifFalse: [ colClientes add: unCliente. exito := true ].
	^exito 
]

{ #category : 'propios del tipo' }
Veterinaria >> agregarDiagnostico: unDiagnostico [
colDiagnosticos add: unDiagnostico 
]

{ #category : 'propios del tipo' }
Veterinaria >> agregarFactura: unaFactura [
colFacturas add: unaFactura 
]

{ #category : 'propios del tipo' }
Veterinaria >> agregarMedico: unMedico [
colMedicos add: unMedico 
]

{ #category : 'propios del tipo' }
Veterinaria >> agregarNuevoStock: unStock [

	colStockMedicamentos add: unStock
]

{ #category : 'propios del tipo' }
Veterinaria >> agregarTurno: unTurno [
colTurnos add: unTurno 
]

{ #category : 'propios del tipo' }
Veterinaria >> armarResultado: colFacturasPendientes [

	| colResultado |
	colResultado := colFacturasPendientes collect: [ :factura |
		                factura armarResultado ].

	^ colResultado
]

{ #category : 'propios del tipo' }
Veterinaria >> asignarTratamiento: unTratamiento aDiagnostico: unDiagnostico [
| exito |
exito := false.
( self esPosibleAsignarTratamientoADiagnostico: unTratamiento ) ifTrue: [ 
	exito := unDiagnostico registrarNuevoTratamiento: unTratamiento 
	].
^exito 
]

{ #category : 'propios del tipo' }
Veterinaria >> atenderTurno: unTurno [
	| atendido hayStock unTratamiento unMedicamento cantidadIndicada |
	atendido := false.
	hayStock := true.
	unTurno estadoConfirmado ifTrue: [
		unTurno esTurnoTratamiento ifTrue: [
			unTratamiento := unTurno tratamiento.
			unTratamiento esFarmacologico ifTrue: [
				unMedicamento := unTratamiento medicamento.
				cantidadIndicada := unTratamiento obtenerCantidadIndicada.
				hayStock := self
					descontarStockDeMedicamento: unMedicamento
					cantidad: cantidadIndicada ] ].
		hayStock ifTrue: [
			unTurno atender.
			atendido := true ] ].
	^ atendido
]

{ #category : 'propios del tipo' }
Veterinaria >> buscarClienteConMascota: mascota [
|cliente|
cliente := colClientes detect: [ :cadaCliente | cadaCliente  tieneMascota: mascota ] ifNone: [ nil ].
^cliente 

]

{ #category : 'propios del tipo' }
Veterinaria >> buscarStockDeMedicamento: unMedicamento [
| encontrado |
encontrado := colStockMedicamentos detect: [ :st | st esElMismoMedicamento: unMedicamento ] ifNone: [ nil ].
^encontrado 
]

{ #category : 'visualizadores' }
Veterinaria >> clientes [

	^ colClientes 
]

{ #category : 'visualizadores' }
Veterinaria >> cuit [
^cuit 
]

{ #category : 'propios del tipo' }
Veterinaria >> descontarStockDeMedicamento: unMedicamento cantidad: cantidadIndicada [

	| stockEncontrado exito |
	exito := false.
	stockEncontrado := self buscarStockDeMedicamento: unMedicamento.

	stockEncontrado ifNotNil: [
		stockEncontrado descontarStock: cantidadIndicada.
		exito := true ].
	^exito 
]

{ #category : 'visualizadores' }
Veterinaria >> diagnosticos [

	^ colDiagnosticos 
]

{ #category : 'propios del tipo' }
Veterinaria >> esPosibleAsignarTratamientoADiagnostico: unTratamiento [

	| verificado unMedicamento cantIndicada |
	verificado := true.

	unTratamiento esFarmacologico ifTrue: [
		unMedicamento := unTratamiento medicamento.
		cantIndicada := unTratamiento obtenerCantidadIndicada.
		(self
			 stockDeMedicamentoExistente: unMedicamento
			 conCantidad: cantIndicada) ifFalse: [ verificado := false ] ].
	^ verificado
]

{ #category : 'propios del tipo' }
Veterinaria >> existeCliente: unCliente [
^ (colClientes detect: [ :c | c equals: unCliente ] ifNone: [ nil ]) isNotNil 
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
	facturaGenerada := colFacturas
		                   detect: [ :factura |
		                   factura buscarFactura: unDiagnostico enDia: hoy ]
		                   ifNone: [
			                   mascotaDiagnostico := unDiagnostico mascota.
			                   elCliente := self buscarClienteConMascota:
				                                mascotaDiagnostico.
			                   montoAbonar := unDiagnostico calcularMontoFinal.
			                   facturaGenerada := Factura
				                                      crearFacturaConCliente:
				                                      elCliente
				                                      cuitVeterinaria: cuit
				                                      diagnostico: unDiagnostico
				                                      montoTotal: montoAbonar
				                                      fechaGeneracion: hoy ].

	^ facturaGenerada
]

{ #category : 'propios del tipo' }
Veterinaria >> historialClinicoDe: unaMascota [

	| historialClinico diagnosticos vacunaciones |
	diagnosticos := colDiagnosticos select: [ :unDiagnostico |
		                unDiagnostico perteneceA: unaMascota ].

	vacunaciones := unaMascota vacunaciones.
	historialClinico := diagnosticos , vacunaciones.

	^ historialClinico
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
]

{ #category : 'propios del tipo' }
Veterinaria >> mascotasConVacunasVencidas [

	| mascotas |
	mascotas := OrderedCollection.

	colClientes do: [ :unCliente |
		mascotas addAll: unCliente mascotasConVacunasVencidas ].

	^ mascotas
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

{ #category : 'propios del tipo' }
Veterinaria >> realizarFacturacion: unDiagnostico [
| exito unaFactura|

exito := false .
unaFactura := self generarFactura: unDiagnostico.

unaFactura ifNotNil: [ self agregarFactura: unaFactura.
								exito := true ].
							
^exito 
]

{ #category : 'propios del tipo' }
Veterinaria >> stockDeMedicamentoExistente: unMedicamento conCantidad: cantidadIndicada [
| existe stockEncontrado |
existe := false.
stockEncontrado := self buscarStockDeMedicamento: unMedicamento .
( stockEncontrado ) ifNotNil: [ existe := stockEncontrado existeStock: cantidadIndicada ].
^existe 
]

{ #category : 'visualizadores' }
Veterinaria >> stockMedicamento [

	^ colStockMedicamentos 
]

{ #category : 'visualizadores' }
Veterinaria >> turnos [

	^ colTurnos 
]
