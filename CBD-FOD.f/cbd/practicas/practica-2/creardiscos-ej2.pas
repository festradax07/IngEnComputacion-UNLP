program crearArchivoDiscos;
type
  str15 = string[30];
  Autor = record
    cod_autor: integer;
    nom_autor: str15;
  end;

  Disco = record
    autor: Autor;
    nom_disco: str15;
    genero: str15;
    cant_ventas: integer;
  end;

  Archivo = file of Disco;

var
  arch: Archivo;
  d: Disco;

procedure escribirDisco(var arch: Archivo; codA: integer; nomA, nomD, gen: str15; cant: integer);
begin
  d.autor.cod_autor := codA;
  d.autor.nom_autor := nomA;
  d.nom_disco := nomD;
  d.genero := gen;
  d.cant_ventas := cant;
  write(arch, d);
end;

begin
  Assign(arch, 'discografica.dat');
  rewrite(arch);

  // Autor 1 - varios discos y géneros
  escribirDisco(arch, 1, 'Queen', 'A Night at the Opera', 'Rock', 1500);
  escribirDisco(arch, 1, 'Queen', 'News of the World', 'Rock', 1200);
  escribirDisco(arch, 1, 'Queen', 'Jazz', 'Jazz', 800);

  // Autor 2
  escribirDisco(arch, 2, 'The Beatles', 'Abbey Road', 'Rock', 2000);
  escribirDisco(arch, 2, 'The Beatles', 'Let It Be', 'Pop', 1700);

  // Autor 3
  escribirDisco(arch, 3, 'Miles Davis', 'Kind of Blue', 'Jazz', 1300);
  escribirDisco(arch, 3, 'Miles Davis', 'Bitches Brew', 'Jazz', 900);

  close(arch);
end.
