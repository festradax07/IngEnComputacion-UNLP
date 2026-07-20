RECURSO queue=([5] RECURSO r)
Process proceso[id:0..M-1]{
		RECURSO r;
		<await(!empty(queue)); Pop(queue,r)>;
		Usar(r);
		<Push(queue,r)>
}
