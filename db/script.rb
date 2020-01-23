excel_file = Roo::Spreadsheet.open('public/assets/employees.xlsx')
excel_file.sheet(0)
2.upto(76) do |line|
  position = excel_file.cell(line, 'B')
  email = excel_file.cell(line, 'D')
  birthday = excel_file.cell(line, 'F')
  department = excel_file.cell(line, 'G')
  ip_phone = excel_file.cell(line, 'H')

  fio = excel_file.cell(line, 'C')
  if !fio.nil?
    fio_array = fio.split
    first_name = fio_array[1].downcase
    last_name = fio_array[0].downcase
    patronymic = fio_array[2].downcase
  end

  phone = excel_file.cell(line, 'E')
  if !phone.nil?
    phone_array = phone.split
    if phone_array.count == 2
      mobile_phone1 = phone_array[0].tr('-', '')
      mobile_phone2 = phone_array[1].tr('-', '')
    elsif phone_array.count == 1
      mobile_phone1 = phone_array[0].tr('-', '')
      mobile_phone2 = nil
    else
      mobile_phone1 = nil
      mobile_phone2 = nil
    end
  end

  Employee.create!(position: position,
                   email: email,
                   birthday: birthday,
                   first_name: first_name,
                   last_name: last_name,
                   patronymic: patronymic,
                   mobile_phone1: mobile_phone1,
                   mobile_phone2: mobile_phone2,
                   department: department,
                   ip_phone: ip_phone)
end
