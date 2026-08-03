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
	| veterinaria medico1 medico2 cliente1 cliente2 cliente3 mascota11 mascota21 mascota22 mascota31 vacuna1 vacuna2 medicamento1 medicamento2 medicamento3 medicamento4 medicamento5 diag trat vacunacion factura pago turno matricula diagMascota22 tratQuirurgicoMascota22 |

	veterinaria := self
		               crearVeterinariaConNombre:
		               'Los animales no son objetos'
		               cuit: '20-12345678-9'.

	"1. 2 médicos veterinarios, con sus datos completos (con al menos 1 matrícula cada 1)"
	matricula := Matricula
		             crearMatriculaConNumero: 'MP-1001'
		             colegioEmisor:
		             'Colegio de Veterinarios y Especialistas en Dramas Felinos'
		             fechaInscripcion: (Date newDay: 1 month: 1 year: 2020)
		             fechaLimite: (Date newDay: 31 month: 12 year: 2030)
		             tipo: 'Nacional'.

	medico1 := Medico
		           crearMedicoConDni: '46111222'
		           nombre: 'Morena'
		           apellido: 'Torres Sendra'
		           domicilio: 'Buenos Aires 123'
		           fechaNacimiento: (Date newDay: 26 month: 7 year: 2005)
		           cuil: '27-46111222-4'
		           matricula: matricula.

	matricula := Matricula
		             crearMatriculaConNumero: 'MP-1002'
		             colegioEmisor:
		             'Consejo de Veterinarios de Parque Jurásico y Megafauna'
		             fechaInscripcion: (Date newDay: 15 month: 8 year: 2015)
		             fechaLimite: (Date newDay: 15 month: 8 year: 2028)
		             tipo: 'Especialista en Dinosaurios'.
	medico1 agregarMatricula: matricula.

	matricula := Matricula
		             crearMatriculaConNumero: 'MP-1003'
		             colegioEmisor:
		             'Sindicato de Masajistas de Carpinchos de Nordelta'
		             fechaInscripcion: (Date newDay: 20 month: 7 year: 2021)
		             fechaLimite: (Date newDay: 20 month: 7 year: 2031)
		             tipo: 'Provincial'.
	medico1 agregarMatricula: matricula.

	matricula := Matricula
		             crearMatriculaConNumero: 'MP-1004'
		             colegioEmisor:
		             'Federación Galáctica de Veterinarios de Mascotas Alienígenas'
		             fechaInscripcion: (Date newDay: 4 month: 5 year: 2018)
		             fechaLimite: (Date newDay: 4 month: 5 year: 2040)
		             tipo: 'Intergalactica'.

	medico2 := Medico
		           crearMedicoConDni: '47555666'
		           nombre: 'Mayra'
		           apellido: 'Calderon'
		           domicilio: 'Av. Siempreviva 742'
		           fechaNacimiento: (Date newDay: 20 month: 7 year: 2005)
		           cuil: '20-47555666-1'
		           matricula: matricula.

	matricula := Matricula
		             crearMatriculaConNumero: 'MP-1005'
		             colegioEmisor: 'Colegio El Perro Mojado'
		             fechaInscripcion: (Date newDay: 4 month: 5 year: 2018)
		             fechaLimite: (Date newDay: 4 month: 5 year: 2040)
		             tipo: 'Provisoria'.
	medico2 agregarMatricula: matricula.

	veterinaria agregarMedico: medico1.
	veterinaria agregarMedico: medico2.

	"2. 3 clientes con sus mascotas"
	mascota11 := Mascota
		             crearMascotaConNombre: 'Leo'
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
		            tipo: 'particular'
		            mascota: mascota11.

	mascota21 := Mascota
		             crearMascotaConNombre: 'Canela'
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
		            tipo: 'particular'
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
		            tipo: 'particular'
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
	diag := Diagnostico
		        crearDiagnosticoConFecha: Date today
		        descripcion: 'Obstruccion de hueso'
		        veterinario: medico1
		        mascota: mascota11.
	veterinaria agregarDiagnostico: diag.

	trat := Quirurgico
		        crearTratQuirurgicoConFecha: Date today
		        motivo: 'Obstruccion de hueso'
		        nombreProcedimiento: 'enema'
		        nivelRiesgo: 2
		        tipoAnestesia: 'General'.
	veterinaria asignarTratamiento: trat aDiagnostico: diag.

	"Cliente 2, mascota 2.1 con 1 AV + 1 D con 2 TF)"
	vacunacion := Vacunacion
		              crearVacunacionConFecha: Date today
		              veterinario: medico2
		              mascota: mascota21
		              vacuna: vacuna1.

	diag := Diagnostico
		        crearDiagnosticoConFecha: Date today
		        descripcion: 'Infección urinaria'
		        veterinario: medico2
		        mascota: mascota21.
	veterinaria agregarDiagnostico: diag.

	trat := Farmacologico
		        crearTratFarmacologicoConFecha: Date today
		        motivo: 'Antibiótico'
		        monodroga: medicamento1
		        dosis: 10
		        frecuencia: 12.
	veterinaria asignarTratamiento: trat aDiagnostico: diag.

	trat := Farmacologico
		        crearTratFarmacologicoConFecha: Date today
		        motivo: 'Antiinflamatorio'
		        monodroga: medicamento2
		        dosis: 5
		        frecuencia: 24.
	veterinaria asignarTratamiento: trat aDiagnostico: diag.

	"Cliente 2 mascota 2.2 con 2 AV + 1 D con 1 TF y 1 TQ (R1 y A local)"
	vacunacion := Vacunacion
		              crearVacunacionConFecha: Date today
		              veterinario: medico2
		              mascota: mascota22
		              vacuna: vacuna1.
	mascota22 agregarVacunacion: vacunacion.

	vacunacion := Vacunacion
		              crearVacunacionConFecha: Date today
		              veterinario: medico2
		              mascota: mascota22
		              vacuna: vacuna2.
	mascota22 agregarVacunacion: vacunacion.

	diagMascota22 := Diagnostico
		        crearDiagnosticoConFecha: Date today
		        descripcion: 'Quiste sebáceo'
		        veterinario: medico1
		        mascota: mascota22.
	veterinaria agregarDiagnostico: diagMascota22.

	trat := Farmacologico
		        crearTratFarmacologicoConFecha: Date today
		        motivo: 'Analgésico postoperatorio'
		        monodroga: medicamento2
		        dosis: 2
		        frecuencia: 8.
	veterinaria asignarTratamiento: trat aDiagnostico: diagMascota22.

	tratQuirurgicoMascota22 := Quirurgico
		        crearTratQuirurgicoConFecha: Date today
		        motivo: 'Extracción de quiste'
		        nombreProcedimiento: 'Extirpación'
		        nivelRiesgo: 1
		        tipoAnestesia: 'Local'.
	veterinaria asignarTratamiento: tratQuirurgicoMascota22 aDiagnostico: diagMascota22.

	"Cliente 3, mascota 3.1 con 3 AV + 1 D con 1 TQ + 1 D con 2 TF"
	vacunacion := Vacunacion
		              crearVacunacionConFecha: Date today
		              veterinario: medico1
		              mascota: mascota31
		              vacuna: vacuna1.
	mascota31 agregarVacunacion: vacunacion.

	vacunacion := Vacunacion
		              crearVacunacionConFecha: Date today
		              veterinario: medico2
		              mascota: mascota31
		              vacuna: vacuna1.
	mascota31 agregarVacunacion: vacunacion.

	vacunacion := Vacunacion
		              crearVacunacionConFecha: Date today
		              veterinario: medico1
		              mascota: mascota31
		              vacuna: vacuna2.
	mascota31 agregarVacunacion: vacunacion.

	diag := Diagnostico
		        crearDiagnosticoConFecha: Date today
		        descripcion: 'Tumor mamario'
		        veterinario: medico2
		        mascota: mascota31.
	veterinaria agregarDiagnostico: diag.

	trat := Quirurgico
		        crearTratQuirurgicoConFecha: Date today
		        motivo: 'Extirpación de tumor'
		        nombreProcedimiento: 'Mastectomía parcial'
		        nivelRiesgo: 2
		        tipoAnestesia: 'General'.
	veterinaria asignarTratamiento: trat aDiagnostico: diag.

	diag := Diagnostico
		        crearDiagnosticoConFecha: Date today
		        descripcion: 'Dermatitis'
		        veterinario: medico1
		        mascota: mascota31.
	veterinaria agregarDiagnostico: diag.

	trat := Farmacologico
		        crearTratFarmacologicoConFecha: Date today
		        motivo: 'Antihistamínico'
		        monodroga: medicamento5
		        dosis: 1
		        frecuencia: 12.
	veterinaria asignarTratamiento: trat aDiagnostico: diag.

	trat := Farmacologico
		        crearTratFarmacologicoConFecha: Date today
		        motivo: 'Antibiótico tópico'
		        monodroga: medicamento3
		        dosis: 2
		        frecuencia: 12.
	veterinaria asignarTratamiento: trat aDiagnostico: diag.

	"El D de la mascota 2.2 facturado y con saldo pendiente."
	veterinaria generarFactura: diagMascota22.
	veterinaria realizarFacturacion: diagMascota22.

	"El primer D de la mascota 3.1 facturado y pagado."
	factura := veterinaria generarFactura: diag.
	veterinaria realizarFacturacion: diag.

	pago := Pago
		        crearPagoConFecha: Date today
		        montoAbonado: factura montoTotal
		        medioPago: 'Efectivo'.
	factura registrarPago: pago.

	"El segundo D de la mascota 3.2 sin facturar."
	"no hace nada"

	"Cliente 1 tiene 1 turno CANCELADO"
	turno := TurnoConsulta
		         crearTurnoConsultaConFecha: Date today
		         hora: '10:00'
		         motivo: 'Control general'
		         cliente: cliente1
		         mascota: mascota11
		         veterinario: medico1.
	veterinaria agendarTurno: turno.
	turno cancelar.

	"Cliente 2 tiene un turno de tratamiento, CONFIRMADO para la mascota 2.2."
	turno := TurnoTratamiento
		         crearTurnoTratamientoConFecha: Date today
		         hora: '11:00'
		         motivo: 'Extracción de quiste'
		         cliente: cliente2
		         mascota: mascota22
		         veterinario: medico1
		         tratamiento: tratQuirurgicoMascota22.
	veterinaria agendarTurno: turno.

	"Cliente 3 tiene un turno que ya ha sido atendido, para su mascota."
	turno := TurnoConsulta
		         crearTurnoConsultaConFecha: Date today
		         hora: '12:00'
		         motivo: 'Revisión post tratamiento'
		         cliente: cliente3
		         mascota: mascota31
		         veterinario: medico2.
	veterinaria agendarTurno: turno.
	veterinaria atenderTurno: turno.

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
		
		self changed: #turnos.
	^ rta
]

{ #category : 'propios del tipo' }
Veterinaria >> agregarCliente: unCliente [

	| exito |
	exito := false.
	(self buscarCliente: unCliente) ifNil: [
		colClientes add: unCliente.
		exito := true ].
	self changed: #clientes .
	^ exito
]

{ #category : 'propios del tipo' }
Veterinaria >> agregarDiagnostico: unDiagnostico [

	colDiagnosticos add: unDiagnostico.

]

{ #category : 'propios del tipo' }
Veterinaria >> agregarFactura: unaFactura [

	colFacturas add: unaFactura.

]

{ #category : 'propios del tipo' }
Veterinaria >> agregarMedico: unMedico [

	colMedicos add: unMedico.

]

{ #category : 'propios del tipo' }
Veterinaria >> agregarNuevoStock: unStock [

	colStockMedicamentos add: unStock.

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
	(self esPosibleAsignarTratamientoADiagnostico: unTratamiento)
		ifTrue: [
		exito := unDiagnostico registrarNuevoTratamiento: unTratamiento ].
	
	^ exito
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
	self changed: #turnos.
	^ atendido
]

{ #category : 'propios del tipo' }
Veterinaria >> buscarCliente: unCliente [ 

	^ colClientes detect: [ :c | c equals: unCliente ] ifNone: [ nil ]
]

{ #category : 'propios del tipo' }
Veterinaria >> buscarClienteConMascota: mascota [
|cliente|
cliente := colClientes detect: [ :cadaCliente | cadaCliente  tieneMascota: mascota ] ifNone: [ nil ].
^cliente 

]

{ #category : 'propios del tipo' }
Veterinaria >> buscarClientePorDni: unDni [

	^ colClientes detect: [ :c | c mismoDni: unDni ] ifNone: [ nil ]
]

{ #category : 'propios del tipo' }
Veterinaria >> buscarStockDeMedicamento: unMedicamento [
| encontrado |
encontrado := colStockMedicamentos detect: [ :st | st esElMismoMedicamento: unMedicamento ] ifNone: [ nil ].
^encontrado 
]

{ #category : 'propios del tipo' }
Veterinaria >> buscarTratamientosPendientesParaMascota: unaMascota [

	| tratDisponibles diagnosticosMascota |
	diagnosticosMascota := colDiagnosticos select: [ :d |
		                       d tieneMascota: unaMascota ].
	tratDisponibles := OrderedCollection new.
	diagnosticosMascota do: [:d | 
		d tratamientos do: [: t |
			t estadoPendiente ifTrue: [
				| aux |
       	 	aux := Array new: 2.
       	 	aux at: 1 put: d descripcion.
        		aux at: 2 put: t.
        		tratDisponibles add: aux.
				] 
			].
 
	].
	"devuelvo solo los pendientes"
	^ tratDisponibles
]

{ #category : 'propios del tipo' }
Veterinaria >> cancelarTurnoPendiente: unTurno [

	| rta |
	unTurno estado = 'confirmado'
		ifTrue: [
			unTurno cancelar.
			rta := true ]
		ifFalse: [ rta := false ].
	self changed: #turnos.

	^ rta
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

	^ exito
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
	factPendientesCliente := factPendientes select: [ :cadaResultado |
		(cadaResultado at: 1) equals: unCliente ].
	^ factPendientesCliente
]

{ #category : 'propios del tipo' }
Veterinaria >> generarFactura: unDiagnostico [

	| facturaGenerada mascotaDiagnostico elCliente montoAbonar |
	
	mascotaDiagnostico := unDiagnostico mascota.
	elCliente := self buscarClienteConMascota: mascotaDiagnostico.
	montoAbonar := unDiagnostico calcularMontoFinal.
	facturaGenerada := Factura
				 crearFacturaConCliente: elCliente
				 cuitVeterinaria: cuit
				 diagnostico: unDiagnostico
				 montoTotal: montoAbonar
				 fechaGeneracion: Date today.
	self changed.
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

	| exito unaFactura yaExistia |
	exito := false.
	yaExistia := colFacturas
		detect: [:f | f buscarFactura: unDiagnostico enDia: Date today]
		ifNone: [nil].
		
	yaExistia 
		ifNil: [ unaFactura := self generarFactura: unDiagnostico.
			self agregarFactura: unaFactura.
			exito := true  ].

	^ exito
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
