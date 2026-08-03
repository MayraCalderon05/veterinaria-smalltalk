Class {
	#name : 'Turno',
	#superclass : 'Object',
	#instVars : [
		'fechaTurno',
		'horaTurno',
		'estado',
		'motivo',
		'cliente',
		'mascota',
		'veterinario'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'propios del tipo' }
Turno >> atender [

	estado := 'atendido'.

]

{ #category : 'propios del tipo' }
Turno >> cancelar [
estado := 'cancelado'.
self changed.
]

{ #category : 'visualizadores' }
Turno >> cliente [

	^ cliente 
]

{ #category : 'propios del tipo' }
Turno >> descripcionTextual [

	^ 'TURNO: ' , String lf , 'Fecha: ' , fechaTurno printString
	  , String lf , 'Hora: ' , horaTurno printString , String lf
	  , 'Estado: ' , estado asString , String lf , 'Motivo: '
	  , motivo asString , String lf , 'Cliente: '
	  , cliente nombre asString , String lf , 'Mascota: '
	  , mascota nombre asString , String lf , 'Veterinario: '
	  , veterinario nombre asString , String lf
]

{ #category : 'propios del tipo' }
Turno >> esElMismoDuenio: unCliente [

	^ cliente equals: unCliente
]

{ #category : 'propios del tipo' }
Turno >> esTurnoTratamiento [
^false
]

{ #category : 'visualizadores' }
Turno >> estado [ 

	^ estado 
]

{ #category : 'modificadores' }
Turno >> estado: unEstado [

	estado := unEstado.
	self changed .
]

{ #category : 'propios del tipo' }
Turno >> estadoConfirmado [
^(#( 'confirmado' 'Confirmado' ) includes: estado)
	
]

{ #category : 'visualizadores' }
Turno >> fechaTurno [
^fechaTurno 
]

{ #category : 'modificadores' }
Turno >> fechaTurno: unaFechaTurno [

	fechaTurno := unaFechaTurno.

]

{ #category : 'visualizadores' }
Turno >> horaTurno [ 

	^ horaTurno 
]

{ #category : 'modificadores' }
Turno >> horaTurno: unaHoraTurno [

	horaTurno := unaHoraTurno.

]

{ #category : 'inicializadores' }
Turno >> inicializarTurnoConFecha: unaFechaTurno hora: unaHoraTurno motivo: unMotivo cliente: unCliente mascota: unaMascota veterinario: unMedico [

	fechaTurno := unaFechaTurno.
	horaTurno := unaHoraTurno.
	estado := 'pendiente'.
	motivo := unMotivo.
	cliente := unCliente.
	mascota := unaMascota.
	veterinario := unMedico
]

{ #category : 'propios del tipo' }
Turno >> marcarAusente [

estado := 'ausente'.
self changed.
]

{ #category : 'visualizadores' }
Turno >> mascota [ 

	^ mascota 
]

{ #category : 'visualizadores' }
Turno >> motivo [

	^ motivo 
]

{ #category : 'modificadores' }
Turno >> motivo: unMotivo [

	motivo := unMotivo.

]

{ #category : 'propios del tipo' }
Turno >> validarDisponibilidad: unTurno [

	| rta laFechaTurno laHoraTurno elVeterinario elEstado |
	rta := true.

	laFechaTurno := unTurno fechaTurno.
	laHoraTurno := unTurno horaTurno.
	elVeterinario := unTurno veterinario.
	elEstado := unTurno estado.

	(((self fechaTurno = laFechaTurno) 
    and: [self horaTurno = laHoraTurno
        and: [self veterinario = elVeterinario
            and: [elEstado = 'confirmado']]]))
                ifTrue: [rta := false].
	^ rta
]

{ #category : 'visualizadores' }
Turno >> veterinario [ 

	^ veterinario 
]
