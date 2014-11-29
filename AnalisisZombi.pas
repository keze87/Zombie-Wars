Unit AnalisisZombi;

interface

	type

		TFactores = record
			Codigo{de factor} : string[2];
			Descripcion : string[30];
			Valor : real;
			end;

	procedure Calculo (var S : longInt; var Z : longInt; var R : longInt; var I : longInt; alfa : real; beta : real; delta : real; xi : real; pi : real; rho :real);

implementation

	procedure Calculo (var S : longInt; var Z : longInt; var R : longInt; var I : longInt; alfa : real; beta : real; delta : real; xi : real; pi : real; rho :real);

	{a = actual
	S = susceptibles
	Z = zombie
	R = Removidos //Re muertos
	I = Infectados
	alfa = Factor de salvacion
	beta = Factor de trasmicion
	delta = Factor de muerte natural
	xi = Factor resurreccion
	pi = tasa de natalidad
	rho = factor latente de infeccion}

	var

		Sa : Real;
		Za : Real;
		Ra : Real;
		Ia : Real;

	begin

		Sa := pi * ( S + I ) - beta * S * Z - delta * S;

		Ia := beta * S * Z - delta * I - rho * I;

		Za := rho * I + xi * R - alfa * S * Z;

		Ra := delta * S + delta * I + alfa * S * Z - rho * R;

		S := trunc(Sa);
		I := trunc(Ia);
		Z := trunc(Za);
		R := trunc(Ra);

	end;

end.
