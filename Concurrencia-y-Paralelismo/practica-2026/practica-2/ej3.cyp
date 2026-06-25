sem mut_totales=7, mut_trigo=5,mut_maiz=5;

process TrigoC[id:0..m-1]{


	P(mut_trigo);
	P(mut_totales);
	depositar();
	V(mut_totales);
	V(mut_trigo);
}

process MaizC[id:0..m-1]{

	P(mut_maiz);
	P(mut_totales);
	depositar();
	V(mut_totales);
	v(mut_maiz);
}
