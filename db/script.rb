excel_file = Roo::Spreadsheet.open('public/assets/employees.xlsx')
excel_file.sheet(0)
4.upto(80) do |line|
  position = excel_file.cell(line, 'B')
  Employee.create!(position: position)
end
