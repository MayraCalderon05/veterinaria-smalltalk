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
Veterinaria class >> crearVeterinariaConDatosDePrueba [

	| veterinaria medico1 medico2 cliente1 cliente2 cliente3 mascota11 mascota21 mascota22 mascota31 vacuna1 vacuna2 medicamento1 medicamento2 medicamento3 medicamento4 medicamento5 diag1 tratQ1 vacunacion1 diag2 tratF1 tratF2 diag3 vacunacion2 vacunacion3 tratF3 tratQ2 vacunacion4 vacunacion5 vacunacion6 diag4 tratQ3 diag5 tratF4 tratF5 factura31 pago31 turno1cancelado turno2confirmado turno3atendido |
	veterinaria := self
		               crearVeterinariaConNombre: 'Veterinaria Fai'
		               cuit: '20-12345678-9'.

	"1. 2 médicos veterinarios, con sus datos completos (con al menos 1 matrícula cada 1)"
	medico1 := Medico
		           crearMedicoConDni: '46111222'
		           nombre: 'Morena'
		           apellido: 'Torres Sendra'
		           domicilio: 'Buenos Aires 123'
		           fechaNacimiento: (Date newDay: 26 month: 7 year: 2005)
		           cuil: '27-46111222-4'
		           matricula: 'MP-1001'.
	medico2 := Medico
		           crearMedicoConDni: '47555666'
		           nombre: 'Mayra'
		           apellido: 'Calderon'
		           domicilio: 'Av. Siempreviva 742'
		           fechaNacimiento: (Date newDay: 20 month: 7 year: 2005)
		           cuil: '20-47555666-1'
		           matricula: 'MP-1002'.
	medico2 agregarMatricula: 'MP-1003'.
	veterinaria agregarMedico: medico1.
	veterinaria agregarMedico: medico2.

	"2. 3 clientes con sus mascotas"
	mascota11 := Mascota
		             crearMascotaConNombre:'Leo'
		             especie: 'Perro'
		             raza: 'Caniche'
		             fechaNacimiento: (Date newDay: 18 month: 11 year: 2015)
		             peso: 6.
	cliente1 := Cliente
		            crearClienteConDni: '24333444'
		            nombre: 'Valeria'
		            apellido: 'Torres Sendra'
		            domicilio: 'Buenos Aires 200'
		            telefono: '2995551111'
		            email: 'valeria@mail.com'
		            tipo: #particular
		            mascota: mascota11.

	mascota21 := Mascota
		             crearMascotaConNombre:'Canela'
		             especie: 'Gato'
		             raza: '-'
		             fechaNacimiento: (Date newDay: 15 month: 6 year: 2019)
		             peso: 4.
	mascota22 := Mascota
		             crearMascotaConNombre: 'Toby'
		             especie: 'Perro'
		             raza: 'Golden'
		             fechaNacimiento: (Date newDay: 20 month: 9 year: 2021)
		             peso: 20.
	cliente2 := Cliente
		            crearClienteConDni: '27444555'
		            nombre: 'Tomas'
		            apellido: 'López'
		            domicilio: 'Fernandez Oro 500'
		            telefono: '2995552222'
		            email: 'lopez@mail.com'
		            tipo: #particular
		            mascotas:
		            (OrderedCollection with: mascota21 with: mascota22).

	mascota31 := Mascota
		             crearMascotaConNombre: 'Luna'
		             especie: 'Perro'
		             raza: 'Caniche'
		             fechaNacimiento: (Date newDay: 3 month: 2 year: 2016)
		             peso: 5.
	cliente3 := Cliente
		            crearClienteConDni: '28666777'
		            nombre: 'Lola'
		            apellido: 'Arias'
		            domicilio: 'Don Bosco 800'
		            telefono: '2995553333'
		            email: 'lola@mail.com'
		            tipo: #particular
		            mascota: mascota31.

	veterinaria agregarCliente: cliente1.
	veterinaria agregarCliente: cliente2.
	veterinaria agregarCliente: cliente3.

	"vacunas"
	vacuna1 := Vacuna
		           crearVacunaConNombre: 'Antirrábica'
		           laboratorio: 'Labyes'
		           especieDestino: 'Perro'
		           cantMesesDeVigencia: 12.
	vacuna2 := Vacuna
		           crearVacunaConNombre: 'Triple Felina'
		           laboratorio: 'Zoetis'
		           especieDestino: 'Gato'
		           cantMesesDeVigencia: 12.

	"medicamentos"
	medicamento1 := Medicamento
		                crearMedicamentoConNombre: 'Amoxicilina'
		                precioBase: 500
		                ventaLibre: false.
	medicamento2 := Medicamento
		                crearMedicamentoConNombre: 'Ampicilina'
		                precioBase: 600
		                ventaLibre: false.
	medicamento3 := Medicamento
		                crearMedicamentoConNombre: 'Contal'
		                precioBase: 400
		                ventaLibre: false.
	medicamento4 := Medicamento
		                crearMedicamentoConNombre: 'Frontline'
		                precioBase: 300
		                ventaLibre: true.
	medicamento5 := Medicamento
		                crearMedicamentoConNombre: 'Paracan Plus'
		                precioBase: 400
		                ventaLibre: true.

	"Un stock de medicamentos (los indicados en los tratamientos y 2 o 3 más)"
	veterinaria agregarNuevoStock: (StockMedicamento
			 crearStockMedicamentoConCantidad: 100
			 medicamento: medicamento1).
	veterinaria agregarNuevoStock: (StockMedicamento
			 crearStockMedicamentoConCantidad: 100
			 medicamento: medicamento2).
	veterinaria agregarNuevoStock: (StockMedicamento
			 crearStockMedicamentoConCantidad: 100
			 medicamento: medicamento3).
	veterinaria agregarNuevoStock: (StockMedicamento
			 crearStockMedicamentoConCantidad: 100
			 medicamento: medicamento4).
	veterinaria agregarNuevoStock: (StockMedicamento
			 crearStockMedicamentoConCantidad: 100
			 medicamento: medicamento5).

	"Cliente 1, mascota 1.1, sin AV + 1 D con 1 TQ (R2 y A general)"
	diag1 := Diagnostico
		         crearDiagnosticoConFecha: Date today
		         descripcion: 'Obstruccion de hueso'
		         veterinario: medico1
		         mascota: mascota11.
	veterinaria agregarDiagnostico: diag1.
	tratQ1 := Quirurgico
		          crearTratQuirurgicoConFecha: Date today
		          motivo: 'Obstruccion de hueso'
		          nombreProcedimiento: 'enema'
		          nivelRiesgo: 2
		          tipoAnestesia: 'General'.
	veterinaria asignarTratamiento: tratQ1 aDiagnostico: diag1.

	"Cliente 2, mascota 2.1 con 1 AV + 1 D con 2 TF)"
	vacunacion1 := Vacunacion
		               crearVacunacionConFecha: Date today
		               veterinario: medico2
		               mascota: mascota21
		               vacuna: vacuna1.
	diag2 := Diagnostico
		         crearDiagnosticoConFecha: Date today
		         descripcion: 'Infección urinaria'
		         veterinario: medico2
		         mascota: mascota21.
	veterinaria agregarDiagnostico: diag2.
	tratF1 := Farmacologico
		          crearTratFarmacologicoConFecha: Date today
		          motivo: 'Antibiótico'
		          monodroga: medicamento1
		          dosis: 10
		          frecuencia: 12.
	tratF2 := Farmacologico
		          crearTratFarmacologicoConFecha: Date today
		          motivo: 'Antiinflamatorio'
		          monodroga: medicamento2
		          dosis: 5
		          frecuencia: 24.
	veterinaria asignarTratamiento: tratF1 aDiagnostico: diag2.
	veterinaria asignarTratamiento: tratF2 aDiagnostico: diag2.

	"Cliente 2 mascota 2.2 con 2 AV + 1 D con 1 TF y 1 TQ (R1 y A local)"
	vacunacion2 := Vacunacion
		               crearVacunacionConFecha: Date today
		               veterinario: medico2
		               mascota: mascota22
		               vacuna: vacuna1.
	vacunacion3 := Vacunacion
		               crearVacunacionConFecha: Date today
		               veterinario: medico2
		               mascota: mascota22
		               vacuna: vacuna2.
	mascota22 agregarVacunacion: vacunacion2.
	mascota22 agregarVacunacion: vacunacion3.
	diag3 := Diagnostico
		         crearDiagnosticoConFecha: Date today
		         descripcion: 'Quiste sebáceo'
		         veterinario: medico1
		         mascota: mascota22.
	veterinaria agregarDiagnostico: diag3.
	tratF3 := Farmacologico
		          crearTratFarmacologicoConFecha: Date today
		          motivo: 'Analgésico postoperatorio'
		          monodroga: medicamento2
		          dosis: 2
		          frecuencia: 8.
	tratQ2 := Quirurgico
		          crearTratQuirurgicoConFecha: Date today
		          motivo: 'Extracción de quiste'
		          nombreProcedimiento: 'Extirpación'
		          nivelRiesgo: 1
		          tipoAnestesia: 'Local'.
	veterinaria asignarTratamiento: tratF3 aDiagnostico: diag3.
	veterinaria asignarTratamiento: tratQ2 aDiagnostico: diag3.

	"Cliente 3, mascota 3.1 con 3 AV + 1 D con 1 TQ + 1 D con 2 TF"
	vacunacion4 := Vacunacion
		               crearVacunacionConFecha: Date today
		               veterinario: medico1
		               mascota: mascota31
		               vacuna: vacuna1.
	vacunacion5 := Vacunacion
		               crearVacunacionConFecha: Date today
		               veterinario: medico2
		               mascota: mascota31
		               vacuna: vacuna1.
	vacunacion6 := Vacunacion
		               crearVacunacionConFecha: Date today
		               veterinario: medico1
		               mascota: mascota31
		               vacuna: vacuna2.
	mascota31 agregarVacunacion: vacunacion4.
	mascota31 agregarVacunacion: vacunacion5.
	mascota31 agregarVacunacion: vacunacion6.

	diag4 := Diagnostico
		         crearDiagnosticoConFecha: Date today
		         descripcion: 'Tumor mamario'
		         veterinario: medico2
		         mascota: mascota31.
	tratQ3 := Quirurgico
		          crearTratQuirurgicoConFecha: Date today
		          motivo: 'Extirpación de tumor'
		          nombreProcedimiento: 'Mastectomía parcial'
		          nivelRiesgo: 2
		          tipoAnestesia: 'General'.

	diag5 := Diagnostico
		         crearDiagnosticoConFecha: Date today
		         descripcion: 'Dermatitis'
		         veterinario: medico1
		         mascota: mascota31.
	veterinaria agregarDiagnostico: diag5.
	tratF4 := Farmacologico
		          crearTratFarmacologicoConFecha: Date today
		          motivo: 'Antihistamínico'
		          monodroga: medicamento5
		          dosis: 1
		          frecuencia: 12.
	tratF5 := Farmacologico
		          crearTratFarmacologicoConFecha: Date today
		          motivo: 'Antibiótico tópico'
		          monodroga: medicamento3
		          dosis: 2
		          frecuencia: 12.
	veterinaria asignarTratamiento: tratF4 aDiagnostico: diag5.
	veterinaria asignarTratamiento: tratF5 aDiagnostico: diag5.

	"El D de la mascota 2.2 facturado y con saldo pendiente."
	veterinaria generarFactura: diag3.
	veterinaria realizarFacturacion: diag3.

	"El primer D de la mascota 3.1 facturado y pagado."
	factura31 := veterinaria generarFactura: diag4.
	veterinaria realizarFacturacion: diag4.
	pago31 := Pago
		          crearPagoConFecha: Date today
		          montoAbonado: factura31 montoTotal
		          medioPago: 'Efectivo'.
	factura31 registrarPago: pago31.

	"El segundo D de la mascota 3.2 sin facturar."
	"no hace nada"

	"Cliente 1 tiene 1 turno CANCELADO"
	turno1cancelado := TurnoConsulta
		                   crearTurnoConsultaConFecha: Date today
		                   hora: '10:00'
		                   motivo: 'Control general'
		                   cliente: cliente1
		                   mascota: mascota11
		                   veterinario: medico1.
	veterinaria agendarTurno: turno1cancelado.
	turno1cancelado cancelar.

	"Cliente 2 tiene un turno de tratamiento, CONFIRMADO para la mascota 2.2."
	turno2confirmado := TurnoTratamiento
		                    crearTurnoTratamientoConFecha: Date today
		                    hora: '11:00'
		                    motivo: 'Extracción de quiste'
		                    cliente: cliente2
		                    mascota: mascota22
		                    veterinario: medico1
		                    tratamiento: tratF3.
	veterinaria agendarTurno: turno2confirmado.

	"Cliente 3 tiene un turno que ya ha sido atendido, para su mascota."
	turno3atendido := TurnoConsulta
		                  crearTurnoConsultaConFecha: Date today
		                  hora: '12:00'
		                  motivo: 'Revisión post tratamiento'
		                  cliente: cliente3
		                  mascota: mascota31
		                  veterinario: medico2.
	veterinaria agendarTurno: turno3atendido.
	veterinaria atenderTurno: turno3atendido.

	^ veterinaria
]

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

	rta
		ifNil: [
			mascota := unTurno mascota.
			cliente := self buscarClienteConMascota: mascota.
			rta := unTurno esElMismoDuenio: cliente.
			rta ifTrue: [
				unTurno esTurnoTratamiento ifTrue: [
					rta := unTurno estaPendienteTratamiento.
					rta ifTrue: [ rta := unTurno esValidoTratamiento ] ] ] ]
		ifNotNil: [ rta := false ].

	rta ifTrue: [
		nuevoEstado := 'confirmado'.
		unTurno estado: nuevoEstado.
		colTurnos add: unTurno ].

	^ rta
]

{ #category : 'propios del tipo' }
Veterinaria >> agregarCliente: unCliente [
colClientes add: unCliente 
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

{ #category : 'propios del tipo' }
Veterinaria >> cancelarTurnoPendiente: unTurno [

|rta|

(unTurno estado = 'pendiente')
		ifTrue: [ unTurno cancelar. rta := true ]
		ifFalse: [ rta := false ].
		
^rta
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
Veterinaria >> facturasPendientesDe: unCliente [

	| factPendientes factPendientesCliente |
	factPendientes := self facturasPendientes.

	factPendientesCliente := factPendientes select: [ :cadaFactura |
		                         cadaFactura cliente equals: unCliente ].

	^ factPendientesCliente 
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

{ #category : 'propios del tipo' }
Veterinaria >> historialDeTurnosDe: unCliente [

|historial|

historial := colTurnos select: [ :cadaTurno | cadaTurno cliente equals: unCliente ].

^historial 
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

{ #category : 'propios del tipo' }
Veterinaria >> tratamientosRealizadosPor: unVeterinario [

	| diagnosticos tratamientos |
	diagnosticos := colDiagnosticos select: [ :cadaDiagnostico |
		                cadaDiagnostico veterinario equals: unVeterinario ].

	tratamientos := OrderedCollection new.
	diagnosticos do: [ :unDiagnostico |
		tratamientos addAll: unDiagnostico tratamientos ].

	^ tratamientos
]

{ #category : 'visualizadores' }
Veterinaria >> turnos [

	^ colTurnos 
]

{ #category : 'propios del tipo' }
Veterinaria >> turnosConFecha: unaFecha [

|turnosConFecha|

turnosConFecha := colTurnos select: [ :cadaTurno | cadaTurno fechaTurno equals: unaFecha ].

^turnosConFecha 
]
