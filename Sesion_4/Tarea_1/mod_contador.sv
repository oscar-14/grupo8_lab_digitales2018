`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Laboratorio de Sistemas Digitales, 1er semestre, 2018
// Laboratorio 3
// Integrantes:
// - Tomas Munoz ROL: 201621029-6
// - Mauricio Aravena
// - Oscar Cordova
// Grupo 1000
// Proyecto: contador generalizado
// Modulo: contador de n bits
// Breve descripcion: genera un contador n bit
//////////////////////////////////////////////////////////////////////////////////

// 
module contador (
	input logic clk, // -> pin del reloj
	input logic reset, // -> pin de reset
	output logic [n_bits-1:0] contador // salida del contador
    );
    // Se crea un parametro que es la cantidad maxima a la que puede contar
    // por default esta a un valor maximo de 3 (2 bit)
    parameter COUNTER_MAX = 'd3; // numero maximo el cual el contador puede llegar
    localparam n_bits = $clog2(COUNTER_MAX);
    always @(posedge clk) begin
    	if (reset == 1'b1) begin // cuando se aprete reset, contador es 0
    		contador <= 'd0;
    	end
    	else if (contador == COUNTER_MAX) begin // si llega al maximo, se reinicia el contador
    		contador <= 'd0;
    	end
    	else begin
    		contador <= contador + 'd1; // si nada en especial ocurre, contador se incrementa
    	end
    end
endmodule
