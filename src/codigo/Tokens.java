/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

/**
 *
 * @author Charly Ponce
 */
public enum Tokens {
    Linea,
    Inicio,          // Representa "TRACKPOINT"
    Final,           // Representa "END_TRACKPOINT"
    Latitud,         // Representa "Lat"
    Longitud,        // Representa "Lon"
    SignoIgual,      // Representa "="
    Tiempo,          // Representa "TIME"
    Velocidad,       // Representa "SPEED"
    Menor,           // Representa "<"
    Mayor,           // Representa ">"
    numero,          // Representa números decimales (como coordenadas y velocidad)
    Letra,           // Representa letras genéricas
    Fecha,           // Representa fechas en formato AAAA-MM-DD
    Horasegmin,       // Representa horas en formato HH:MM:SS
    Guion,
    ERROR
}
