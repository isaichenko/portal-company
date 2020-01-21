class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :show, :update, :destroy]

  def index
    @employees = Employee.all.order("ASC")
  end

  def new
    @employee = Employee.new
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

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to root_path, notice: 'Сотрудник был успешно обновлен!' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    respond_to do |format|
      format.html {}
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Сотрудник был удален' }
    end
  end

  private
    def set_emploee
      @employee = Emploee.find(params[:id])
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
                                      :department)
    end


end
