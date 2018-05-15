
def aprueba( minima)
  file = File.open "alumnos.csv"
  data = file.readlines
  file.close
  data.each do |alumno|
    nota = alumno.split(', ')
    suma = 0
    nota[1..nota.size].each do |dato|
      dato = 0 if dato == 'A'
      dato = dato.to_i
      suma += dato
    end
    promedio = suma.to_f / (nota.length - 1.to_f)
    if promedio >= minima
      puts "#{nota[0]} APRUEBA con #{promedio} promedio\n"
    else
      puts "#{nota[0]} REPRUEBA con #{promedio} promedio\n"
    end
  end
end

file = File.open "alumnos.csv"
data = file.readlines
file.close

opcion = ''
until opcion == 6 do
  puts "\nIngresa opcion:\n 1: promedio por alumnos (archivos) \n 2: inasistencias totales \n 3: alumnos aprobados \n 4: salir \n "
  opcion = gets.chomp
  case opcion
  when "1"
    #archivo con nombre de alumnos y promedio de sus notas
    data.each do |alumno|
      nota = alumno.split(', ')
      suma = 0
      nota[1..nota.size].each do |dato|
        dato = 0 if dato == 'A'
        dato = dato.to_i
        suma += dato
      end
      promedio = suma.to_f / (nota.length-1.to_f)
      File.open(nota[0] + '.txt', 'w'){ |f|
        f.puts "#{nota[0]} tiene promedio #{promedio}\n"
         f.close
       }
    end

  when "2"
    # inasistencias totales por pantalla
    data.each do |alumno|
      nota = alumno.gsub(',','').split(' ')
      suma = 0
      nota[1..nota.size].each do |dato|
        suma += 1 if dato == 'A'
      end
      puts "#{nota[0]} tiene #{suma} inasistencias"
    end

  when "3"
    #mostrar alumnos aprobados , con metodo qe reciba nota de aprobacion, por dfecto 5
    puts "ingrese la nota minima para aprobar: "
    notaminima = gets.chomp
    if notaminima == ''
      notaminima = 5.0
    else
      notaminima = notaminima.to_i
    end

    aprueba(notaminima)

  when "4"
    puts 'Adios'
    break
  else
    puts "opcion incorrecta, intente nuevamente"
  end
end
