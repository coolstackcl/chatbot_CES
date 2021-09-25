# archivo para leer y ordenar excel para carga masiva
require 'roo'

xlsx = Roo::Spreadsheet.open('./BD_CES.xlsx').sheet(0).to_matrix.to_a
cols = xlsx[0]
cols = cols[0...(cols.length-1)]
data = xlsx[1..xlsx.length]

curso = []
data.each do |d|
    curso.push(d[data[0].length-1])
end

#puts data
#xlsx = Roo::Excelx.new("./BD_CES.xlsx")

#col 3 y 4 son horas
data.each do |d|
    if !d[3].nil?
        d[3] = Time.at(d[3]).strftime("%H:%M")    
    end
    if !d[4].nil?
        d[4] = Time.at(d[4]).strftime("%H:%M")    
    end
end
puts curso
puts data.to_s



