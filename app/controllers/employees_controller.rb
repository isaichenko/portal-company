class EmployeesController < ApplicationController
  #http_basic_authenticate_with name: "user", password: "Dolina2020"#, except: :index

  before_action :set_employee, only: [:edit, :update, :destroy]

  def index
    @results = Employee.where('extract(month from birthday) = ?', Time.now.month).order("extract(day from birthday)")
  end

  def ip_phone
    @employees = Employee.ip_phone.order(:ip_phone)
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, notice: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      #@results = Employee.all.where("lower(last_name) LIKE :search", search: @parameter)
      @results = Employee.all.where('last_name LIKE :search OR
                                 mobile_phone1 LIKE :search OR
                                 mobile_phone2 LIKE :search OR
                                 first_name LIKE :search OR
                                 patronymic LIKE :search',
                                 search: "%#{@parameter}%")
    end
  end

  def table
    @employees = Employee.all.order(:last_name)
  end

  def tiles
    @employees = Employee.by_sort_position
  end

  def sort
    params[:order].each do |key, value|
      Employee.find(value[:id]).update(sort_position: value[:sort_position])
    end

    render body: nil
  end

  def department_search
    @results = Employee.all.where(department_id: params[:department_id]).order(:last_name)
  end

  def new
    if current_user.role == "admin"
      @employee = Employee.new
    else
      redirect_to root_path, alert: "Только администратор имеет право на это действие!"
    end
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html {
          redirect_to root_path, notice: "Вы успешно создали нового сотрудника!"
        }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to root_path, notice: 'Сотрудник был успешно обновлен!' }
      else
        format.html { render :edit }
      end
    end
  end

=begin
  def show
    respond_to do |format|
      format.html {}
    end
  end
=end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to table_path, notice: 'Сотрудник был удален' }
    end
  end

  private
    def set_employee
      if current_user.role == "admin"
        @employee = Employee.find(params[:id])
      else
        redirect_to root_path, alert: "Только администратор имеет право на это действие!"
      end
    end

    def employee_params
      params.require(:employee).permit(:first_name,
                                      :last_name,
                                      :patronymic,
                                      :mobile_phone1,
                                      :mobile_phone2,
                                      :ip_phone,
                                      :email,
                                      :birthday,
                                      :position,
                                      :avatar,
                                      #:department,
                                      :department_id)
    end


end
