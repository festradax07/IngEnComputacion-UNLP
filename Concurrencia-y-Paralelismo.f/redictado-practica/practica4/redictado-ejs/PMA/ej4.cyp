En un consultorio hay un medico que debe atender a 15 pacientes de acuerdo al turno de cada uno de ellos. Cada paciente ya conoce su turno al comenzar (valor entero entre 1 y 15), al llegar espera hasta que el medico lo llame para ser atendido y luego espera hasta que el medico lo termine de atender. Nota: los únicos procesos que se pueden usar son los que representen a los pacientes y al medico; se debe evitar hacer Busy Waiting.

chan llegóPaciente[15] //link privado desde el cual informa que llegó el paciente i
chan atendido; // canal privado desde el cual espera
chan entré;
proceso paciente[id:0..14]{

	receive llegóPaciente[id](); // en este caso invertimos el control
	send(entré); // canal individual para indicar que el paciente ingreśo al consultorio
	receive(atendido); // canal global para indicar que el paciente sali+ó del consultorio:

}
process Medico{
	text sintomas;
	for i=0 ..14{
		send(llegoPaciente[i];
		receive entre(sintoams);
		atendiendo(sintomas);
		send atedido();

	}


}
