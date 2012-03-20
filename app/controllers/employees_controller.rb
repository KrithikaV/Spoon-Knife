class EmployeesController < ApplicationController
  def index
    #@product = @category.products.all
    @company = Company.find(params[:company_id])
    @employees = @company.employees.all
    #@employees = Company.all(:limit => 10)
    #@employee = Employee.search(params[:search]).paginate(:per_page => 4, :page => params[:page])
  end
  
  def show
    #@company = Company.find(params[:company_id])
    #@employee = @company.employees.find(params[:id])
    @employee = Employee.find(params[:id])
  end
  
 #@product = @category.products.build

  def new
    @company = Company.find(params[:company_id])
    @employee = @company.employees.new
  end
  
  def create
   @company = Company.find(params[:company_id])
    @employee = @company.employees.new(params[:employee])
    if @employee.save
      flash[:notice] = "Successfully created product."
      #redirect_to invoices_path
      #new_company_employee_path
      redirect_to company_employees_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @company = Company.find(params[:company_id])
    @employee = @company.employee.find(params[:id])
  end
  


  def update
   #params[:employee][:existing_task_attributes] ||= {}
   @company = Company.find(params[:company_id])
    @employee = @company.employees.find(params[:id])
      if @employee.update_attributes(params[:employee])
	redirect_to employees_path

      else
        render action: "edit" 
     end
  end

  
  def destroy
   @company = Company.find(params[:company_id])
    @employee = @company.employees.find(params[:id])
    @employee.destroy
    flash[:notice] = "Successfully destroyed product."
    redirect_to company_employees_url
  end
end
