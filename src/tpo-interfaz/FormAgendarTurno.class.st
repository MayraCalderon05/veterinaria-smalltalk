Class {
	#name : 'FormAgendarTurno',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'campoDia',
		'campoMes',
		'campoAnio',
		'campoHora',
		'campoMinutos',
		'clienteSeleccionado',
		'campoMascota',
		'mascotaSeleccionada',
		'campoVeterinario',
		'veterinarioSeleccionado',
		'campotipoTurno',
		'tipoElegido',
		'listaTratamientos',
		'botonTratamientos',
		'tratamientoSeleccionado',
		'botonAceptar',
		'accionAceptar',
		'botonCancelar'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'acceso' }
FormAgendarTurno >> accionAceptar: unBloque [
accionAceptar := unBloque 
]

{ #category : 'acceso' }
FormAgendarTurno >> deCliente: unCliente deVet: unaVeterinaria [

	clienteSeleccionado := unCliente.
	veterinaria := unaVeterinaria.
	
	self openInWorld
]

{ #category : 'propios del tipo' }
FormAgendarTurno >> generarFecha [

	| f |
	f := Date
		     newDay: campoDia texto asInteger
		     month: campoMes texto asInteger
		     year: campoAnio texto asInteger.
	^ f
]

{ #category : 'propios del tipo' }
FormAgendarTurno >> generarHorario [

	| h |
	h := campoHora texto asString, ':', campoMinutos texto asString.
	^ h
]

{ #category : 'inicializadores' }
FormAgendarTurno >> initialize [

	| origen aDia aMes aAnio espacios |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 800).
	origen := self innerBounds origin.

	aDia := 130.
	aMes := 130.
	aAnio := 200.
	espacios := 19.

	campoDia := LabelConCampo label: 'Día: '.
	campoDia position: origen + (60 @ 100).
	campoDia ancho: aDia.

	campoMes := LabelConCampo label: 'Mes: '.
	campoMes position: campoDia position + (aDia + espacios @ 0).
	campoMes ancho: aMes.

	campoAnio := LabelConCampo label: 'Año: '.
	campoAnio position: campoMes position + (aMes + espacios @ 0).
	campoAnio ancho: aAnio.

	campoHora := LabelConCampo label: 'Ingrese la hora '.
	campoHora position: campoDia position + (40 @ 80).
	campoHora ancho: self width / 2 - 100.

	campoMinutos := LabelConCampo label: 'Ingrese los minutos '.
	campoMinutos position:
		campoHora position + (campoHora width + 20 @ 0).
	campoMinutos ancho: self width / 2 - 100.

	campoMascota := BotonAccion new.
	campoMascota label: 'Mascota: (elegir)'.
	campoMascota ancho: self width - 90 alto: 40.
	campoMascota position: campoDia position + (0 @ 160).



	campoMascota mouseAction: [
		| opciones indice mascotas |
		mascotas := clienteSeleccionado mascotas.
		opciones := mascotas collect: [ :m | m nombre asString ].
		indice := UIManager default chooseFrom: opciones title: 'Mascotas'.
		indice > 0 ifTrue: [
			mascotaSeleccionada := mascotas at: indice.
			campoMascota label:
				'Mascota: ' , mascotaSeleccionada nombre asString.
			campoMascota ancho: self width - 90 alto: 40 ] ].


	campoVeterinario := BotonAccion new.
	campoVeterinario label: 'Veterinario: (elegir)'.
	campoVeterinario ancho: self width - 90 alto: 40.
	campoVeterinario position: campoMascota position + (0 @ 60).


	campoVeterinario mouseAction: [
		| opciones indice veterinarios |
		veterinarios := veterinaria medicos.
		opciones := veterinarios collect: [ :m |
			            m cuil asString , ' ' , m nombre asString ].
		indice := UIManager default chooseFrom: opciones title: 'Medicos'.
		indice > 0 ifTrue: [
			veterinarioSeleccionado := veterinarios at: indice.
			campoVeterinario label:
				'Medico:  ' , veterinarioSeleccionado nombre asString.
			campoVeterinario ancho: self width - 90 alto: 40 ] ].

	"dependiendo del tipo de turno que sea, puede agregar un tratamiento o no"
	campotipoTurno := BotonAccion new.
	campotipoTurno label: 'Tipo de turno: (elegir)'.
	campotipoTurno ancho: self width - 90 alto: 40.
	campotipoTurno position: campoVeterinario position + (0 @ 60).

	tipoElegido := ''.

	campotipoTurno mouseAction: [
		| opciones indice |
		opciones := #( 'Consulta' 'Tratamiento' ).
		indice := UIManager default
			          chooseFrom: opciones
			          title: 'Tipo de turno:'.
		indice > 0 ifTrue: [
			tipoElegido := opciones at: indice.
			campotipoTurno label: 'Tipo:  ' , tipoElegido.
			campotipoTurno ancho: self width - 90 alto: 40.
			(tipoElegido = 'Tratamiento' and: [ mascotaSeleccionada isNotNil ])
				ifTrue: [ botonTratamientos show ]
				ifFalse: [ botonTratamientos hide ] ] ].

	"si el tipo es de tratamiento, deberia tener una lista de los tratamientos que implican LOS DIAGNOSTICOS de esa mascota"

	botonTratamientos := BotonAccion new.
	botonTratamientos label: 'Seleccionar tratamiento'.
	botonTratamientos ancho: self width - 90 alto: 40.
	botonTratamientos position: campotipoTurno position + (0 @ 80).

	botonTratamientos mouseAction: [
		| pendientes |
		pendientes := veterinaria buscarTratamientosPendientesParaMascota:
			              mascotaSeleccionada.
		pendientes isEmpty
			ifTrue: [
				(CuadroConMensaje conMensaje: 'No hay tratamientos pendientes')
					openInWorld ]
			ifFalse: [
				listaTratamientos := ListaTratDeMascota new.
				listaTratamientos
					tratamientos: pendientes
					deMascota: mascotaSeleccionada.
				listaTratamientos addDependent: self.
				listaTratamientos openInWorld ] ].


	botonCancelar := BotonAccion new.
	botonCancelar label: 'Cancelar'.
	botonCancelar color: (Color fromHexString: 'B08968').
	botonCancelar position: campotipoTurno position + (0 @ 200).
	botonCancelar ancho: 150 alto: 40.


	botonAceptar := BotonAccion new.
	botonAceptar label: 'Aceptar'.
	botonAceptar color: (Color fromHexString: '6A994E').
	botonAceptar position: botonCancelar position + (350 @ 0).
	botonAceptar ancho: 150 alto: 40.

	botonAceptar mouseAction: [
		self validarFormulario
			ifTrue: [
				| unTurno fechaNac horario |
				fechaNac := self generarFecha.
				horario := self generarHorario.
				unTurno := tipoElegido = 'Tratamiento'
					           ifTrue: [
						           TurnoTratamiento
							           crearTurnoTratamientoConFecha: fechaNac
							           hora: horario
							           motivo: tipoElegido
							           cliente: clienteSeleccionado
							           mascota: mascotaSeleccionada
							           veterinario: veterinarioSeleccionado
							           tratamiento: tratamientoSeleccionado ]
					           ifFalse: [
						           TurnoConsulta
							           crearTurnoConsultaConFecha: fechaNac
							           hora: horario
							           motivo: tipoElegido
							           cliente: clienteSeleccionado
							           mascota: mascotaSeleccionada
							           veterinario: veterinarioSeleccionado ].
				accionAceptar value: unTurno.
				self delete ]
			ifFalse: [
				(CuadroConMensaje conMensaje: 'Complete todos los campos')
					openInWorld ] ].

	botonCancelar mouseAction: [
		| adv |
		adv := CuadroConMensaje conMensaje:
			       '¿Está seguro de que desea cancelar el registro de la mascota?'.
		adv agregarBotonCancelar: [ adv delete ].
		adv accionAceptar: [
			adv delete.
			self delete ].
		adv openInWorld ].


	self addMorph: campoDia.
	self addMorph: campoMes.
	self addMorph: campoAnio.
	self addMorph: campoHora.
	self addMorph: campoMinutos.
	self addMorph: campoMascota.
	self addMorph: campoVeterinario.
	self addMorph: campotipoTurno.
	self addMorph: botonTratamientos.
	botonTratamientos hide.
	self addMorph: botonCancelar.
	self addMorph: botonAceptar
]

{ #category : 'acceso' }
FormAgendarTurno >> update: unObjeto [

	unObjeto = #tratSelect ifTrue: [
		tratamientoSeleccionado := listaTratamientos tratamientoSeleccionado.
		botonTratamientos label:
			'Para: ' , tratamientoSeleccionado motivo asString.
		botonTratamientos ancho: self width - 90 alto: 40 ]
	"lo dejo asi para que no me salte la advertencia"
	ifFalse: [  ]
]

{ #category : 'propios del tipo' }
FormAgendarTurno >> validarFormulario [

	| valores completo |
	completo := true.
	valores := OrderedCollection new.
	valores add: campoDia texto.
	valores add: campoMes texto.
	valores add: campoAnio texto.
	valores add: campoHora texto.
	valores add: campoMinutos texto.

	tipoElegido isNotEmpty & (tipoElegido = 'Tratamiento') ifTrue: [
		(mascotaSeleccionada isNil & (veterinarioSeleccionado isNil)) ifTrue: [ completo := false ] ].

	(valores detect: [:c | c isEmpty ] ifNone: [nil]) ifNotNil: [
        completo := false ].
    (mascotaSeleccionada isNil & (veterinarioSeleccionado isNil)) ifTrue: [ completo := false ].
	^ completo
]
